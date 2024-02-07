Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5384C71C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F21B10ECD8;
	Wed,  7 Feb 2024 09:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aPUeZiGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3041910E1AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:19:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so301564f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297556; x=1707902356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THgk+e9Cb62XQUQpCM4anGjiBdgkprTbUp5Xnr6DNDA=;
 b=aPUeZiGsRiVXwB0m9FZYC9VRfrn1jcCX1/l0lyGttPfJUqqdTRVUhS2Z5PpV7B00fE
 RllacgfUA25RaMMP9/WnFwE0iFnn/Q1IMaSpo3twM9H9V2IqDONBs+sFJ7BuZj9xiJEr
 qL4lEteq1vBF2lW6cRpSjT6VtG/ABBQFNKx6GD474iemBeV2YrVuwyFgqpWPzHR6X+b7
 IyXR2Pl2G/7dEFJFf8Q8vrlKJ12BhSv7Gk/lGRGe1j9+SYHkxCfLnYKpAq8+Hi/RoJgZ
 m5zvZtGyIlD4zcRz7zFBTuSSIq+JNwhD1FKrCadWA+lHuJ0THu+TbRHqu4IVztJdhqex
 1q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297556; x=1707902356;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THgk+e9Cb62XQUQpCM4anGjiBdgkprTbUp5Xnr6DNDA=;
 b=jqHI6Y5aKupNhr+cRm8k59o98gP4W+ig09QiEZgGVV0n1Tb4i6izve5KXDLODJ7P+p
 ZG8a2mQw70t5BvhuGMIsMX/BLj8nF1O1xR7qGE03bBAHSwq5s9PLZB6yxa17ZhhilqZl
 gTCEcrz5fF9L6koRV4oJ8f6PCZHtRCiD8xRdTw7sHcc2jtb+MgPCuO9rbS6A2tP5jZgJ
 TwRI6cGXURxQkui+COUlKrOcsGaXup0v//7nrPp1sl62IV3+Ru1ACBoW5Ge1NZVPGpgU
 5MQWgxwgmv39Lzy6hEtTXw5H9e3x7ZroXnUB4hqHXBvUWIZ704S/JQt7dilfl5/yE9qh
 iSjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCJXMVff6k34M8wkS7cdCDtrUlNFvOjHHH87jahUXKeDQaSv1U3rrsMfle+r+G5XWODqQC8D4QxeXIGpEwO7jPLkcdY9sudD05YRHHWlSr
X-Gm-Message-State: AOJu0YwHOQGiziC8RXVLojp9vjXxRlDFdiUgP15MJXEaWdOcPNnrNfn2
 98kqj+osO0S+Fnom7BlMrgozyQkEA0ly0Y1zJ6O0CufXFdH3ML7VLJNMh/rWZ4Y=
X-Google-Smtp-Source: AGHT+IFH3IS82L5gMUchaVBxO2U3Dm3TiOIG6AHHKdxNIxx731oN2gzwqakpiXj2hF5Y0reTcfq/wQ==
X-Received: by 2002:adf:f051:0:b0:33b:26de:ea with SMTP id
 t17-20020adff051000000b0033b26de00eamr3532439wro.37.1707297556498; 
 Wed, 07 Feb 2024 01:19:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWiN+qIiZ+TGCqz6O1ozMaHDU937wmh5nPirJyx1NADCaa8DhzV5aRPcP1mlSeh8HS9tGnzuRYwqGdTodkvALK0+mgXVO87Ajgg1qFaP+36SZu+xs4ctMTJbe/QTi8UKQxz3AuxRxWHghJ+tBTDjP4e2aU8XK7L/Zar6hb1TtfUqdDk+Pajvg6A17Z3ehLjk3EtAKAcNlBMimPGFU9ZutwTsgzR1zDTLoB3Vj6BV+7awo2Qd4kKbzadF7nF1q8g23bprCMoLIidVw+9+tnq5/wJx4eYmATRg+HQIU/QdohVTyula19yRXkyRerG3hRJ08bn2+xB2GsYfsmI3x7Ciu69xbME6dZV7T5d2ezhFUXR//dk/5wwIYwptRGp3MyJumTFHXfgpeRfDlhIELN1Fhoio9bOSQak669MwUghfOz1/s5GNChseQ4qFsej674RQuAETJjWjoQeLjMpuqasSopZBGNY7JhW5OTtd5IbYJXWVtXcdhuN3jqbQ5CqWU6gyhqIwIHUwjaWj/CzcoAGniVOfgsonolBAV5O/qlCp7Mk4rMC3UfJxZyxU/B1JkE2Qsh4CuI5z12vEQWa8xue9rfLQP25L6RiTR5WNAvmNXiFNdtpVTZHS0/5oV5iKdcCqEWXasnhSIycPntk8LJkIkVQOm39whjVtj2rFJpbigZyHSFgKvtiJ5B
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfb1d4000000b00337d6f0013esm1003490wra.107.2024.02.07.01.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:19:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
Subject: Re: (subset) [PATCH 0/5] Add display support for stm32mp135f-dk board
Message-Id: <170729755552.1647630.4818786052103823648.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:19:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Mon, 05 Feb 2024 10:06:50 +0100, Raphael Gallais-Pou wrote:
> This serie aims to enable display support for the stm32mp135f-dk board
> 
> Those are only patches of the device-tree since the driver support has
> already been added [1].
> 
> It respectivelly:
> 	- adds support for the display controller on stm32mp135
> 	- adds pinctrl for the display controller
> 	- enables panel, backlight and display controller on
> 	  stm32mp135f-dk
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[4/5] drm/panel: simple: fix flags on RK043FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=536090b695c429e9d672f72341a5b6fb147d389d

-- 
Neil

