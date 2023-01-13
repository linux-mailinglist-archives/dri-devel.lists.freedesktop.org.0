Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C572669D75
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AEA10EA2B;
	Fri, 13 Jan 2023 16:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3325610EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 16:19:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17742881wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zhz9fWOoERNBAN38ex2htt2h7c3lJT7eoS2NI1GaWwA=;
 b=CbuR3CX0p4skKGw4xsujWI8bAF7IwZzXvafQLAFYWfdT0cxwQOuyzMYog3nQApK4yI
 mCW7BeHY/pvbQTUb59i30dWLoZhyWomHHyOS+sGJxH8Y/dR2vu5seIdkLfGG+7YsA9Fb
 qpQWX+O6m5BmLLqlpzcxO9JUiBRoRmS4yzxX3efqbhb3HvpWz5lhknuFi+wKcE0psmb1
 lj0uMe9tPyg41MpQ13/XWD74HsAN+WUzcJz53QwLEpIaoCIY11CH3xkk++CgkGN/fZzh
 4bo/t6CCMyiBaClf424D7IxEmdHPI7DinlsDlmKY/ne9mgijFk51gpnJU8oLiap7TS7G
 MQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhz9fWOoERNBAN38ex2htt2h7c3lJT7eoS2NI1GaWwA=;
 b=vzMHuWSnVRo/OgthfJbnOEQMNGKZ1jnSwrh3azzA1JQo7h4GErxCiztDsIquat5tYr
 dyxyQOm9dEcVkwheTLAHnuA9WEb3c066mfYM/P5Csk/3/+zz3ap/J5veC+PqX6R520HV
 rQ2FMnmtqbJ0ScLvMcHMfkyTf4fo8h8OL7K/wulXwIjuaY8iwgn3D0PEObr9gNWdIWLb
 kAg9HAQEHEPpG/l71fGSdlRbfV/4kerZ0beXhkEZulhd7mykGuF2cndsC5G+XxCou9xz
 DCJuWzJGh0BLIUlH6HkneNWA/OgPfbutRlhr3YeMM/0IZndqJ/1WnbhVS0c2sm5sqc9k
 6HGw==
X-Gm-Message-State: AFqh2kpetdf7FpQ++Vn/pgpX7zwNDQrA3PU04rhpr6n/jQVDAu6mfRjN
 6ZIqnjgjw0dQX4aPygeVO8aMhQ==
X-Google-Smtp-Source: AMrXdXtIgncPdiydx2VlDE0pGuWdm7d/in7Wu/0hk+2SCGaU6GE63Rke3KKAMtwlBX6B8wIfaEEE0g==
X-Received: by 2002:a05:600c:3844:b0:3d2:191d:2420 with SMTP id
 s4-20020a05600c384400b003d2191d2420mr59847990wmr.7.1673626754635; 
 Fri, 13 Jan 2023 08:19:14 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003b492753826sm23729637wme.43.2023.01.13.08.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:19:13 -0800 (PST)
Date: Fri, 13 Jan 2023 16:19:12 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] backlight: ili922x: fix kernel-doc warnings
Message-ID: <Y8GEgFlw+q0P+2em@aspen.lan>
References: <20230113064108.29172-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113064108.29172-1-rdunlap@infradead.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:41:08PM -0800, Randy Dunlap wrote:
> Convert comments for START_BYTE() and CHECK_FREQ_REG() macros into
> kernel-doc notation to avoid these kernel-doc warnings:
>
> drivers/video/backlight/ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * START_BYTE(id, rs, rw)
> drivers/video/backlight/ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
