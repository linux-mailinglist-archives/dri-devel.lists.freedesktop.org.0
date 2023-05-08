Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D451D6FB216
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 15:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CFD10E2A4;
	Mon,  8 May 2023 13:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980F210E2A4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 13:59:14 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1929818d7faso31626786fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683554352; x=1686146352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HKI5hargzKBJ4u7aTkJl99CJ0qfSrzAu9HhTH/5DBYA=;
 b=BQfgfPoucSO9c0iYSjaKh5WEjsLp6hSV70hZxGF9TjAkJY+7/p6Nl+vDhsx9L1ZWWf
 nXRiiqmxG1ptJIeP60CAb/vG1tzQp3aaKCqoA5quhRNYwDaLA+taA/HrpcFDaebaYYLK
 TFx4iwsiU7MqaR2VgjhUizBLHi10ICQLi9yGOUikTGCFsBk4YIAS/VtILBrEUno6W6OU
 +3/p7jTt0njRB6rhvXCRxTKjQ32yVxonaeG+p6HHcRP7Wy4JhWynRY2lwI48IXn2DWxe
 9dvbCYsVbQB5v0B6igzIKSHgzqADtdDCm8FdUfFYlgPVSXwo9b73EID5SU1986f1yMD5
 xjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683554352; x=1686146352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKI5hargzKBJ4u7aTkJl99CJ0qfSrzAu9HhTH/5DBYA=;
 b=JM0uv2hwlneB9vHCd6j/RNWnQ4ZkhxE2kp/7tC2R7lJiJDPldCkKc/hxtRIB98uCzS
 3lmbt+vSwjb4Rfk6Y35G+JgrB2goBJHo0/8S7cUm3wl/PxZJYyBSEbL71fKT+SmlLuia
 w2Sddn+0hfBgj4c/aS1IbGbD13muLSNdBUkfmUEKhi3VUuNquIPng4oKrIXzpc3pOZUu
 O1JkJgOzufknCTX77eSHTrE4bOPWVT5+IoeAbCYCMm1zYWnepX78L739eVggNWtl5qdp
 p3BqjCJvP0gSyI3w8RUtBaz4MmPX4R25y35Br/uBBVNoCFjlBfNzX+E1UpZ7B0fWspha
 CT5g==
X-Gm-Message-State: AC+VfDwzLecY6XPdD/EpSnCJsb3Wo+R6c/BDKd/nL3HhlWGyr4H4gcGe
 uD/tYF9FfsB4Cd4h+s+iuk9C/0vuc2IV8cFEc5k=
X-Google-Smtp-Source: ACHHUZ50LkNfTNRkSeGJJPoa/BAX/xul353Ik0wlxeRY6hIxnEX5WoLqEnM6SGjMhC3zTb7ICsPNNWeUaMeA3jfGlNY=
X-Received: by 2002:aca:c0c1:0:b0:387:31fd:1782 with SMTP id
 q184-20020acac0c1000000b0038731fd1782mr6592750oif.28.1683554352400; Mon, 08
 May 2023 06:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
In-Reply-To: <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 May 2023 06:59:02 -0700
Message-ID: <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 3, 2023 at 10:07=E2=80=AFAM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Mon, May 1, 2023 at 8:38=E2=80=AFAM Dmitry Osipenko <dmitry.osipenko@c=
ollabora.com> wrote:
>>
>> On 4/16/23 14:52, Dmitry Osipenko wrote:
>> > We have multiple Vulkan context types that are awaiting for the additi=
on
>> > of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
>> >
>> >  1. Venus context
>> >  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
>> >
>> > Mesa core supports DRM sync object UAPI, providing Vulkan drivers with=
 a
>> > generic fencing implementation that we want to utilize.
>> >
>> > This patch adds initial sync objects support. It creates fundament for=
 a
>> > further fencing improvements. Later on we will want to extend the Virt=
IO-GPU
>> > fencing API with passing fence IDs to host for waiting, it will be a n=
ew
>> > additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU=
 context
>> > drivers in works that require VirtIO-GPU to support sync objects UAPI.
>> >
>> > The patch is heavily inspired by the sync object UAPI implementation o=
f the
>> > MSM driver.
>>
>> Gerd, do you have any objections to merging this series?
>>
>> We have AMDGPU [1] and Intel [2] native context WIP drivers depending on
>> the sync object support. It is the only part missing from kernel today
>> that is wanted by the native context drivers. Otherwise, there are few
>> other things in Qemu and virglrenderer left to sort out.
>>
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658
>> [2] https://gitlab.freedesktop.org/digetx/mesa/-/commits/native-context-=
iris
>
>
> I'm not saying this change isn't good, just it's probably possible to imp=
lement the native contexts (even up to even VK1.2) without it.  But this pa=
tch series may be the most ergonomic way to do it, given how Mesa is design=
ed.  But you probably want one of Mesa MRs reviewed first before merging (I=
 added a comment on the amdgpu change) and that is a requirement [a].
>
> [a] "The userspace side must be fully reviewed and tested to the standard=
s of that user space project. For e.g. mesa this means piglit testcases and=
 review on the mailing list. This is again to ensure that the new interface=
 actually gets the job done." -- from the requirements
>

tbh, the syncobj support is all drm core, the only driver specifics is
the ioctl parsing.  IMHO existing tests and the two existing consumers
are sufficient.  (Also, considering that additional non-drm
dependencies involved.)

If this was for the core drm syncobj implementation, and not just
driver ioctl parsing and wiring up the core helpers, I would agree
with you.

BR,
-R
