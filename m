Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AF6B738E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1F810E4C7;
	Mon, 13 Mar 2023 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40B210E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 10:14:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g3so10745210wri.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678702487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LFf8imUXGJ740YH30H8G1wP3R9KYJHw0iP0NBgTQYjg=;
 b=vFNwZo6RCHXiM9iiMArLPMPbJCFc/TRgHdwWgiREr79AhocZJC4USZsObQ2FuO45qf
 /pYOUkBfHdUJyqlNEi2VlUGnNEgay8UO1jJIcF98bJJd0t1+80wfuCAmpy6ttHVnpicF
 S6xbPBQifPCWFghEzurSI479fm+E/lS7GvHvcur+Ni6/yFUh50ABzZmCUgZw82bsVyYm
 CCmqON5iJgMlhnUMKIRzUp6/TzBtAGYeyjuacVbeasFqrd5NRa2/31+Dx5Rd1oCukOIy
 RW+FIo8fvSWDEhx8MREr4tuJ1yF6LRjbzW9bCfsro6jEyRcH3ZUnXLhvbahXnJRTWtE3
 n7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678702487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LFf8imUXGJ740YH30H8G1wP3R9KYJHw0iP0NBgTQYjg=;
 b=y/fy4yCfPIH7D8MkB146vvEABefYWXsGLiY7AI8kf8TlpxM+UJ+6Jo7COUBGwkMprF
 nEQBt9jfBRk4x/NfB5sYYUbi4bbVFNb0xdrzzdmY20pWvJk/RoUja45mGDUY3CNloNUJ
 jX8NMonbe/g2O6wpst+FCSxO7uysfF1jQBD3zUqFPBiGPCtrefZy99d7J18j5AhT/mQ9
 03N0nockAXp+niLI2g1A9wOVz7ZHEgg4QVzcmSOYXFty/ZU/qt4NPyK7UGz5fsmeiriv
 WMbQolwkftIbn7RmrMxPWNWQ5wzYzUu53ej3nfOpED3+bwIRiEjBInn6CyOfQg0DuG5s
 Ebfg==
X-Gm-Message-State: AO0yUKWCscr2lGgV7xpTlBhkNXCz2Jr82K+PILDLwQnEJOMK6z2YYqAM
 nBR49ioLkH4Y2iuGW9SWTPFIew==
X-Google-Smtp-Source: AK7set8yLU2cIhBgVUD2MrkZNSiTLmoACOPx2vcTRtog66hQ7l61dtZLkzmt+UbOf2oZpjyAn50keg==
X-Received: by 2002:adf:eb4b:0:b0:2c6:e744:cf71 with SMTP id
 u11-20020adfeb4b000000b002c6e744cf71mr20498231wrn.52.1678702486687; 
 Mon, 13 Mar 2023 03:14:46 -0700 (PDT)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 y7-20020a5d4ac7000000b002cea8664304sm5554039wrs.91.2023.03.13.03.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 03:14:46 -0700 (PDT)
Date: Mon, 13 Mar 2023 10:14:44 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] backlight: arcxcnn_bl: drop of_match_ptr for ID table
Message-ID: <20230313101444.GD55049@aspen.lan>
References: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
 <20230311173556.263086-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230311173556.263086-2-krzysztof.kozlowski@linaro.org>
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

On Sat, Mar 11, 2023 at 06:35:56PM +0100, Krzysztof Kozlowski wrote:
> The driver will match mostly by DT table (even thought there is regular
> ID table) so there is little benefit in of_match_ptr (this also allows
> ACPI matching via PRP0001, even though it might not be relevant here).
>
>   drivers/video/backlight/arcxcnn_bl.c:378:34: error: ‘arcxcnn_dt_ids’ defined but not used [-Werror=unused-const-variable=]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
