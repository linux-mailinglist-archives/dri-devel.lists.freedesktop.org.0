Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3E4395C6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 14:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5289F2A;
	Mon, 25 Oct 2021 12:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E689F24
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:14:03 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 65so7536099ljf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9EdUhOEz6LCHy9Q4PpzvVDj9adp0XAbP/V+787pVMF0=;
 b=o+dWeZI/z6lqMSLsbil6YIyE1jqJSEN4+lcUSDasiWYLtPgepVuV9yRFGul/S+IZjd
 gDbGpaNe3bqNbRWJhQ8uzBY4CiicZs1uR5BS3+MoUCDorm+8eG2KGfZD1N4QFQhEcKYw
 xy7gxDmYOZRBm6yhyTEiLwdcWRAlH9ewRtC0Drmg6f6HGWdLbLyhETNKBPdWq8uo1CSV
 cbAWIYtOWs8A+jmLxHgpOUrmw4sE93EPz2L+YLH6FIq17e7sB4yGDacegypyYqkVZsfc
 +nFJF2hSn2fSDbNW7rTDUeK7o2Z6gvK87WT6kkz+wB0G7qLv3XjLyhikq5itsQnyPrpo
 L0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9EdUhOEz6LCHy9Q4PpzvVDj9adp0XAbP/V+787pVMF0=;
 b=j5iF8h03kkip+s+v32Gk1OLRhf7wmuTqfVg97QnJE97FI/yfggX9j7CvIOwYnLO2Rw
 6vHw/ZUsW1L2/LqtNrKM6xj35NZl2vGW535jx9VM59oH7++TKxKSysuSnu3eTaH19bK8
 2J0x53j9hIRmsjA3ugY56AtZP+n3+a3yfO0ta9d3I3A/cxcWThnFS8sPlPUhQ5JKw12j
 O2cQWNWCyA8e9fGmfLvF1pYQAKbqA1Dn4UlXBrrLoEdd7ypmsq5JiLCNxYRUZGyubpCR
 VTA4AJJz4Jcfj/gVi6hCyVnIwvDfM9GP616TSnUBJB/gW8TPA+Bw6pRoUrEKLi/YCh8t
 Kiyw==
X-Gm-Message-State: AOAM531qRF/jQF6PMmLSmla5WUVrYo0m6tLgepjRT/+xGV0lmsIdAZTK
 s2fGWJAsn9axHjv7xOscPD2O9DBTRNRclBpOH9CTUA==
X-Google-Smtp-Source: ABdhPJxMcBXf08mQujD6/q+CS6va26l4F0UMxyQLEYHppTQUj1YDoHEdo/Gg27zgpNe8o6sYV7ePnDmBYzD5E0mpwE8=
X-Received: by 2002:a05:651c:2328:: with SMTP id
 bi40mr18700746ljb.121.1635164041366; 
 Mon, 25 Oct 2021 05:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211010124628.17691-1-gregkh@linuxfoundation.org>
 <YXaIx0g/kHEnq8ZN@kroah.com> <7328189c-0567-847e-17e9-e2ed4f3a78f4@amd.com>
In-Reply-To: <7328189c-0567-847e-17e9-e2ed4f3a78f4@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 25 Oct 2021 17:43:49 +0530
Message-ID: <CAO_48GE9C_eOK84iYwvNjkGQRcFQQ8Hn-z70ndOhmF1gbmd5BQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
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

Hi Greg,

On Mon, 25 Oct 2021 at 16:29, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 25.10.21 um 12:36 schrieb Greg Kroah-Hartman:
> > On Sun, Oct 10, 2021 at 02:46:28PM +0200, Greg Kroah-Hartman wrote:
> >> In order to better track where in the kernel the dma-buf code is used,
> >> put the symbols in the namespace DMA_BUF and modify all users of the
> >> symbols to properly import the namespace to not break the build at the
> >> same time.
> >>
> >> Now the output of modinfo shows the use of these symbols, making it
> >> easier to watch for users over time:
> >>
> >> $ modinfo drivers/misc/fastrpc.ko | grep import
> >> import_ns:      DMA_BUF
> >>
> >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> >> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> ---
> >> v2: added lots of acks
> >>      added 2 more drivers that needed the change, as found by Arnd
> > Ping?  Any ideas on what needs to happen to get this into the tree?
> >
> > Or can I take it through my char-misc tree?  I seem to have a bunch of
> > acks on it by the respective maintainers...
>
> I could push that upstream through the drm-misc-next tree if you like,
> but honestly char-misc sounds like the better approach since this
> touches a lot of drivers outside of drm as well.

I agree with Christian here - char-misc might be a better way for this.

>
>
> Thanks,
> Christian.
>
> >
> > thanks,
> >
> > greg k-h
>

Best,
Sumit.
