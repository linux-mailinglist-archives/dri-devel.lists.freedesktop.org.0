Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CD677E05
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDEC10E4A1;
	Mon, 23 Jan 2023 14:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9B410E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:29:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so8722779wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OVEX3K9R7UTVs9BpydIEVGiNnSD4cwRlULo8SBOwRn0=;
 b=i3RoMQQsfcUP8NOwgfzVsWobAfVLn54sIZ4XHfy+qH+5n0QZ0M+sWsiNJTPpKCU9K8
 yqaNynX/bMUw2xIkPwJI3RoYO+DyM0d0QhX/6Cngq7qnw6kclIfHvp7040IR4NAlnrM4
 fnhBpq/EZrpa5GzYXXa4C+IZaTklI8dpbkC5W9HcFJ8fbyzDPFaxXTA+WudfULmeJEYw
 DNvDV10+bAumqGo5/QMgQhj9vQUrSY+v0QJip3z9RXyIA32B3p49xegzWnudQhV/+BH9
 dhsot0MsFXnAaAJEOOVH8svtpyHgg3P9rk6izZrf6lOxlvZlfu+RMhr29AMY+npqCvlo
 kRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVEX3K9R7UTVs9BpydIEVGiNnSD4cwRlULo8SBOwRn0=;
 b=fYH5DA2RzbZjXCbHZMxE7D9WYyVf0/fujJXjd9JU1zl3suX4+njt8/U3R8YIcu8ZvJ
 fNUybvCU1R1WXPBVjSavlmXuDI2p2ggEB3nIicyEjAafhQ9ghSHJm7PYyN9g9B5acQkL
 HBrweQRGbNQY2p5m3q1Z2xF46TD5wseDR85d8HeJCR15/BeW+uvv1rzsu59FpHCWTwRG
 ErwEJuIC7Yad6rgok8OFsl3ItX/1sYoG9JqmdpGLAOGnxBHT6mtxYb1Ox7dbU20N8lVG
 FsUQjfC3YUOILXm5Bxom5qNt7aXA9HraM/WOKVUamWyZ3hKOcKSdBOhpqfrRzwZTlgcE
 X63Q==
X-Gm-Message-State: AFqh2krpOOE/bmWvRkket8Tk/yvPuPVVoaVb9+LpBdmlza3muyFc5x7b
 iE/Cl3hjU3XrmA+FbmCv/Z7SVA==
X-Google-Smtp-Source: AMrXdXu+uy83sENphsRTx1C76RiEULtoqR/9nxoXaE+2BE1EGyLljUeg1Q2ZHou14FVb8ThEN22dvA==
X-Received: by 2002:a7b:cb88:0:b0:3d9:f801:73bf with SMTP id
 m8-20020a7bcb88000000b003d9f80173bfmr24150509wmi.12.1674484184653; 
 Mon, 23 Jan 2023 06:29:44 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o28-20020a05600c511c00b003dab40f9eafsm11865469wms.35.2023.01.23.06.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 06:29:44 -0800 (PST)
Date: Mon, 23 Jan 2023 14:29:42 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y86Z1ohimSHhNvj8@aspen.lan>
References: <20230120155018.15376-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120155018.15376-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 11:50:17PM +0800, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
