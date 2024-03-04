Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E339886FF58
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144B10FF66;
	Mon,  4 Mar 2024 10:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="etPmmUKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEC010FF66
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:44:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so2253109f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709549089; x=1710153889; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DShOdkyxQQydWFkGrr4h1cWbRj4V/cqaen17JYA3fLo=;
 b=etPmmUKXcafA+OZpobNO3VJmU4igwmufXI9iHK5/5yekS6e34J0YcENiQjjlZq/KCM
 Ue4BmKqmkSlex1u8d1YxMccgnKXMeCKQIA5TUoVe9KQpwac/WdvBV3zHMgCHh6iCULXA
 Kc0psuFOIzdP84VlkUozYZABGAIWaWW+EvwPR5f5qliM9HE1jxZ6Iea57i5hvibyDBJx
 IEOPoDrIRPQ6UasRciNJ/ExVEq8Lmz9SSp0eNZX/L9IrZDDZlKRYB+nYFUj2H/80w3PM
 ehm2SSIfiMjmLCvkOETOMoMRbRTcf+AsLgENf1l0ej2FtAMfs2z9Ij/jmHRGsz6pvlEE
 KTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709549089; x=1710153889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DShOdkyxQQydWFkGrr4h1cWbRj4V/cqaen17JYA3fLo=;
 b=pkFXiHiPvDkB9kmneMsqM0yPe4v1RHBAeSJf0P+BR9XNKywxFW4HUksOfEwmXuZ0ta
 nB75eH7ZWFzokkT030FvN2cPjnYQ9rbGAT4Qcq/FsE9Z4CZHmQkSjcbypL4QvkNOcsA1
 +BFHDo7/cX1gaDFP6Jk7tC0hcDKa4sTWgXbZa9tR6No6XyubWCqCrSwZh4zjWf+q47kH
 pzu3hAViUHgRHh2LdnLTQ6xy631GG3pLh3ChJYPoXNoDK8fDh/A6O/LTTDnyrTpRvi1k
 M43rFM4kIAVUyKTxy7efqLGCz+XdxLPybxI7gYi9zAE8Wt2HesbUkpV9R63nnHdAcPOj
 lkAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPmuMo29PZJjWwqiiHf1DpAaHczPFlED+gPquO9l3/gQ4g9RsAezUM5OnoFXe+iMF0BN/oFt74tgm9W2DFgu97N1g+B/nWNICX6uYFtH4Q
X-Gm-Message-State: AOJu0YxVVD25DXp3DOk/XjVtVou6oo63rYNkj7AogksqWG4k0ea//GX6
 W+EGtYv6JDw2VKQ72tEbalGTA4Bz3GmmxjTvTgCNIBDREiY7advxs1bCAFlA0R0DyUBI90/cJrn
 m
X-Google-Smtp-Source: AGHT+IGHNvJcAynoDjTNPW/ad/wQJ0F772XQ2t3xcrYzgUbC2j348i+2RyW2OuqOddYLNpQK9qlF5g==
X-Received: by 2002:a05:6000:181b:b0:33e:162b:5353 with SMTP id
 m27-20020a056000181b00b0033e162b5353mr6523335wrh.16.1709549089558; 
 Mon, 04 Mar 2024 02:44:49 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d42c2000000b0033d7dd27d97sm11832699wrr.45.2024.03.04.02.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:44:49 -0800 (PST)
Date: Mon, 4 Mar 2024 10:44:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] backlight: lm3630a_bl: Handle deferred probe
Message-ID: <20240304104447.GE102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-5-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-5-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:42AM +0100, Krzysztof Kozlowski wrote:
> Don't pollute dmesg on deferred probe and simplify the code with
> dev_err_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
