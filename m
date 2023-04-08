Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1826DB941
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 09:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B484210E11A;
	Sat,  8 Apr 2023 07:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15B610E11A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 07:07:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9476e2fa157so210586366b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680937660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXoFjgpD9Cwq3kIRxNGd8ecDEoW5EyNl4Aqp94FhPuY=;
 b=T3cs/IbldKyYw0jlOQBYubSsMBksZ/OsOf01EiSQRyLFouIQ/LDT6VDaWTlzucFVme
 RSog9LR8VZ4x519GvDIpPxMIeqdaNYkx/9wcSNiDms+hRFIxycfbb2vt/vJSRXP7GG8/
 bq5r5YGs8GbCitPKhjmMiXFm917Yv4Osfscaa5ScKJNuBPNjLtOIIgnEdyfIz8CLEiy9
 KcDOBHFXhvjTUzSF/hP7E8h2EGvBLHJJNFz9vXMbRbOV0UqwzixgBXrC2WlY+5hJIogd
 CIHCqETGiVSLF9EXN2q69VUcLduz0rrPXxn/vxw0FT5shCF0rvelG2pwLZdE/ZSCRqsw
 uPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680937660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXoFjgpD9Cwq3kIRxNGd8ecDEoW5EyNl4Aqp94FhPuY=;
 b=Bv4AE10+ENpDYikHNupEq9YbI5FANDgAU0mSuX+ht0maVLFl6g6UvOP5pP22qzDawe
 Ox5Aa2cOPZ4uKM9MgdYzt/EreqJzQytNPu89IOhQ5rz6scbWg7cg9ISVwaCEyMCznkIx
 vOC5dDLyh0gRTJtjbc7qsg69t82iizMoR9LjMZQcOqenQZjGHkbot+hIiBjFBuJztwVI
 /WyhRSgpjgWBLNZMxQNelS8oNQb3ylzD3vc6I7JV2Iyz6mJB0uzz2VfmKXdZxU4GqV2Q
 bBMBatNiMftMf/oQ9YHcwNURb/0ExA37zmc2H3u0VumyG63JI5jYYtVY3fip+e9UXFbF
 XUOQ==
X-Gm-Message-State: AAQBX9fBft/SGm6sNW9N7+gu2A66Kk93fpa8Qmj4ablP092XoJfEolDs
 kKBWmdlGnz6pfewzosECCCA=
X-Google-Smtp-Source: AKy350ax5r2EKzYegd2xSOZGrwHN58yVwJQh5K3T49zBPaaDMonr78zO1J+MoRtd49ztjKFYPf0xuw==
X-Received: by 2002:a05:6402:b09:b0:501:cde5:4cc9 with SMTP id
 bm9-20020a0564020b0900b00501cde54cc9mr3621206edb.39.1680937659702; 
 Sat, 08 Apr 2023 00:07:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 c90-20020a509fe3000000b005047d3c8700sm1285380edf.65.2023.04.08.00.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 00:07:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>, Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Date: Sat, 08 Apr 2023 09:07:37 +0200
Message-ID: <2219295.iZASKD2KPV@jernej-laptop>
In-Reply-To: <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 05. april 2023 ob 14:34:11 CEST je Roman Beranek napisal(a):
> Hello Maxime,
> 
> On Wed Mar 29, 2023 at 9:58 PM CEST, Maxime Ripard wrote:
> > > In order to preserve semantic correctness however, I propose to preface
> > > the change with a patch that renames sun4i_dotclock and tcon-pixel-clock
> > > such that dot/pixel is replaced with d/data. What do you think?
> > 
> > I don't think it's exposed to the userspace in any way so it makes sense
> > to me
> Here's a new series that includes those renames:
> <https://lore.kernel.org/all/20230331110245.43527-1-me@crly.cz/>
> 
> It turns out however that the new dclk rates can't be set exactly as
> requested without touching pll-video0*, tcon0 now therefore gets
> reparented from pll-mipi to pll-video0-2x which, as it further turns
> out, breaks DSI. While simply forbidding the video0-2x mux option seems
> to me as the right way to go because there's not much use for it with
> non-DSI interfaces either besides the opportunity to power pll-mipi
> down, I'd like to run by you first.

It's been a long time since I looked at A64 HDMI clocks, but IIRC, pll-video0 
is the only useful source for HDMI PHY (as opposed to HDMI controller.)
So question remains how to properly support both displays at the same time.

Have you ever tried to make HDMI and DSI work at the same time? This is one of 
issues of the PinePhone IIUC.


> 
> Kind regards,
> Roman
> 
> * As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
>   retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
>   in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
>   The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
>   294 MHz though because it limits itself to 6 MHz steps.

Yeah, we added CLK_SET_RATE_PARENT flag to several clocks after initial driver 
was merged. Adding this flag sounds completely reasonable.

Best regards,
Jernej


