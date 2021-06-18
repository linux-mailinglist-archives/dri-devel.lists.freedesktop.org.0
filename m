Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5753AD3B8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B126EA9A;
	Fri, 18 Jun 2021 20:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3B6EA98;
 Fri, 18 Jun 2021 20:38:05 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s23so11881062oiw.9;
 Fri, 18 Jun 2021 13:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzQpDhklEQ/5JlkHM/IA/NZF6AkpVhxvXEzA5dRQIjI=;
 b=p70oAnIs6IQq6Ii4vFXv91weYphLY4hkgeFYkNdbJQZ26R/K66sFhdHxqJs4SAkro0
 XaRrirrgceTLhhbdLevolozfeNf2idvkRPM5qqIN5qRf0p+iD0jxmIPVMrPemAhpovbb
 wu34ka+hGc7vqvV6Er3UrxFku3iCwBrRCtC1yYbfYrx0t7KeI2R9TMZ2GRYvZ/pzbtGz
 ctMc97NUhOkBMxgNGPTyslklR/Ggvl8MDJIIK3/HrUAoaR/O1KNlVA3V9YxKHNq4oVLZ
 SUqFtUqA7F+cGhOfTpGCB4mz5f4MFTfnD9yB3qabg5qAmtyB2+3v3cBC7ZziZ1UaXr62
 Pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzQpDhklEQ/5JlkHM/IA/NZF6AkpVhxvXEzA5dRQIjI=;
 b=XWmsiephK2ihP2FRb0vmvp2acIbYusBUe49L2HMjuFRXzIcKvGteofzQFLsWeXSlHt
 946vgkGlZSHWO0qqqVvrEDDnrPDt5zMe3NeQL1PVpRJxNvTm1+ZUBJfOBfdnaXHnMkHz
 MI3DSiaNFl1/QxjxEyVzEbDykEGVd8RgT6ItWhPcjwujhp59Eaxx2lmhpvHYeYgd5zNb
 e9PKWpMWjQBPMiUwBNwIRswIiW3/rjuEBOpaOOG7f1qTV7R+FsJnErW4064+5C21IrsJ
 zUwQqCZob4+jYT5xlEDCgDfxWZi0rTbWWv0SvlKPlmWMe69MxiL+F6PBJy55x4NtswXe
 jH8w==
X-Gm-Message-State: AOAM531h0BdgvfmqckxHxpRv6VLt/pMyI9JP96LP1VblOLarUyb7sCZD
 5rnbsjrHCmfkbQlw4H+/s/bbcrNq/e0JPVx463I=
X-Google-Smtp-Source: ABdhPJwPkOTpTcBJLf0vMYnm7L/iRZoDmTGcxgxVQ2BTrNe/wrDM7fXiHCbU+D1ce1/UDivRGWO3a/Ma2FItssBnnk0=
X-Received: by 2002:a05:6808:999:: with SMTP id
 a25mr8503622oic.123.1624048685292; 
 Fri, 18 Jun 2021 13:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <1623979403-50239-1-git-send-email-zhangshaokun@hisilicon.com>
 <f934cbe6-369d-a7ad-ac03-3c8dcc6526a2@amd.com>
In-Reply-To: <f934cbe6-369d-a7ad-ac03-3c8dcc6526a2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 16:37:54 -0400
Message-ID: <CADnq5_MBP_ATmZuNrhLTeOCOkXH1SYet7NmdJcTYCKe6Wa34xg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove the repeated dpp1_full_bypass
 declaration
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Jun 18, 2021 at 9:48 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2021-06-17 9:23 p.m., Shaokun Zhang wrote:
> > Function 'dpp1_full_bypass' is declared twice, so remove the repeated
> > declaration and unnessary blank line.
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> > index 9a1f40eb5c47..71b3a6949001 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h
> > @@ -1497,8 +1497,6 @@ void dpp1_cnv_setup (
> >               enum dc_color_space input_color_space,
> >               struct cnv_alpha_2bit_lut *alpha_2bit_lut);
> >
> > -void dpp1_full_bypass(struct dpp *dpp_base);
> > -
> >  void dpp1_dppclk_control(
> >               struct dpp *dpp_base,
> >               bool dppclk_div,
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
