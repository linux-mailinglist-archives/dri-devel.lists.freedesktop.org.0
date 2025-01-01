Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01D9FFF82
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78410E081;
	Thu,  2 Jan 2025 19:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T6A5Hj2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337A210E221;
 Wed,  1 Jan 2025 16:42:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43635796b48so65185405e9.0; 
 Wed, 01 Jan 2025 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735749681; x=1736354481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=673uKSPzcYnBh2TsZV1+vzSMvKs5q5gmZERqpENWy+4=;
 b=T6A5Hj2AE+mqcmclz1jmKhJK2GSR0i0Wqsjnf2yDZAF9hi26C9Rk9qhxTWJX28iwp4
 XF7XcyU8lauIqnMGMdjoQOVr8sPMKXRDIdppg5AwNutWmsKyhtPQvCQTtRYPV87rOLfz
 W/psKVaV0kCsqZtbV8cuoDsrIyGVnYtxrHUELIFENZUprRyQ2irq+Q1m8s898/1+amME
 tJ5y5ZTEYBzguDM1oT77vvxJnElex/e6Wtk3PqOUphdpFiXEkpSEypyOTD10QSkYomj5
 jpfBw1DZXs0OLGsB8ZNaRu9ETXybDGMRHRS8HKqnVF9ui2t2A8lbL8o7Dwm46i5zW+sF
 Salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735749681; x=1736354481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=673uKSPzcYnBh2TsZV1+vzSMvKs5q5gmZERqpENWy+4=;
 b=PL0jgvY0amKjut0A42GR09Z+H4DGUUqs9odlfmfrjBG2ijB4k/KGnSCN5v2e7MDiAB
 EZhWKFHcVxt9BrinKEC5Ac5l24aBJTFFQES2VPNqkFVy3fozec1zE2AW8WMHYGVARg14
 nTPEzQ+/FIXcoAPikUmItaYqtn5S2Ke9+XNLauLlYzz4EF7e+Evk088ieCY1kL1ubURL
 ofCzdiCtHoubKrprwf2W0MTVSC+r9RyNk2Qhi9yl7qCCwIptboSJQiz0WdtBOpFmMqxf
 zFHFbTmVnnlaIFKh1KFkBybcTlEGm4nlt6IT5VFlDDOmxpB+IPDp0+QmM1VOmSEZi9lW
 jpvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ1wRM+cTdqNg9D2Jb8P0FYg67EDkaihlwli8d3TwXIRMUZwZwZLsclEADpDUM4GddGd7zV3/Rq9Te@lists.freedesktop.org,
 AJvYcCW751/1Ov1VzQf5VkRN3btZzkz62cMgVLxAINN/ywhmKXnsyG1E/t74nuSpNeUdUwhtKlVJtet5/uQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK3BY/ZU3nX1a8U4KDFyVZeaLF9q4Pykk/Uaj6qzP4XqWH+XuG
 xAJBEbGZTO4FYkhl4o8598nWPZcOcubvQhe6IAW5ViOWXaqmeCCk
X-Gm-Gg: ASbGncukDlIbDMq9pJdQ9GIA5/7s1hnG8U1nzFwyiDEvm4GR3zO75fnTET8WzB3/PT0
 xbtK/L6YOIMKnLbO+Zp1xLiAN5DcGsMAdebxtrR1/XzANmDl5xQClsDjrkC2WESlLftjKz1YOD8
 77bNMB1FTnRPMBn0KtTDQn5ccCgnNbgnLIkd0YHB49gnBxW6e7O7JMad88SXM5xalSTNI9SCvjY
 yBIvC5EtrRBlCBsqKo/yD8FGFfgNS2bJBuVTKGs/hix4yTfjhfkLJygVYTB5Q1zJ5sgbcrdY1rE
 BReZKE0VZNbINNvPWfvYglw=
X-Google-Smtp-Source: AGHT+IHQHSCpLv1Uk9ROvVaAadFohvt3o6x+X80bv++kGLPADaDQj6k0S7ZMrKyj9Dk+KcAYYjcUig==
X-Received: by 2002:a05:600c:a0a:b0:434:9e17:190c with SMTP id
 5b1f17b1804b1-436693f7cc4mr339030115e9.0.1735749680436; 
 Wed, 01 Jan 2025 08:41:20 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364b0532a6sm449633705e9.1.2025.01.01.08.41.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Jan 2025 08:41:19 -0800 (PST)
Date: Wed, 1 Jan 2025 16:41:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Reuven Abliyev
 <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Message-ID: <20250101164119.000d2bd4@dsl-u17-10>
In-Reply-To: <20250101153925.865703-7-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-7-alexander.usyskin@intel.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 02 Jan 2025 19:43:55 +0000
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

On Wed,  1 Jan 2025 17:39:20 +0200
Alexander Usyskin <alexander.usyskin@intel.com> wrote:

> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 76ef7198fff8..230bf444b7fe 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
>  		len_s -= to_shift;
>  	}
>  
> +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {

I'm sure that should be (to + len_s - 1).
Using GENMASK(31, 10) completely fails to indicate what is being tested.

> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data;
> +
> +		memcpy(&data, &buf[0], sizeof(u32));

	get_unaligned_u32()

> +		idg_nvm_write32(nvm, to, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		buf += sizeof(u32);
> +		to += sizeof(u32);
> +		len_s -= sizeof(u32);
> +	}

It isn't at all obvious why copying 4 bytes helps.
Indeed, if 'to' is 1023 and 'len_s' is 2 it goes terribly wrong.

	David

> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data;
> @@ -295,6 +313,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
>  		from += from_shift;
>  	}
>  
> +	if (!IS_ALIGNED(from, sizeof(u64)) &&
> +	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data = idg_nvm_read32(nvm, from);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], &data, sizeof(data));
> +		len_s -= sizeof(u32);
> +		buf += sizeof(u32);
> +		from += sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data = idg_nvm_read64(nvm, from + i);

