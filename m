Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D1889B5F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207B410E74F;
	Mon, 25 Mar 2024 10:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fc6LTPgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80A10E74F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:51:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so351278f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711363866; x=1711968666; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=82qCE9td6OtrJPbZ4uolnTjGQdgWhZ9rL5H7Hy2dBBI=;
 b=Fc6LTPgwobtGqii/vOQyXbnRb9LFF3U0YaWhRb3R+a5vWs8rxlH/7RARSVdIjIPFg3
 kv1M1ArBk7Lkip9YuWM7GewLIcKhdftYp46UOdyztt6hz4WC/DFCdFNP1gL5NGqn8Y/y
 bXwh6W6vNyonodw3k/4Lm1wrBFFAK7Mkbio/M30Vvtwo6viAejxaNQReEPAbSwuvd8P6
 mFTNhmATe8qH0yD4YnI7HbNWv0Mx/GNoE9s/dY3BRxeDEz6HpwqZReKhV331tGbcFIoI
 DJuiCeoV+T+jC31GNhKhXQNqn3IOTNxtvgKvIp/XVh4S4H+yffVlc9ESvGJs+/OgDoBw
 2MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711363866; x=1711968666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82qCE9td6OtrJPbZ4uolnTjGQdgWhZ9rL5H7Hy2dBBI=;
 b=HnepOsf/XbTS5W5O/AVW3fnSx0WvCXzB3RTP6uyM27OEwgjVohHOEUGc+t38STSAvU
 4AErzc8SPBTD/PqN+W3b51ZLeX4eMtiaSe3y3nH/T1fdqkUrVoOqh58IeGZXcnmrgaVH
 u129Cl1xqhpRhn2UrKIAr6IwnnDVoDr2YyZt/bbubl9pPZtJ1UMLJ6L1yunQ7+5S5DdQ
 K2iL5MGv8TrDEAj/GZ7FHAOqyH/2z3yYpxwZJ06pZ8+P1VSey7vpQ+5V4q+cSx8lUy9V
 jbHkQSKtx7T0P5vqIdtE/PjIMirc0QJJWJsaYic1gJLTUTUaSFAwAPitL36Uv1cHx5S+
 GM+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMhCghJPRfdN8nRxgUIkKR9/fQxTQKm9FjsS/tKziiZuIwjg/J6G+8wzlB54q5YRZLK7APdFJ24+/LIsl9B9VlpRoM0+RyIdPoQbSF99UO
X-Gm-Message-State: AOJu0YyoGnfYOP0T0FJrEiolQgWf2m14C0en2gXsPRVbyOhKJRFjUFYT
 zBCQ30iAipi9dsxLQ6PEJiy0Sz/Y4CALtyxLww9wHKgD1UwtdZf18/54xbwje4Y=
X-Google-Smtp-Source: AGHT+IHR4nhe8qAdpwc1tLFzCRaFXi75wao/RZL6XKVs1RbH1T1CsovHHCRog5ww0klKJ0HED3DL6w==
X-Received: by 2002:adf:efce:0:b0:33e:6ac9:f5b0 with SMTP id
 i14-20020adfefce000000b0033e6ac9f5b0mr4620135wrp.20.1711363866209; 
 Mon, 25 Mar 2024 03:51:06 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 cr1-20020a05600004e100b0033b48190e5esm9202151wrb.67.2024.03.25.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:51:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:51:04 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] video: backlight: lcd: make lcd_class constant
Message-ID: <20240325105104.GA182188@aspen.lan>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
 <20240305-class_cleanup-backlight-v1-2-c0e15cc25be1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-class_cleanup-backlight-v1-2-c0e15cc25be1@marliere.net>
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

On Tue, Mar 05, 2024 at 09:21:18AM -0300, Ricardo B. Marliere wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the lcd_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
