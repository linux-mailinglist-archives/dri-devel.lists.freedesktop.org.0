Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5D79078D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 13:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643010E06C;
	Sat,  2 Sep 2023 11:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7266F10E06C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 11:10:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so47845081fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Sep 2023 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693653035; x=1694257835; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sCWoWPe6h8Qmaq6PAfz3dXsnt+0ElN/TsBNKOj8iL1I=;
 b=M/hsAbbrooVnQ1SsnUcjRNK4sjKKc1L1DZ1n/OgjxE7LXl+sH1dOyravkbD86py/40
 mnrxRxz5oUQ6J96iW75I0rq5oUv2iZPevi54DlaGm7n4j0b8gh3uwMofiP402VAx8/rk
 v1rbdiDrceGqJOwaA3yvt+1AUXCvTrEt7FrCFzs2v4mfWnUYnS0CgL5opjsTrAg88eKs
 jv18Bv5I6HpmTmTGFxOKCTYQb0KH0WXiNA9N29cYZ1xGRgxRZEgOKL/o3xazfpoDkn/0
 zicrgEfynm57NRMFiB6tfOXSUcvB8Jn2eMaVWwVZYkRm10qXo7Esdw1gAi4NMUTxEqBT
 dmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693653035; x=1694257835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCWoWPe6h8Qmaq6PAfz3dXsnt+0ElN/TsBNKOj8iL1I=;
 b=fFwKPUZZx8pwL/OenxKm0rB5IeljO92BH5zgkT5z57gQHHTldiz/kdncY3X0rLgWfB
 5Am2ITh6fc+7fjUODCvNfaIhp8tRnEMlynBue+MSXYs4m3UPJ9b7X/1vc89lNFilSUoN
 AeDtbRb9Tqosf/sIS6FYCTIKoZ2wlLQ8LHkjQ0Uou5RzcUG9TLG16ixK9thXp3Bhcmgo
 O8WVQlNGEzs7TfEKLx9ZYvlnCnnB1Kw0QDLISsFxxgb1Ihsyd0N236Vd3W4Cg8UIoXZJ
 lGijHkoyPrBNfrfdks9MSP4ksoH5V/l0wmnE3MgZxWT89JPDOwNVGqKj4Dyax+6XcdYt
 kJDA==
X-Gm-Message-State: AOJu0YzSi/rCw0MwjiDYkvRdzr/uXZ2ahd54M9y4toIvAgVlpBkPfkOz
 x93negzfuLgDwyRipaf1QFvTCqaYAOaKk5eYUiM=
X-Google-Smtp-Source: AGHT+IG/VqY3vkLqgYJkFoWyA3BAQzDL3TGfy+OM6GskqKn3cNhSQnpX1YM1Nnj35Q12kl0+w6BraWus5k49mAtQrh4=
X-Received: by 2002:a05:6512:742:b0:500:7f51:d129 with SMTP id
 c2-20020a056512074200b005007f51d129mr2639186lfs.34.1693653035278; Sat, 02 Sep
 2023 04:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <ZPDgdGBbxrTl+m2s@debian>
 <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wg4vpuourbbUPn19yFx2cNj93O6t0PhiARLLL6z22yV4Q@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 2 Sep 2023 12:09:59 +0100
Message-ID: <CADVatmMF1QS235CD4KbDPy_w9hAi0rN1EJqAXtJok2Xg0iE-UA@mail.gmail.com>
Subject: Re: mainline build failure due to 501126083855 ("fbdev/g364fb: Use
 fbdev I/O helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: linux-fbdev@vger.kernel.org, regressions@lists.linux.dev,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 20:04, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 31 Aug 2023 at 11:48, Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> > The latest mainline kernel branch fails to build mips jazz_defconfig with
> > the error:
> >
> > drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
> >   115 |         FB_DEFAULT_IOMEM_HELPERS,
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> >       |         FB_DEFAULT_IOMEM_OPS
> >
> >
> > git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").
> >
> > Reverting the commit has fixed the build failure.
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> Would you mind testing the exact thing that the compiler suggested?
>
> So instead of the revert, just replace FB_DEFAULT_IOMEM_HELPERS with
> FB_DEFAULT_IOMEM_OPS.
>
> I think it's just a typo / confusion with the config variable (which
> is called FB_IOMEM_HELPERS).

Yeah, you were right.
Patch sent - https://lore.kernel.org/lkml/20230902095102.5908-1-sudip.mukherjee@codethink.co.uk/


-- 
Regards
Sudip
