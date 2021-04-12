Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDC35CA5F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07389EA9;
	Mon, 12 Apr 2021 15:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516689EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:47:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a4so13461917wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/5Z50hT8XgUDXDqADXHmHcFjdRyH1Ew3g+vGI2YvHI=;
 b=MFST10U88/SHQi3NPS+LstwNQOXwSVV1pw36E6Y62at+1lwNrnRsNZu+IEXozYTYlj
 a4E+/HxXPI1DC1LJLJsgjQncch5hfZkxsgX/kio/wyHMOI3u0b1Xv9TNUWxkP2aRmNls
 yEuOb01G14f8+Kwi8t9kVJpzVBINWLO/2UT7RRZFif51kEB/3YCKJRU7KW2sl0jLiKzG
 257E26rDNlHD/K+4BogMQ9xqwD9qMoZx6ruyzLCFypjJCnVikjIEEtLF2ZdFG+SeqbZg
 OWUeJn16xlg2H0DYZL9HR5U3rILKNS7GiNx6v7H6ArdrAJnIjLmQlI8NSVGX66y9i+bc
 0VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=y/5Z50hT8XgUDXDqADXHmHcFjdRyH1Ew3g+vGI2YvHI=;
 b=Vvg7oBozc1H1HDJJIUhMC6XrG7WH+fdRfR1HZBDVNpl1L7jG3vkyIp/HLrH6AaUqx9
 savybjkrcG3nc3i2GbGDLYAuFVWSD5VgPgNy/92QTJKv1sLB7XeC1gOg8XamjBYT2EqX
 4xPE+FoAbsZDnIPcjd/xPbQ3nIbsSDtYKoIjw2r+PE2AAGqeIIhHR+FIfWNiZCgNCs4S
 NBLWYaeRKNu400vDhVbTnA+j4k543jU0sQXS9fP/2O9tvGYgpfrL4uSIddvBJfvqUKmf
 rCioMeWoszRz1GoGbGTvfmFFCJxY15Wchm+pjdY0tU/rG9J87V+9B8sWHzUzy+fHn5A7
 T5Fg==
X-Gm-Message-State: AOAM533Yo/JzK4hg8Afoa4s0J5gC4f6Zl1cqhQVKBqk0+Vyk8diN7Bnm
 VDTlPCNiijbeH9f+Q2FnQoVifQ==
X-Google-Smtp-Source: ABdhPJzUvkIkCj0rMsw6OaH+49uNILOkPp6qGZpZMBcKowl9s74T5zr9/moXsBUJQOdNSGxyVS/srQ==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr31725469wry.48.1618242466693; 
 Mon, 12 Apr 2021 08:47:46 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20?
 ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id t19sm1522421wmq.14.2021.04.12.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 08:47:46 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] MAINTAINERS: add it66121 HDMI bridge driver entry
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-4-narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <bb9196e3-e2d0-e44b-0cf1-cb469ea2edd7@baylibre.com>
Date: Mon, 12 Apr 2021 17:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412154648.3719153-4-narmstrong@baylibre.com>
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
Cc: Phong LE <ple@baylibre.com>, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2021 17:46, Neil Armstrong wrote:
> From: Phong LE <ple@baylibre.com>
> 
> Add Neil Armstrong and myself as maintainers
> 
> Signed-off-by: Phong LE <ple@baylibre.com>

Obviously:
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ae8444c96b4..ff6450c83049 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9515,6 +9515,14 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  T:	git git://linuxtv.org/anttip/media_tree.git
>  F:	drivers/media/tuners/it913x*
>  
> +ITE IT66121 HDMI BRIDGE DRIVER
> +M:	Phong LE <ple@baylibre.com>
> +M:	Neil Armstrong <narmstrong@baylibre.com>
> +S:	Maintained
> +F:	drivers/gpu/drm/bridge/ite-it66121.c
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> +
>  IVTV VIDEO4LINUX DRIVER
>  M:	Andy Walls <awalls@md.metrocast.net>
>  L:	linux-media@vger.kernel.org
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
