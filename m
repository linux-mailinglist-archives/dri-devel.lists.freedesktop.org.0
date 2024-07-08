Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DCB929CCD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CB510E240;
	Mon,  8 Jul 2024 07:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Ush8vxmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F128510E247
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720422588; x=1721027388; i=markus.elfring@web.de;
 bh=dsbLp7BbzLwr5pkBfGcpEadAFzTk5V5tler4D1YulVg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Ush8vxmx2Ke/5BgJB3uZ5I1qLyviKaRqZa4HeybcXqzuozjWkA2UjeXAP1p2FbsH
 0aqtMUsK7CxMbQA67+pWhGexeMMwzXFMcgZmtqT89K2c1HcxTeJzED2jgHQDavt4I
 9ORt2FKQcsPugBjwzKwdHS3VDsfVSUa+rtR/L4cFwrHj2tSxUfkEOoq0o1eA9gpYW
 ByCxpGjVn2a1g8JNNp9hXwx+2ZjS0YulCTI7rykX6qBUiZ9iEiu6sw+CvypnaFND1
 wzMAbwnpBl2/9bDX60ztYsgf4wOPfPTswJzyYMVqCIMWc2zy+3xbEcz99CUejQ07X
 MfYYJmsfKBpl49K2KA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSZHv-1soklB1Vzl-00Ho02; Mon, 08
 Jul 2024 09:09:48 +0200
Message-ID: <5bb059a0-b94c-44cd-b18f-4e2a79a6e8a3@web.de>
Date: Mon, 8 Jul 2024 09:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [09/10] drm/imx: Add i.MX8qxp Display Controller KMS
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240705090932.1880496-10-victor.liu@nxp.com>
 <6595d4fa-2e83-4380-b36e-9c4d910aadea@web.de>
 <3b91320f-730e-46e4-9c96-8c348bf9a2a2@nxp.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <3b91320f-730e-46e4-9c96-8c348bf9a2a2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zZFDSWkyyalWyOFIig9SO2WM02MNHSHIkbmdG+A5Z3yZlFb8Mhq
 cTJN60ko+TR3/WLilCtUAGSkAbjXDbvsuATZnkS/EQMhUwzVdqrjyPsvuvJhThnHUzsGBxt
 +zz5hU8giM+2aLSNTVmu3oXtv4NNGf5aUcZ3zBswNK0TGmPFDvYG6oGDFX8uAH3DYcpW16w
 eXTnx3S2VH81Bj1TzbGgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9D+LPmG7TBo=;do29/MKV/GC3mcS425948u80aBB
 Adfa5xzyA4sNgWisMHP5MApTFgPWNrB5mrqNTOIhyFKftorxfWEsj52jnEQVVFwMxS6T61Z4v
 QBnURRW7R3TjaUeITtSJqriZ7+q94jt3kEgZNrzO5x10uxHULatYJ+AeaPnOXAwYEr0DVxWGC
 ZxYGg1tvx88Ar8El8n/vY2FLccwEHgGxsNSL28t+NFD6vcP1mAgG/1xFYnPwN+qkOY6HWa33x
 ncWv3Uhei5JI57D3egfrs9fNB6wb7bRrg3/1vblMre5iKNMBEmBsam3J+BP/lBX9KxkVvRCw1
 zd5KE7C9rXoveJB/apWNGg8fmYxld9Ex5/nlmOVkpcuur85+a+C+FooY4rHUAf1v8QNTcxbW9
 R3demM9LlgMHqjnzzVj4FpGfYHwtdJl/bbClfVM1/5R8TuAROcOuMgqlA/dkeNNuq9kPu51tS
 qQcBGaRjaQfQGG0tRZisSGbh8mi7Ahm5Lt3VLz7Lux3p8zD3k2mIwg35lCpy/3izr/s6wXZPc
 uDfMDv+Sv7a28CXOlmTCQLqL/BtoOhbCI3fhz63vCeD2N4YnG/z6pwZoeQCtl1TXdJh5s0JLC
 91/43e9NQkYnZy14s6XieeOaIb3R50AAEjj4DkmGK5Q3WT5DTDn/CSQS6OklakOwK0KrIo3b6
 J2PcyH3S0HWU3Z0S0rwIYSVC0yI5N7yU06PHHqGfojhQaUZjZol2HcYMKbU17xA1fuT+JyMYf
 qjCHqeuZBD6vj6ZBydsp+GoLSK8nPJ16vAtaZf+5MUZaMaN+8gaacOZdFScf6acosgcGukPXy
 dVEao9+T59e/SpXZTU2zigg78UJtY4rHsmssTxyiFzZy0=
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

>> Under which circumstances would you become interested to apply a statem=
ent
>> like =E2=80=9Cguard(spinlock_irqsave)(&crtc->dev->event_lock);=E2=80=9D=
?
>
> I just follow the kerneldoc of drm_crtc_send_vblank_event() to
> hold event lock like many other drivers do.

Please take another look at software design possibilities to benefit more
from further applications of scope-based resource management.

Regards,
Markus
