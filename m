Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369454ABC4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1D10F932;
	Tue, 14 Jun 2022 08:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96C10FA97
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:27:10 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 54F8566016A5;
 Tue, 14 Jun 2022 09:27:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655195228;
 bh=6BHp+SEqrOka0kJh1K6ITLyHzwfMQZol0v1SsMsiHFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iMOU2MsD9iUiBXCCIY+n5CEX/lUopW1GCACEuG/8g73YQBHeoFkGX2Q7X6esAk4mS
 i3pbxbMWuqgU5Soctlwin40oVpEoAjhDb6lgE1VRBcmF692J0hkTtck3nz6ohK0Gh/
 ZYpWgWMgwRTum8jXRutZfRHUjVFdxhF0uuU3pZLoOej4Rg7qBb/EdsJqqXrnxwhFqW
 OWzBS3fL++iXbG8baGbCpZ9FiESUCgSrYkZseWInfCzKiGoOL4mNK6rh1B99dVXiSC
 WLOznbGnIKtjwUvYKdk3etkznlIWQt9KGaoaTS46vqGTdFa8KW2/PzgufZu6W//IxM
 0Omj2zmt6duHA==
Message-ID: <82e0812e-c6db-9f69-b968-794a0f6b915a@collabora.com>
Date: Tue, 14 Jun 2022 10:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/7] usb: typec: mux: Add CONFIG guards for functions
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-3-pmalani@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609181106.3695103-3-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/06/22 20:09, Prashant Malani ha scritto:
> There are some drivers that can use the Type C mux API, but don't have
> to. Introduce CONFIG guards for the mux functions so that drivers can
> include the header file and not run into compilation errors on systems
> which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
> the Type C mux functions will be stub versions of the original calls.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v1:
> - Added static inline to stub functions.
> - Updated function signature of stub functions from "struct typec_mux"
>    to "struct typec_mux_dev" in accordance with updates from commit
>    713fd49b430c ("usb: typec: mux: Introduce indirection")
> 
>   include/linux/usb/typec_mux.h | 38 +++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index ee57781dcf28..9eda6146fd26 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -58,6 +58,8 @@ struct typec_mux_desc {
>   	void *drvdata;
>   };
>   
> +#if IS_ENABLED(CONFIG_TYPEC) || IS_MODULE(CONFIG_TYPEC)

IS_ENABLED(x) evaluates to 1 when (x == 'y' || x == 'm')
IS_MODULE(x) evaluates to 1 when              (x == 'm')

....this means that a IS_ENABLED(CONFIG_TYPEC) check is enough, and
the latter is redundant.

Regards,
Angelo
