Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F3814C90
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7D210E1EF;
	Fri, 15 Dec 2023 16:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEAE10E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 16:11:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c68c1990dso9289245e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702656686; x=1703261486; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xjfWYzWd4wgJGa/29WuHSyewFcHfkJSdAaMGHjnzo9k=;
 b=NtvtwF1lVVsQkpuYlz9W1zCRDRo23hWuEmKyH+Fgmr773AqrrBpqC3P+lV13u/Eo8K
 AM89gCnxF49IEK5yf5YePrLs9EWA4aRrYgdBfMPcPVgQkPKdIv5+SO1GB/S7EXBTqdsR
 dmKBJ2Tp02PQKN+l1vQ2Jk/Lf50qWbibxyubiuxV1HoPfAmlIcXHiYzWJ2/53Tekqk5O
 bqQpJmbO/PJ+0LwelqiVC2+1za2cuiZTAal5k0SpGjefDUbpdMfY9u4LoQ6FzyncweyM
 XnNENKgY/OJonyZtPxXPu6q5gHKZBGhn0sMNM+5gwG1CI9lTe01N7e5gnAyKTo25420A
 houw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702656686; x=1703261486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjfWYzWd4wgJGa/29WuHSyewFcHfkJSdAaMGHjnzo9k=;
 b=DkeChkYQ4spH3Ydje7aIeOkN+s8lAE3xL5NaEZK9izXHGwMf9UKVNPp9A6tzph+E8q
 v1bmMQ+ZJoTiTc+W85kjEgbqxpT3mk7AIPlkxJzzQYX8MrO+L5S6r5ccYxp4zBz4tSM8
 1j+vaNC2XXW7q14EybMO/dlIUbvmYqylsyz5j/NHNLPCcVNb7jR92PRgJd1Lr979iXSQ
 YGCx+L1Zv2LdFZs03Wi9edpOqL3yr4Idxqqtb9WUrDsdqkdyMS0ijxnZpinF6ntzxaad
 gKOmxXjmpHh9O7Nt+KUKZJokAzoqLtTng0zQv61Jvc08c1dhj7tf05KcVHU9UBUVZvvn
 8YNQ==
X-Gm-Message-State: AOJu0YyQ/c3t6cgUJ/wjnroYCGYq4DMwIkHVRx16wfpdGOmVU2fpGmYM
 i40bRnws0HoiIEbwobkGny1NCw==
X-Google-Smtp-Source: AGHT+IEDPUTIQdX+5o6mWltMx2mWOny7j3VwgpyCppn/saZ1B0MQY8/3rkAc+pBFE95C0ol9B7s7/g==
X-Received: by 2002:a05:600c:2d4c:b0:405:1bbd:aa9c with SMTP id
 a12-20020a05600c2d4c00b004051bbdaa9cmr3616687wmg.34.1702656685924; 
 Fri, 15 Dec 2023 08:11:25 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003feae747ff2sm32267141wms.35.2023.12.15.08.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 08:11:25 -0800 (PST)
Date: Fri, 15 Dec 2023 16:11:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] backlight: mp3309c: Utilise temporary variable
 for struct device
Message-ID: <20231215161124.GB662726@aspen.lan>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214195158.1335727-3-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 09:51:14PM +0200, Andy Shevchenko wrote:
> We have a temporary variable to keep pointer to struct device.
> Utilise it where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
