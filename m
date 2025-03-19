Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C2A68AB1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 12:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68D010E073;
	Wed, 19 Mar 2025 11:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gB6sIZ8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2847C10E073
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1742382461; x=1742987261; i=wahrenst@gmx.net;
 bh=DRPgxLsN3BwNnKI2+/LAbfjX6Py8734M+P/lTgZt4i4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gB6sIZ8WqJJGtYYRWOtcdV1CxyPT6QgUR+1WLlcDMFeZkNNHm+tiV6CZsgbJGUcl
 g9KwPniZwcp5aVvkHMIs+XShiw/cyMUJloIMN+D48LewZwYXbglw4My7S9sU2Unye
 RwPboyfJcr+578k6SbnfpZUIRfK9GvYFJweGDRcO81+qptJeJKjGQn5KCYR/v7FUl
 c1Dz4NEtUaQYmWf9CqCFecWXeGduURR66qAymEsFl0DLzn5obvLDEYXGkuKeFBIp8
 PaiTPy/q0RHrDvpuVVxfvKr5IpKrxdBf9aNXxc5IGqv4ZW6O7gVtYB8MI9A9BR46s
 royQ48zKAnI04Ur+hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1syF073sCt-014i6p; Wed, 19
 Mar 2025 12:07:41 +0100
Message-ID: <1e0442e3-923c-453e-9d99-1aebc481c17e@gmx.net>
Date: Wed, 19 Mar 2025 12:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-3-f3ee7717ed17@igalia.com>
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
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-3-f3ee7717ed17@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRJ1wjbn8dyUxPJ4q/Z757kcS83F+heYC9JwuAlv+E6c1jEEerV
 tMFNkU/eqwYXdW8B6lZBBGxKolYNvUVdGSCJ3UAJ9y3FI29LIyRAVvwdq1y129SRZ3E7q9s
 8O0pIrRcawc+rrlVagG9RT1un0Paqt2nBbJeKA/MvbUZbE6h7TPUi6MPFz9Ck14yS5NpwBy
 f6icR2toTyzdOU7zZlkxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TYqbePkDekc=;U3Mpr5sHJC/SKJl5H86mEGTUQna
 iQdLI7tiGFuGs7K8M9lCdMtfWzTfXXC9Ybv5AubwFa22Ouhn5mv6Psd8ppTp5vXOc7CgyKqby
 aE1tg0OXdcGI9vJM5HDdZhLoaQhV4qO5Lz2TgTXVwRbgnAjvA/gKabsLCyj7eq7imADiJL7B6
 fFcCX+4qXM8omnJRMiv73m5QguT4bCvK5/uDoyQ0J3FjUTCROYbJIwQerfse13Twr19Xf+fD9
 Y7QGjgD/Ddb9/nVVDtiRCtZl7M6ZSN+hsOxVbpqykmySGG+qQv80J48oUyFdqbPbFwIx5Ar/h
 lUOp55CMCBuplzdxCkq4254E/zfTXQ72Jyc/PNfp2OeA16Ux4ntpKxmEhBmojQ0c5OYHJWmOo
 x7vFei4YrxBO8Ge5HtoJhAQLCAgZJ+34M0bzw1Gz3gmD1cWydf3dRR90ArVKmlpkjL0UjVUJc
 0SsiXZa+EcQwADkDJMYh17z3hJ/znUwmK/joSCmrJhWAGqM9hSJBaOs01j4vw6Z1j6KGSBDFm
 ismxdNBSr8WuYp7jq+LDBb+4pnAZlGcFDOJIQOLakYiWYLdUElEB8ChYVP/xB+U+M8a+XJk9F
 FH9wIPq4fX+g2yFnY7M6I3O9KJO1Sq1wK4VN/ULqKrE99BL/+ojIjKGMnF+YMjWZUhSZOE0+2
 QUIBNyy8IZNbPt6prQZdo0aOTWNIairLv0M3BJq2LsAiBCLPT+Cf4NGEs8LTsojFxxuaAxPGZ
 8wlz8MqNqA9PHNUFRWVcjEDrQaxREey9R8Yq6LJik/wxLw+lrmCKPp8TUHtc80DGqquSCk7wK
 X5KdPjLdxjEmfYxoW8lriyyaLKXMIArs8p+xxDThP7sQW1M9WBlGiChMZU/KSe3ZmtgvfvXVK
 PKrfRm/vrWEngRIFpDQoFqoUwCe6mrqgoZHm8nwmqO+HCgTi+cxqHi6+dQQzRZ0islv8K6Yr1
 8JIS/J0NeBD2nxhQfHwcpk2NULmgwMTvNBqlSkW2vbMd5WCCD8mgT51cj1SSZIzXCkjzy30Fw
 7aQkDSmES2Ivcq2XRneh5FJCAKgFjr890EGJ/LXUhFvrVXUiwfA4Zg3OxmerpmbsED62oPMFb
 rL7HK/bJqQksuCEXefSnrlFIKsbK1GUvJDoeoGZrXDykXq4nfcYkBBaq5dwuWsOaQcz0kV/TW
 O3LC8TdLuOAn4C7ipKrj5sziueMOdqMGonAWLgAVT4ac6LABRcdnVU/aQ5WyFu63gzh1290yD
 9Mqh9CMvpk+2phDYdfNOyZ1xHxanW9hYQpkyPoyoyZ4ztAj7bvnZ5/bG6jOrZxPPhdnMGHBLi
 DaSqCeqnjnUcf9syzQs/fLUx0iaqdSBb7/MzlUsec2SJO7VRI7KdJz50LUnC5hEvpwWgM7XgX
 bNFqI6nOYpLEMAJK9KfbhLTHHM9sUH2+B5pPvKEl2Tmsze32UxBMeeKmy8wUDLtzngTCFgRB0
 XrcYqz3wG/xNGmhxe5S5b/jBsoN4=
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

Am 18.03.25 um 02:01 schrieb Ma=C3=ADra Canal:
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
> index 6a1a09031983eda4691a939329ed159b32f77669..dd2cc63c9a51da11691e4e81=
b225b74fbe86d709 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -77,10 +77,12 @@ allOf:
>             items:
>               - description: hub register
>               - description: core0 register
> +            - description: SMS state manager register
sorry, i still don't get what SMS means. What does the second S stand for?

Regards
>           reg-names:
>             items:
>               - const: hub
>               - const: core0
> +            - const: sms
>     - if:
>         properties:
>           compatible:
>

