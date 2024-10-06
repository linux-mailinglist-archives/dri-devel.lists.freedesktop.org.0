Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9284991D36
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 10:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5637F10E011;
	Sun,  6 Oct 2024 08:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="CH/21V+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3F310E011
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728203182; x=1728807982; i=markus.elfring@web.de;
 bh=Y4ockITT1j5FDIoYVCOvGM4GjctO3dHrsHjmmK90pJQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CH/21V+mM422lc1yL6cXpqoaCbmLO1H/kUCeEHs/Vu0udU4G2zIDCxQSxUTx30Ks
 HNFaH2np6tV6GT8Q5mVOo+5mdA5CaThEwurmtL4GMQ+iU0qXFiVp5RzbAdj6LobIG
 /7sOnXAqZ4rWg+YkNu2zJUJt2eYxu4anIO+cwqfW2wxfTATiTCiwt/7hzX/wwV5Wz
 ERGfjBKuWqlCAGAKO4jju4LILm5dnqFiAbcvMv8hsr0tQ2qr6RoSpDO/GhvJb5KDS
 XHRiDWqO0hoYfX6NgNtqo1yFTVyIwK/S4g7STNPZDPapoQjCpw8OFfGolO9LWllE3
 G27OlVrbhPme6GbuIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkElP-1thzs44Bdh-00k4K4; Sun, 06
 Oct 2024 10:26:22 +0200
Message-ID: <2e22e3dc-756a-41ae-8c83-1a08cc824046@web.de>
Date: Sun, 6 Oct 2024 10:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240918074841.2221210-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/fsl-dcu: Remove redundant dev_err()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240918074841.2221210-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:D7nWqKs5SibDbS7K1nYXxDU1ZAn8Zg+j/upr6i1SUk8S9vVWz7z
 JpJIJRPMBiyJ4+qPZ10WKMhKcRDc20CM0vNi3lhUdCMHeyB3jQ5EXCWKfLmcLjFNbOETQ+H
 ZUOyzpEUiWolknfwZsvomLOShvG3OKwimaBOhhRpo2645QEP8AV8ftbXHGck20TFTf4Bb/a
 6ytZNNS2d33ojnK0QOhtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w8QLfmpfoQQ=;+zuftbnKE7pB1zvvuNLYB52X+ua
 zAT6ZOt06Uv9SR+tiOVhvz3SoIcg8TY7w3ORJ3WrekxH0uYMSIoi/QxcdZFAv3NvVVlOfPxsr
 8IFxF+lusft/bcv6zeJAK8pIsvkK8RiJ3fPzAD8/08cD8DN2wIjqaDLg+sO1P2KEiemqxmHmX
 4+7pMMsgHqycpXYGO1O5QZdgkN769JjjSjO+ediTg3zHdiKBr0rGjeAyq54nHoJ1y3vCGq3w+
 tDv/AeyyEaJvFogH5EG6ZgGKLuc4PdL27jBFKocgcsxnbGgQDLzFm9xHBFwrpbGxyalRx5fUb
 xrrC3BtkjREXiPxdGVcPeZptrMewWTXJ2p3rVmSfdRcViHHrcOQ4PdnGNDCCYw65YXxb2DrjK
 1Zhnmuiej3pmTP0kaQihIpM5AhKeIJ2nILAox/xql7l1DFf+6kUjmKTG/WLU96coh4SxTXY32
 SFiPCnwXiFwT3D6hVd3gkgySYZMxQ+bS4OLX3NPJ7vAH3IsK33DsBDJseyyEFV+z1+8qrWS/l
 HN8XwXKqeG+j+2NLd0e/uNRbPMwP/IVH3MSZ5ojL4BxS8OYOUeZnJl6jBMPc+mLAGFyUYVUYa
 H018M8ObjdLMs/WCLZsab2el+kw5rHfH8SdetQeOUONVCmCuwgI4H7KAqoEdIXgm5kKUxx0nB
 1etirslcalg90V/Kb17lyqj0/lv9PWrSFIOgTSXyhpcfJJbMkJ7cUZpezjHRka761yTXEtEPg
 ifNYEE7c/PlFWnIkBvhJ+JUU/GwcOcnYZjWHd4NaNHCvCNjMoLQDD+D2G0sMz/SNY8R4Z2SHQ
 gf+E7JkGm7k1rH+MSzGmG69A==
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

> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message in case of a
> failure.

Can such a change description become a bit nicer with an additional
imperative wording?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc1#n94

Regards,
Markus
