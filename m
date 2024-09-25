Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63249855CF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406E910E2DB;
	Wed, 25 Sep 2024 08:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rgBuQSq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2E10E2DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:46:45 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f75aaaade6so68653331fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727254003; x=1727858803; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8yRGp5lskF2mbtcxmoFpyzKd/BqPva/CreLYlU+Osqs=;
 b=rgBuQSq9NyLml8TQOI7wTD3SGhmdZaU7Z5v/DUPcdF2yNk/1LGI1fAftsvioQe+DYV
 dSfFnWuoN6/+nCx1yrpatdgKqoURkw2YNYjS+op7gqFJ3SFlPcPimAv0jIIGqpvyqDaK
 hfUeyPjn1gxhGFEP1Xwe2BpjfcgoEKT0yCXYK9Avha2zT9yveEJVpslontO1wEe/Rygw
 oSRZ7ZxKkuyX5b4J5zD4/NSt4XjKpJWKNYX/ORvOGN9CPAFiu1X3twouOhrW1F1eypmV
 BA7XfeYvDcOUKzY+uC5NiT84siNBUJ/ka5mk/ky5mbweTxlzRySaETGB42tN2e5g5jXq
 BRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727254003; x=1727858803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yRGp5lskF2mbtcxmoFpyzKd/BqPva/CreLYlU+Osqs=;
 b=rzT/RxZrIjPE66BUGXg9aNDOLMukwXXR7Ip4mVw9hAK+wClLsEcTtfFpBUJVNxhNO1
 hG4COJoUnVLA73ZT+WmeZP8TD066lRUieOp8tDBYQ2KfXBy5mImU4ctX7oaX5wnw3XDH
 4HQSPin3FfHzNDPkXDR7eFL6OuP/+kkzBSP8wFNnX1dc/uMzIRR21GbDdM9Agno9W9f3
 4mhF/AMR11/BqNNRshNZ1CzHcg0nWwrz7myhCuLs2NiqSonhQg771pBHPOoM10On7oX+
 DJ9VZDIaVAyxHiIgRV676/YunZerHhlPS0kY+EqwHFDkNH2sXs81KFevomvIKVIfvibw
 neUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGRgn2f9TL3WFTJbsdF30Vj7gcQA2OZLeZM2C3iWf4BSatDHdAThBOdVYcpikzyS/RY0eTBr69ZUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTRsmStSpuoOYCFBqaeGABnD8PmXqWatBjFH8fXCWArCeq1MNw
 Zz+TjD80zqtISacEOsRjCJX7/FH8ANM3a4wk2xn3Jgum9LYOleHPP5jt9630oGY=
X-Google-Smtp-Source: AGHT+IHGGuuc5DgIEE8huO5Nf+QqWz4aKGNfwoBxKPNxJBNkF8LnAA0IjcwCRgwvkpbCrrQ5J09w3A==
X-Received: by 2002:a05:651c:2128:b0:2f8:d537:2846 with SMTP id
 38308e7fff4ca-2f915fdf844mr12642871fa.13.1727254003253; 
 Wed, 25 Sep 2024 01:46:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282fd34sm4517451fa.28.2024.09.25.01.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:46:41 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:46:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 02/10] drm/bochs: Use helpers for struct drm_edid
Message-ID: <hvf7ws4x3uemp6o5ucwfvmrv6wbtgl2xfb7vvut4qrop4j7b6y@ncqluxhfsd7f>
References: <20240902105546.792625-1-tzimmermann@suse.de>
 <20240902105546.792625-3-tzimmermann@suse.de>
 <2fuwrqk4aeuflsxjr73zj6nyvvmpmiupam4oemw7oxfia22ila@5hehupmjzkhh>
 <c5c1b947-bf7a-46c6-be8e-ddd52d90b707@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5c1b947-bf7a-46c6-be8e-ddd52d90b707@suse.de>
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

On Wed, Sep 25, 2024 at 10:15:49AM GMT, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.24 um 06:35 schrieb Dmitry Baryshkov:
> > On Mon, Sep 02, 2024 at 12:53:40PM GMT, Thomas Zimmermann wrote:
> > > Implement a read function for struct drm_edid and read the EDID data
> > > with drm_edit_read_custom(). Update the connector data accordingly.
> > > 
> > > The EDID data comes from the emulator itself and the connector stores
> > > a copy in its EDID property. The drm_edid field in struct bochs_device
> > > is therefore not required. Remove it.
> > > 
> > > If qemu provides no EDID data, install default display modes as before.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >   drivers/gpu/drm/tiny/bochs.c | 48 +++++++++++++++++-------------------
> > >   1 file changed, 22 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> > > index 47a45a14306c..197fc00b373f 100644
> > > --- a/drivers/gpu/drm/tiny/bochs.c
> > > +++ b/drivers/gpu/drm/tiny/bochs.c
> > > @@ -85,7 +85,6 @@ struct bochs_device {
> > >   	u16 yres_virtual;
> > >   	u32 stride;
> > >   	u32 bpp;
> > > -	const struct drm_edid *drm_edid;
> > >   	/* drm */
> > >   	struct drm_device *dev;
> > > @@ -172,12 +171,14 @@ static void bochs_hw_set_little_endian(struct bochs_device *bochs)
> > >   #define bochs_hw_set_native_endian(_b) bochs_hw_set_little_endian(_b)
> > >   #endif
> > > -static int bochs_get_edid_block(void *data, u8 *buf,
> > > -				unsigned int block, size_t len)
> > > +static int bochs_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> > >   {
> > >   	struct bochs_device *bochs = data;
> > >   	size_t i, start = block * EDID_LENGTH;
> > > +	if (!bochs->mmio)
> > > +		return -1;
> > > +
> > >   	if (start + len > 0x400 /* vga register offset */)
> > >   		return -1;
> > > @@ -187,25 +188,20 @@ static int bochs_get_edid_block(void *data, u8 *buf,
> > >   	return 0;
> > >   }
> > > -static int bochs_hw_load_edid(struct bochs_device *bochs)
> > > +static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector)
> > >   {
> > > +	struct drm_device *dev = connector->dev;
> > > +	struct bochs_device *bochs = dev->dev_private;
> > >   	u8 header[8];
> > > -	if (!bochs->mmio)
> > > -		return -1;
> > > -
> > >   	/* check header to detect whenever edid support is enabled in qemu */
> > >   	bochs_get_edid_block(bochs, header, 0, ARRAY_SIZE(header));
> > >   	if (drm_edid_header_is_valid(header) != 8)
> > I understand that you probably don't want to change the behaviour of the
> > driver, but maybe it's better to check drm_edid_read_custom return
> > value? Bochs, amdgpu and radeon are the only drivers that call
> > drm_edid_header_is_valid().
> 
> The nearby comment indicates that EDID support might not be present in qemu.
> But drm_edid_read_custom() warns in this case, even though it's a legal
> state. Hence the test.

Ack, thanks for the explanation.

> 
> Best regards
> Thomas
> 
> > 
> > > -		return -1;
> > > +		return NULL;
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
With best wishes
Dmitry
