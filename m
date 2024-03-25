Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE3889BF2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE0110E779;
	Mon, 25 Mar 2024 11:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zQKnmN+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485A10E77C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:06:54 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso49931701fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364813; x=1711969613; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OzYo9oAHWPo+TRsqkkObBMH6qMGOUpYvfb9XwOQz8ek=;
 b=zQKnmN+xMA6zHd+xougedTCSk/za6l6yLsFhsnVdrGbl8eI/OfEmQBg/0ivUvhrrSf
 6EgcD/qP59VAQBfMC7B1ZDFotY7TGS8J3D46gRJSMIPKi7katY+vBJJQh4EGdI9rATjh
 Z344SBOJGkEmi6j0fWOZtjIz2J+3m5mF1uyOrVsM/vbK7qW2B73ezmuFsXFVLBGAbRcg
 EYUlY+YZuMS0OkS6Gm90xxFPELmwLeikCAVtGUOvqJ1aQuAX+ZWNlEXQMOFQxG4YugsI
 XqG6m64CR3ko/WZEx+V2JwquI0Hg+PGsgyp7heIm7wzqFrME5CRRKXLtTeXkdLGuhkRo
 FAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364813; x=1711969613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzYo9oAHWPo+TRsqkkObBMH6qMGOUpYvfb9XwOQz8ek=;
 b=YATzDxiI8guTDJ2m9oifucfbJHi+19yWPgRzRfsiRgCDOknuN9b+qz9wOTiV4XQHnx
 hMh5QSSuvOlU4oyjKeDK5rvj4JWjBxNvw63zFZ2z8aYtaQ9/Anpgpa1lZtwUyiWeXXs/
 bl5rEJEMAdXMWqXHCC8VvU3JoXtIGtnfjvQ/r7ribDFeoIFS406nethpu0BiCmugBhsl
 htssTsYu9vjWy0cLujXtUYtMaMgfeP6UNFB0MhaKw5K7Q1c1Zl5ExQakZ+N56qqXM5N9
 attxRITWd/+nh8eZPddO/k+fwbsuD5HpGBTYfAzfiMbFNuAHBBOFYiNhAFS2/GVwSoVx
 DShA==
X-Gm-Message-State: AOJu0YxclrvGO6wrmuaB9zAflIWklM5VBhvB9IfdmqfdmrTXkRISCt6B
 NRWh8URGYba897KPzggPJBfXre8cDjFUDiQmpitGsC82yjB7Nuz77Ye7Qysm6AY=
X-Google-Smtp-Source: AGHT+IFyw+VCmIwfUgfLpo4PGCVswJxK5GtlgxguZfuOrp12zUG45UoQztc69XOjcZt7uc7aTZj+6w==
X-Received: by 2002:a05:651c:1502:b0:2d6:d852:1757 with SMTP id
 e2-20020a05651c150200b002d6d8521757mr1739225ljf.39.1711364812918; 
 Mon, 25 Mar 2024 04:06:52 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b0041487f70d9fsm4539285wmo.21.2024.03.25.04.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:06:52 -0700 (PDT)
Date: Mon, 25 Mar 2024 11:06:50 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Message-ID: <20240325110650.GA190215@aspen.lan>
References: <20240310135344.3455294-1-paroga@paroga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310135344.3455294-1-paroga@paroga.com>
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

^^^
Is there any reason this patch wasn't Cc:ed to LKML (it should have
come up as part of scripts/get_maintainer.pl)?


On Sun, Mar 10, 2024 at 02:52:56PM +0100, Patrick Gansterer wrote:
> Add Device Tree bindings for Texas Instruments LM3509 - a
> High Efficiency Boost for White LED's and/or OLED Displays
>
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v4:
>   Use backlight_*() to access backlight_device
>   Do not set backlight_properties.power

This looks like a changelog for the patch set rather than for patch 1.
Normally that would be posted in the covering letter rather than here.

Nevertheless:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
