Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B385621E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA94F10E660;
	Thu, 15 Feb 2024 11:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JV8tYGJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376D510E660
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:49:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4122acb7e56so949325e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 03:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707997745; x=1708602545; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PMdqF4BxnLzSwd0JYe63JOfvhqT8FaZryFeHRQWW11s=;
 b=JV8tYGJJGL9XxrQHp6VvNlHfdfpYpQr3wDI1os24fhqrPsSDJyn9YstEHR+JZPDnof
 VXL46z3+A7C6NDp9sUtpvd5jC7MGKhXrhMKbSeu62pfqTH3IYlOSYCvI1a0q+OmCfdAC
 fOEJ6UFMHC/aq1/AaXbdM7tjC5IVAD8EfMA+Rl47LdBLzZVFK/nYbWH0Z7l977dLLcwk
 PaAbGnejKOkMewfpbDVLxY8TlDzYRK6StfrLnX1tWEYmXg5tNzDFYJ3ruQPt/jDdO5QD
 XE8e6qhRNIUem3V+bUzjE0AIEZUewOrzDf+ZxhnvIGU5lKU/EBzz+0Cz+xaaqY8Iff7M
 QBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707997745; x=1708602545;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMdqF4BxnLzSwd0JYe63JOfvhqT8FaZryFeHRQWW11s=;
 b=xGnD+RMmYAZIMxoHKfYoOrk1mUQj7UVBMkHJtfdNMDq1/PtT8zvK0m/+X07/A4sERw
 dDIAqnWvSN1KQOVA0r+IGHRp0phwDRwD9eRu+h/S1whhTXm+9OxttPHjo/A2N0i9tF1m
 C1gHotrkHEMTG/OrqpbF+fGh/z1ZXgBguB9uRQWjKddwj7BOYElJIfAjbiHmQ2DVbcav
 Cd4y7U1ivdLU4SGaIsWpuzzbJk2x6rwv4/VjpIdYkSfcPgtBun6iw4jeX7tNBSbYi4th
 3ss+GV4NTeWItG8h4K0+uh2mZurvykIa/IiCxP7p1KItYKqekSQvJh+3K91IhW5zMTXa
 faNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKWC2VgiU0RRQI9ggGx6cQbVSPMr+VP2L8OwxPqzxq31ezQVea/o398Qk1+BTic3kWWssA/swt4Juo+w6KAqH1h0iJkHWbY0xeA/I342xg
X-Gm-Message-State: AOJu0YxMEUFg3P9vDD54PkgZNEkdNWbv1jO7ifQKOIC9EDO6pb8PEdNz
 tQ7+5Z01L9ue+96J9k7e6MdEXJbMfVOlCeeYzdAifYIPMItrTDGgSf207SY2Cdw=
X-Google-Smtp-Source: AGHT+IEPqfe0lQU32GGuFkM16RloqQWYNuLy7eiEqCzQNMdjhgJO3HI8g7e/KPfBuJeESwNfUgFUDQ==
X-Received: by 2002:a05:600c:470b:b0:40e:a32c:988d with SMTP id
 v11-20020a05600c470b00b0040ea32c988dmr1202419wmo.4.1707997745749; 
 Thu, 15 Feb 2024 03:49:05 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a7bcbcf000000b0041076fc2a61sm4778156wmi.5.2024.02.15.03.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 03:49:05 -0800 (PST)
Date: Thu, 15 Feb 2024 11:49:03 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
 Hans de Goede <hdegoede@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "leds: Only descend into leds directory when
 CONFIG_NEW_LEDS is set"
Message-ID: <20240215114903.GF9758@aspen.lan>
References: <20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr>
 <20240212-expresswire-deps-v1-1-685ad10cd693@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-expresswire-deps-v1-1-685ad10cd693@skole.hr>
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

On Mon, Feb 12, 2024 at 09:03:25PM +0100, Duje Mihanović wrote:
> This reverts commit b1ae40a5db6191c42e2e45d726407096f030ee08.
>
> The ExpressWire library introduced in 25ae5f5f4168 ("leds: Introduce
> ExpressWire library") does not depend on NEW_LEDS, but without this
> revert it would never get compiled if NEW_LEDS is not enabled. Revert
> this commit to allow the library to be compiled.
>
> Link: https://lore.kernel.org/2cacd8dc-6150-4aa2-af9e-830a202fb0a8@app.fastmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Interesting that this could be a revert!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
