Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BF957266
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABCF10E341;
	Mon, 19 Aug 2024 17:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8XPM1DW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD41310E341
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:50:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20203988f37so30384725ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724089836; x=1724694636; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mOf43rLdvXlX2YVrcERQm/M+ITZnbYWg68aFZLl8QSU=;
 b=D8XPM1DWBXm2hzlzq2YDgEnctbG/HHnLTULiCASn8zONz92TSrjC2YPRwdPCRyo8Bg
 y17yAlgd5kRrvDtwR7wzS7yYLM4xAGtuUce6ML94PaefA5dZqoxfLTx7ONd18Bj534FG
 QzV8c68dvfcMzhgek9KmDtXRUYJe0K0R8E2o9zpl6iobUZtSVS9I7bAcEVVCCSJy/DvR
 rQLkXsyNuYWqoP9XFPAMTLZ8/xDcMpMnXrn5gehwzAy6eWCDKp9Oim5fEhdQmWaKdlcv
 eyRR8MNA5MVpXdqnnuJoayM8YYeINwtHiNIVEOFGNe5S0GqpKCfKd7X+zvR2AZTx5sI8
 vnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724089836; x=1724694636;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOf43rLdvXlX2YVrcERQm/M+ITZnbYWg68aFZLl8QSU=;
 b=eipH/SuUKJuR/PaSYj/5U0/Ph0M++Rej3YRSLgmJ5yTWaEFkfX9qivOCOYMYAQn6Sf
 jxn/DnF12JT4ktk1DSv7OdZ8x/ju7tO86JtYORwhyEnAVH2ia6u6a+vcq3rusPe/UsCM
 UtSPr3lXC7X3yCHRgJ9mjDxJRvD+iC9tHz6qs5kwCsdlanF+z7ZfToesBzfQ6zH+DKd5
 X9oFO6GYecdWlFWI9RIa+6GIOuLoYZIq+Mq03HXEgbjb5mrQMwLs9zUVoVGLsh0oGKpq
 oXESghA6jgMK3g04jQdKJn5SMx8713uVx3uzClwC/NmwWZ8QsbtrlpWiYmq2NMVLtHhr
 M58A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqh8I+P1+LjSd1UqhLsOPT52l2nAB9gX1YJPYL6ck/rR7k3yMZMa7UT1m8ZRNIIk93KHaSp8qxe7RBMhUYHvr2MbLTT5cu2PEMEXTaFkfT
X-Gm-Message-State: AOJu0YxAo/sW4Y/9IDpPa2bwA6IKxjj9Ty0SMJO+/cqsXY+0Iqf2qGV5
 DFWplIvaPoYcTpALDra2K2/QHujE7v7m/oFIvJl9VplVwXMqcc3l
X-Google-Smtp-Source: AGHT+IHthh45koxlcqVb51AsdJSIiP+ADIZPw47JXoa3D6QFq1yXv+bLoH3499/vUQxg94w0/AWJPw==
X-Received: by 2002:a17:902:d2c2:b0:202:5ac:fa49 with SMTP id
 d9443c01a7336-20205acfb5fmr141255095ad.51.1724089836004; 
 Mon, 19 Aug 2024 10:50:36 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.231.54])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f02fa4e0sm65064025ad.7.2024.08.19.10.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 10:50:34 -0700 (PDT)
Date: Mon, 19 Aug 2024 23:19:20 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
Message-ID: <ZsOFoP+NR/pGNC5M@embed-PC.myguest.virtualbox.org>
References: <20240812171019.561321-1-abhishektamboli9@gmail.com>
 <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>
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

Hi, Neil
Thanks for the feedback.

On Mon, Aug 19, 2024 at 05:41:07PM +0200, neil.armstrong@linaro.org wrote:
> On 12/08/2024 19:10, Abhishek Tamboli wrote:
> > TODO : Add missing comments for ILI9341 register definition.
> 
> Please rephrase the commit message, and explain why in a proper english sentence.
Sure
> Neil
> 
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > index 775d5d5e828c..cba6a6952568 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > @@ -121,19 +121,19 @@ struct ili9341_config {
> >   	const struct drm_display_mode mode;
> >   	/* ca: TODO: need comments for this register */
> >   	u8 ca[ILI9341_CA_LEN];
> > -	/* power_b: TODO: need comments for this register */
> > +	/* power_b: Power control B (CFh) */
> >   	u8 power_b[ILI9341_POWER_B_LEN];
> > -	/* power_seq: TODO: need comments for this register */
> > +	/* pdtcaower_seq: Power on sequence control (EDh) */
> >   	u8 power_seq[ILI9341_POWER_SEQ_LEN];
> > -	/* dtca: TODO: need comments for this register */
> > +	/* dtca: Driver timing control A (E8h) */
> >   	u8 dtca[ILI9341_DTCA_LEN];
> > -	/* dtcb: TODO: need comments for this register */
> > +	/* dtcb: Driver timing control B (EAh) */
> >   	u8 dtcb[ILI9341_DTCB_LEN];
> > -	/* power_a: TODO: need comments for this register */
> > +	/* power_a: Power control A (CBh) */
> >   	u8 power_a[ILI9341_POWER_A_LEN];
> >   	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
> >   	u8 frc[ILI9341_FRC_LEN];
> > -	/* prc: TODO: need comments for this register */
> > +	/* prc: Pump ratio control (F7h) */
> >   	u8 prc;
> >   	/* dfc_1: B6h DISCTRL (Display Function Control) */
> >   	u8 dfc_1[ILI9341_DFC_1_LEN];
> > @@ -147,7 +147,7 @@ struct ili9341_config {
> >   	u8 vcom_2;
> >   	/* address_mode: Memory Access Control (36h) */
> >   	u8 address_mode;
> > -	/* g3amma_en: TODO: need comments for this register */
> > +	/* g3amma_en: Enable 3G (F2h) */
> >   	u8 g3amma_en;
> >   	/* rgb_interface: RGB Interface Signal Control (B0h) */
> >   	u8 rgb_interface;
> > --
> > 2.34.1
> > 
Regards,
Abhishek
