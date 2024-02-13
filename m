Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27FD852FDA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5EA10E5CD;
	Tue, 13 Feb 2024 11:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QEorCLjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3910E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 11:52:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso15060125e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 03:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825122; x=1708429922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d/8hvfnB52WKyQuDYeSY+T60yEnMttg2LqXyXeds56w=;
 b=QEorCLjA8iJuyB7k7I/RmaopcdJ18S59cRY2N5pCMjo50ylgyrfEyOkEaSLRY0/rrc
 No8xmQAF6TL7xXrdFgBbHKxezBxeA2OMwedblwooJEnZvcPrhDOOL9U6PDbmcCvFHaSU
 hO96pNrCqqCOA2+It/3u1i7PEMjwBBCfqJP5FPj79yL6/kvf/DwVl5s0M+71UfJBbAQK
 lddSVd0AOq9ELWNxN7d3WknOq4uwZ+6Z5uli37BJRgEJK0wUQaogsDeTrPvTmGaTLb/N
 c0w1QZcd5PTGh6BEiSvrlykQdpoV00CTJyuebkDid3Nrjx3YAlLlBVwBmvVqlNC+7+//
 sXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825122; x=1708429922;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d/8hvfnB52WKyQuDYeSY+T60yEnMttg2LqXyXeds56w=;
 b=dltslCx4/Q1oTTh2WPnrNNz74IGoS+dQNNPFwjDwMDZ61d6Tlis69iwY10k6w0Kxx3
 7LuuVQOtqivMIweBy3AA1TDjgz8/oLT/D7hMY8FzZ20i0kEe0DVuELRzVDaRS0SOjxaR
 pG6CeRO2ni0+uQRn0uYyvroVs9qrdiAv9o4Bc1yQj2oELhMPy8KTXL3zwbLlckXcMp4K
 WTJdpidO0eMb20bQICSmDStDG+8JLJ6TA1MsYjE2e3PxYej3sIrc6nkhadc/SRaNgM4a
 9CAZaXviTKP1ObOQy7mRrdWtmsXdYBGOPtXwFVuldme2PhU+y9EshU/CQIsMNN/xqcu9
 moow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXCg5+H/6hFUu+KlXWqVTLp7RbP8F5LR7nSh3vzgQhIB0OUEwdIMBlF6nBQS/GBqiz5xAYBSFdOlNpTgdg/ScB1yFDpCFaMSCeE3B6sU2+
X-Gm-Message-State: AOJu0YxuhSmhfsOhSKDAjrufr9OPKDYQjFltoqQox6eY5oj1/6vU3CHd
 7JgemStDqmHGSCDBajMVlUBQ8AzpFD/D4mJkKcii4Tnh5/nzJ36kFCL20E2TxsM=
X-Google-Smtp-Source: AGHT+IHonkkurPUvJavEJpeMYX9VSCpuekmQBUsogxy3x8teNWtObawj37dzh2fc1R7htZFP4Udrxw==
X-Received: by 2002:a05:600c:4709:b0:40e:e834:3d86 with SMTP id
 v9-20020a05600c470900b0040ee8343d86mr8201325wmo.37.1707825122315; 
 Tue, 13 Feb 2024 03:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKMaS9AuJ7XQ3rkJVqEFEokJo3tjRWlKUvffNx5SXum2LJHH3Bvw0+P7i2To8z3wox0BEW8GkCSwe+SXVk3znoZmyeshQISrNsyjs7zMDUyJFL38qjuUmhfy5k4SegeW8Wp5aIs6dRoHJYx0xDPZUi8/TBF+rF36VGvWP2GTKRiaBchP2AOHZFbrJxURBoUNQf5tGycsufQQObs88oRRy4vzTCA0pxcCXin917IQaQ9nac097iwu1NoLeih0Vcc4b5VRf+pNj4zpcDfxeTg8LL0+gFv2fptmONcPLI4r5S9DaNNlKW4Naw1H80d72U7w4uHzakpGcWtRFSf8hehB+bBzJn35LwduBRv4A5QXdL3WIA4f26kw28jVrFyBL3AY4qHh80wcDU61ArYNO55urLifMR8JDj1v3Wam/JYebbFY4c/4vr88kiVXpT5AGcjvOPd+JJf3fy4doEHm6PlHFEIFJikG92FVTH2soa2Gew4rq2bcqdOJLA3uISsCqtEkPHV6RITM5ictW24MYhvREgM41McQU7s/geUbKFl/KbGSK7JUU9thr1zfQcSsTi1J9B9OZg89vKL/lwCnmCoNRtpNkSPoZJs9Jle3JBf+Aa
Received: from [192.168.1.20] ([178.197.223.6])
 by smtp.gmail.com with ESMTPSA id
 ce9-20020a5d5e09000000b0033cddadde6esm1090631wrb.80.2024.02.13.03.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:52:01 -0800 (PST)
Message-ID: <840738f2-abfb-422e-bf2a-c2763e76197b@linaro.org>
Date: Tue, 13 Feb 2024 12:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: display: Document ST7703 panel rotation
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
 <20240212184950.52210-4-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212184950.52210-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/02/2024 19:49, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Document the rotation property for ST7703 based panels.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(with or without empty line removal)

Best regards,
Krzysztof

