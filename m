Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF705A1C7E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 00:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5C10E46D;
	Thu, 25 Aug 2022 22:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Thu, 25 Aug 2022 22:38:32 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C94C10E46D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661467112; x=1693003112;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pXWRUr7yy74YSO6PolHsHDXM3uM60SKPSfU0sqhXVlw=;
 b=TYVDESp/LWTmdDuBqWEM+FjUfPKGZW++MdrQ3k5fc+fRJsjRdxvY92lW
 TWsAfvWB+XpxBGYzbu2JmWx20zoMN/ZE7i32RmelAo77x+aGMznNeSBz+
 /1jEz76eIYMd7B/w+nLkCwtJkOR8lIL/64Gn4Uae1gIM8AjJIfsRgfk8j
 UR12CyaVMwHoTlkijngPaD+RdRDfiTV9iNsJ/ec1IZp8XyMtUFgTEkh9I
 rwgFZtAW3qIfYxYe/WfNbLDsj88R7NyFfmRD5odOOBDCdpInzxZzIa5FF
 kaZfslAzpZ5c7vmq93fbgIawCH3BsrYfdVmyRtDIjWIkWwqnsFSy59Tfz g==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654531200"; d="scan'208";a="321780544"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Aug 2022 06:31:22 +0800
IronPort-SDR: yd+OIZmSf+7W6LLO49dihzWuOORPvuI8e1EplBSqy9iXsh02f87nTX128mUz/nyB3Td6VBsU4K
 R8Llurls97FDRnwv5gh0ugBxVYxmIeDKWCnSPz9W7idA8i+BMzjoTHZSBa+ieuSm0t6lymGsVh
 Nbo+NU1Wg8IDtBfRZkk7b7oKteOYSI99KQRhFr8c6vFIFp39CaxJ4KEAwm5K0Vs1zCS7H/j3YL
 TrIdhaMlR8YQmO83J3lsMzxrnOlNbtH3q0jFQWCbsptxfp7XpaodAAabwbkZ7SyYjzyX4JE7yb
 ZDkz0iLX+g/wDWsLqGc87/WC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Aug 2022 14:51:58 -0700
IronPort-SDR: pC4Bs/Zzp8AGwdvTVRNT7ea+PFDj7Ium25cQ8mOrf4RE6/HqlzlGROpvZ2nkYI//hMa5N4P10l
 Zv6V5Ynzr8Zk8TgBHNMY0FmFo6gtwfbtRkxkk7JA1DGSOk4NTg6wmnwnTT1TrkVhrsCTA3Na1B
 KzO7k+/pZBE6LGlAPUyom1pdDo8FcuI+j1K2Lx8JOlMIAG5IBKKYWW64vf8dLt3Yxpk5tpyz51
 MsW8wuPv7jKBeHZJeCQFeB3cXofQQfeAJQ6mdVjVdW1hGbjACWJe07wGM61/Br4oVDuD7sirPY
 TUY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Aug 2022 15:31:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MDHkK2M6Lz1Rws4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:31:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1661466680; x=1664058681; bh=pXWRUr7yy74YSO6PolHsHDXM3uM60SKPSfU
 0sqhXVlw=; b=a8whp66ACRrklw6ADvp7cL99Zh6tbdcTsus1XTWRJx1aNBRUnzU
 79wpHkqB4aCfkJ2QYSrIBiZKDaAZJiIJqmWQBFGH49efNg/Z+d2IwiAJNh9daBOQ
 3OgqD6XE5LeMN4usjJnhhhShvkaIGmAxd78j6SXzLJm9YG0VqTvf6by0P8EyZX7+
 P3zVnBiP2ajxTAxULa2hPJzwckV8794zYVyoynMwtl9VOU8//kJFawZ+gTFnmR+q
 ojL7lEdll7fquZxt6CgfCF/1fwhGyD7gTzUb8RSUU+lGJwOnj8ZaaS74gnb2buvI
 xSJoFmAA1/riuh0hOIgnDxp0cS22y93OZiQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id VtbCnV4yKE_b for <dri-devel@lists.freedesktop.org>;
 Thu, 25 Aug 2022 15:31:20 -0700 (PDT)
Received: from [10.225.163.46] (unknown [10.225.163.46])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MDHk850sGz1RtVk;
 Thu, 25 Aug 2022 15:31:12 -0700 (PDT)
Message-ID: <bb0728d1-20fd-8b6d-5d42-a0c76b6d3e4b@opensource.wdc.com>
Date: Fri, 26 Aug 2022 07:31:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/5] dt-bindings: ata: drop minItems equal to maxItems
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Marek Vasut <marex@denx.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/25/22 20:33, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml       | 1 -
>  .../devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml     | 2 --
>  Documentation/devicetree/bindings/ata/sata_highbank.yaml        | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> index 235a93ac86b0..3766cc80cb17 100644
> --- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> +++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> @@ -30,7 +30,6 @@ properties:
>            - const: brcm,bcm-nsp-ahci
>  
>    reg:
> -    minItems: 2
>      maxItems: 2
>  
>    reg-names:
> diff --git a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> index 21a90975593b..529093666508 100644
> --- a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> +++ b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> @@ -22,7 +22,6 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    minItems: 2
>      maxItems: 2
>      description: phandles to the reset lines for both SATA bridges
>  
> @@ -32,7 +31,6 @@ properties:
>        - const: sata1
>  
>    clocks:
> -    minItems: 2
>      maxItems: 2
>      description: phandles to the compulsory peripheral clocks
>  
> diff --git a/Documentation/devicetree/bindings/ata/sata_highbank.yaml b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> index 49679b58041c..f23f26a8f21c 100644
> --- a/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> +++ b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> @@ -52,7 +52,6 @@ properties:
>      minItems: 1
>      maxItems: 8
>      items:
> -      minItems: 2
>        maxItems: 2
>  
>    calxeda,tx-atten:


-- 
Damien Le Moal
Western Digital Research
