Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E4619863
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7CA10E7DD;
	Fri,  4 Nov 2022 13:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871810E7DD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:46:10 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id hh9so2997174qtb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nNOoeyNPbk4klwxXRT+oWl+4JUP2MxkRrYLhtJXAbr8=;
 b=y5cyYq+ECxL6vl+kFY5grLw7dVgw/6YPqpqGm2pcr/O2va4IkgEIltfaC/1BQNhGCc
 5ns0noh2pnxhErcjx3BxpvpCdxpNsfKRsKnR5zz4HUkAmuV5Rg19f710w9L09LFzKec9
 r66nTrlfIBjRASVkCbiMJqPJ6u7fG0njn2PlFBnhxiMdG4Chuskz6flV1oYPCYXtVrGz
 XP/JHucGnGIoZu93Xif8VxKCEWeCBZyIIiFTjUxsozZM4w9xQB2J+43w0eX/vwWNNASp
 bL/7TcRZ00gPunemlpJP/K23L2MhR2cCV0uQ4oKeaDPBZmf2jV1LPZs20seYxmi+HcoW
 6nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNOoeyNPbk4klwxXRT+oWl+4JUP2MxkRrYLhtJXAbr8=;
 b=QloDAZkpxXxkO5JZWKu9jjhJtoP14nuq8JtNitjFSKRA3zHLFijile5G02KzgTJM8c
 IvBfSJMs45RH0vpFyjbImpQHk+eukmhfKDypE8o+z7qpFlr6u2leWADQkZGv0sTjALp/
 IkwKDxCW1hqeu+9kD8Vlo47V+XA3ofRezezdvgCxHHBRGMcA0ivolFFGiwjQgsTFq8xq
 OZZsnSJvOXYUeZcugQJcv17r26+dMQ6SancI+KQ9oD7no6gCcktonWF4OOSBRfTlaYkk
 ZLHt5lWtFzSKWHy/YbvypmOtn6TWBz/r/CUEyBtxXJGyLOezmfbxuwx66M799vAo/I29
 v3CA==
X-Gm-Message-State: ACrzQf03ifWJUyn7IPHZgGwhOYsq3tv/G7vvv1VczLs/Hiw7kKJg8UGy
 bGr0ErVNcEC00Y0tjBPh1ROdMw==
X-Google-Smtp-Source: AMsMyM5z68VJ4ZL4fh0QWV5cz9FsjGkFdAAv2iMVmsPyBZltry4swkjwL6vej368Hj6i1GkOsBsxUA==
X-Received: by 2002:ac8:4a0a:0:b0:3a5:33cf:c1d2 with SMTP id
 x10-20020ac84a0a000000b003a533cfc1d2mr18416625qtq.548.1667569569695; 
 Fri, 04 Nov 2022 06:46:09 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a05620a318b00b006eeca296c00sm2851191qkb.104.2022.11.04.06.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:46:08 -0700 (PDT)
Message-ID: <9a6032c9-7784-3f64-fbaa-c18982d25a2d@linaro.org>
Date: Fri, 4 Nov 2022 09:46:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2 09/10] dts-bindings: phy: Add Cadence HDP-TX HDMI PHY bindings
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <f1a558c1511f310475002ed7a18d4e0406318b63.1667463263.git.Sandor.yu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f1a558c1511f310475002ed7a18d4e0406318b63.1667463263.git.Sandor.yu@nxp.com>
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, p.yadav@ti.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 02:44, Sandor Yu wrote:
> Add bindings for Cadence HDP-TX HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../bindings/phy/phy-cadence-hdptx-hdmi.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-hdptx-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-hdmi.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-hdmi.yaml
> new file mode 100644
> index 000000000000..edd7bf1c8920
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-hdmi.yaml

Same comments apply as for other bindings (also phy)

Best regards,
Krzysztof

