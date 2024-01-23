Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6583963A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DB810E807;
	Tue, 23 Jan 2024 17:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAD710E807
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:21:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40e80046246so27901675e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706030433; x=1706635233; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tqYXrsvbaMlrmoMHzhpki5Mt71I7zZeWsiDaURT2h3o=;
 b=G3osrr5GevkKJGTyNMc3GTuBAQtX3ROgWOBOHW1zJjd/kzJARjAAh8HXqe6VD7uels
 EoGmbI+pB2rs/06/lzPLBNelovZfBcgNvJvNUaqU6fzLnLL+h2xNTa1YTUujp5fp6bkP
 90fk6qAluJixkXMedxvM3ZSTstHBElULc4EkLS2gbYi89eaz0/t994Aa8bXV340Y/IiH
 tK017bR+ztP07cFgKHOArzxrd6saGZlz8uNXQVTfPu1208yjHw2SYIhrmIhU+sMrYojl
 y0w0Jr8dsLcFK7F2zdqAtm9gu+/gU+DJO42EAompi7ApkpFA7qWrEI0e9SWZ7B+6f1IW
 IhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706030433; x=1706635233;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tqYXrsvbaMlrmoMHzhpki5Mt71I7zZeWsiDaURT2h3o=;
 b=GqvMKjg76MD77oxM5Po534ozoyQAVJ3OQexK8wHimp9OR5Rj4OEVxFh8YJ0i2o1h4g
 Admatr0x5j7k6baDXI+0BcPOAU/V7q0jfZou517kvfW3KfLer7tbDhnndf6kSNoNQJJs
 Lz13WlKfVRJX6JzIm6eB/QLtTjwaa6HZ/HQqxGP7PWA0L9mdrWAezLNYZU84OrC1c0oD
 quG+dHjdqxqJ4GJs1uvuuPvjxBk+x25hdw8ATu0L1cAkUp4y0OqRygVWoxRtZTcJ1ppV
 BOQiU1KnLbp8mwFD+H0kzVxdZBn/XceaETveqKDbcDvLywctCZsAPh/BFXZ9xNwbuC/l
 UabA==
X-Gm-Message-State: AOJu0YysEcQg+CqSXNMAbMAGeeFY0fX/M5/G1AfZOJUK97u+HtB7PPQr
 Nxt34qJW2qidiEnVB7aaqR7XLiar+caW2X+YX8GQbxfeVPwERRisEWFGnHT1t7Y=
X-Google-Smtp-Source: AGHT+IE0+DZQGCS4EN1BBZgSwkTn7W+MJDfyHXzr6PStwtw6b5GaozKJv9t4TXOiNKfsBfmbOiSaIg==
X-Received: by 2002:a05:600c:2310:b0:40e:4c31:affa with SMTP id
 16-20020a05600c231000b0040e4c31affamr329334wmo.138.1706030433353; 
 Tue, 23 Jan 2024 09:20:33 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm47199795wmq.47.2024.01.23.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:20:33 -0800 (PST)
Date: Tue, 23 Jan 2024 17:20:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v4 1/3] leds: ktd2692: move ExpressWire code to library
Message-ID: <20240123172031.GA263554@aspen.lan>
References: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
 <20240122-ktd2801-v4-1-33c986a3eb68@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-ktd2801-v4-1-33c986a3eb68@skole.hr>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 08:50:57PM +0100, Duje Mihanović wrote:
> The ExpressWire protocol is shared between at least KTD2692 and KTD2801
> with slight differences such as timings and the former not having a
> defined set of pulses for enabling the protocol (possibly because it
> does not support PWM unlike KTD2801). Despite these differences the
> ExpressWire handling code can be shared between the two, so move it into
> a library in preparation for adding KTD2801 support.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
