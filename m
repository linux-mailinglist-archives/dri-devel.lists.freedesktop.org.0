Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A55A67644
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5CA10E194;
	Tue, 18 Mar 2025 14:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="waO+Blfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017910E194
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:24:38 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5499c8fa0f3so5761593e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742307877; x=1742912677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZSOxfNpsuHJ2r8f2irDmxZoea8ixqgNXdHmJ1iC78E=;
 b=waO+BlfaRRcsT1fT4ubzn6wpLl2fxj6cpvvRmkLdJAUYSaJngGs/Uc+dXczNY7H4al
 mMXdjzl9JnUtU7ksySRW7EIN8nSVEQpgk1E6wtX0iRbZUWyaqXJIwg8XLf2MWiRmXao0
 8ehuS2hly02jI3Qlh7gXg0X9vuUX3AgmG6KJQj+HdCWh+dFDAh6ZXplLfpXasMU3RTqq
 kDBSVAMCd88jxUAdxL2Waqh/dxl2gd2WOfJHeyGIgcNjQdUp/7fq15WPwSK/XGneD1rR
 a78s7Ext0BWO8IySz1XdAKLHUrWP8ClMiiS6SXgkXJan92+7IReuXg5PE47J595oz2j6
 6tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742307877; x=1742912677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZSOxfNpsuHJ2r8f2irDmxZoea8ixqgNXdHmJ1iC78E=;
 b=OYWWUGrdlXZg8RpholgXLRPzLcZZ9nFZpZEi/UB+kdiajrkd0Mg/l4PzfVQqIyZ908
 mlvvLDQralgxvjOAR5RjZNjezIPeD8samkon8IfNg7MrUqsXskpifCDAeYaW93+cTNUU
 lLmPMmS6c0xEzfZV9M+uLdu5dQTMc4sRlJUkGHxy/qEen3VcAOJ5naX2c0ehENNs38AH
 ZS/BoQ954T0W+ajBMbDpdZyoFnpeNwDc6XbymLx2PZUdG3ycqC/2MzvqELbnfmJTuOWW
 yWdl8TtVwHEpgB+98BeivCB3FQOLSFPFyKuqK0o781KUdRIxlKhz4QkuWUMYDBpLze1h
 jtmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0LLnlLV2QgQY+ZZRUtE1yxPD+2bvNyUtFv+Cec3PSJpR7axJ3YKIHqC3jLmESdKnWvF/MDuiRyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxep9WCOhmLV/qXiURMaSBjo9+sN5iQrJgtdoZoS6D4xW3G1UdK
 2pT95ZhNTTEQJFZ2D9oud0T34/rVpVfvhMUilHu5gOkrVkxRUigUmmPQjWNOzPlFrHqGgsV1dXb
 eJif3/qKgnlGKs5cX4N9jjSgZ5hKaf6/M5hv4oQ==
X-Gm-Gg: ASbGncv+3dyRWKefQSKJOh8SzuSqmC+60FhfJrm2dXqIR5fI0cTVpcwRgj4helOiMi7
 PKodVyDK9uj3JV+aINUGDvFV4+v6WP2WLMaEQasGgi8dHh+R3204mO5uiJWAQU1ccQiRHY4buZN
 wJocybkUWmBZ0edV0c5X6UCpQ0QQ==
X-Google-Smtp-Source: AGHT+IG9CQGaGXwj83/CaWY1G56V+6jdIV2m+4yH9D/kfodrFtIHnTXnxFGbiTsYYiGMbs+jAqjCMmoxKtCUTvuxFTY=
X-Received: by 2002:a05:6512:3ba4:b0:549:4416:df02 with SMTP id
 2adb3069b0e04-549c396e65amr9771645e87.41.1742307877094; Tue, 18 Mar 2025
 07:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <3685561e8e3cd1d94bce220eeb6001d659da615c.1742306024.git.geert+renesas@glider.be>
In-Reply-To: <3685561e8e3cd1d94bce220eeb6001d659da615c.1742306024.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 15:24:25 +0100
X-Gm-Features: AQ5f1Jpc7dAEv3PciQ-6RFgHdOpEl7a3cOhURtVt1riqmVcpakV2QbZsA1JHrvw
Message-ID: <CACRpkdZXc1uEXspd0EYRE4zBJ-sJGV7H6hPh59ROsh8w_CSa+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_AMDISP should depend on DRM_AMD_ISP
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 18, 2025 at 2:58=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The AMD Image Signal Processor GPIO pin control functionality is only
> present on AMD platforms with ISP support, and its platform device is
> instantiated by the AMD ISP driver.  Hence add a dependency on
> DRM_AMD_ISP, to prevent asking the user about this driver when
> configuring a kernel that does not support the AMD ISP.
>
> Fixes: e97435ab09f3ad7b ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied as obviously correct.

Yours,
Linus Walleij
