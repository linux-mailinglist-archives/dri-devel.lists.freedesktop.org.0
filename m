Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E978C71B0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFFF10E09C;
	Thu, 16 May 2024 06:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Yr/bZpoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6C110E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:43:26 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5e8470c1cb7so5246050a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715841806; x=1716446606;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MbD9OONNgONi8UaqGSjW3pD6UDCGtAlGXcl7rP3rgjE=;
 b=Yr/bZpoTj61Dr9HItPCR1/nDzRe0bsPfRCBFMkQAIEBZ4GdKFkEgroCF3Ug4GHBWNy
 BdbDel2n8SNhnxMNjF9vm+C2p5Umdd5WHzQRDhnTzJMQXhI7WkgeDy829SleQV65jNfx
 psNSa3iIgOre9GFfUyF9qDPuObEiwuElpkYLNMQsYDWuZKBkTquQLzE7CWbuRfeVJNjV
 396vEQqvzO3XoOiMVfEpus9xGZCsO2bPQfpyD0qbpfLEGT18i0bhIPIbnwMYtERBQ2o4
 ODzuQhs+xT8TmFrJEzdZwjACDqBLleK+5bE0wFAeUIvJYmcSF/MbWIWIZK7E7QWYBjRk
 qDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715841806; x=1716446606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbD9OONNgONi8UaqGSjW3pD6UDCGtAlGXcl7rP3rgjE=;
 b=CnkCM9izpQu0QQahNjpdWrA1RZq3SUfPqlk2VzsBsxlVNu8VcMk/oNDHhBNN63vChc
 xmZvcjPr5LvmKqDns6AvdfVGthyJ3sHu6/zTsjcTREqQccTETtl+xOuT7BISxl5XSBTS
 MOVkEqG6+5e1IrsqCZq227Bn8i2/Cr1/v40aNnFtoaKbS+XvGoo/EfsexqTyxcO+/OJk
 q7ZsDVwBwSHIqX7TXkq+iyWLkNj2pAM7DVorUnOP2hRsIo7yfDjgttaLxqktMoyGO7st
 /sg8xAthauqsd7PFhKuTTARGyZNyye8wEUPx/2IJQbyMRIRYDusqrFz8Zd6WFXtz3TlK
 tW6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVXSbyQmtL5Ks2dF2Uw5GmibD/c9LM2HB8JB6iC/lqKJ899gMCTjVdSJBL63kb10lXkBN5eLq+yAf1CvnBnDsgDm+9eJO/Wy4iqCpXlw7f
X-Gm-Message-State: AOJu0YwksEirojILJgfHPmc6wVMSJ1x0FYHf27cKOg3GIBPZuQMyCabj
 WKhOvDp7sOSOLXpvFC6Q/iVl3bDL2EmpF72bNNJXEXK5MFDFf5GbyyX98mLpoOBmn5mQi8q/tNp
 +cQNttRULXSbK5wc2lgTdazIaRDgdELHlC22/qA==
X-Google-Smtp-Source: AGHT+IHDppSukXCiHciUkgsTerTNmnDmHK840fw5n4L6dCa9CfJH8j7P5339bVpVAT53uRl05JVp5ugFFtAulpNDsuM=
X-Received: by 2002:a05:6a20:f3a3:b0:1af:acd5:b462 with SMTP id
 adf61e73a8af0-1afde201cbdmr16442323637.50.1715841806422; Wed, 15 May 2024
 23:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
 <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
 <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 16 May 2024 14:43:15 +0800
Message-ID: <CAHwB_N+foZpCjqUy0dJdS2wBbUjHVRQQP0p7S_eTG1Yrh0bgPw@mail.gmail.com>
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

Hi:

If it is determined that a separately patch needs to be sent, then I
will remove this patch in V8 series?

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=8816=E6=
=97=A5=E5=91=A8=E5=9B=9B 05:28=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> On Wed, May 15, 2024 at 2:16=E2=80=AFPM <neil.armstrong@linaro.org> wrote=
:
> >
> > Hi,
> >
> > On 15/05/2024 03:46, Cong Yang wrote:
> > > DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WU=
M_NL6.
> > > Since the arm64 defconfig had the BOE panel driver enabled, let's als=
o
> > > enable the himax driver.
> > >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >   arch/arm64/configs/defconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defcon=
fig
> > > index 2c30d617e180..687c86ddaece 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> > >   CONFIG_DRM_PANEL_LVDS=3Dm
> > >   CONFIG_DRM_PANEL_SIMPLE=3Dm
> > >   CONFIG_DRM_PANEL_EDP=3Dm
> > > +CONFIG_DRM_PANEL_HIMAX_HX83102=3Dm
> > >   CONFIG_DRM_PANEL_ILITEK_ILI9882T=3Dm
> > >   CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dm
> > >   CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dm
> >
> > You should probably sent this one separately since only an ARM SoC main=
tainer
> > can apply this, probably via the qcom tree.
>
> Really? I always kinda figured that this was a bit like MAINTAINERS
> where it can come through a bunch of different trees. Certainly I've
> landed changes to it before through the drm-misc tree. If that was
> wrong then I'll certainly stop doing it, of course.
>
> -Doug
