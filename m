Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D7978F9C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 11:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF510E190;
	Sat, 14 Sep 2024 09:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0P2m/V5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FC10EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:28:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-206aee4073cso28575965ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726262914; x=1726867714; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eUXF5H5IXAzMNdp+0PMvadCYVO9boEDpM2jvPihbWCo=;
 b=c0P2m/V5WSy4gheg1yP4jKvW1W3oxJpEAJW/PFhk97JvEaQuKFRDGint+dNoiQqc4c
 Vhw9cG2+r6sDj/0e9/zb+Ih493+dhwXJsZNTfgjWEoaA0KuirsAteQLEzQWsqU2iAmc+
 qa0e1IsdQuPuO6L4Mm0Rj9v3dGMJz9ToonZuh+V8xc/fbkRqxOAQbUve9O2UPqPza3Yk
 zbyKXryhqfUA9pG2Bv6ZOmD8U28zAEh+TdXZW3cjO9IZYo5D00DwpYokzzbs78Jkz2Qe
 s7VvziKgRXmB6/lkYs+AxfFdZ5Y0unBVULRn2/iS3XAE+2gvRCl7VDNY+0FXT3OoKkER
 OUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726262914; x=1726867714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUXF5H5IXAzMNdp+0PMvadCYVO9boEDpM2jvPihbWCo=;
 b=RucpmMUottP46paSxZ25JhF3jIIHB2R6WhQSWIXtQ+02GRD0ulgYNaiH3GO2ljT1zT
 wh/v8yXcInhRsX7jI8+k7hGfgBxZFi+vpI1M/idB69BHFnCtcqL446J5i3xj+55+MG4I
 Kj4scGn23+nVWgWuHtz1toMjQ79MWPPlr2hLbb1CNV071pCXnztlyr5mD22f6TEJV5nq
 mt69caL09XTjqFThIeNsfbbOfRNaSZoDGddOF1ODDNio/EDkCGizgJvtu6/IDPf/j9tE
 7uWAC8oTt0QSVhfxYzRFQZqRO4uMv3/l0byrrYw41l257FpMsnxHjW2sWCNp8rFZQGsh
 BCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDm8T3NhbPcKOsTE4zv7A2pHTTfgSUcDknolNW+kQxJCZvn4KnBy+bz36HJuVX0KM1hQDbBZJ4wWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/TMdZy9eajClch7EldDdzN5ah2Um4302RZ7DeNgM3l9FuX2ul
 ulIfe9EJ1M2gkI2d9nFNo6guALbn6fl2E8ToxJu2UXhnpS/jNHUqNO/p5w==
X-Google-Smtp-Source: AGHT+IErA4QcPhjRnWC+bHzkpYBAkSoV3mGELKKhRk+7WAcjf+ONdJ1RhUqC8LGm0+14W5f3lPmJOA==
X-Received: by 2002:a17:902:e54a:b0:205:7835:38dc with SMTP id
 d9443c01a7336-2076e44917bmr108642345ad.60.1726262913925; 
 Fri, 13 Sep 2024 14:28:33 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9f55:654b:622b:2859:2848])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794731494sm680765ad.257.2024.09.13.14.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 14:28:33 -0700 (PDT)
Date: Fri, 13 Sep 2024 18:28:29 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <ZuSufaLavkdMdsSL@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
X-Mailman-Approved-At: Sat, 14 Sep 2024 09:50:57 +0000
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

On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> the value is 4, i.e. insert_pcuv is already set.
> 
> According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> but before this driver sets the hw_params, and this patch sets it back to the
> correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> no longer necessary (but is a harmless no-op).

Hi Hugh,

Thank you for your extensive testing. It seems then there's no action we
need to take for mainline, as it's already fixed there.

> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> 
> btw, this patch doesn't apply without edits as these filenames are incorrect.
> 

Yeah, I see. My bad.

Thank you,
Geraldo Nascimento
