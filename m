Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5DACEB02
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100EF10E22A;
	Thu,  5 Jun 2025 07:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="zfYWfaGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721D410E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:41:34 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e81877c1ed6so779540276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749109293;
 x=1749714093; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
 b=zfYWfaGrrt1yxGB18Ljx19Z+lvt+58eb/Uxb8Gu2fKpUOa3G6DZtmUUtw8IGNZkVi6
 J3FvP5kbCoebP+/Mcv3UqH/iGoPcQ99VMP8FdE1vu6Wia5icJk5ZWs8R+UfNwxt13jDO
 XQISbw4Gj5QeLopTapgoWbhkIoAHJRHxKbNE63GTnvKG9n5NXZPj+m9jt3wjwwq2IpRW
 sDKQwWBvVmGurQExPw+GY83IPZaENZsJiyRcMUDfbYaNuTcU9F1ORCEVH49Qo5VjHNfL
 +l3d4We4+R4GnA0nntfa0ymne6GAiL+Xf4Ae4egHBzF6lXLI9g1NfKVUe8pa5Q4xmZRf
 R/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749109293; x=1749714093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
 b=S36uoWUwXbStiZM1dSPxdjxtxvtpLIbTOSXRoU9iWeqnZnsI761DtK/ZyICB+umSbx
 3AAjmqtG2YckWWW23XcvAuZMfhGCh/wRepPMzVWs3aOb/b0HkbnR9skWfLW9rqhkTWU2
 5ZL3F6zscPOImMNH8T4bhfILv+mO9bEbGJP/aUa7wCru6bJT6uT85KHesDVVfllvYOtz
 fkoOh3M8uUjhJNSn3ixFvxyi9++wskO8RvlMWIpdBsGEIy11tMs6qAAXIj6X1qxk3YCc
 CEKH+cmk9qUd8pJKoclBZX3JcKTjctBgCRdMRFFrnO0FmJ6ONHkaKsia449UoNc6aB88
 j7Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcf0+pTeZyrl+WRARceKw7N6gcBxuLOOfE1mzNFrn6+FUun6xmyvqVfPVoQp+8sJgwZLkU2Rsy9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmhgLzeRzgx7DyyLuWwgQGMwELS0e5bRzfWRFTXwrCqB58gnNX
 HMShnI7DGIxmtpE+QttUgiQvNptFxwy9xWPfDEgNDMu6TzBz0V3ywGFRicOw0qSotVS5ZOXYGXn
 hfKYSmEkSSA==
X-Gm-Gg: ASbGncvNUaeN5opg5xFeexeax+nl7Ac72g5NkS7DkopF1+nACptqACdNuTqzzSc9UBG
 OcWJdwaex2JH6kRFULmz37sx0pJ1CtSI/l5dEC5o7PqRCgCl+u/I0xmXMICZYhCucRBU173cXwd
 CByuLaXvdfcqn1tuqE7cFG6urv7Bwl125iYagiGDY1qrNJ6P8Li3quC3+1HXq19MOBeau1O38QK
 49xUzydHHxMQVoQSdBmslPd5ewtsjNiwaI5O2tXXz+gd8O7vumre+MqarNkRg5fb49raqoZlSSk
 xkZ/IwgT9sluXpA6caYbrSrCXXjQw/AsVKVUYCL8eHmj3Zt9aHGbRktBNQVXuc6DHmo3LFTIGQk
 SWzu2tbmO227WGIPOkcisH/73ozOWiA==
X-Google-Smtp-Source: AGHT+IEldE1z1BnRmrYLS/27SFHp7f9dp0duHSExznCFqMnctYUI/5rLqsl2BW2UAYVxNNpr6nC/MQ==
X-Received: by 2002:a05:6902:72f:b0:e7d:9ec3:bce4 with SMTP id
 3f1490d57ef6-e81884d729cmr3492061276.20.1749109293192; 
 Thu, 05 Jun 2025 00:41:33 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7f733ec598sm3550979276.27.2025.06.05.00.41.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e73e9e18556so755400276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXoxcht1SuLR6zSu+hzziYoaQzWEKbVS4vKpq19XjQ9YM8txHv8jh60kElZIBFCFMygRtxpMW0+6g=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1387:b0:e7d:c621:33d1 with SMTP id
 3f1490d57ef6-e81882c7d19mr3544074276.14.1749109291936; Thu, 05 Jun 2025
 00:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
In-Reply-To: <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 09:41:21 +0200
X-Gmail-Original-Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
X-Gm-Features: AX0GCFucQ_FiqAlA0rjsUQpt2JT7jK-lOTeRvMqo5HOGrCT-6j2Gn-ED1Jn3Rvg
Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 4, 2025 at 7:03=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2025-06-04 5:18 pm, Daniel Stone wrote:
> > Hi Tomeu,
> > I have some bad news ...
> >
> > On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote=
:
> >> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct=
 drm_file *file)
> >> +{
> >> +       [...]
> >> +
> >> +       /* This will map the pages to the IOMMU linked to core 0 */
> >> +       sgt =3D drm_gem_shmem_get_pages_sgt(shmem_obj);
> >> +       if (IS_ERR(sgt)) {
> >> +               ret =3D PTR_ERR(sgt);
> >> +               goto err;
> >> +       }
> >> +
> >> +       /* Map the pages to the IOMMUs linked to the other cores, so a=
ll cores can access this BO */
> >
> > So, uh, this is not great.
> >
> > We only have a single IOMMU context (well, one per core, but one
> > effective VMA) for the whole device. Every BO that gets created, gets
> > mapped into the IOMMU until it's been destroyed. Given that there is
> > no client isolation and no CS validation, that means that every client
> > has RW access to every BO created by any other client, for the
> > lifetime of that BO.
> >
> > I really don't think that this is tractable, given that anyone with
> > access to the device can exfiltrate anything that anyone else has
> > provided to the device.
> >
> > I also don't think that CS validation is tractable tbh.
> >
> > So I guess that leaves us with the third option: enforcing context
> > separation within the kernel driver.
> >
> > The least preferable option I can think of is that rkt sets up and
> > tears down MMU mappings for each job, according to the BO list
> > provided for it. This seems like way too much overhead - especially
> > with RK IOMMU ops having been slow enough within DRM that we expended
> > a lot of effort in Weston doing caching of DRM BOs to avoid doing this
> > unless completely necessary. It also seems risky wrt allocating memory
> > in drm_sched paths to ensure forward progress.
> >
> > Slightly more preferable than this would be that rkt kept a
> > per-context list of BOs and their VA mappings, and when switching
> > between different contexts, would tear down all MMU mappings from the
> > old context and set up mappings from the new. But this has the same
> > issues with drm_sched.
> >
> > The most preferable option from where I sit is that we could have an
> > explicit notion of driver-managed IOMMU contexts, such that rkt could
> > prepare the IOMMU for each context, and then switching contexts at
> > job-run time would be a matter of changing the root DTE pointer and
> > issuing a flush. But I don't see that anywhere in the user-facing
> > IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
> > why it's not possible ...
>
> On the contrary, it's called iommu_attach_group() :)
>
> In fact this is precisely the usage model I would suggest for this sort
> of thing, and IIRC I had a similar conversation with the Ethos driver
> folks a few years back. Running your own IOMMU domain is no biggie, see
> several other DRM drivers (including rockchip). As long as you have a
> separate struct device per NPU core then indeed it should be perfectly
> straightforward to maintain distinct IOMMU domains per job, and
> attach/detach them as part of scheduling the jobs on and off the cores.
> Looks like rockchip-iommu supports cross-instance attach, so if
> necessary you should already be OK to have multiple cores working on the
> same job at once, without needing extra work at the IOMMU end.

Ok, so if I understood it correctly, the plan would be for each DRM
client to have one IOMMU domain per each core (each core has its own
IOMMU), and map all its buffers in all these domains.

Then when a job is about to be scheduled on a given core, make sure
that the IOMMU for that core uses the domain for the client that
submitted the job.

Did I get that right?

> > Either way, I wonder if we have fully per-context mappings, userspace
> > should not manage IOVAs in the VM_BIND style common to newer drivers,
> > rather than relying on the kernel to do VA allocation and inform
> > userspace of them?
>
> Indeed if you're using the IOMMU API directly then you need to do your
> own address space management either way, so matching bits of process VA
> space is pretty simple to put on the table.

My impression was that the VM_BIND facility is intended for SVM as in
OpenCL and maybe Vulkan?

Guess my question is, what would such an accelerator driver win by
letting userspace manage the address space?

Thanks,

Tomeu
