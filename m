Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A16B07547
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28C10E118;
	Wed, 16 Jul 2025 12:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="axlkNEEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF0310E118
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 12:05:04 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so12842053a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752667503; x=1753272303; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
 b=axlkNEEHXcaCKNGW5NRPhV0MTZYItk0TYXFW9psjgc2l48HdUXTZTcjrYa/UT/zQxl
 hjHhZeeTcuTE/1DKzJwP6dPQAfI072h6Z8tucJIlp/lV6p+TQ8YB/xrizrcYq2Kt1TWu
 FyyamQ/l5NsqPOWr+oixWdbSrF96SbWJoFSQipUkBh4iTjJG+MTXIyavFkAkcW4o1EBD
 vMKcN7giKmQPTyde4C7Lb3FzbQvmZeOAcaS7KnXM+WKHVy4uJBbPMKBnbw6N8NHxcS02
 NvPsYlmOtIMW+S5OaL1W/EzeA7tZhG2Agkz9nf3YwoSt5THeKxk94E2pzBW7LmdQzu9j
 rLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752667503; x=1753272303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
 b=wePDzfX0aDOsYscjdY2RIo3R7Z5W/nOGAzfw+YjFtZyoEotc2Uab3w4BYszMX2Dp8Q
 eFWfmKVFlO8C4nb2k0CVU1nasE0MjtSXHZvPDSZudkH/s0GGV2ZJHBiUZj9qf4Dpd3tc
 4BCbhVcNZq5iJwwN3G3TxkMAlZDDIYpE6IahDg3e0ddO2X4Vgsd+mLMx2FvDvK4D7HoB
 ozJwpFBsqj/1fYLV0GJlhWd+wLf03ZsCg68w7+lzBrd54s8ZvttH79aRS+i3vFotTAZ/
 1nVobtZMLzhlTarLSKHdJHTMEJehnvhjz8n3tslsX6QrmV6GjhPnfAWvR59QHfkZ3DIP
 iyPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURrmnZeXpYwoZkioUWlzTnVpr2516oyQfhA4cUdn9sXdbiP73cWNiqXPmizPSadBouWe9W3zSf9uY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeWeReC5RDJU9A0YdrAK2clpbZHtVNryIN3Qs4FP3Nn5dJ6OpV
 s+7F9fXchIxKuluX+CNsif3IiX7+U6zGhkj28IBn8GIvk2iSOkTv5ckv5nwAH+NBlqg=
X-Gm-Gg: ASbGncve5qz40ArQOaoutDMMlawk8rViSXBAFRxJFzR29Ox0mObDXXMu0gEJyzCmp8w
 nyEabJ2c04pfheUEx2Hr/tzJ4RuJ5COTgk/66Bv0RaX3fO16x9laJsK/NfmDAsMPrr2gD/XlcnY
 iLXUQ4RZT5aXTmaekybXO5+MQ2MuIgwsggeaiwXASJGDrCjWaJ383po950jEmUqjKeNaEpfbuqo
 CbwCtXnZGqQ2RiFrEThPdQHJd2qEoAnkmVepnWRssQcG3EoG9Qgg8NqjaOGTAVGHrAE9S2VHJP2
 mpU71fs+A644a3nrHBGWcPrm0F99qCAB6Y7RdyvHnrn2tawgSPDSidfxgvLWzaKK5Ky5o4fs3js
 zbcVg5TurbB6e0FB8fwk9jtnUnrE8rw==
X-Google-Smtp-Source: AGHT+IEHWN0R93F6utf9eOM9iKnjv5S7ssfr5R2MO8UdDd3ai68a3PSrvOh737Pa7gqaj1wFZ0jbCw==
X-Received: by 2002:a17:907:7207:b0:ae7:cb7:9005 with SMTP id
 a640c23a62f3a-ae9c9af35afmr267572766b.35.1752667503179; 
 Wed, 16 Jul 2025 05:05:03 -0700 (PDT)
Received: from linaro.org ([82.79.186.23]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294c15sm1185884366b.117.2025.07.16.05.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 05:05:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:05:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when
 RPM routines are called
Message-ID: <aHeVbInuGbZM7TUJ@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
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

On 25-07-16 11:15:06, Laurentiu Palcu wrote:
> If runtime PM is used for the clock providers and they're part of a
> power domain, then the power domain supply will be cut off when runtime
> suspended. That means all BLK CTL registers belonging to that power
> domain will be reset. Save the registers, then, before entering suspend
> and restore them in resume.
> 
> Also, fix the suspend/resume routines and make sure we disable/enable
> the clock correctly.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
