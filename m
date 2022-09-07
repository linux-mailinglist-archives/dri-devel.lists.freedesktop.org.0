Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F55B0C8A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 20:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5F310E826;
	Wed,  7 Sep 2022 18:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBB610E826
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 18:35:21 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 130so22867294ybw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=STJNUAoDz8/H7GZWo2JC/f9FzlPrG+LEjtWrEMBbtXs=;
 b=RskBKCOfeFOaMxC6KYoO1H6x+3b5BOgf0WTEukFan66nkQS9frqNBSpq46LtZuBCV4
 dK6cNYLtIkbozPkYsjq8blAENOPmRaaWV1SVHk42judEYe6ZQmXQ9be56/fLxl2OmPfu
 Aw6ca/tM3cGUYfGTctoPHZPqSdeUk5A5+Tncgs8cYb4YDrjXgcvOjoUZkJQA4GQ30Vwl
 x9Hw2iBs7sgIuHdBr15dVtqthnyn+QXuLBjumdG04Bj5vHWQrEfvMKGhbU6tuhTdBoE+
 JOkxbtqalDnWAmyT3CvJzX0EonTumQpI5lnWbBKiqhO5s6W5QwxLtTwGyp5LiIaodCCa
 GeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=STJNUAoDz8/H7GZWo2JC/f9FzlPrG+LEjtWrEMBbtXs=;
 b=hw8LFuoh8pbbIUln3pmN7XiLboo9DthrkKmGIuA/+1ebkrUk48ytNmrOcT+zgIyt2I
 ScOxRJlnCkAED9JC4rfWa4saKZNC7KwAmao2VjlO1yYq5Vh+ULgrBvsocBqNSRHqyorZ
 Saf1zNK1nFVbxM1xD5lsjYbDfU6BLInotGUMtgYE+R6a2Kj6UMlpBm9UROd+ydK1ho3J
 0Yu7Ist3fWItn7/3sdxM8fHeGI5SgqxyDRbQVhq3GLdxDv4c4Tkm+50siSGKjyY5fekX
 3Ay2j02NITttPNBnh1kPxEBG5BDxpJ9jABlIHYrHswmJyN5j6T0ZgGzitcHD519DvfJA
 U5nQ==
X-Gm-Message-State: ACgBeo3PK+rv+g4pjdOcMdt4Zqi+6qru6Vni9Lf3zsoJJ3BGg87CPrgc
 5dMVCkzNJQg7dQoLmoT2AwM2uq08KRsGZ5DECKk=
X-Google-Smtp-Source: AA6agR4z5iyGc/KnbqOKgxH+QqziQC1XLVqpCtNUnd525QBq6NgFTnEt6ShlgjJeBS1/7kliuF78qGIlm6wja/49KCQ=
X-Received: by 2002:a25:dbcb:0:b0:6a8:e19f:9938 with SMTP id
 g194-20020a25dbcb000000b006a8e19f9938mr4130188ybf.158.1662575720543; Wed, 07
 Sep 2022 11:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
 <20220907170451.efhz62nkxybqxtaa@mail.igalia.com>
In-Reply-To: <20220907170451.efhz62nkxybqxtaa@mail.igalia.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 7 Sep 2022 19:34:44 +0100
Message-ID: <CADVatmNodAV4PB5jjARnowu=VGbgMWgBYDWPuwJe-f1WFaS8ow@mail.gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
To: Melissa Wen <mwen@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, linux-next <linux-next@vger.kernel.org>,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On Wed, Sep 7, 2022 at 6:05 PM Melissa Wen <mwen@igalia.com> wrote:
>
> On 09/06, Sudip Mukherjee wrote:
> > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Hi All,
> > >
> > > The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
> > >
> > > The errors in mips and xtensa are:
> > >
> > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > >
> > > The error in arm is:
> > >
> > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > >
> > >
> > > Trying to do a git bisect to find out the offending commit.
> >
> > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > RGB565 format")
>
> Hi Sudip,
>
> Thanks for pointing out this issue.
>
> I think we can replace the macros that are triggering those compilation
> error by functions in drm/drm_fixed.h that do the same calculation.
>
> I checked those errors when building for arm and i386 and the issues are
> fixed after applying the patch below. I appreciate if you can test.

Sorry, could not test as the downloaded mbox is saying patch is
corrupted and could not be applied. Can you please attach the patch or
maybe send using git send-email.


-- 
Regards
Sudip
