Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E9E53E431
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 13:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E205010E277;
	Mon,  6 Jun 2022 11:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541E010E277
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 11:22:00 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id d128so2745450qkg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xTsthcJVQmhF7Xm+0URj3QnPKdLx/8RaDMYR7w133tE=;
 b=ZOewfqDrRLi/wwwz9ymLuAwvXjjYy53E3ClhFkvNdW+qY5vw0HCyp+up9VCzwFAaYC
 TMZMyPxvNTz3csXNIdbs8rsyOHKUCVlnSamtOkI5F6E+zyV50wpCEXQvwX3Vchoobyi7
 oEFLlmugJIZbBqnAwFBO6Jj70E2UYEMPY4tyZ6RIl1lE7paHygqQJIl3SXwoKeKrBZYA
 jB8JdfEshy0LTf9aQq+lrbp36yS2ywNM6/WARXiQodcjG0/HrurVUVIChqTOmFDB6oPq
 1W/cgapZ8twK+qTRv/lhZly7yjV0TCgOfRUkFeaWIQg0kk3I6VDhSs8SX5kgj8n9OUBC
 fFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xTsthcJVQmhF7Xm+0URj3QnPKdLx/8RaDMYR7w133tE=;
 b=OwxgygC2fpLgkE7CFiTzUomhh+OvF+zTDCszAcTg/CBhjN4IkhMlhVMaY5zHTCHC+G
 PRhf6uLj2gPBYGNuLBFnt14fc7zPdMDlM3mDtdYkI3YLhAEWTzjuKoeH3+RQzDaWKDeP
 uvuWzTFAWLaOwJEhaCrxiPvGr2MZUfyHE5AHsg3GJUm3LW5ZGRu4ASw2xEpVt6rkAV8I
 eqQngTleeLPFO54hCcFBts+7399BE8UUp+prDd9EdKuvuPaKPZkqE8YedkfcJEQck3nq
 nlvEMGa3BXVOZWuk3z0+93qH9n5PN5UF+vxsHPZK6u8dCRQno+U8UzI3VHtDjOQ35q6g
 s/UA==
X-Gm-Message-State: AOAM531rr2uTNa7mrAtErlMvgsoOi2t1ROl/+Tnhy1OEM942ZQKku043
 5hD6CtYL1NVpoMpanS4DD3aYFDiWkE2HMjRnAr0=
X-Google-Smtp-Source: ABdhPJzzrtziPOS1KJw58ikyVeRSCTJtL+zJfPSfWpi98XNxg9V5/7ZCr1rZWPNC30U++ZWvtfSeh1uxvMfo6LMcU18=
X-Received: by 2002:a05:620a:4310:b0:67b:3fc1:86eb with SMTP id
 u16-20020a05620a431000b0067b3fc186ebmr14966019qko.495.1654514519340; Mon, 06
 Jun 2022 04:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
 <4714286.GXAFRqVoOG@jernej-laptop>
 <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
 <20220606092006.4bgxibmayv44juox@houat>
 <20220606092225.yxyw77mtuqpbmd35@houat>
In-Reply-To: <20220606092225.yxyw77mtuqpbmd35@houat>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 6 Jun 2022 14:21:48 +0300
Message-ID: <CAGphcdmFyK0023cW=UuUWCzqXtkMNBF4t+9CGR13ULaWseJVaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode
 property
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

=D0=BF=D0=BD, 6 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 12:22, Maxime Ripar=
d <maxime@cerno.tech>:
>
> On Mon, Jun 06, 2022 at 11:20:06AM +0200, Maxime Ripard wrote:
> > On Mon, Jun 06, 2022 at 11:17:20AM +0300, Roman Stratiienko wrote:
> > > Hello Jernej,
> > >
> > > Thank you for having a look.
> > >
> > > =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:37, Jernej=
 =C5=A0krabec <jernej.skrabec@gmail.com>:
> > > >
> > > > Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko n=
apisal(a):
> > > > > Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> > > > > "None", "Pre-multiplied", "Coverage"
> > > > >
> > > > > Add the blend mode property and route it to the appropriate regis=
ters.
> > > > >
> > > > > Note:
> > > > > "force_premulti" parameter was added to handle multi-overlay chan=
nel
> > > > > cases in future changes. It must be set to true for cases when mo=
re
> > > > > than 1 overlay layer is used within a channel and at least one of=
 the
> > > > > overlay layers within a group uses premultiplied blending mode.
> > > >
> > > > Please remove this parameter. It's nothing special, so it can be ea=
sily added
> > > > once it's actually needed. For now, it only complicates code.
> > >
> > > I would prefer keeping it if you do not have any strong opinion again=
st it.
> > >
> > > I am working now on exposing all overlays, so it will be needed soon =
anyway.
> >
> > KMS assumes pre-multiplied alpha anyway, so we shouldn't need a
> > parameter to force it: we're always going to force it.
>
> My bad, I got confused with your other patch.
>
> Still, I agree with Jernej, if it's not needed it only complicates the
> code for no particular reason. If you need it at some point in the
> future, add it then. Otherwise, it's hard to reason about, since we
> don't know what are the expectations that those future patches will
> bring.

Well, existing code already has some sort of support for the sub-overlays:
For example 'int overlay, ' parameter is always 0, but it still passed thro=
ugh
the call stack. Therefore this patch is just aligned with already existing
traditions to keep sub-overlays in mind.

>
> Maxime

Regards,
Roman
