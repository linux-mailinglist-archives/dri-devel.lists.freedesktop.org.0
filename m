Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D24A679F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D098110E1E9;
	Tue, 18 Mar 2025 16:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="IEwOpapn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B509B10E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1742316241; x=1742921041; i=wahrenst@gmx.net;
 bh=GEFJR0mEztQD/2wn8hD/FGYZSNaNTFVn1wzkOHSQ5h8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=IEwOpapnB1t0sFAoldz3B2A1Wrni52A1tgeNsV/FFivme0f5TL6a9qNFjKrxXc7P
 JgTRYtihzNbX1ULy78qe6vsvYeAPGNPEYUMb70wvaYVOm1XggwOg4yQbp0xoBLY/J
 UTE0yMpXjO3m3966hyO+f9g1nW3h1Ltfvo8oD5P5llcdTeh7GvI029wz65YfsosNm
 C/fv6kN282R79y0yAfdz5CYiuHwPQPa31u+IMm95JuxN14aTX8glUXlr96x0k7eZX
 T6kpNsNGzUfrXQ9HL5wJash+fRRP1rA+lgrZmqGVRf78gvY7+r8YfCelio5WZAc3R
 YBmmN5Mqm/7GWBa+XQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGW7-1tXJ4024UP-00JFbK; Tue, 18
 Mar 2025 17:44:01 +0100
Message-ID: <00c4d88a-c116-44d5-b6ae-2de3b3299189@gmx.net>
Date: Tue, 18 Mar 2025 17:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm/v3d: Associate a V3D tech revision to all
 supported devices
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-1-f3ee7717ed17@igalia.com>
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
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-1-f3ee7717ed17@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v93hKqdggLdSoXP1bcWRmY45TlcvScd4MNE8uD4Y4vV1W45br0j
 NB/zJwqrjVvC/xpQvCkWTnEMk3OuNcBPBzdJedTCf66J+hunhJ6sgWEqKupDQ4KzVxHXzx5
 W/UbBDNBaD8Lb8YsZuAjdDWQHmLuBcaAliwqe06DnB0KUBoq6NwprKdwBR9ksqL0Z25Hmyh
 bk442Vc47qegrLlNwz37w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qkj0JrynCAM=;Xb+nTwOVOLQ8lLQkvHaQ+qPbv5R
 G04nBNJIJxN7f5UQTUQNjA9nO4VVrF/bGx0zh/6OYau5cjFyex9N645cp0NI20OikXDPvceZ/
 jgch2Igrc2spkTDMlBmn67GpGkpR/cc2QR2vOo2tgCZ5VitIrdfT/LmCp7IQzvmeTPskPchq/
 YlDMXXxgfWj5Z85R9JFjT6qwV9sFhRRDygFXTrbqURVBYXzpu9JjyBJXFrA1b7bCpYfCfZQ3u
 Y+GYOnWi+vNc3/tLcuVS4D0UKuShzyqE+NYRqkqnf2oWBPU8DYBq56Q1Oce93Zu42Gp2Sq1KY
 UzKQVzDpZGbrmEcouILP82BzJj8SgBbnpYdz5hRwqc7jI7Mmys1UHF0q1YkOTgzJo5wl9/UfI
 bKdXNkfdzZwSoHLFm2cp9/hq2yAUblFweJSuWCJ+FAYGkdxD8cHttOgeoffirJOQQABPnKF98
 Oonl/xnHVUEbmdNevLPxKuPF5S0Nq0H48hs75Kw+qgqgtRfowH7+nzafScQWG1H785LrvK9hu
 UE/foI5BHDKmSuDG2rLSOQKCDjsdnqN+NI7sStAHF8WHxu4XPQS3kuBrHojuflBeQd6oGnAH6
 ZCj7qsc4mJmmss3F1bn/q7iplIIeZEhdmaCCNeJv/X0jWuty9INdjMCUf6M1q4BuPFU/RYQww
 3JB1DoMXbZZ75gS5MEsnb1IUpQuhirBHVPSshGK4v4zOGpWC2wW8rMKVXTJ7Gr9LEkKydkd6q
 YDrm9d5WYR3O7+G2K3Fy21PqSsWlz8yCfHU73CdNpZwsJlqK6hxnOHEJ2CCJ6dhOQt5WpnU96
 01yG0alzEsgz+2jAOOlU0kB9+RNawbsxno50NCJ8id/bhPU+EI2l2fHSy1KyoGjNdAU07NFYq
 I858m99Q2jnCMcQ6/Yi3GTS4pXREpW9+bMp4CLX274uZVYEaX7GNJqs/R4MXwJfwQ/tzcMEpo
 1pCLYvKPZx47PtQBnggx9RiPHIggv7Yb2D7LfC7pHXdu7yPdpXTjSIusGR0+Ohq/sGF64+8FW
 NH2tH3ucPCAj1MuH1V3CcyT+lkP7enPR4dprMDfhNsn4dcuEdvXjZ/0UBqJzEKo+jTWIRHTZL
 jCykLE/Z2hipVhdFbTcI9IJyWT67no8wc/nkrYVBk6jyXGTZXFDfDjSZe8yVU/R8qDQUW3o88
 59zQtABgYvyVF5yIcsYount908kBRC2AUw7Ll+ozGEc7/vIWCijczEA1+0KX2HhlSgrxHtk6p
 hEljweovyovMp7gVvLaQDUjRpPBMhRKW6ToX5q7lFYRKsdNrdVN2ImiPicC/iPFnyRRVsX1yM
 +LpKQjfRYImNE57Th4hTQcY706WUex5f0WSrdSKG7p3/+/PfDMp49JcFpLiBhO9yQZy6d4uIz
 1iH9vo9Zpex/fQojdjwIM0C/+Qs8yC/it0ZdjWZE4Y358qTsLS3bDNBmufQRHzN8nGyxxZL/l
 TUgLPP4fQQPI8tApvdZ2v0rs++xI=
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


Am 18.03.25 um 02:01 schrieb Ma=C3=ADra Canal:
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
> With the goal of maintaining consistency around the driver, use `enum
> v3d_gen` to assign values to `v3d->ver` and for comparisons with other
> V3D generations. Note that all mentions of unsupported or non-existing V=
3D
> generations (such as V3D 4.0) were removed by this commit and replaced
> with supported generations without functional changes.
>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
