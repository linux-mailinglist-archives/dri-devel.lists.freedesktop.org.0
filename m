Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6FA6367E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FFA10E1CA;
	Sun, 16 Mar 2025 16:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ajWWmV0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F34F10E1CA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1742143886; x=1742748686; i=wahrenst@gmx.net;
 bh=qAeg33gT5p7GoTwxLQbuHUfPQkHvBqpHq4Nx9UO5nCA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ajWWmV0QH2HagDZOgmfaIOg6yjBGCXeuzA7UYASJs7I63gDYM5tChfqUbHIP/f88
 gOgW9b611WSeub4p4diQlk0Xp76hjEXR58hzwHmDlGf8IwQa7WSYJuUY8L1p3zapi
 NEa8gXa5kZjJ8J74sB3sXoZcBYm9Mz4TILbFuLA/G+TUqTm4knM+/7PnVqJgdzjqT
 1kHarYd06RlK88/BetgPt2AZwXCyPvfNSAXIrdw/UedDAuGnwUEOiqE0ixl499wel
 JItWRENftXwxKRdksZF7ENa6CfnfqCOCcBDA9046G/X5ps7ZvqiVE5Adtpw/T48Hl
 JQ64idm0IBr8OljL8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1tnpbE2FC2-003hVg; Sun, 16
 Mar 2025 17:51:26 +0100
Message-ID: <5dd6e477-989b-4a4a-b136-a1c863dbe2a4@gmx.net>
Date: Sun, 16 Mar 2025 17:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/v3d: Associate a V3D tech revision to all
 supported devices
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
 <20250316-v3d-gpu-reset-fixes-v5-1-9779cdb12f06@igalia.com>
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
In-Reply-To: <20250316-v3d-gpu-reset-fixes-v5-1-9779cdb12f06@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lCo/uFmDrqUE5/hIwvK4DY+FPmHfXvGAtYuFx1WsN//dAlYPAUS
 ZdKY29QZroalv9BIIcRQRCOK1khlW0ntyN7AtLn+08+5bFcQ4RZSKvn7ds3tCJe1i4AEGS8
 mHP/PLWO6/DjRuQTn4wg91dDU7Z1biJ3mV2o9Bjvxw8GsMJeG7j2uaU7/6HqwhLjnCqLFs9
 17jgReWYbGRfrBVwU7asQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TgcWGamewRg=;b1xPZ54hVJHfxtaN1zZyiY1Asn1
 kIn0c8+H7ZkDP4i8xFqFvhqp0XkcCtBbG5+z2mgIaYzXx2liVlBSmW7McEaPp8wgrUC3QqWGe
 MekntNV/tWcqVTKLo2UBZNNkqUQ87v/Ouphz8YUyPwXAceajmZ4AJSn1Ug/baqYusIwSj8FPE
 2ZjObQZak6TqyJEOPI72WaD5j3P/kAJVCv7luy/8Ew9GVFKxwMrvnESgR0FW25HRyTYiexl4h
 UOIevLHVpxQyfbGJNMG6OjXRoy1OfPjywlsfKjqs1Q9k7iXjm0xYN3it1yFEDFTKLODzvrc2M
 1CcxgezKLz8kugfvwC9b8iDLV0dDPcjf+OCcaNY9773Sec0d5mjIyib5PwZ5sqv+VTqj7trKU
 ifa7EsJe5aJqA/zMa8ODP/WR8Huqa5Wn7yHnmYCZDqzz4HI81RzOUXo5BBKt5nXWUCY9KHvg+
 Z34eKlqlcqioQ8uyrDde1ZgIfuAshS+uHjzAlJpzInjaLNbTNm9r/KHJtlKH5MFsG/y/+UZKw
 VoPYbLi1Hzosc28BXmarU5Wv2ykVOJVNl25OPyaqR0nqE/JugAROA9+Rz7Ac+eeM5jN+FPwEU
 gEJD7P2JrUUK7+DVMKf0hZdYkEtrmGIMvGfwrfIT7+tIyPrt12sY4GwK9I58VfZBz61R4ajv4
 BNHqd32NPwSZcFZNUV2flzo8chpLkOJT1531w6rIKgOx2ZRTGcobgyOHewEPRYzailc6wcVxg
 h9NYTWrYVETkc0LM6JYXwpvc9fpDj+wOV1xCWgQTBZ/+YZXTrzn+BQk5RuH2IXAfRwt6vk+D3
 iKSdn7pIpQz6AgxM6/ePfc9jPIgFRhbvcm8ea4ukDWF+J09vQa8jguBY10ua32szCZ/v2JAiD
 LorjEzoeppYG+qjEi+p8IhFoGZqOYNhS/0FWxeIQKw/X51ZGWIUmnao3G+Bl52sy/6bKiwWS/
 fvy+3+fyyhd6A48EIGsVrt1AXNCcC01L13C54468hWVUX6WWFk2XY0ewBmr890BD5ivLKSTo2
 VTG4C0NH0lFogazflpF+nj1Gc8W05CVqa7SFuXuIQjcNNGFDHhASxgij6mJ1PkOw14Uh+DUSD
 UMhfzgECi0VoQlJFvlu9d66OXSf5SDr06Q5mH1IFqn6IVjdyMzkRVOh+70yEf1FS7642VUU/n
 ezEYffq34wHvYjCjcW8RTUEFIajN2KHykIV3dnPcdKleiTxvwkwkT/CMi3+0NzthJTKFND8uD
 F9TDdI/As5wMQ7yqtw+Yf9ora/kggz3aWphfhR/jI/BIqvvRZkUvMKUuhC50CDDYn+qY0dCLb
 OKgFlVcdbM4mk3OPnG8glB39eGPl8qXSC3TRCbRZOehXX/zUqLrWw7HU/5Wp+52ryqTSUcLBR
 AuSFnoMZwCQgzm2vRUrRfbIbv7eNRlN2S+wfTP7C58EL8OdOSENHoJS+NyRZWS+5ekl4vw0SL
 VuYmLHDqsbFF/m/lwnB8uHQUi8DE3UXnqtfaKKYDi7RBM5ipg
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
> The V3D driver currently determines the GPU tech version (33, 41...)
> by reading a register. This approach has worked so far since this
> information wasn=E2=80=99t needed before powering on the GPU.
>
> V3D 7.1 introduces new registers that must be written to power on the
> GPU, requiring us to know the V3D version beforehand. To address this,
> associate each supported SoC with the corresponding VideoCore GPU versio=
n
> as part of the device data.
>
> To prevent possible mistakes, add an assertion to verify that the versio=
n
> specified in the device data matches the one reported by the hardware.
> If there is a mismatch, the kernel will trigger a warning.
>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_debugfs.c | 126 +++++++++++++++++++-----------=
--------
>   drivers/gpu/drm/v3d/v3d_drv.c     |  22 +++++--
>   drivers/gpu/drm/v3d/v3d_drv.h     |  11 +++-
>   drivers/gpu/drm/v3d/v3d_gem.c     |  10 +--
>   drivers/gpu/drm/v3d/v3d_irq.c     |   6 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c |   4 +-
>   drivers/gpu/drm/v3d/v3d_sched.c   |   6 +-
>   7 files changed, 101 insertions(+), 84 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d=
_debugfs.c
> index 76816f2551c10026a775e4331ad7eb2f008cfb0a..7e789e181af0ac138044f194=
a29555c30ab01836 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -21,74 +21,74 @@ struct v3d_reg_def {
>   };
>
>   static const struct v3d_reg_def v3d_hub_reg_defs[] =3D {
> -	REGDEF(33, 42, V3D_HUB_AXICFG),
> -	REGDEF(33, 71, V3D_HUB_UIFCFG),
> -	REGDEF(33, 71, V3D_HUB_IDENT0),
> -	REGDEF(33, 71, V3D_HUB_IDENT1),
> -	REGDEF(33, 71, V3D_HUB_IDENT2),
> -	REGDEF(33, 71, V3D_HUB_IDENT3),
> -	REGDEF(33, 71, V3D_HUB_INT_STS),
> -	REGDEF(33, 71, V3D_HUB_INT_MSK_STS),
> -
> -	REGDEF(33, 71, V3D_MMU_CTL),
> -	REGDEF(33, 71, V3D_MMU_VIO_ADDR),
> -	REGDEF(33, 71, V3D_MMU_VIO_ID),
> -	REGDEF(33, 71, V3D_MMU_DEBUG_INFO),
> -
> -	REGDEF(71, 71, V3D_GMP_STATUS(71)),
> -	REGDEF(71, 71, V3D_GMP_CFG(71)),
> -	REGDEF(71, 71, V3D_GMP_VIO_ADDR(71)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_HUB_AXICFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_UIFCFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT0),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT1),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT2),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT3),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_MSK_STS),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_CTL),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ADDR),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ID),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_DEBUG_INFO),
> +
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_STATUS(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_CFG(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_VIO_ADDR(71)),
>   };
>
>   static const struct v3d_reg_def v3d_gca_reg_defs[] =3D {
> -	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN),
> -	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN_ACK),
> +	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN),
> +	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN_ACK),
>   };
>
>   static const struct v3d_reg_def v3d_core_reg_defs[] =3D {
> -	REGDEF(33, 71, V3D_CTL_IDENT0),
> -	REGDEF(33, 71, V3D_CTL_IDENT1),
> -	REGDEF(33, 71, V3D_CTL_IDENT2),
> -	REGDEF(33, 71, V3D_CTL_MISCCFG),
> -	REGDEF(33, 71, V3D_CTL_INT_STS),
> -	REGDEF(33, 71, V3D_CTL_INT_MSK_STS),
> -	REGDEF(33, 71, V3D_CLE_CT0CS),
> -	REGDEF(33, 71, V3D_CLE_CT0CA),
> -	REGDEF(33, 71, V3D_CLE_CT0EA),
> -	REGDEF(33, 71, V3D_CLE_CT1CS),
> -	REGDEF(33, 71, V3D_CLE_CT1CA),
> -	REGDEF(33, 71, V3D_CLE_CT1EA),
> -
> -	REGDEF(33, 71, V3D_PTB_BPCA),
> -	REGDEF(33, 71, V3D_PTB_BPCS),
> -
> -	REGDEF(33, 42, V3D_GMP_STATUS(33)),
> -	REGDEF(33, 42, V3D_GMP_CFG(33)),
> -	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),
> -
> -	REGDEF(33, 71, V3D_ERR_FDBGO),
> -	REGDEF(33, 71, V3D_ERR_FDBGB),
> -	REGDEF(33, 71, V3D_ERR_FDBGS),
> -	REGDEF(33, 71, V3D_ERR_STAT),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT0),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT1),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT2),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_MISCCFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_MSK_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0EA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1EA),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCS),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_STATUS(33)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_CFG(33)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_VIO_ADDR(33)),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGO),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGB),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_STAT),
>   };
>
>   static const struct v3d_reg_def v3d_csd_reg_defs[] =3D {
> -	REGDEF(41, 71, V3D_CSD_STATUS),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG3(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG4(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG5(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG6(71)),
> -	REGDEF(71, 71, V3D_V7_CSD_CURRENT_CFG7),
> +	REGDEF(V3D_GEN_41, V3D_GEN_71, V3D_CSD_STATUS),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG0(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG1(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG2(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG3(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG4(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG5(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG6(41)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG0(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG1(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG2(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG3(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG4(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG5(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG6(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_V7_CSD_CURRENT_CFG7),
>   };
>
>   static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
> @@ -164,7 +164,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m,=
 void *unused)
>   		   str_yes_no(ident2 & V3D_HUB_IDENT2_WITH_MMU));
>   	seq_printf(m, "TFU:        %s\n",
>   		   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TFU));
> -	if (v3d->ver <=3D 42) {
> +	if (v3d->ver <=3D V3D_GEN_42) {
>   		seq_printf(m, "TSY:        %s\n",
>   			   str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TSY));
>   	}
> @@ -196,11 +196,11 @@ static int v3d_v3d_debugfs_ident(struct seq_file *=
m, void *unused)
>   		seq_printf(m, "  QPUs:         %d\n", nslc * qups);
>   		seq_printf(m, "  Semaphores:   %d\n",
>   			   V3D_GET_FIELD(ident1, V3D_IDENT1_NSEM));
> -		if (v3d->ver <=3D 42) {
> +		if (v3d->ver <=3D V3D_GEN_42) {
>   			seq_printf(m, "  BCG int:      %d\n",
>   				   (ident2 & V3D_IDENT2_BCG_INT) !=3D 0);
>   		}
> -		if (v3d->ver < 40) {
> +		if (v3d->ver < V3D_GEN_41) {
I had expected that such a behavior change was at least mentioned in the
commit log.

Except of this, look good to me.
