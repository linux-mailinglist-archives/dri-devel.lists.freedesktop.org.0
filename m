Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D766C9C77
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557B610E274;
	Mon, 27 Mar 2023 07:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AB710E274
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:41:33 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso4536949wmo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902891;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nMDnDVndzHNxg8IysowsDNshZJLrhOGXhE/oQgMJt/I=;
 b=EsFgBGI6BZ5ZwDAdbcfRIPDxe8eYQItMtqfFw25GhIa7AY+vGmel0quZRkl9QnaAFu
 pIrgEpxLejlsdV4FguN9YPOUkiNJsKDefJ6eEVTDxdXSpGBdrzHmYONRTTODpaTOxrWO
 9m6SdAhLyUB8NGgMoPEgGd8tUkzYAo0TPSDEi1H6HYuuO6T2aA5GjnlHo3JJsm/jD4DL
 EHIsp+4/OVrHhR2WLmOQ9ZiDHKLxSWdS2HMHzQk/YgyjqxYlP/Ddw5wuEvAERzxW6uNp
 CHxU133Y47dv1W2gn7qo2ODdqF5izciLdy4RNlGyx4XSfHI1nUoyaJXmpaJ7Cxj76/KZ
 RZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902891;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nMDnDVndzHNxg8IysowsDNshZJLrhOGXhE/oQgMJt/I=;
 b=W4Ax4aXmJNHYpgTgISMB13IXWJzMNux3TWqLeP8QBqcoJYwjUXYxY2o1hv/1LXzP1r
 vM6Pin4DlOd1fCTVjaPyp/YeiAcJZ8Wj9FyeIYt2DoCXRF6457Vw+Mb3GND53w9nnjaZ
 1ZaLuCVs8iXbagDDhMJHWFyNgHWMUOR6z6Oo8SdvBvqmlsSBV4FpzCl0om2BGV7Sg63U
 Rghl3orHJXlU0f9woQVn45zlH8ZfoEf4YL5EOic1jDsQ1XQpqO58utLD48f95RtEIjsy
 TswQzihur4HDI1/SHcqPx1Il5b2lu1URoYKkp0yj3eumAcPCUCMT4P7+a+rBHsetWucK
 eWxw==
X-Gm-Message-State: AO0yUKWAt+P42CD+goWf6p2NDmPVMCjyc4CtXosmvagly5uFCFJ0Y8oq
 gSKSnDBWv9vt7XUxQwxfJ8O49g==
X-Google-Smtp-Source: AK7set+XzclimABLgzyAaFqjRJkjXg0QKtHa5QnWiLQJdngamdnCBLbkp2QJ3aYaDYZYaiWLArXVCQ==
X-Received: by 2002:a05:600c:25a:b0:3ed:358e:c1c2 with SMTP id
 26-20020a05600c025a00b003ed358ec1c2mr8493947wmj.18.1679902891504; 
 Mon, 27 Mar 2023 00:41:31 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a7bcc94000000b003edd1c44b57sm12680153wma.27.2023.03.27.00.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:41:31 -0700 (PDT)
Message-ID: <702f7101-8e1f-21b3-d958-b9653313efa8@linaro.org>
Date: Mon, 27 Mar 2023 09:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: xinpeng,xpp055c272: document
 port
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
Organization: Linaro Developer Services
In-Reply-To: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
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
>    px30-evb.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/display/panel/xinpeng,xpp055c272.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
