Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0232A63694
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 18:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B613B10E1CF;
	Sun, 16 Mar 2025 17:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="uPa3TrZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2B010E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1742144415; x=1742749215; i=wahrenst@gmx.net;
 bh=Yhk3pke8SopWAqXAXxTbiyqZ9AZFCJbch6mayWxHbQE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uPa3TrZWKzNWKY7ui/b1pSw8pXUYaXo+bYDNZ9EIeVbmRrD01vD5IlOiyByTmoiO
 HmQnxGuoiuURq887GNSGOPZiXlq+2t5jKbkCuA8mf/15FBgYWjjgVRQWMLzRLlWva
 yA1Usj2jltjypRd0lrxLeia3E/q5Gkik/9s/Fikln7KRoVa9WPGsvtaBhF4CrUmD2
 VlzDDeotNqxjFNpssVLuCs086XxsQqD+RZPbNMQhX8luAX4flYmcV4W10tPwCA59a
 PHeIz4p3UDvqc+dbH+iFGfmD4L8Ll7b061Bb80Df5wiuW888OqSW5iyz21UIs/aYv
 kwuOYoFtQXbb+iDwNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1sybt80tnN-00uJL0; Sun, 16
 Mar 2025 18:00:15 +0100
Message-ID: <493490e8-1ea0-4e10-8fd7-e8f6b10607da@gmx.net>
Date: Sun, 16 Mar 2025 18:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
 <20250316-v3d-gpu-reset-fixes-v5-3-9779cdb12f06@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250316-v3d-gpu-reset-fixes-v5-3-9779cdb12f06@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lFOB0ncZFagvFOKWhTD6YhlfvUaIIs/VcOPeqRK0MjSD7fWyTzw
 CIsXcOkmHeWGMVvne00z48ZGTA3WIh3AxIAF4bvvqK7hSLsL2qR82mQO+F5wfSQP3sdU5jE
 uwZqmYPbM6VofNoJz8nBJDKWDlj2EEgyjP0eXTE6ioN+u6u58dYUzo4zxnabi24hfUDYiQp
 PNH3ouN8hZlCJjWfAJI0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TyJgRGz42kE=;rJwc3rIHTgKAp46FZcApxyuzHGK
 I40hnSFUXEKGYsOg1mgvsAWJ6U5cMMW9VzrUFHbr3qC124fuyfg2g/+bHJUmj9o8tG3mNCkg6
 HqZZDfJqCsqHu0u4JC9hpB2q6AtBlMbNCzHUzDXyu0Yrw5UuTnWj/u/reDl9UP+czmYqhxWVz
 DO6jzioDPjG9t+3eMWZETzwpIJ6ixaJmNtT19gDoecAg3T/tPdaxNsPL8hg4h6DnU70vimLCt
 9JzGcuDmSOcrhrdvQ0P4p2y4FWSkF9p2f2Vdj5hkUsmOjGDPW9kz1vyrU2GMqNaNKubud1/5s
 CTf3X83FkC6+qClCWEifhNVKA/47IwaW567Wz2qPg+oPrxAQYq38Lr5BKm/ZtZPtbHk6MLhWQ
 dHOlX/5OBaNrO9vqNG/fmvqrhmS8tn8OfQ0EFLT4vxQm6WWAgEt/Y6g8km7u0EPUavPRYh7Bz
 MvKoQJjGrJ3h8VZzhl7w50aEwaqpTK77hiiFm7twg4/ipNzpGbwt6oDXLxTuI82BDPjeOC6kE
 ECaJ/cfSNgTKJh5wvP6JgO7H9aKJYPb++BMYlZ2E3CBnZ+WjO94UHui08a/AZ+Z+FbBHufn4C
 YVobMRg/LMzgZShlY69Z5Vs91QbWcYTY+XMP0yJmm99xdae37XUX5ASNx2tkg1+WU7OREVDp/
 vLnKKp62XrXE1OlTmvcPl9vwHuACoBvl1+k8q7rlbgnUceHQ2oBGBOjEJPaMk6czN476ljesq
 Zea+CnzWYtEvnF/NzpCiCJI73d/fR2aP3QfQNdZi15Iq28HZDguZb1ERNlhYlA4Jt+Mjvj5ib
 jh1d1aKAVjL3JziRiBqxNxN7fMYbcsvOX7bbE26UIp2i34AHqZD+qaPD8oubLhoYvlei9c0B9
 se0gk/PrsgaunMymkTDimoej+1aw/nRcNwZVTxQmaESF5GnW1fD9mSSWEgilh+2WhQLjqUdUO
 MLFyGSE9VFz4u5+Sv0XARWQ4bsi8N6aSI9Ow3ilKuoY/vp4EFFuXLwI7Q685EJEzOukJ7t5V4
 q8jX6yajZjmegF8OTdrmpPJnD9tJ+q1FHO0k3qQk3OfsLjPkh7ZPwJBJ067276H4eexQsBWJR
 TMRD6Cpv9U/mFOLD2QrAazOCqfi+dlSUsJEZuaN3KwVKaCZCAPgxHWXQ6Nab9pIvQZrk2SFx6
 qy6NYtuqq6EC3O7olvxkxdQSjPDA1apucZsBpCUJpMQK8mYcqig8v4xwayrpv4nHEb2mGyoJs
 LKOzR8oophdJ/nUR0JwpGeke86gdTXpoCuhFnS4v86qaUUQEPDKSLUKyL8Gt4ax9hNX0Oxzdo
 zgsn7o1FebuHKgdNVpgp/3d2icD2W4+NMWYv4bIB1vA52P3wcQqRyHgF2ayLqAP6GWthjnPxR
 P82ed1VUw1KwpMsQbTKsGqM3UAURSQ0QBZtB6w7UnBgR7bEqGrTLjG+Hi4Cbd3tdtGCo/Sof+
 n8Fvpu1IKicbr4ClO6EySGRIvQSE=
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

Hi Ma=C3=ADra,

Am 16.03.25 um 15:15 schrieb Ma=C3=ADra Canal:
> V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
> V3D 7.1 core, add a new register item to its compatible. Similar to the
> GCA, which is specific for V3D 3.3, SMS should only be added for V3D 7.1
> variants (such as brcm,2712-v3d).
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/D=
ocumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index c736b3b00ed2c259c263615bdc2bc1899c8961f8..766a310ab653855d7cc9a80f=
18c2083218fe307e 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -77,10 +77,12 @@ allOf:
>             items:
>               - description: hub register
>               - description: core0 register
> +            - description: SMS register
maybe we can use this opportunity to explain what the acronym SMS means
in this context?

Thanks
>           reg-names:
>             items:
>               - const: hub
>               - const: core0
> +            - const: sms
>     - if:
>         properties:
>           compatible:
>

