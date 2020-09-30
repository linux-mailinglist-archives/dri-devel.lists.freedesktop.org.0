Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124D27EAE9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 16:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A0489D9B;
	Wed, 30 Sep 2020 14:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4989D9B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:28:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so1767751ljo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LNZSATopZvHbgR/4b99CRcpXTktdC6uhs22y5re6+iU=;
 b=ySY2T1RygXRt0RkOKlRd75ETVAyq+okk3tJUwxELRj1ysPKahjxYody4ShGPiodpKg
 zIIdQQn/ETek8M73EUQ7eCjg4DARRijxf45koj3V+Sg8eUAvOGzro9ySLu2NBpFhIdkE
 f/iEncnFsdMNlMFsOYcPJEYvZX58L1YQdzX+j25m++hbZjOb3611LI6D0TZLQSfzeqRK
 p37iukPbdFsnFfFnfZEerda6HVVdqJwGCwn2z+juu++10kWde985aZXyeypEdaVrLai0
 a3er6x4TSktrcktGLOUWsJJG5yn31YCGBsy4rfv3QRY2OQRm7g32WPLNFZz2SK0T63Zm
 z97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LNZSATopZvHbgR/4b99CRcpXTktdC6uhs22y5re6+iU=;
 b=twUpYfPfWn7L+aW2Je6VoenBQQo3pbHXnYRcshGGk8lsG9XfceJ/3R/HSEAkWndXJ5
 Gr3wS0F0oEkeZDiDfa9ju9vGpbLkpDgXo7DtbAGRBrQQTI3oy0BcWhJEq+SGjzgp5ftL
 e+wwT8ncKHNFJCFQ/FdoplF+FEu3pwE8RwLar5el6cwu9PxZ5u54wGnF13guy9gCLmu6
 nJd+xNqbhyX8LsPNsMP5uY8GMIMPZjZg8Ed3biIqBNaGwwDg0p/sW9bpE7BpX/sANxKi
 Qy4+GxIwyNmz9nJG1n51WxPK6wJ4UElBKh5EZdhnj4h5enYnCnv2rlFtchQFpNT3DcGm
 xwXQ==
X-Gm-Message-State: AOAM530pxs++w19Lt4De6IhCHpq7Uk8A1pu9VWnDdX+72cVk2gtbmkrY
 yehZHGnPI/C7Pw74kbwoT1Z9htlWbwbvxYCIS0pKPQ==
X-Google-Smtp-Source: ABdhPJw7SHsb/RlTOpoMoIsTDxXdupxWGFSMAEBFgFEaUBNmVLFcI79BckzifBpoUP7EkMyfOK0KVFYz19hMphQmiew=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr1029225lji.283.1601476103362; 
 Wed, 30 Sep 2020 07:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200929195344.2219796-1-pcc@google.com>
 <CACRpkdYqCJumZesRVcWq74aNmoi2HgDnYoKOYLjWo5tT1soogQ@mail.gmail.com>
 <CAMn1gO45D9nwuJT_iHyzrHpYCx8uEN_pmCOuQLUn_vwh4VQQcw@mail.gmail.com>
In-Reply-To: <CAMn1gO45D9nwuJT_iHyzrHpYCx8uEN_pmCOuQLUn_vwh4VQQcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 16:28:11 +0200
Message-ID: <CACRpkdYxDyh=XCTMKFtAVBWaskXkULRgt=g3ZLdfKoPhojVJ7w@mail.gmail.com>
Subject: Re: [PATCH v2] Partially revert "video: fbdev: amba-clcd: Retire
 elder CLCD driver"
To: Peter Collingbourne <pcc@google.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 11:16 PM Peter Collingbourne <pcc@google.com> wrote:
> On Tue, Sep 29, 2020 at 1:33 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Can you also share the kernel config used for this build so it is
> > easy to rebuild a similar kernel?
>
> There are instructions here for how to build Android targeting FVP:
> https://cs.android.com/android/platform/superproject/+/master:device/generic/goldfish/fvpbase/README.md
>
> It also includes instructions for building the kernel (which is the
> Android common kernel so it does have some patches on top, but it does
> closely track mainline) so you should be able to make your changes on
> top of the common kernel, rebuild and test them that way.

OK I'll try it! It seems to assume the user is already familiar with the Android
build process in some sense, and I haven't built Android since 2012
or so, so I need some struggling to get up to speed.

Android being as it is I suppose it as usual also require quite a lot of
harddrive space to build, so I need to get hold of a computer with enough
space on it.

> Because of how Android boot images work I don't think it would be easy
> to provide binaries where you can replace the kernel image. Let me
> know if you have any trouble following the instructions.
>
> The configuration is basically a combination of these two configs:
> https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/arch/arm64/configs/gki_defconfig
> https://android-review.googlesource.com/c/kernel/common/+/1145352/11/fvp.fragment
>
> Those configs enable the fbdev driver. You can apply the patch I
> posted earlier to fvp.fragment to switch to the DRM driver.

Excellent thanks.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
