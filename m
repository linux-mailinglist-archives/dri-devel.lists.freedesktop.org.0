Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481236615FF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 15:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A223910E1F2;
	Sun,  8 Jan 2023 14:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250F10E1F2
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 14:59:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso1759582wmb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 06:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l4M/UpUULlMB/QRDK84kNKvNm3p0JIVteECSWzec3Ns=;
 b=Mdh4xNLK5EGYOgX2nVxEUx5L1UiPB+khVNYaQfPSmQStL1BSuw5IOXtROunniO6+xe
 KMrYehrz4oX+cRis9/L8u/Nq1Yt8UssFdNEOXzUJS7904FSWWjW2b9eZ59h3X1eFICK0
 CivGtb6v6jrgzEm9IUafFiSY/TAVNVQXFFuQMQhQEpRlWyuaTF728gyxDJX0dt/ybM73
 Bd9ZgMwS01+5RgMiGa8EnB6X3S4eovB0EOxkXdn5FtAYKtF211SDstDZFQuWY6zhh4w6
 DsC4qFJZv0MvRdXUqjfW8/PLGRBYba6rjx7x35eck57r9G24WJtGBTokaHGZ3ajBtCSP
 Lw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4M/UpUULlMB/QRDK84kNKvNm3p0JIVteECSWzec3Ns=;
 b=AJIF3sVjVH9Q97Q1UrGhY0OvMmqamm6yBxFvsePci2DGRvftO7DLIZVEJoTzEJn4sY
 KAXtJXu/Iz/xsnq/+Uhs129+hPfW3OAu9O2EGaqg3bb8mNnOsCEhrjEzEtnZiRsELDYR
 9uzw3KxpcKMDU9gDxlJIYXSsF2fxvnOWD4DBQOuNuDTk5S4V4HY5eJyCf/DG6aAgO+eO
 PNFDo1rxx4K4rQcibKTCyIPLtwFmSj5tIyBl5lfp2B8e8gItJEvff7XMyjrCr/+xuIfU
 gzEudx0znPQ4C2L6ASPuaWkSqyZ4J2lMpLfqjtC3xyM+9YSEyMkhk8GJfhcZ07bHsS9D
 9Wmg==
X-Gm-Message-State: AFqh2kqlekaQc4a1GPgXLZOXyEryzgSvpYm4jNoeezFufVzgZqzFFC/7
 0pumpaf48bHaLhrGq11V3+OYqA==
X-Google-Smtp-Source: AMrXdXu36HW1suA8i90fum2DC1iUwZ6q029yvEEFPy79hWo1C+3IfHGRRRTwWy5zSQkwe5jiynSHMQ==
X-Received: by 2002:a05:600c:3502:b0:3d9:e75c:756c with SMTP id
 h2-20020a05600c350200b003d9e75c756cmr3336586wmq.12.1673189963864; 
 Sun, 08 Jan 2023 06:59:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003d9780466b0sm9203210wmq.31.2023.01.08.06.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 06:59:23 -0800 (PST)
Message-ID: <7f672ee7-7b78-dad9-ca58-2eb4c2c2dd39@linaro.org>
Date: Sun, 8 Jan 2023 15:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 7/9] dt/bindings: display: bridge: it6505: Add
 mode-switch support
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
 <20230107102231.23682-8-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107102231.23682-8-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2023 11:22, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v8:
> - Updated bindings for data-lanes property
> - Fixed subject prefix

How? It is still wrong. You have slash there.

> 

(...)

>                  port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>                      reg = <1>;
> -                    it6505_out: endpoint {
> +                    it6505_out: endpoint@0 {
> +                        reg = <0>;
>                          remote-endpoint = <&dp_in>;
>                          data-lanes = <0 1>;
>                      };
> @@ -148,3 +173,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c3 {

Just i2c


Best regards,
Krzysztof

