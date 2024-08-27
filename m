Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3DC960D67
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD710E334;
	Tue, 27 Aug 2024 14:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KOsU5HYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7B010E334
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:18:54 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-714226888dfso5000598b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724768334; x=1725373134; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JSMiJ5fVqnyKb+9n4eHykIt/ocg8tbqo6X0nAPTgvIk=;
 b=KOsU5HYc4W71Z3RfsJXPxf/+v6DFoCRFjHFfh3TECY1PEVu5rfhkDE+dFDq38XMI1I
 XXec39Yxc8jOYCoR7Q55gZc1n8R4/F28Tqyh8r0qOh2/jyxMszWgTpD+76wYVWnWuJaW
 LO1MT1C35CpPctJvcjlGJLHa0YSaJRkORdZ6c5RSHOs69uVZb8fNHrrFCJKFlhjmfnaV
 ypn30KQelAEczB0OE078EhMTrh/ieTUdlnt3RDr8EMauJA3QxK1+U2QbdRVPP3OYoWzR
 3IApRgJu7C2J4/n3mCh7JylIgPk++QPAhNQW7EYJHHEuhUHUgb93UmYGf5YOQJFbsCLB
 yuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724768334; x=1725373134;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSMiJ5fVqnyKb+9n4eHykIt/ocg8tbqo6X0nAPTgvIk=;
 b=i1KMfdYIkObcsnxflthFYWCdXEI2zAIRErq+gvFobcwNPAvnAM34A2zckxFLWy8Ydh
 acN8eG4Ku7KPDFhomfClQTwT6EH/JvJBfqNFe2Be3pVMb9CthugCUKT09O52gyGs2VZI
 yDzLg2kxkp63bUOJigiFSTXc8uaX7azFfbjK7SJDRrAOmblSM+ytXlJg5A7BEH1nh/qZ
 AJep9okLzGo6YOirkvJl1xiIckw/wNFVujH9+vD4UaqnC4uHiuEtwZQ735c8SP2aVjE9
 3ELoA3wzX55Hum6PbnPXPrwoQzdVFSE/pUEuddah2HInG90+c2oSGgJwuY4Tp8MhdBhP
 B7wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLxoL3MjtoHVo+fNpuqMpKY4gT5sUjFxBpb8d1exHQySpk4QehGg8KYCyETPbb8S04du5tm4yXFzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBJsHeX1aqz+Q4L4dKGQ6HyFZyOZ1sCRXyHVeOdSz3xEIzJ0ln
 6PDvN9XrHzPu4PIw73F5rZhlqQr9+9NJ5kD4/yOBjFVqdqXnjK6E
X-Google-Smtp-Source: AGHT+IFC8drrJmM4s4TDlAOrYOIKUf05TrbsTxNGNy/4YT441AzNhYGWwAjlpKQO3LwwXX8KcqVrdQ==
X-Received: by 2002:a05:6a21:3987:b0:1c0:e629:3926 with SMTP id
 adf61e73a8af0-1cc89d6bb9amr15486459637.16.1724768334086; 
 Tue, 27 Aug 2024 07:18:54 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.235.177])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d6136fc523sm12117848a91.9.2024.08.27.07.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 07:18:53 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:47:24 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: kernel@puri.sm, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: mantix: Transition to multi-context write
 sequence
Message-ID: <Zs3f9LIS1PenwMMX@embed-PC.myguest.virtualbox.org>
References: <20240826160328.12685-1-abhishektamboli9@gmail.com>
 <ZszDipyk1Ey8M0JZ@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZszDipyk1Ey8M0JZ@qwark.sigxcpu.org>
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

On Mon, Aug 26, 2024 at 08:03:54PM +0200, Guido Günther wrote:
> Hi Abhishektamboli,
> 
> I think this was already handled in
> 
> https://lore.kernel.org/dri-devel/20240820091556.1032726-2-tejasvipin76@gmail.com/
> 
> and applied
> 
> https://lore.kernel.org/dri-devel/172414629205.2571141.13215409630895562248.b4-ty@linaro.org/#t
> 
Hi Guido,
Thanks for letting me know.

Regards,
Abhishek
> 
> On Mon, Aug 26, 2024 at 09:33:28PM +0530, Abhishek Tamboli wrote:
> > Replace deprecated 'mipi_dsi_generic_write_seq()' macro
> > to 'mipi_dsi_generic_write_seq_multi()' macro in mantix_init_sequence
> > function.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > index ea4a6bf6d35b..f276c65cc9bb 100644
> > --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > @@ -49,22 +49,25 @@ static int mantix_init_sequence(struct mantix *ctx)
> >  {
> >  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> >  	struct device *dev = ctx->dev;
> > +	struct mipi_dsi_multi_context dsi_ctx = {
> > +		.dsi = dsi
> > +	};
> > 
> >  	/*
> >  	 * Init sequence was supplied by the panel vendor.
> >  	 */
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> > -	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xA9, 0x00);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> > -	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> >  	msleep(20);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> >  	msleep(20);
> > 
> >  	dev_dbg(dev, "Panel init sequence done\n");
> > --
> > 2.34.1
> > 
