Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1451228EB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233D96E99F;
	Tue, 17 Dec 2019 10:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2366E519
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:11:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k8so6742159ljh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TAiI2BLb7pg9ooKEGjkHuJASfBqFSr/9eTqBaRR+Q5s=;
 b=PH0wGXKoxTI1BJDicekstqKBJ4bUQMNjt5WFLwFeBFjDEh9y5g8UwguA9xkD8yaXiv
 c7k11mDPDSUg94LtuFZlCmyjmF8MebpdBATDduGD0Y6wRdKFNpU4xwTm8ba2xWcf1ZyU
 fy5iOnXALduWsM2HUAHDqo9gHZrbujiRXpyhluUvLz9ZdEumIDdRD6ZPi9KSbWQUR7Eg
 Ei4OTHNf+9he5dyj3hgkHpFmiTiZSDzs0j9y26AhuPeHuXLDfoZRuLZZZnHSZUE+pK7r
 4JDl4oGg1cyCZcXADYc3F7ZC4T8lWFWZz+LD2PqB4lynHIjQfAJbnzx7qKDGCoxEkIOa
 TMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TAiI2BLb7pg9ooKEGjkHuJASfBqFSr/9eTqBaRR+Q5s=;
 b=QvGlffhoWsqVdqT0WTWgKFlJElyFS4r+D2boYgVi8WaGzMrXw3pDAfoL9otbSBbtxh
 NqI4/piKWUMwcLbF9gXG4ME4JJL8uL5gHLPBW9p4YoLsrnxWwKWaBdKnoOnC3WavitVT
 /WOSiOAv0dDYsye8NczqWMz6tmnKiazVyqgFD51NuvP8s5wxzB+QepkVY1jwVKWyarDn
 B+MLoCj0F5A+wPcegDgJ2XA/nO2kUkw0XntR6Wl8T9nQoMb5Hw5f2QD3vKL2C66csr0O
 vn+Jj9/voctrux5GqELko88FZ80gNVuGAUELvL7ZDf7BanoB4uXq2ZKBc6Q5AI3d6GZ6
 vwSQ==
X-Gm-Message-State: APjAAAWP+hQ7FgSwnFQWRldkI4g6/bYeGihYrTsxQ0NGfYKxHZGmT+fz
 Y61ML45Qro9lqXVDZbAAv0Q=
X-Google-Smtp-Source: APXvYqwdw8OQRUE6Eja3yiNQfI7EwoJnMViFtOVOcm6zH9PR00CiPZ6kA+IbXoy2RpCQX6x3Aam5qg==
X-Received: by 2002:a2e:83cc:: with SMTP id s12mr16392876ljh.11.1576501885998; 
 Mon, 16 Dec 2019 05:11:25 -0800 (PST)
Received: from [192.168.1.111] (91-152-83-50.elisa-laajakaista.fi.
 [91.152.83.50])
 by smtp.gmail.com with ESMTPSA id q25sm10648226lji.7.2019.12.16.05.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:25 -0800 (PST)
Subject: Re: [PATCH v3 11/50] drm/bridge: Add bridge driver for display
 connectors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Message-ID: <61bdedd0-6d88-7e1a-8229-18790439ed9d@iki.fi>
Date: Mon, 16 Dec 2019 15:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2019 00:57, Laurent Pinchart wrote:
> Display connectors are modelled in DT as a device node, but have so far
> been handled manually in several bridge drivers. This resulted in
> duplicate code in several bridge drivers, with slightly different (and
> thus confusing) logics.
> 
> In order to fix this, implement a bridge driver for display connectors.
> The driver centralises logic for the DVI, HDMI, VGAn composite and
> S-video connectors and exposes corresponding bridge operations.
> 
> This driver in itself doesn't solve the issue completely, changes in
> bridge and display controller drivers are needed to make use of the new
> connector driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes since v2:
> 
> - Fall back to polling if the GPIO IRQ chip doesn't support
>    edge-triggered interrupts
> 
> Changes since v1:
> 
> - Use drm_get_connector_type_name() instead of open-coding
>    display_connector_type_name()
> - Remove empty .hpd_enable() and .hpd_disable() operations
> - Set bridge.ddc
> ---
>   drivers/gpu/drm/bridge/Kconfig             |  11 +
>   drivers/gpu/drm/bridge/Makefile            |   1 +
>   drivers/gpu/drm/bridge/display-connector.c | 292 +++++++++++++++++++++
>   3 files changed, 304 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/display-connector.c

<snip>

> +	dev_info(&pdev->dev,
> +		 "Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
> +		 drm_get_connector_type_name(conn->bridge.type),
> +		 conn->label ? conn->label : "<unlabelled>",
> +		 conn->bridge.ddc ? "with" : "without",
> +		 conn->hpd_gpio ? "with" : "without",
> +		 conn->bridge.ops);

On AM5 EVM, we have HDMI output with DDC and HPD, but I get a kernel print:

display-connector connector: Found HDMI-A display connector 'hdmi' without DDC bus and without HPD 
GPIO (ops 0x0)

I think that print may be quite confusing for someone who doesn't know the details of the drivers 
involved.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
