Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2B452A51
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 07:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F696E8F5;
	Tue, 16 Nov 2021 06:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 16 Nov 2021 06:05:38 UTC
Received: from mx6.ucr.edu (mx.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2630E6E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 06:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637042738; x=1668578738;
 h=mime-version:references:in-reply-to:from:date:message-id:
 subject:to:cc; bh=Z3Zujelhp95n7JiGO15pEnuj1r6cZj7PyaJcCYcZCrc=;
 b=PkgmIRsNGXr03C1mGjncXZO+aF7UffQCP7Mkx5l//5VS4N8U18xPAjna
 uhI5t71/WLtin+5QWRSYFhunhgPOefiPz1jkXxEkWaHxLeTq0tH/xarat
 rKmgMTKYBmz1Nup0fUReyfTfvvBs+EHiC1h5ro0rfFEX9KY7FSwIMBn2h
 /JydcC6NP+URJUwFrQzz5aev5t7Eu0t2j70HT6iN5VbDYJLTKguZzp26O
 CAnw7pH8Nt/feQBQSfmD4jX8hGTTWFxfxhv2uRrHEErCilzrhRvQMxhxd
 8rSRcSHxAjv7uOvoW3Cy60KwR5erwmaMnMYUrEvHJr+divhYONrR0hV5J w==;
IronPort-SDR: T2f+r5babBzCENavGGkd/RXXkDIiYg1TQhku1G2F7vQXbqel8OQXh41bqtQkpJYsrWnpXn9O8K
 MjtPowIEzmaRvZJSjQchLwWjhqqnaDLMzY3ooLbwMWbfRH0EbQsPnwd98XUcjJx2ynNG2dLdK4
 OBOvHQK+unX7rBTXy4WyT9nDGeMkGc1kMsWnlnUQuevfplh0154QYpLiSSMjM38Co6P4oCXlur
 ru2+wmrDcvz7gJtPdkafJt8ssL7Td/xH//J/z1tUNgn3bsDTZfDPhVMGfocdjWcmGU64fVkV11
 3DR4jfkM/FPflYVxVBBHB8qv
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="258779262"
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 21:58:31 -0800
Received: by mail-yb1-f199.google.com with SMTP id
 v7-20020a25ab87000000b005c2130838beso30785536ybi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 21:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/XhVolQXCHPmPCzdRzFWhpIuM6H2Dzx9QQPO3TDOnQ=;
 b=f867r1i2Ostx6BltPr4Oc+FLyknNCfRZZ8l/kHRJB8wnAdh1Z+85jOUgfhVaqYWG43
 PnHHT6jy+L7VBZdHouMBNsvuWuuto8figPchs2mldQ8qtJC5qaOraraScvZVlbxxkf4L
 SkpkgUNLz56wCGs3dil3hUuNC1TeoZwqBwW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/XhVolQXCHPmPCzdRzFWhpIuM6H2Dzx9QQPO3TDOnQ=;
 b=ciHHS4SzdRimwT/g+x+b9MvZWPe24crMyi8AHwKofGw8zDInJ7UtkP2UR3bgdrFA0y
 T1Is/T3uZ1hweoexfCzNMQjJ66W8W4P0Sj6NoKuF08VuUOSumuUdO2MpAaCz2ms58che
 kTfuydwepje78j3XtMrCZAeXHRjI/3dOrKNHQ7QOTRNgdiWadNB/Ef5sYsB0Vp17brqC
 9cY8mwurr8K2lf5R+aA1i4vTAs1YJP0rIzFBCyLovtv3kzZiHW09WcNdhKQswDNdAADs
 8rbKXVL6D5X3Sk2jETGh0Ig4p2L9M4j+FcPEMpf5vocBELJTPpd+s0SU62JeFY4083tT
 xwIw==
X-Gm-Message-State: AOAM532rxoWm0W7L1OtJz1TWBx5JC2Gk5q1/4UsdmfjeUsYgWFYre2lx
 9m1FVoyR15oehZ2PqAQwIeErFymIVQ+M1l/NkjNBdM5WfHp49nwYpUnxoTWszkux1+6mikBcg7D
 +xvSSYmORcO1w7vJ7E3gij4D3cPV2/01pcW77unoc/ALvKg==
X-Received: by 2002:a25:d103:: with SMTP id i3mr5547193ybg.260.1637042310179; 
 Mon, 15 Nov 2021 21:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwUr/rkQjN0wPIocSPR9Ha22HtX3sCwe21HdQmlEhLyrgEeqa6u/wE7tEwiSL8OX/t6aAWemYEafgo1TEtMxs=
X-Received: by 2002:a25:d103:: with SMTP id i3mr5547162ybg.260.1637042309942; 
 Mon, 15 Nov 2021 21:58:29 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
 <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
In-Reply-To: <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Mon, 15 Nov 2021 21:58:19 -0800
Message-ID: <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/core: fix the uninitialized use in
 nvkm_ioctl_map()
To: Karol Herbst <kherbst@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karol:
Thanks for the feedback, the patch might be too old to apply to the
latest code tree. Let me check and get back to you soon.

On Sat, Nov 13, 2021 at 12:22 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> something seems to have messed with the patch so it doesn't apply correctly.
>
> On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> >
> > In function nvkm_ioctl_map(), the variable "type" could be
> > uninitialized if "nvkm_object_map()" returns error code,
> > however, it does not check the return value and directly
> > use the "type" in the if statement, which is potentially
> > unsafe.
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > index d777df5a64e6..7f2e8482f167 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> >                 ret = nvkm_object_map(object, data, size, &type,
> >                                       &args->v0.handle,
> >                                       &args->v0.length);
> > +               if (ret)
> > +                       return ret;
> >                 if (type == NVKM_OBJECT_MAP_IO)
> >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> >                 else
> > --
> > 2.17.1
> >
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
