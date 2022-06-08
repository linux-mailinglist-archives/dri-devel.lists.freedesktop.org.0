Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42C54329C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081E811221F;
	Wed,  8 Jun 2022 14:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E3A1121F1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:32:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so775062wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mHZcc87752dCD5EakMLSwQMgSNKMbCnC16gyyFD++5I=;
 b=iRZ0wVla5u9zp0SUCSyUiAxjH9RAE3J3FBcCkxHdsTvZIAvAoIiTfT3tGOS1jmquHP
 Enoc55DWAOCNnBOHOmwCwtXBbjlfVIHI6d3yv8fr49HgEeyDerdVlFc0Z06gG6D9H2Zc
 ynOKMPLCV8XcC63V2GeH92kmwKS4cmctokNnA27r/B7x0K8MVdJDWThBTADofYW2KKUa
 TxgX4BUGEdEdWdUi38Bw7CeqWaY27VL6grEHQPI5VPySkrXILGpvdxV0CJQlRePRGivJ
 +nc2kRpn2YpwEzoG93IWD2tGyGJzfgXAni+5vvNxb3gXzfbLcKH6SCQSOXtZzcUMxV7T
 u7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mHZcc87752dCD5EakMLSwQMgSNKMbCnC16gyyFD++5I=;
 b=zNASEo8js+WixnXn52fFR0++QKM2Imj6KEXks95kCbRHaga+tE501iBKAgxfs1ls0I
 nTbp/ZXkd/mf3CM9oOw8Hpon2tzkxWnVpgxlPl1lnwFmxa8iF9kBduB806+8BbwzyxqJ
 sxM4Evon9JbzFym30M4WmuyNSCaNs3ViLmU6JABLnXdeieJdqhB2CoPXNa3sEuX+nVxn
 H1Zsu7jUbJr/KYNgkk+zOk0IxXHmsHBIOJ8OHL0KJufe6/SpbSLWk37ri0F/bjEG+RWg
 BLjiTJRhjZnYwz+TYO/I2prV8oBz9n1Me/+MPoAa+//gN3tXy3hjIptQ5YX2oLtFJDmT
 xc4Q==
X-Gm-Message-State: AOAM531+k+d6rmil9iVE4mhJZUg4P0NyH4dRIe5AUYKjXEtjf6zxetDe
 AlvplQjS2zPfZh7cbG5gP7MOQw==
X-Google-Smtp-Source: ABdhPJwXEQ4i7ZpLaMkGxRTUYH9S/yoGBN8D+OBla3n/ONr6sTpO9FmexKwaO58/OLLltjA4Tnbt+Q==
X-Received: by 2002:a05:600c:3b2a:b0:397:3e63:3db8 with SMTP id
 m42-20020a05600c3b2a00b003973e633db8mr62698557wms.40.1654698755974; 
 Wed, 08 Jun 2022 07:32:35 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4b8c000000b0020feb9c44c2sm21540231wrt.20.2022.06.08.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:32:35 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:32:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 1/4] backlight: aat2870: Use backlight helper
Message-ID: <20220608143233.l5pbopafqc4n6uwq@maple.lan>
References: <20220607190925.1134737-1-steve@sk2.org>
 <20220607190925.1134737-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190925.1134737-2-steve@sk2.org>
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
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 09:09:22PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
