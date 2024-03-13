Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E087AD70
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824D810F533;
	Wed, 13 Mar 2024 17:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I5wz0RvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00BA10F4DD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:34:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5685d46b199so106376a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710351293; x=1710956093; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDVYaiWTHLKSiNQF6TvsedVi1h66ePmZbiVPozc8hJw=;
 b=I5wz0RvK1vu3HAxNY5mXre81kttCX2HIqLeLYp2YZEpOyjVLW34kwwHM9luUZZHLml
 e3fhU+qoKIGaEs7BNHMVSXc0urnERKEyG9+Fd47gQmhXq/2hW1G/QLgv9XUF8bh/TNZX
 cp9m32II7gbxvydJ90A7U9JDoe3o83l9AHjGQKf1/cbsGd81grvcZ+YGw/qA9lU7LmAs
 TQJfQeAnU7x0eOvVvPMLH0hEB1NUnA041o//DTSw1oalo3fqz8wBHIeVH2Viq9inbjSk
 JlhkXjm1xU+xDKX4P3TmNAdLdy8O6l1XP5EiyIQceWfI1c/Bmcvs2bOiddPAWjlfC5gH
 n/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351293; x=1710956093;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDVYaiWTHLKSiNQF6TvsedVi1h66ePmZbiVPozc8hJw=;
 b=tfk5pkbG7GIrmH5QVT6Pm1WVozzBonk/HgJBzE2AlcRyYBaj120Pb+eRzSxb7lDp4Q
 urfqzXd3ljtGUPt2YZXPfQDaFGpRDDVYZaaWrmjDEWEzz7l4Ukw0reCRP+BhZHrZhBCY
 ha9nG3qoOI8spAjJw5mDYGYSneYDlEyFlqeSc4G+2XV8mE7MrATElpSEMoJxqNkZBHSS
 NxHPLS827AYy0V/vs6z7tKkZ/53Av5cMnwuQj4eY935GIZGvSD9KkXrPrqo+X8iwNjy5
 pSpV6I5tM7YPST/UPP8IADqKw6Qd5v9UehatGNEm/bDZ/PG+kRETThibvVKkA6dHG3/o
 lzlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm6njWdTWED/tuVjU1ZSYLvMnycEKIADj8kAOczQkBuuzXRvb1bN8lU3te1z3mkMC5Dowj144W8ousFayM350uXk/QduH4bbjtZrrnRCVF
X-Gm-Message-State: AOJu0YxGfiAATmb5d2kSWhKvvDi+F14RLjD+tQIHigYM/+9OHhOfqXfT
 DqDUuuWdK37sA8V/pAuGDvpYIZTag/H2Zvli51ea9PWCdINkhCxwc4eDsWdEeog=
X-Google-Smtp-Source: AGHT+IF0uw6I6idQAb4xv3M/WoLxMq8rIEcSu/qwR7wMCtqeIzkvl56KxAb3RLUFTKsxfBzsJerNtQ==
X-Received: by 2002:a17:907:c209:b0:a46:4469:6ef7 with SMTP id
 ti9-20020a170907c20900b00a4644696ef7mr4148744ejc.52.1710351292978; 
 Wed, 13 Mar 2024 10:34:52 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 jw22-20020a170906e95600b00a4623030893sm3441069ejb.126.2024.03.13.10.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:34:52 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <ece2ddfe-a996-4622-8c46-abfd84c79809@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:00PM +0100, Thomas Zimmermann wrote:
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.

If you end up resending there is a typo s/implement/implements/.

regards,
dan carpenter
