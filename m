Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89521A31F1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 11:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC82D6EB97;
	Thu,  9 Apr 2020 09:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFB66EB97
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 09:39:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so7463979lfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i9hj27ADd+17C+KGuD555EZkHehi83Ox596cp2GT9jY=;
 b=V7oI1N4QzARgNUD+zjSXP9qPd1SwFm0eFfUrdMo0BWluWbqsr3Uj4VVBWqiH1lK8jG
 iBjPK5A5i4YWQr19OtCvlx6F5JI5Kj6Tc5SIWupgmn2aoKs60bQB3KospHPVZJ996n2V
 Pr6jxbDsrkrRbgCHISuFxmoCs/QZOkIXSAYinkIIORVXo/Fm4GuNQfdiYCtN41KqdK2M
 UJkTdUkJUaln9HS4V5gS2m0GLIE3/437bEcVrVG8atfdWS2mBha3hMBf17+82UboQ1fk
 adDoCYASdAxdDqfiVNxrYAtLmdRECdwwT5aSjUnPunb4jhnI016t+b+YZVouIVJKpsF6
 5MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i9hj27ADd+17C+KGuD555EZkHehi83Ox596cp2GT9jY=;
 b=bcVkUomNvgVPCZegexRblf116XKIEZCixWbPBAehKbtLiAo59X4t5poQyuu1D2o5uu
 q2khqdQLDi9PvqtqlQmDQjj4oLegu8PJfTMNwop+Z6tCV2ZvqZ7cNT7Ck2zzWWzc8leO
 oKxZaO3tpjGMfROg8InIE2iacYOzsO5t5q3Wx6gH7c4B/K4tL7P+Gtq1GiCRcIEk6lwf
 LexExkkawvG4i9RYGzxxtsLHYoLKjgX02mnYIdrAJvUXVLapR6Kg5xr1J/no7a5BvsBp
 vMXF8GUhDTM85pCTxUJVj8/YlFZs8OlhzmwU/iXQ3hLSlpEUudTirGnPfOjC7GMHqy3U
 Burw==
X-Gm-Message-State: AGi0PuaE/fyJt/5ul1DoMvDOfEpAk50iHmYf7ohqRkfoPyV1CiJVkpWt
 ME9s43PpVcUvVGgXPp2vUMQ48w==
X-Google-Smtp-Source: APiQypI8ZMs5zHNTel6RghTB6VGJ1Hiffnb8Q9ocT3qWKuwf1QRuH6Mu5rz8D1GHtiYNkRLnzg+A7A==
X-Received: by 2002:a19:e049:: with SMTP id g9mr7454758lfj.198.1586425196108; 
 Thu, 09 Apr 2020 02:39:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11?
 ([2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11])
 by smtp.gmail.com with ESMTPSA id c21sm3333953lfh.16.2020.04.09.02.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 02:39:55 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
 bridge connector helper
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0b0eaf1e-793a-e67f-d5c2-d6e5f6ac2cb9@cogentembedded.com>
Date: Thu, 9 Apr 2020 12:39:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 09.04.2020 3:36, Laurent Pinchart wrote:

> This small patch series enables usage of the simple-bridge driver with
> the DRM bridge connector helper (drm_bridge_connector.c). Patch 1/2
> starts by simplifying the driver by delegating DDC handling to the next
> bridge in the chain, and patch 2/2 makes the connector creation
> optional.
> 
> I will continue converting existing bridge drivers to this new model,
> starting with the adv7511, rcar-lvds and dw-hdmi bridges. Anyone willing
> to give a

    What? :-)

> and converting additional bridge drivers is more than welcome
> :-)
> 
> Laurent Pinchart (2):
>    drm: bridge: simple-bridge: Delegate operations to next bridge
>    drm: bridge: simple-bridge: Make connector creation optional
> 
>   drivers/gpu/drm/bridge/simple-bridge.c | 107 +++++++++----------------
>   1 file changed, 36 insertions(+), 71 deletions(-)

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
