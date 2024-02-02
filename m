Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBA846DB6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEAB10EE35;
	Fri,  2 Feb 2024 10:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mdjxG7ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5E410EE35
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:18:03 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2cf4d2175b2so21209641fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 02:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706869082; x=1707473882; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bNlg5tluenjxqxv+IvVDSMicjYmmaEPizk6q+pCzwOc=;
 b=mdjxG7exzoeXdURBU+j257wVHkZTcb0opRhAeBJdWaIcqH00hBuknGcSnGq3LqOmM/
 EnX+PM64FsMhIZHsrSuVESEFuQe9ZQFQHMwZt3W67oYF8PWcjlbi7dKVuUd/v2ernUto
 u9wI5RFI+bJVmkApGHYbQP+ejoUnpXa6W1i+fGFJWCaO2F4OzcqW7Y2NzWvpwORlkns+
 OPb5RmK2rMLjX3XvXF/8G1p82TWKgKGvedkBY6xx4sOTvPy6vaU63yy7EemCZcYZ60qp
 phiYUfrbD7eyRyDaTMBr6h8zNwpaGXgQAOWs8bh4saAJV7LXT8+IZPi3uR6nYHuqRMkA
 3xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706869082; x=1707473882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNlg5tluenjxqxv+IvVDSMicjYmmaEPizk6q+pCzwOc=;
 b=kJyJomdKaD+nbDNAkh4siPhQWnaUeLbAqeaZBnKGRmCGA8U7eki3Mk5WneNlxWXuP+
 48uRjFW2L6GfOUclpBbL/mK9zJ8eXE/iFd7cRc01a1dz4EFojOr29xCMmo4msOhFdYGM
 WPI6W08qSSU93jZs/EDor8CQmtYf7Vl4q53k8FBB9peCJGk+kNVu1RrsOjfsvxTzyG+l
 qPxPZv4ZQ6pmQ7oBKWNYRMHDNkLKUAu0YwMxWZrbEbNCNL2h+CcxoMPxEVs/LLHsYohk
 HMyw+fpL66ZPx1NNaeHAbPnyx+4HexwoC1MuoI/Y5LDPI5zlV1sEd9MUQ5r7mSPBAI1+
 DZwA==
X-Gm-Message-State: AOJu0YyfbhWVg7QMvYZPA4Q4qudxPPUzaoKZACsHDPCZgomk1uaSLksf
 KiMzlfa9dKmAxht6aCCm8GIJ9kAzO183E9mOET7LVRMysJxPe2U/rrYJpmyo2x4=
X-Google-Smtp-Source: AGHT+IFb6pGaht1vtGLugyU4EquI8JZtaZf3lgnGnF/CXwI6w8g3Qk0atL5pvkeoQeSoAoeHfJkBOA==
X-Received: by 2002:ac2:528c:0:b0:511:3a1f:1cec with SMTP id
 q12-20020ac2528c000000b005113a1f1cecmr389005lfm.0.1706869081832; 
 Fri, 02 Feb 2024 02:18:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWKhdLF3m6XfZrlisw1SIYzZ1pIiAQ/yxERF8VJJmEocp9Zl9ZYpN73n/FjIk39BnSihNUrjeVZUOFMTT3TzzlsQuGHcdVxebBFLyMHvCETTY8Teu09KoOvRvA/IrZuq0Hn96bif5qhjv6BdVy1vZkm7eO5NHbqdLCxLTjRC4zYdSd06xoONW5rcYAxUpqT3NGCuM556TOXllEVu3H8IZYcEruH6CNMxbywzPq1BaqA3Lan
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c1d8a00b0040fc828d8d8sm1204371wms.22.2024.02.02.02.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 02:18:00 -0800 (PST)
Date: Fri, 2 Feb 2024 10:17:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/4] backlight: hx8357: Make use of device properties
Message-ID: <20240202101759.GA373571@aspen.lan>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
 <20240201144951.294215-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201144951.294215-2-andriy.shevchenko@linux.intel.com>
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

On Thu, Feb 01, 2024 at 04:47:42PM +0200, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Include mod_devicetable.h explicitly to replace the dropped of.h
> which included mod_devicetable.h indirectly.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
