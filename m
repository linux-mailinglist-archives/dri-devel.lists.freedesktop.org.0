Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8366C9C7B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3F910E2FB;
	Mon, 27 Mar 2023 07:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE1110E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:41:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id s13so4442965wmr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902907;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wftUyDBTHaE7XsvAT89oBtCXtZZaZ2/72dyCqkMo38o=;
 b=GnzyZeSybUCxnTGVz2QA9FDPPHzPJeyS+r4L6lDXn5RVquL6LZ1iaA7IdPb7zgofO5
 xL52VRYTyDhiYoGM60Ru+4LMHb3d/aE97LAIvWyNNaPeGazQkoLtSWmHhi31ozOAGIbl
 bdjJ+zUs/bO501qVmXT6ddurN6c3ck8UoEeA1r9AxNXuVN6kzfVHtpfcREdfGSSuq0T5
 zQ5tl/XEan4hvSRV8M5eEmaNh5RxxCH8G3skCzx8xEouRzMl1r8JutgvNYPI2e/KnOu+
 mus3tqTuowFZXbXnFmXJ8TmKiUfYjJF9J/FFiVoOt0YNsikRQi/h0njRSZbgFfOro5Co
 qtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902907;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wftUyDBTHaE7XsvAT89oBtCXtZZaZ2/72dyCqkMo38o=;
 b=TgrVVAm9whBE+fbtll0eZNXxAkU8GGbu2E6x4D515nX0KVVz+X6ci31o1youUtiaMm
 IwkFM3e7P5FnmFs53JjTVrOhKQVmsYwvVG0rRZNcRoiy9DH/S07BhSAs4h4PSX3vK9QO
 YoL3srJnTCjGKIu0PJ/5IiugQ+0mdZ3YVhjJ4i0/1GTdgCl6Q0QwDWvwS9QSm7ZfJKFo
 1rncUk8hdjCJMAnlWaH9Zci+3OKuKIguXaGi6K1bmIA1To6SA72D3INv6OlpJBdmbqUS
 cuURLbuXfNnNl69h/EyozmdzVVyivpyhqzFi64ghoWI9MTvwT4rHjXpKkk/ixxWEyDMA
 xhdg==
X-Gm-Message-State: AO0yUKW1iYi2do/qNzf4nvIo5jep0oZo5tFyDegtylQsjZgecSOafT6V
 wp/dvMASoqiYUnIxiR92TWEmRg==
X-Google-Smtp-Source: AK7set8q0LEyBkDhe3iz/XDbNL+smBGxwor15EZq+ZO8fHwN8HGNFIa9XUon5Vly4d30jmQORdJqqg==
X-Received: by 2002:a7b:ce8f:0:b0:3eb:42fa:39d5 with SMTP id
 q15-20020a7bce8f000000b003eb42fa39d5mr8425248wmj.29.1679902907507; 
 Mon, 27 Mar 2023 00:41:47 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003eb2e33f327sm20207317wms.2.2023.03.27.00.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:41:47 -0700 (PDT)
Message-ID: <0bf8fa92-fa41-31f0-0ee8-05dddebb51e5@linaro.org>
Date: Mon, 27 Mar 2023 09:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: display: feiyang,fy07024di26a30d:
 document port
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326204224.80181-2-krzysztof.kozlowski@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 22:42, Krzysztof Kozlowski wrote:
> Panels are supposed to have one port (defined in panel-common.yaml
> binding):
> 
>    rk3399-rockpro64.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/display/panel/feiyang,fy07024di26a30d.yaml   | 8 ++++++++
>   1 file changed, 8 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
