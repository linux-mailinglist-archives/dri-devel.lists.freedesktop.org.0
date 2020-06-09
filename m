Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C01F3B1B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 14:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1EA89A1F;
	Tue,  9 Jun 2020 12:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC6089A1F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 12:48:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so24854908ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
 b=mPvH/CmSSgHpsp6C/uqGy+AZnrwq9ay/aD+xL69u0ckBRA03GUU6MFGxmh+3CM1tav
 AfWDP7Q9/kw8uNorr4dLbJuH/FugHOrbW0L1kLqWhDSSadhfoReraccYGm4jgU7kawd8
 RGjIDKBu5LhPtGQKJgD/ULY4bXazpgO9iA14JBJv66Y3rQpom722EcFJrvzFlju4+PPd
 63XOl+NUFcOXugFmtxpKQxHGSYD0dz7w2Cx82vNQ64DciwKJ7UBf4oAtnd9ez4db6tPv
 EbJNPf78cg6H1YxzFFexQgQPzILS0+t7j4K95pw+fRVIfPDJAVT7HG2C9pHJDGj5daVO
 vuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
 b=A+sAv6rGjkqUu406EBTbhHyN7JVd++se8JglMOAHKzUvgu4Hq7tfnkGTJt6M7OKfut
 WOBLRit0BzYIZangj3/mtHmg47AJ4WMYQjAnHT0INhyP9H5ejSXDE5kKXO6s4KYtuQZH
 sdIClCEbOD+WRpGUbks8u+hf08diZn4NyzEdwImibp1sXKG6y/+NWktuDIlxkuKxDRl0
 q23mzYB4Vy0XMM7TL1s9BNZWMVs7416RX50w9aYvamVaIulVVLpTXffvwyyO/nOz05Lo
 rQZ6aXtOcYWGb+Jc575E7vsK2Lf3mFgJnj37ULsb/kgE7te3Yte+Cd3ElDDGwkxERySi
 RGeQ==
X-Gm-Message-State: AOAM530sqNDb0J+o3j3zlDUq6d7P59ikMROtodxSmRURrsXuqAKcft3M
 FsPwdRxeQAGhCmmlmuHqZ1k+iXLAGwz/B4NRFq/r3w==
X-Google-Smtp-Source: ABdhPJy/jDW/k8Iu7wTAdiTg2q3uE99N0IA6oABBl2JcyK9DT3ERhQ6uhNzdJoff9mYZXt3GW+4EBXl7qqFZLpBxRpQ=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr14419265ljn.286.1591706918718; 
 Tue, 09 Jun 2020 05:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
 <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
In-Reply-To: <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jun 2020 14:48:27 +0200
Message-ID: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > I ran into a randconfig link error with debugfs disabled:
> >
> > arm-linux-gnueabi-ld:
> > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> >
> > Change the helper to only look at this variable if debugfs is present.
> >
> > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This fixes a compilation error for me on the APQ8060.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Could someone be so kind and apply this fix to the MSM DRM tree?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
