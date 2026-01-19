Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF7D3AC70
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8710E475;
	Mon, 19 Jan 2026 14:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NvK0bfPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6A10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:42:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-431048c4068so2597316f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 06:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768833742; x=1769438542;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TvnwX7iYJXUTTPGbmFJMfKYn4PnTqwC1sbs2t7QZU9Q=;
 b=NvK0bfPmr5esLsSRVWteb0Lnj1pUan5LCYY6lWqZcoiR58W0JG4Wfrl9xL2WBVXe8w
 G4gt7fJ3JM1jaVoX5FQU/fAZwcf4kXlE2KXZoXJMN+rRA3MkLlZAxpN5F4vHxZc/wIxO
 +gVTkODkWGyq8RDEVB3+5wkE0wa9Oyf7UEogmlTolfW0U/9oQl3XjEqpVLk73/vtHcO5
 mJgK8xmedKx9gQV6KFOXmFRfmkDDpgb4YudEleiWdDjJhDJWAD+L7g1s4i+HBLt9W/yq
 /EAZw473P8+11o1BzF95i4F7NnjooCmAvOexMK+9lljH3ols91+mFUVIggUbnxwiOXIL
 uC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768833742; x=1769438542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvnwX7iYJXUTTPGbmFJMfKYn4PnTqwC1sbs2t7QZU9Q=;
 b=bk9b6+jmpxjRs7/WLq7DoWYB5xBfPD7LIlVS9Jlzcf02qy+d5hDlRbxy7osXwUJLIH
 ls/4wQp8B69EER2xowjjWDpqt6uqlmbNbuxLacNkLMLWnEJ6eby8qVNrqGGNKwWMlb1g
 4s/jLWVdFcwiEI6MvvtSI5syYafPueZcpwzyGAiPH98wq5J0fWCH1/fX9Q5RwfNtQPgy
 N1jdjNZyplUZ9L0gifaPW5WHVCSUIJpVGJK5UW1kQaM7z6IaKQP2iGVL9BI8y8YNsT0D
 cv+Jh97GcdZdkNP7HSXVbBLqvSj6OIu+3bFAX5ufAbQYoRcCaoDW4yjYeYELcUXnS42C
 ePHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHj+o4iXND4XkYpH67cfQk2a3KiD/hLMM52Tu2+5+1+HN0k+QCDfxuBRCbbDBaQv+Wyn0AeIJ+huI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV7IPDjuRuogb1nmHbkJTDdPyM8W7oObHTIyw5DPx8H5oCFg/H
 fh3PxmOHBYcNSqQ8xAtAwUZTbz/3t6+VPB1/8PAQy7iC4pIlNqFIhW+k2g+0siWveYg=
X-Gm-Gg: AZuq6aIduNRNeXbWjWOylGeVIYSRHm615xtQj0uPeD705zMWXRh0kyi6NSSn3zFZG++
 aWPzxLrEzWKRtV7NAuyW+7pGnsVHU4ykkwk14qlZNXNyJpadq1ZCiZEP1v/9ak8cOd6f5pRZZVn
 fcA4EtFcGubDB/JD69m0M1lFb5sM2hztJnzRbAqNpmNocUbcAi5xFaVF+Bj3ICT6z8X6Sc6hdpH
 7igo9+DBrhcX/2v2y/mThWcf4TE9YRde/MQZIuMpWh9xOmnXYypcshIKQqvr0cIpQ980MKncaiL
 YNpkiArLHH5CKHJ57QLXNdzja6bAZGLvJx5h9NJw7SLv3M5JRjiZzzjWbX/CXJQNnykjhbEd4LK
 Og8cy1lu6cX3lVV3luavmNGPBLmonNu/0T0/dFXz09NnZYQ8+UNHzKQIsollZoD/qeD4J/PTvjC
 rFOU/YiP5fWkKPYCW6121hpq8seWKxx+r5GVBzlnucbdlaDWhcrAS9crGDly3mR6Eg+wa/fYa6+
 EV852HDWpw7jDH8hkGdZDbBMwwZJokoLtyaUn/l9EqQO+5jXNcK5G5PmwncsqHzLe2ThEcICG7A
 UH72sL8=
X-Received: by 2002:a05:6000:4203:b0:432:d9ef:3bef with SMTP id
 ffacd0b85a97d-4356953f7d4mr17422902f8f.2.1768833741613; 
 Mon, 19 Jan 2026 06:42:21 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435699271dfsm22939388f8f.15.2026.01.19.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 06:42:21 -0800 (PST)
Date: Mon, 19 Jan 2026 14:42:19 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aW5CywUjbr6eCPI_@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
 <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
 <aWe7_hFpmO0E2sJe@aspen.lan>
 <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>
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

On Sun, Jan 18, 2026 at 10:18:32PM +0530, tessolveupstream@gmail.com wrote:
> On 14-01-2026 21:23, Daniel Thompson wrote:
> > On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 1483ce4a3480..82698519daff 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -16,9 +16,11 @@ properties:
>      const: gpio-backlight
>
>    gpios:
> -    description: The gpio that is used for enabling/disabling the backlight.
> +    description: |
> +      The gpio that is used for enabling/disabling the backlight.
> +      Multiple GPIOs can be specified for panels that require several
> +      enable signals.
>      minItems: 1
> -    maxItems: 2
>
>    default-on:
>      description: enable the backlight at boot.
>
> Does this approach work for you?

I think so... but I'd rather just review a v2 patch than this kind of
meta-patch.


Daniel.
