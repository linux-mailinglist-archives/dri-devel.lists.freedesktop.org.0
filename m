Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1989210A3D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2176E88F;
	Wed,  1 Jul 2020 11:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7D36E88F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593602658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0yfRNSZH7jw3LwxF/5C1mFfotPxZcAA3DmkNVF3agc=;
 b=iHkY2YMUGWFd7ZNtKJ7Id2PJLB2moD8F8n4g+aam2oVKkVoRSxyt9B3NzsMTgE59kOiZp4
 bt0vtzJ8Xm6ene7xaolTNotM4BxFS1zZrmoAWfWt5rW1w6wNjS4Y+7QPvWVYLL1oMQ2vSd
 kaXAwqpsWaKXjE0axAVciPUFCeUInmg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-QCdt6RPGMquCSz22MSrAVw-1; Wed, 01 Jul 2020 07:24:11 -0400
X-MC-Unique: QCdt6RPGMquCSz22MSrAVw-1
Received: by mail-qk1-f198.google.com with SMTP id f79so10762357qke.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 04:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0yfRNSZH7jw3LwxF/5C1mFfotPxZcAA3DmkNVF3agc=;
 b=lKLZKoXDpxqlVNpZ0TBa+RN1/r9y0ked5Y81YKmt9/zbdyaWBjx7CMz5UX6ToYzhJZ
 MR03HweW4hShz9X7VsMsb9GarIhEo6aEGKvgnZDyWKtpDXpsYrYeISzX1dVLJfryw6RI
 ZC6AZB0swt7kiznYP1uvLi3aUTnWGzv/NWxf2NxsyK0deEP9OvHdSn0b22qWdRQbk1Jm
 iJSMf6N3jpzCHybGTukTOStfBv3e/cQwltS0jHhErawI0a/FYwUGk75HPqyQ5tGgeuqA
 02IaVuUnWX4Xgs3t0xkEfARODrccS4WavnYKz6kD09XZScZHySUEzzcLIqKOcBQVvN1X
 TDxA==
X-Gm-Message-State: AOAM530hDHgEp4XDecQDBJpon5SbLs1lWfj4kWAbTB1zbG1eN5yoQzyn
 XIThUKXJD0ia6MwGVPc0N6knXBeP9S5blxZwcBOY0NP2o16No5H2JkFsB5y9d3UDCs+FvOsnTud
 Iz67OfiOKRDY1C6oFyeYUkbGWc/fTN0n1E92dcQoS+Rbz
X-Received: by 2002:aed:208c:: with SMTP id 12mr25653165qtb.286.1593602651312; 
 Wed, 01 Jul 2020 04:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbe3/mk0yAROfKDdFroQfk3ZID3DtTYPB35Q69fjTtOuyoXNweu61AJE29nOxb7iqVnZIUltP//HI7XwvB/DM=
X-Received: by 2002:aed:208c:: with SMTP id 12mr25653150qtb.286.1593602650968; 
 Wed, 01 Jul 2020 04:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
In-Reply-To: <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 1 Jul 2020 13:24:00 +0200
Message-ID: <CACO55tvT0fOMai7k7oAP1TL42YAuMwJocxk2seNgjYibs+h5oA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 1, 2020 at 6:45 AM James Jones <jajones@nvidia.com> wrote:
>
> This implies something is trying to use one of the old
> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> first checking whether it is supported by the kernel.  I had tried to
> force an Xorg+Mesa stack without my userspace patches to hit this error
> when testing, but must have missed some permutation.  If the stalled
> Mesa patches go in, this would stop happening of course, but those were
> held up for a long time in review, and are now waiting on me to make
> some modifications.
>

that's completely irrelevant. If a kernel change breaks userspace,
it's a kernel bug.

> Are you using the modesetting driver in X?  If so, with glamor I
> presume?  What version of Mesa?  Any distro patches?  Any non-default
> xorg.conf options that would affect modesetting, your X driver if it
> isn't modesetting, or glamour?
>
> Thanks,
> -James
>
> On 6/30/20 4:08 PM, Kirill A. Shutemov wrote:
> > On Tue, Jun 02, 2020 at 04:06:32PM +1000, Dave Airlie wrote:
> >> James Jones (4):
> > ...
> >>        drm/nouveau/kms: Support NVIDIA format modifiers
> >
> > This commit is the first one that breaks Xorg startup for my setup:
> > GTX 1080 + Dell UP2414Q (4K DP MST monitor).
> >
> > I believe this is the crucial part of dmesg (full dmesg is attached):
> >
> > [   29.997140] [drm:nouveau_framebuffer_new] Unsupported modifier: 0x300000000000014
> > [   29.997143] [drm:drm_internal_framebuffer_create] could not create framebuffer
> > [   29.997145] [drm:drm_ioctl] pid=3393, ret = -22
> >
> > Any suggestions?
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
