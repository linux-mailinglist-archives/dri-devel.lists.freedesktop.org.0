Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC76C18CE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3410E5CB;
	Mon, 20 Mar 2023 15:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4A10E5CB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:27:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o12so48247782edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679326051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WEmn3ezyj6eA5BOfLU0yXf7IoBAmpDvuzLW+5wrOX+g=;
 b=VVvn4d8bEf/oUM2tTGl4fQO5uS2x0It0EfbJYchV5E/p2pdzybPW9q75kxKStMuwND
 nEyNGy7E68tGnlspW3ierXl/cz4IDEit52b3b8b1F9aV4mkCAHiPUPS2MmAUkQtRWlfx
 R9MJ4DrhQxbPHxkLteE9fDhZxePSilbC5UNvTmYK9YQbfo3B+ZEBE5ZF6dUOJRlKzVHZ
 gGKK3ULN3UjXtXzYzH3rXK/Lw3IpeoFds7pkiLpduRc0plIi5916oZyJeZ42Yh6PEJJG
 ZajQs40soEXCJ2UdYkGSCr1KHJK2bHdZNnq+rZWnSJEfHtSsk9vTEpG73LRJ3IRvDKrp
 RY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WEmn3ezyj6eA5BOfLU0yXf7IoBAmpDvuzLW+5wrOX+g=;
 b=PZ+qnPFadzzWLsuyngZOniPmJ7hvoEx4MYk/VS5CPpP6pNgmFOoPvV58aZWbncLQMf
 zkHOvkEXf5MwO6a52dKSShClmBrAsj1oGKazKDr3t++hjK7tUNinb2z5jBRIVgjFUzX0
 uM2YCNn3cF/u/hcmmULcxnsCfUOxefm2SwEJnYxVpcv338Sy5aaZuNmmJ+10TqWACPfK
 +/k8/ags73zrBP2btZJ4LDXVcggeIfSilFrkVsMMm7d0FvLHQ8HeJ5bnl8AD6j5zKn5n
 lJiwPnZxs7+Ajlw5/M3lC3+eceGE2sQBLegU0qf8Z/E9fWJ0K74Qa0TrmthIr1kidQCm
 8tng==
X-Gm-Message-State: AO0yUKX8BWIIhLMVdQUUlMTudPw4syZO4zaPDuAcKnAtTQ5SeW6/EF/q
 JYpiIS1BBtsuH6TN3H3WHnAwcg==
X-Google-Smtp-Source: AK7set8Mv/6NZQmY/cewfFovcPQx3S77XB1TuD1OioHu4HZdpCl+pYhmc38k1airbGaoEgTwpYzVsg==
X-Received: by 2002:a17:906:84d:b0:933:1134:be1e with SMTP id
 f13-20020a170906084d00b009331134be1emr8843315ejd.53.1679326051561; 
 Mon, 20 Mar 2023 08:27:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0?
 ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090648c200b008ea8effe947sm4568161ejt.225.2023.03.20.08.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:27:31 -0700 (PDT)
Message-ID: <f4c9e4cd-200f-9ec4-16e1-38596f74770c@linaro.org>
Date: Mon, 20 Mar 2023 16:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCHv1 2/7] dt-bindings: display: st7789v: add Inanbo
 T28CP45TN89
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
 <20230317232355.1554980-3-sre@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317232355.1554980-3-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2023 00:23, Sebastian Reichel wrote:
> Add compatible value for Inanbo t28cp45tn89 and
> make reset GPIO non mandatory, since it might not
> be connected to the CPU.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml  | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> index d984b59daa4a..4fc86f96b00f 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> @@ -15,7 +15,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: sitronix,st7789v
> +    enum:
> +      - sitronix,st7789v
> +      - inanbo,t28cp45tn89-v17

Keep them ordered by name.

Best regards,
Krzysztof

