Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DCA6782F5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56B610E51A;
	Mon, 23 Jan 2023 17:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374410E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 17:22:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso9139031wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vYfFlh2/eH7MvCcmWNy4mKSX8tRnOgxZyY5AP/uWpUU=;
 b=YpBf+98NAtcBgnr7cRLj6jcCG2UJ+IHjXnag0beSGoEzKzuyHyHEm2+x7TuNHlqwK0
 QOMPFZ3lzSlggPepssvl5TXTeVnpwDeSTBeLl8uFyb5EXQEuklV5fHplgLhELNOG6UV4
 2lcaR+XuhXvx22+gO8m8nDejj9e5/YfHMXqn9xl/1btAVUq6ATXdAjAVdgTVXTX4ZVKU
 32E6w5Y3yuYZvXjq+LvJHpPA7QnBl5uaNS2soAm5gkMQ+1z/lFDbQ+AMwGsbafRtara8
 jewl00kMOvvRKXTeVQszB+IBwAwM7X5Tfp2G/xuTcnvCZfKZz6a+yvoxxcz57/MwzRBX
 d/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vYfFlh2/eH7MvCcmWNy4mKSX8tRnOgxZyY5AP/uWpUU=;
 b=WhGAZUjrJxMUTyh9NA25NX6dWkk1pQ5iqpc016SUy5YwwVIge0VvOXlaoqWnstVwqo
 Pze4qlXuBDgD44lVny+INdN8FF+tsjGnz4CefjMwrbyglwtzwLN/AkVbSr5nozCiIwE/
 kwX+lvzoatao/R5Rht+8Vjen9Ff/QSnml+yF2qXE2C5xTThWi19yy5pVpFXdckf0Jivd
 jMGF/RQsUkgZwSwmWQQZQvLpOI6sFK7ZKr5vJNmJT4mx5pip7Lq/giSH+ZfWEDlHRBbO
 ZpevYxrBtQFVXPBdA1Dajj9wbl8Q0OmQrJK9Uo993d9lnqYmj4lGU5xL4FjSdwZ+a8zy
 KlsA==
X-Gm-Message-State: AFqh2kr5cQnXbsO8SuH+7+VZ3o+JMoUOxnQXh37Ma7zd5GW4RLK/yWbK
 IziJ7cZ9u1j52SRbkkKqJH/skw==
X-Google-Smtp-Source: AMrXdXsp5VTL7eID2mLlksuZgLpiW+9AgWYCFv7/R1au06KFo0AcHm2xAf79T/CRCmojHKWVxUYYpQ==
X-Received: by 2002:a05:600c:3b82:b0:3d3:5d0f:6dfc with SMTP id
 n2-20020a05600c3b8200b003d35d0f6dfcmr24221518wms.30.1674494557284; 
 Mon, 23 Jan 2023 09:22:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1c5453000000b003db09692364sm11091592wmi.11.2023.01.23.09.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 09:22:36 -0800 (PST)
Message-ID: <ae50541f-7456-6088-b310-c67f653176ee@linaro.org>
Date: Mon, 23 Jan 2023 18:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/4] drm: panel: jadard-jd9365da-h3: Fix panel vendor and
 model
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230123164018.403037-1-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123164018.403037-1-jagan@edgeble.ai>
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
Cc: Tom Cubie <tom@radxa.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 17:40, Jagan Teki wrote:
> The initial datasheet claimed that chouzhong designed this 10"
> DSI panel on top of JD9365DA IC, but later Radxa mentioned that
> chouzhong is the manufacturer.
> 
> So the actual design of the panel, gsensor, and customized FPC
> is done by Radxa. The panel model named is Radxa Display 10HD
> with AD001 is the part number.
> 
> Fix the binding and panel driver with the proper panel vendor
> and model.
> 
> Fixes: <6b818c533dd8> ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> Fixes: <bb3098eead99> ("dt-bindings: display: Document Jadard

Does not look like correct syntax. Did you run checkpatch?

> JD9365DA-H3 DSI panel")
> Reported-by: Tom Cubie <tom@radxa.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  .../bindings/display/panel/jadard,jd9365da-h3.yaml  |  4 ++--
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c    | 13 ++++++++-----

Bindings are always separate.

>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> index c06902e4fe70..10ba1b813304 100644
> --- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> @@ -16,7 +16,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - chongzhou,cz101b4001
> +          - radxa,display-10hd-ad001
>        - const: jadard,jd9365da-h3
>  
>    reg: true
> @@ -52,7 +52,7 @@ examples:
>          #size-cells = <0>;
>  
>          panel@0 {
> -            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
> +            compatible = "radxa,display-10hd-ad001", "jadard,jd9365da-h3";
>              reg = <0>;
>              vdd-supply = <&lcd_3v3>;
>              vccio-supply = <&vcca_1v8>;
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 48c1702a863b..ea89cecad0cf 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -167,7 +167,7 @@ static const struct drm_panel_funcs jadard_funcs = {
>  	.get_modes = jadard_get_modes,
>  };
>  
> -static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
> +static const struct jadard_init_cmd radxa_display_10hd_ad001_init_cmds[] = {
>  	{ .data = { 0xE0, 0x00 } },
>  	{ .data = { 0xE1, 0x93 } },
>  	{ .data = { 0xE2, 0x65 } },
> @@ -364,7 +364,7 @@ static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
>  	{ .data = { 0xE7, 0x0C } },
>  };
>  
> -static const struct jadard_panel_desc cz101b4001_desc = {
> +static const struct jadard_panel_desc radxa_display_10hd_ad001_desc = {
>  	.mode = {
>  		.clock		= 70000,
>  
> @@ -384,8 +384,8 @@ static const struct jadard_panel_desc cz101b4001_desc = {
>  	},
>  	.lanes = 4,
>  	.format = MIPI_DSI_FMT_RGB888,
> -	.init_cmds = cz101b4001_init_cmds,
> -	.num_init_cmds = ARRAY_SIZE(cz101b4001_init_cmds),
> +	.init_cmds = radxa_display_10hd_ad001_init_cmds,
> +	.num_init_cmds = ARRAY_SIZE(radxa_display_10hd_ad001_init_cmds),
>  };
>  
>  static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
> @@ -452,7 +452,10 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
>  }
>  
>  static const struct of_device_id jadard_of_match[] = {
> -	{ .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },

This breaks ABI. When was support for it merged?

> +	{
> +		.compatible = "radxa,display-10hd-ad001",
> +		.data = &radxa_display_10hd_ad001_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, jadard_of_match);

Best regards,
Krzysztof

