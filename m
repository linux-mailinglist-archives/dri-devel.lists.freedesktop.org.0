Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312998E86F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 04:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D0810E04E;
	Thu,  3 Oct 2024 02:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ClIPtxrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D6610E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 02:33:18 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6cb2458774dso3668186d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 19:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727922797; x=1728527597; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xkpfPr0EYRdlxNhthgj3FTAxfyKqmJJR9nkwDDTRTpI=;
 b=ClIPtxrICMXTTfWVmq3wdKod5NubGXb4CI+EIT6DapnJUHg4GqSjJmzkdjQhrY4WqI
 LVhVuFSJaiFz0i93lF42x8KPPgwhxhX2zo559gu7Kouw3zoD0sYt9cPtXcZj+z8Hw5es
 pDzXLjX7Su6qNfYi1O+QyXqpEHEC7JXtBSTqn93FBAazak8fgIWedzB7rFEh3d4edqlM
 mORETjdamc6GbxNsVxi9hlXSoJVaoiN1HtpXP8j4dLNGi/T6sa7PzvFZ5QK2EK5tw9+Y
 j842ObaqKsxnTWCvcCw+jIbR/7wiDk18nZ8vlI9QwvON2G1zspI2SDGO2tPgpgLBnER/
 66rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727922797; x=1728527597;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkpfPr0EYRdlxNhthgj3FTAxfyKqmJJR9nkwDDTRTpI=;
 b=X8By7aDrVVtDXNDg/7WyRv5E2scENsIIF1HNoNxEoufo2AnQ+RyYx8omgphfhXsfGD
 Db+l9SqAduT5mfCUj2OA9XLzdx38w06yrKw3dxDNDKrXdqQW2BXTX+3emMv/s1NzkDkZ
 twTBWyxUhlZjRRtlLNYTBG0k5Ckoyx0GCBCdaUuWHgCB02F6xb5/TFzJs4VRCqo0PCVk
 aR52s9/cAuNMMMoZbCu5WJ0BiNjWIGPkpDpx8jiyMiZY5+Zh7ZBbdKlGEK1Qpz0JkIof
 taAtUTLrFe9VlY7U7uVP6NvG27Wxzf/cMhSpsq+ZbeXsSmoFZKG6jyVRR/zNSbq2LTV9
 /2YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoXRzmwc4I5jwagP8sPoh/I28pSqAgPJhjU+eA0KV/ajBWxlXcOGyy5CFAYeQ37ByC+OG70LfM+po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNojvxNr4ocf45NG+1Y74r9tzlipvhRORJlzE4Y0NrBoE1h2xE
 ne8LYA43Jk7oBPQn22XZTdUkFsUJvfaOTMCySfDgLbd2dAQ1nu3F
X-Google-Smtp-Source: AGHT+IFI/jVC3KeK2s+JU4a0+Yt+Rz9wy+dcMj8aCK/vKQWCiYwY7iHn9bnCY+q25G+oSsBZcN4Q1w==
X-Received: by 2002:a05:6214:3f84:b0:6c3:58b7:d703 with SMTP id
 6a1803df08f44-6cb81a24c2bmr86793316d6.22.1727922797436; 
 Wed, 02 Oct 2024 19:33:17 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb937fba50sm1501446d6.116.2024.10.02.19.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 19:33:16 -0700 (PDT)
Date: Wed, 2 Oct 2024 22:33:13 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
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

On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> > This patch series add support for the monochrome Sharp Memory LCD
> > panels. This series is based off of the work done by Mehdi Djait.
> > 
> > References:
> > https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> > https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> > 
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> > Changes in v8:
> > - Addressed review comments from Uwe
> >     - Replace pwm_get_state with pwm_init_state
> >     - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle
> 
> You didn't explicitly mention that it's fine if the PWM doesn't emit the
> inactive state when you call pwm_disable(). You're code should continue
> to work if you drop all calls to pwm_disable().
> 
> Ideally you mention that in a code comment to make others reading your
> code understand that.

Sorry about that! The intent of the code is to stop the pwm from outputing
when the display is disabled since the signal is no longer needed. If
it's best to emit the inactive state rather than calling pwm_disable()
I'm fine with making that change.

Best regards,
Alex

