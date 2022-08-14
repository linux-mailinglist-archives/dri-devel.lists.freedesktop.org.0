Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF8591EF8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 09:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB34CAC19;
	Sun, 14 Aug 2022 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8DDCA969
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 07:46:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e13so6101725edj.12
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0ZqIRQWJDcAC5WtbT7TgFRmcMUbjN/uJOcvXh/zp784=;
 b=gxLU9r/njC15ZNa7u6wmpTydgDAmpZqNMGimY2taEyzEHjjMII7wiFB+6IgXe8E7Tj
 tEiKi+U/UOWI5BgH/N7PCzqY5Do6hz8mQ3uKO2ptcCp7hy+PGyH88inR6MuKIdA/usqX
 ofY8vpWAhNCh7o50QyseDquZ+A3VyEKw2hqIwB64vW8V/sR+stgRWaL3TfVysNs9Bw2h
 sLn/NLo7rTFRCVaQkz9t5NHfjvBNXXBlI1H2ToZQT7ar+86To1Ol2M0G8wM01rc8UAMC
 EP404fnL3P2vDtpig9tQU+cSAZakASLZfRp36Os/ODMalwIl7Wru2Udldvs7qG62w6qv
 em5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0ZqIRQWJDcAC5WtbT7TgFRmcMUbjN/uJOcvXh/zp784=;
 b=79NUyXfY8wnmFivkc5pZcqRHibTPCQ3SNpGemq3g2YAkYITwGgjbxCUtsCRXWZd5rG
 GfhWq7xHG4g7mBgTzRStleJPsUkJmXnKN0xN0qC2NUf3EbvhRtVqTcOya4kAFgDurlrP
 PCxEg2UyMpIKc9GWgmhdFNwhV7jA9CUvDWpDnbDtpctdWhW5fpyF/Uob+bYG9gfmkaxy
 sdsQ+kH2e0H7wEHXQUGRTKf7hceH/SWwK2/yxByi5NX7ViHMppfa4TdGSYf0zkBouvwp
 iPqVhQgyhf5tHbSTk/MgqGEPB/7B+2NZTRj/ZmP4JReIBXu4L93s7BH+i0bkLZA3FdRs
 uOSQ==
X-Gm-Message-State: ACgBeo02z35cAoiwiwGyrOBeQnNPqec8m23SShaUs1yquOjrF4QgrRUk
 tkC1vAnSKHntxVZ+fV/kA/Y=
X-Google-Smtp-Source: AA6agR4PqI308kOBU328tJjNj3BJGJwFneQKD2OMYaR6Vh3pmZvoBbypevpZRbQBhX87/O3h9QhLAg==
X-Received: by 2002:a05:6402:4029:b0:443:a5f5:5324 with SMTP id
 d41-20020a056402402900b00443a5f55324mr1351235eda.51.1660463213805; 
 Sun, 14 Aug 2022 00:46:53 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b0072f1e7b06d9sm2667073ejo.59.2022.08.14.00.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 00:46:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/4] drm/sun4i: dsi: Add a variant structure
Date: Sun, 14 Aug 2022 09:46:51 +0200
Message-ID: <4731474.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20220812074257.58254-4-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 12. avgust 2022 ob 09:42:55 CEST je Samuel Holland napisal(a):
> Replace the ad-hoc calls to of_device_is_compatible() with a structure
> describing the differences between variants. This is in preparation for
> adding more variants to the driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


