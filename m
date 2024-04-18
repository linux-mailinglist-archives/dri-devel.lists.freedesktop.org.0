Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C98A9532
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656BD113ADA;
	Thu, 18 Apr 2024 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rtPoLt2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA3113ADA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:41:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-418dc00a31dso4947585e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713429715; x=1714034515; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lcAKWCMj+reGzv/SxgQTObCQDHvEXKI5uKBcKnB6ORw=;
 b=rtPoLt2yT41mu3ljWDiYGlw6jr1F3PgS2RcdDHojO63hAFL8I71hgM6jXo44gEPomX
 s6Tl8u6IZT4oHJp8m97ajQt+wgTSOoGj7hRBL50aJyhzn7w4PK5obvAmt8/RCEQsRVFF
 JcqccqiiilVgYF54JwCd8mxH85dFo8Kia4ndlhSc1JjP0+yjk8FgXIglSP5Mqm13o2sT
 VuAjJEnHFBPEL+FkWYJ9tjxYHb/qC+QUeqgPFIKLG4xzc31RRISguWOSOKG686vb/0ma
 jNKqtbXq8VjlCqt78uzpwGg26xVln8lyeRjXeaAKbu39vlRN+qgARncszNDp/4iBOqgi
 Eabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713429715; x=1714034515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcAKWCMj+reGzv/SxgQTObCQDHvEXKI5uKBcKnB6ORw=;
 b=uOAz0KvzexrUaUeMkCxr7TkkS9O9FUU9L9qc/Lgls/gKh+dTYlbPqwrDW8m5EMBMRB
 8LXIvuYC3ZTlUv+OyqJ/2g8MGPONP8U5I1dJGao9bx1uNR6fv4xUlSEutGW/stQmbtgN
 bDzy+ZKymjnlLo+nil7atgsgQsaPfmyb5GLUxabsADZiYHcHFTpOA9cwN1LevhJE0VP2
 8j65yc972u020aMt2qb5HT4uR89qESrWkJHKY3z6wB3dXHoPHlHSvsQY/XSPNAd6Kot6
 7kITqiUj5Iv5m0Aa8vPyXl2skAn88oF7kA4TzD6bqxZ8Ma6Kpf/jbwkEqxZVyJg+zPwM
 DEOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJZ3zk57v5gxOYCMryxUWxHYdkPnl4J//oT3+w18y+HU5VRtU2kPSkCz2kt9bGoAPPZKDmx8RRvNaFXTTUJoJWyHcFaF8BNaVL2y+Kq4vB
X-Gm-Message-State: AOJu0Yxxr4OrwT1ClUsOthE741NACan3XzQWcs0d+aaveSHNYc+8jgaa
 0/I+1p04plm9MJ5Iu5fRnIxhFwZgM1bevx/IfkXHHqMsn6N3kJ2gy682dRSLN0A=
X-Google-Smtp-Source: AGHT+IGtSojqwzGCY7o8kpFDZjkynQ3UI+S+NsFqETzKmtJMJWjWSr5MyuisF3yopc1Ssg3dQzg7tg==
X-Received: by 2002:a05:600c:3555:b0:418:f400:4af1 with SMTP id
 i21-20020a05600c355500b00418f4004af1mr12010wmq.38.1713429715231; 
 Thu, 18 Apr 2024 01:41:55 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b00417ee784fcasm1894342wmq.45.2024.04.18.01.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 01:41:54 -0700 (PDT)
Date: Thu, 18 Apr 2024 09:41:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] backlight: mp3309c: fix leds flickering in pwm mode
Message-ID: <20240418084157.GA162404@aspen.lan>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417153105.1794134-2-f.suligoi@asem.it>
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

On Wed, Apr 17, 2024 at 05:31:05PM +0200, Flavio Suligoi wrote:
> The mp3309 has two configuration registers, named according to their
> address (0x00 and 0x01).
> In the second register (0x01), the bit DIMS (Dimming Mode Select) must
> be always 0 (zero), in both analog (via i2c commands) and pwm dimming
> mode.
>
> In the initial driver version, the DIMS bit was set in pwm mode and
> reset in analog mode.
> But if the DIMS bit is set in pwm dimming mode and other devices are
> connected on the same i2c bus, every i2c commands on the bus generates a
> flickering on the LEDs powered by the mp3309c.
>
> This change concerns the chip initialization and does not impact any
> existing device-tree configuration.
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
