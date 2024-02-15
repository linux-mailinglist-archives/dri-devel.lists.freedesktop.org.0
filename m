Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB70A8561F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5E10E0E1;
	Thu, 15 Feb 2024 11:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xe7tH0Gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408910E0E1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:44:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51187830d6dso820707e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 03:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707997478; x=1708602278; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s0Dx5FtY4ggm/AcNbdXVVFP1mItC63qDUNAWfsNzDFY=;
 b=xe7tH0Grt15OFX93PLP9IRXn5YCAu1lhAfBjkrQSR9rbMzAFZOS5Cs0fKaH/RkXIBq
 eSpRwXPKWUEzO1f4MYadrIgTEnDGaM4kQx/Hhu5gAkWfHu5l5WQt+f7TIAExbgbsjnhk
 UjcLgigrniFBjrTpJMWuVN1Vufxa2TPGdDenp3SP2cg7g/k/hwnymFdmrdRURdhLOoyd
 lqv4oQDZ2zdZBqID3xlhpYq1YIPZhevOTGszxWm6E18lGJiG26U8qaPdsD6pgZ18PJZT
 KDTzug3EvDEjV7Rp5sq6qHGaizylsJV1lGEoEt9Ifl56iaKAqxm3KY1uwtN9jxTLK1r1
 qOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707997478; x=1708602278;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s0Dx5FtY4ggm/AcNbdXVVFP1mItC63qDUNAWfsNzDFY=;
 b=RV1wmFdHE4Sh8rvAhSgyqIAkqBGtkTgk8/JSJx5Dz+I40n9VakYzOUKc1jQPPjiJsI
 TfVgDwiGPPWg1/TQSoUNszR5jLPJkOxOJFmUgMlp6N2jg0ZR+YYHMo8itHlQ75Pj0D5U
 C+8Xyz65waBTq8theThLzD/dl6H9lHzrgLMzniLlI672s8VayrK69IXMQOCe81eRG5TT
 HRUuTrzi4PEX/9f6YxzhhBhVxchexMfdHNHD7rG+lrPCrJrP83Acs3h0hX1zFU+HJElp
 uD0N/cadWVfl9QaavTLEmNQgs4tVdPlRKmYc91m9IGIpAuUUIGDoulCcDukIycX6tSS0
 1ZTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy57oBHbqpSwNWUH51Xh0trJgsaCJ9d81Ej6WPvsneBgJBBZgjiDis0AoH+Yf9EyzdHviKvenxb8KnYLNqN0f8DGedTHFIFzI4yEI0Wz/z
X-Gm-Message-State: AOJu0YzkyNumL1LlfTn8BmE0h7eU0amkPcQi7ELU0XRLwL9Sslmky4sD
 m7ZHvtJxRo3H3znAsGDPKgssOGRFCnrFsICaMJnKnXN1y4i/XR6wLvRjCciuI0Q=
X-Google-Smtp-Source: AGHT+IEu0C6G66d14pfWgMYK2wzM1oPNS0d7EodOMsfiSkKWIbZuEl20a097XvjUuM1uqVFibSZSPQ==
X-Received: by 2002:ac2:58d5:0:b0:511:69bf:d1b0 with SMTP id
 u21-20020ac258d5000000b0051169bfd1b0mr1243154lfo.51.1707997478365; 
 Thu, 15 Feb 2024 03:44:38 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b00410794ddfc6sm4787174wml.35.2024.02.15.03.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 03:44:38 -0800 (PST)
Date: Thu, 15 Feb 2024 11:44:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@kernel.org>, Karel Balej <balejk@matfyz.cz>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: depend on GPIOLIB
Message-ID: <20240215114436.GC9758@aspen.lan>
References: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-ktd2801-deps-v1-1-7feb5385eb9a@skole.hr>
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

On Tue, Feb 13, 2024 at 07:12:33PM +0100, Duje Mihanović wrote:
> LEDS_EXPRESSWIRE depends on GPIOLIB, and so must anything selecting it:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=y] && GPIOLIB [=n]
>   Selected by [m]:
>   - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]
>
> Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
