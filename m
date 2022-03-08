Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F14D1A32
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428A10E616;
	Tue,  8 Mar 2022 14:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264C210E61E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:17:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k24so19317940wrd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=V8TIHc0j5BWltEXkyzmvOawt/D8EVJ6xLmc2G9cv1xY=;
 b=K4mICRpvPbg4yfk1/E03sYIpk212hPRiJBfYlEqJWOqDQD0I1S4dC+Lb9H2kmvCuO2
 y9PR2ugdSdc9C69y5TRmJ23a+wY5+uJInO+y8614FH1gLjK0WYe8sJ5mQiWgkw4EdVFc
 oasQc05uCh50MLN2NaKDTj7KDaIz8yv5BmB/sLv+YyxYGpSVGgIGgAwk/J8umYukIg/c
 d4UJSdEg2FvqE27PF3Jm4nKcZJY9YMcX+wC8oNanxi9PVyCrcmG3HDGAaZQG0++izngK
 91pvCR3JbVz6fLNzVp49gK7qe2f+jgSn14f2EUtlKR6loZY+ftJhoaWiRIq4bVQurVAJ
 2zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V8TIHc0j5BWltEXkyzmvOawt/D8EVJ6xLmc2G9cv1xY=;
 b=xDzfvOYwc38QDOOF/i52hupFcIbMH9GdOPMjaj17KZFbXrguc2xL2BGIUMo24JT0oz
 2flFhtHntHojEHe552P2Zu3/WzHkgZwxTKZdH625spCuCtgLmLIlaKzebaf4q3m6i0ed
 ouGGv1jVwoqAKh1z86EfMlJRp8JEY0tA63h4FrAOZw+5sDAaYyhF1PkSBvvZ134vbGBV
 gc4XKyBdQo/CGDn9RSmkXHuxSXJDZwkerjmu2x0BB8af5QuB0ydxoZutzem7dDWYHRoS
 xGovG4uVFUM23NLbpjdtEEP/x5gRl2U/fAzLuIfub4UNIpwnqSBWzsyx2fm60IziSah7
 kcKg==
X-Gm-Message-State: AOAM532Hoir4csy4u5ty5Z1XOkKD6rInZaODXe5OCVFz9oZL8O25KR6T
 swXC7MaFBsx+H0o1HEUTjDU=
X-Google-Smtp-Source: ABdhPJxmSrGi9ymzbuPvYZowQx0hfPeyCWJrAyYDfaErh/FqxdYePSY4ti4PFua0HMh9SPgP45MVUA==
X-Received: by 2002:a5d:6251:0:b0:1ea:9412:fc8b with SMTP id
 m17-20020a5d6251000000b001ea9412fc8bmr12140763wrv.657.1646749044470; 
 Tue, 08 Mar 2022 06:17:24 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b001f0620ecb3csm12818160wrt.40.2022.03.08.06.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:17:23 -0800 (PST)
Message-ID: <709dcead-8f00-3bd1-dbfe-0d1f6c228260@gmail.com>
Date: Tue, 8 Mar 2022 15:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220308094911.2680291-1-robert.foss@linaro.org>
 <20220308094911.2680291-3-robert.foss@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220308094911.2680291-3-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/03/2022 10:49, Robert Foss wrote:
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>   
>   			anx7625_in: endpoint {
>   				remote-endpoint = <&dsi_out>;
> -				bus-type = <5>;
> -				data-lanes = <0 1 2 3>;
>   			};
>   		};
>   
