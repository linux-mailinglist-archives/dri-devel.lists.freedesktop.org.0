Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D125273EEB6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 00:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F4010E261;
	Mon, 26 Jun 2023 22:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A7E10E261;
 Mon, 26 Jun 2023 22:38:33 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b698dd515dso33294441fa.3; 
 Mon, 26 Jun 2023 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687819111; x=1690411111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/4BPPMHxIuX4VVUkfnAZKGZOTCGN6vqENFDffRdr5PA=;
 b=jQFjf4X3mG+0YOiNUYcjsja7cQ+ItKtzN8+vj6u4YVgsB4JaIqtuhMT5UCVUxUJz4i
 ZEDU69/ocAs3SvgoX+rDPvyDPOlHzbuQz/lyEAYF6L0LH+8LgctjGFNm4Vejo7MxVzDt
 qiJjofMJtWSRxEVa10tAOWjc+h7fi/7Hv05huAdjtBimk8g1S+ueVSLTo7op4BLp7ON5
 jvf5lj7DKxmOb5m6ju6QC6fnctbhz4mgT/io2QdujpKtpLMPYeNaco6tAscDk9Xkz5rQ
 pWWh3HUFbUIbbkW+Cf/iIIqufSPZY+ydtcQZIpa8QIJJJ0JPVMXz72S6TAns18MhtEP2
 apKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687819111; x=1690411111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/4BPPMHxIuX4VVUkfnAZKGZOTCGN6vqENFDffRdr5PA=;
 b=MbKjSN2Q7inrJiJOyOMzAubZeLd4qxegiTstnEiUwCu7z2UeNstaZmu1/Si0hGaIYE
 La4elsmX/Pfe2YnPgcrqFxoHE/T21WlY/LKc+TP0N4sqh/RC9DdYJl5HJvPQpyaZjzK2
 +iflnArs1OgBYrmH2fVmJ1vxaaa31OkhjPZP1ZDuU21M3ad1MS4tRi7/aj4kcXlck315
 QEWcCWrU3Ex/53XUkRomy2v1C8FgozsyW5OArcx2HTOQnhhPhCrywaUws+jg+MqT1WG5
 Lpl9u3g5UuFQCSLfRH0HfJdMPvrxURyozfJ36qt/B8Kcx36IKPjLbQS+gAiUfTaCsf8p
 rnhw==
X-Gm-Message-State: AC+VfDyTqPDTCZW+etEbw2HOrCwj2HI9AkYV4UnkLpamlAyERT6zvoRV
 n3lLgE/7CO/ihPmIxPCFTNVgr0riz5BbxzmlkCc=
X-Google-Smtp-Source: ACHHUZ6lR+r47SwmWrLOLwTX0weKHcxS2NtYt9q6sHoMoPzLK4Ljmu+yCVm3VJkQRyQVU7ShZUnwFUHfeto+xg4lEu4=
X-Received: by 2002:a2e:2e10:0:b0:2b6:9b4a:2608 with SMTP id
 u16-20020a2e2e10000000b002b69b4a2608mr2962412lju.37.1687819111001; Mon, 26
 Jun 2023 15:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
 <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
 <c1f05169-dec0-22ee-52fa-c8070678394e@redhat.com>
 <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
 <4a52ac7c-19ba-8906-5902-fbf75673bf59@amd.com>
 <d18a4ea5-4e8e-be69-84c3-ca658f5cfd24@redhat.com>
 <923e914f-d367-2f74-9774-f0024d946bdd@amd.com>
In-Reply-To: <923e914f-d367-2f74-9774-f0024d946bdd@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 Jun 2023 08:38:18 +1000
Message-ID: <CAPM=9tzQ51LEc9if5HBCgbn7-HUOPw+qEvx7jEE2hk6gYBKvOA@mail.gmail.com>
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > As pointed out by Christian, this would optimize the "get all mappings
> > backed by a specific BO from a given VM" use case.
> >
> > The question for me is, do other drivers than amdgpu commonly need this?
>
> I have no idea.
>
> >
> > And what does amdgpu need this for? Maybe amdgpu does something we're
> > not doing (yet)?
>
> Basically when we do a CS we need to make sure that the VM used by this
> CS is up to date. For this we walk over the relocation list of BOs and
> check the status of each BO+VM structure.
>
> This is done because we don't want to update all VMs at the same time,
> but rather just those who needs the update.

This seems like a legacy from GL and possibly older vulkan, going
forward vulkan can't rely on passing lists of objects into the kernel
due to things like buffer_device_address, I'm not sure we should
optimise for this situation, and moving the tracking list into the
drivers is going to mean having a bunch of drivers all having the same
boilerplate, to do the same thing just so amdgpu can't avoid doing it.

Now there might be some benchmark somewhere we can produce a benefit
in this, and if there is then we should consider going this way for
all drivers and not just allowing drivers to choose their own path
here.

> >
> > Christian - I know you didn't ask for "do it the way amdgpu does",
> > instead you voted for keeping it entirely driver specific. But I think
> > everyone is pretty close and I'm still optimistic that we could just
> > generalize this.
>
> Well, you should *not* necessarily do it like amdgpu does! Basically the
> implementation in amdgpu was driven by requirements, e.g. we need that,
> let's do it like this.
>
> It's perfectly possible that other requirements (e.g. focus on Vulkan)
> lead to a completely different implementation.
>
> It's just that ideally I would like to have an implementation where I
> can apply at least the basics to amdgpu as well.
>

I think we can still do that just either have an option to disable
using the list internally in the gpuva or have the driver keep it's
own tracking alongside, there may still be use cases where it can use
the gpuva tracking instead of it's own.

I don't think we should forklift what is pretty likely to be common
code across every driver that uses this going forward just to benefit
an amdgpu design decision for older stacks.

Dave.
