Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DA631F91
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F6A10E2AA;
	Mon, 21 Nov 2022 11:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2510E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:08:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z4so4715531wrr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pKFN/qhJLz7mgPB83k+rnOu0PmFMybHP5ytr4JLJaN8=;
 b=skMPVaZW7ILGeRoxtx30vONIGtauHppYucwUioLbzrs3ayNy+JmTsntWDg04dYoH3b
 HF8vhGPUTX5cDsFpMtgSFUhFOBoMcf+9IL9M4nYrI55ja55xbrhlRIFCs0Bsth+Ixa+S
 MppqtJMBoy+vP3MfNHzbCc/RdrLvbYwilyussbFkEAym0PFcj/mJZg78Ht8bNO+nXSc0
 gCrRT00Q6xFI70WgpViyj3jZT0m425ddYS8rPsJxTg5J5DbaoEnTDuqDsEQnKyZQPAtz
 SwKtNRl9PXTmXn1zd+TnoFzX2vVnQOGr/F8JYxIWXNV9csANcDjnnEAvyVKY92C44t5A
 Z3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKFN/qhJLz7mgPB83k+rnOu0PmFMybHP5ytr4JLJaN8=;
 b=Th2GKY4peSPgChzR9oONqA76KBpkU49dXc2DnMOzk3R/A4hE3IxhwepUvLuDz6NL/N
 HmELyHU0gHz7GKa3BXTkr2QszEL3rLJ3b4E+Q39/vmQnQpb0panvKvgVJUVQla+qAT/O
 T04Hl9CL7c/kwteGXv1PAxTrzsYbWu+2gQd2zRuQsy1IpnGxyeJYjRtHjlYBjdEwxkdW
 +9Yh8d0ExnN+YVGNEU5mQmqYSn5jxxAAiV7tQ2ZyrFKK8ZxWr1iZgi7+a6AidYQl+PqY
 fl3CMRdjiP5BDkxdHhXJGDCMT5Na+iQb3WBUVq0/PAITK6z8qkc0lH/4NHTR13eKa9MJ
 gRoQ==
X-Gm-Message-State: ANoB5pksaA+0qmCuiwOHDMW0SE+K+GOC6/TY43j8uEkmVNIEdw/yvblC
 M+CZsx6wMT1K81nZNAHxZiExFg==
X-Google-Smtp-Source: AA0mqf40H/ICnbr6ZBWHaqtwbFiAylS7QqqSPNSiszc0FzLclW6Lm03Q48bJYma9B2JABx2G9q/GyQ==
X-Received: by 2002:a5d:5955:0:b0:241:553e:5040 with SMTP id
 e21-20020a5d5955000000b00241553e5040mr4154181wri.578.1669028927942; 
 Mon, 21 Nov 2022 03:08:47 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d005aab31asm13554055wmq.40.2022.11.21.03.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:08:47 -0800 (PST)
Date: Mon, 21 Nov 2022 11:08:45 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 590/606] backlight: lm3639: Convert to i2c's .probe_new()
Message-ID: <Y3tcPeajtfN/hCce@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-591-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-591-uwe@kleine-koenig.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:45:24PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
