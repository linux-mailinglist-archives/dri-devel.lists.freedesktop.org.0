Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808F6E0991
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9D110EA96;
	Thu, 13 Apr 2023 09:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7AD10EA9E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:02:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso13123503wmo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681376537; x=1683968537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hePEpcTr4MAQXnMqmGvunBUBaXlfTQunP3G36DUCNCs=;
 b=i384PkJRVYCYGBvDYMZG66hIP7oQMpQ+MeQp/fPjllVefZwhzkl3kDUOGFu/vypz8T
 D6tL+cedlOpEaUDl2/IgVaOdz7L8MEpodY9vNHfqICdYqG8q7ChwsFNgjN7fZtv3mDSW
 gJPmjsKow89Ry8rWAXCZGQao+/+nYq7MLq6ne7d2RLTRxdBNxPufaWEPyI38RV8QShp/
 qlKh7Oq95ZAXhbB+RFkVTwXyyKtwMH/zm3QUHdzXfM3TxZAWK0FXb+dVTv1NMJzdjfTa
 +IMnx+ov+3BB/U97k1VQNoHS0DRz6SXfXLtn1HBSl0R/hCTO3meFsJhRVNi3SSLWq6JN
 XYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376537; x=1683968537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hePEpcTr4MAQXnMqmGvunBUBaXlfTQunP3G36DUCNCs=;
 b=MZtu7eNzqr5UwmXSoUF5c2PoqH7NVxy2VBFLH9C8MhFY+IP5qcEXDiExTpagEKDZsM
 LD2zjF6nCc34Nwf/idnC9JM3A7Wmhz1JEPe8OZYxcnFeR5sSNw1aSi3mLrbied5Gi58x
 MazspHE/C1TgqH95rcL8FuCV8/0T8bZ5nd6pdwTGjsquYoqzxsxvrIH1OndrgkH1IsOG
 R9RXlepQFH/UNSpgllB/m9l6zY95fAHanNWVYV05PcLLgsLFtolp2lBS+XcBdi+8Gqp3
 DAoJTgsRHUXfKBBqj88zoDGxaYNYIzAZ1PkyGfu2DoVB2sYpY6bkTPouxzZ6kmIcHTeS
 K//Q==
X-Gm-Message-State: AAQBX9e0xRRRs+eT3f8Nls42evCpVJD0h/KeKnhBIFg8gJROeUgU8agH
 5RvCJc+dvg2PG0K6cTqnJo8=
X-Google-Smtp-Source: AKy350aPIkSil2eNqxWa6pty/dkpEVy0N3KQzirw3H6p8KpaxSec/NGQXd6t3JGm8Dit1W6dKyunfA==
X-Received: by 2002:a7b:cd0b:0:b0:3f0:310c:e3cf with SMTP id
 f11-20020a7bcd0b000000b003f0310ce3cfmr1204986wmj.37.1681376536720; 
 Thu, 13 Apr 2023 02:02:16 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003ef5b011b30sm1267080wmc.8.2023.04.13.02.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:02:15 -0700 (PDT)
Message-ID: <83323c24-304c-b129-88fa-f001c0d9e04d@gmail.com>
Date: Thu, 13 Apr 2023 11:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com,
 shuijing.li@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 4707b60238b0..13fa76299254 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -29,6 +29,7 @@ properties:
>         - mediatek,mt8173-dsi
>         - mediatek,mt8183-dsi
>         - mediatek,mt8186-dsi
> +      - mediatek,mt8188-dsi
>   
>     reg:
>       maxItems: 1
