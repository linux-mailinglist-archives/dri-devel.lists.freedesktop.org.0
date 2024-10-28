Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A409B30DC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2581110E4A3;
	Mon, 28 Oct 2024 12:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CFE0ZN2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159110E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:47:46 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so41100911fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730119664; x=1730724464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAxHdK7Nc18OMO867UdF4uPbQ9YU7Xhpufz5sijgR1M=;
 b=CFE0ZN2ATqcsSQxGyYFP1rkzunwwoTOdIhYFoeWwwog9oR0wvxey0dPSq/hG7l0t4x
 9ybjSbd+M/g/M+6QgitfYzYzrbZj13MZdJ7fUytNeWNKqa3SpSLAmPVPGsZ9OV0I8nzl
 1ED1LDVRPool9Xm7AWNS9DdT96YEOESYzkHqLQ+DqIL/7VRAKJA4mQxnL+iyTnK6G1qn
 44xAXcchLQMJyInrgUPY6gcCE6P6UwVAcdyCgrJcg8HGK3nLagvWOFzaiSpnJ0Nv/5C0
 5lwtmjDtp2DPQP+Us52wOJqn6MUbrQeChB3MNOuHLWtNhHpxmXrdF0foxFI0y5m/PvXB
 /X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730119664; x=1730724464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAxHdK7Nc18OMO867UdF4uPbQ9YU7Xhpufz5sijgR1M=;
 b=wG7H6J3V+wTXVMn2nzdi3PL6u5jyhaXrfQlE+HvSxX8/9Zg2rcol+n43L2Je4uiwWv
 Vrg/utVqlP1jWZbJNF4lWcOCab6gsJoFht6y77lidC8oIToxRhj1JC1OBi3vKqXYJyN1
 bXE5zUcowJRfO2CLR4bDDsG0bXcQszLcrb9lEFSveqx28m8HhI4ePznJ5Z+vN7K+lfSO
 xI2DkNqbIGrmKSqIVk192IU07CG7XRTMCHQ5h7pwtLreOROzt8ULDyn6vlm9BE12GCe5
 vl6Bb+2aPql8FQMBc6h19v2qBdLVESc7SWt+q5vlSAmpNAzKWEdTjf+kHGLw62+9HK7X
 pXZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNqW6e/stVH4mOyoERlAS0raSxQ3VlhMMXKj62/ftgyT2euEmGVYtJK5dlnxfnOyfdiK96y62pzGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO2qmIhh2SthQ6cEMKdU0ABpgFyW2fYJgaT5RTl67YyXjt6jkr
 3zDx4czKTIgCvM1vHff4FiBjmNH2cJXiTjgZeZflT/feNeflbdJw0Y6e63SNWWteE73lc7bE1Zl
 VXDn84YSEO6xANLlDPVazfJlhMhPPcFKvmqcNGQ==
X-Google-Smtp-Source: AGHT+IGmcTiIlNRg9bE3mhHjf1euDiK5RVv2I8rfuort+Uj/jsAnk0dYe87dqLP1FyJnvDejhjUGho1fBoV/SrdQy8k=
X-Received: by 2002:a2e:be20:0:b0:2fb:3a12:a582 with SMTP id
 38308e7fff4ca-2fcbe004c83mr29806141fa.23.1730119664333; Mon, 28 Oct 2024
 05:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730070570.git.jahau@rocketmail.com>
 <1491f275e9956b2da1f1e2580abd54f4e459c7d2.1730070570.git.jahau@rocketmail.com>
In-Reply-To: <1491f275e9956b2da1f1e2580abd54f4e459c7d2.1730070570.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:47:33 +0100
Message-ID: <CACRpkdY-5G0uui1xKnKFbxVs6couGUy14CH+KrHH=j5LfDsb_g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip
 option
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

On Mon, Oct 28, 2024 at 12:42=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com=
> wrote:

> The way of implementing a flip option follows the existing
> panel-samsung-s6e8aa0.c [1][2][3].
>
> The value to flip the screen is taken from a downstream kernel file of
> a similar but older panel [4]. The mipi clock [5] for the new panel
> samsung-s6e88a0-ams427ap24 matches 461 MHz and a hardware read-out of the
> 0xcb values corresponds to revision R01 of that older panel [6]. Although
> for samsung-s6e88a0-ams427ap24 that's in non-flipped state while in this
> older driver it seems to be the other way around. Further up there is a
> hint [7] basically saying for revision R01 to change the first word of th=
e
> 0xcb command from 0x06 to 0x0e, which is actually setting BIT(3) of that
> word. This causes a horizontal flip.
>
> [1] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/pa=
nel-samsung-s6e8aa0.c#L103
> [2] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/pa=
nel-samsung-s6e8aa0.c#L207-L211
> [3] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/pa=
nel-samsung-s6e8aa0.c#L954-L974
> [4] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/bl=
ob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c
> [5] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/bl=
ob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L20=
27-L2028
> [6] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/bl=
ob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L13=
7-L151
> [7] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/bl=
ob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L66=
-L74
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
