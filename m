Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A377DD589
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3191910E59F;
	Tue, 31 Oct 2023 17:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEDF10E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2E3veqHg9OrVeSCRKWiZ1+wEoUp/PDuBKg96qAOXiQ=; b=my5RucsTfxH7smQjbgy0UExDk0
 KN+aCl13wjSI9aT0Tie5qmQfcbIO2vf5BOXKw1/2yzVvXgrKxgoaFm8YFmSc7q9eufSyoIH+kLtRP
 5LfjmHw1GEDlyvePW2/AcDGYMevNEvpibcrNlThdGMB1WL8lMvmakxqx1iMNnNMAIls/uj8iTcLsq
 OWMmS+l3iR2knBy1tLc4PJUvaMvoHQzRIKqjBJF5CeCRkUVfyu9qjaXARnt5jbAaVG01lq3sg0gOr
 N0Z4s8ZiWLmKoPt9NbW+v3ygX3qwn/ylyRPQGH5i7cuaUwjn9JoM3QZo+QZrpcpsces7BiZ5FMlER
 BeJrcKHQ==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.20.12.146])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qxsvv-00FU3i-Et; Tue, 31 Oct 2023 18:53:43 +0100
Message-ID: <d3ed80e5-b3a1-e9ba-48eb-7c6fc58ef3f9@igalia.com>
Date: Tue, 31 Oct 2023 14:53:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
References: <20231031073859.25298-1-itoral@igalia.com>
 <20231031073859.25298-4-itoral@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20231031073859.25298-4-itoral@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I would like to ask the device tree maintainers if you are willing
to take this through your tree or should I push the entire series
through drm-misc/drm-misc-next.

Best Regards,
- Maíra

On 10/31/23 04:38, Iago Toral Quiroga wrote:
> BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
> 
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> ---
>   Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index dae55b8a267b..dc078ceeca9a 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -17,6 +17,7 @@ properties:
>     compatible:
>       enum:
>         - brcm,2711-v3d
> +      - brcm,2712-v3d
>         - brcm,7268-v3d
>         - brcm,7278-v3d
>   
