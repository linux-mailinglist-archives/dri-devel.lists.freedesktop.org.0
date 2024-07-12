Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC3392F87F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4CB10E1F8;
	Fri, 12 Jul 2024 09:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="dbR6Ekqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9B10E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720778130; x=1721382930; i=markus.elfring@web.de;
 bh=qA8dZxx5ZAywJE0Ce/DvrSCgak1qKg/qBSRGPZMW8gA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dbR6EkqjUFukvLWHaRUTvXDZ9Q3eh2KY+bnr9u0PzwHn8JOXU+2s/bLlAU0nLVe9
 QvAFPPlYMy/RuXwut44zlkSZ0xzBv5FeQ/LEAsLp2MhVjkOsM2IOGPAC7cAVr9dAK
 UoCMq5LMERNdaDq6vsLOJ97/1PV8FMtinIrSYNW+2IrFu7yKcIMjjUNLctBZ+Oq+1
 s9u4qmipSYoPLMlLpF1TZhPZG3T0NK7OU50HjWl4KEh9GysgmBCExnchvh92ppN2y
 y97jzSqZeZPemiVieJRZ6Idvuxf9PCEe40iY16M5rK6ST4TBgeoPke+jOfwk2+QwO
 INUGAEyvltYlVPOvQQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MiuSe-1rpYG625Ei-00aqKn; Fri, 12
 Jul 2024 11:55:30 +0200
Message-ID: <bb82eb1b-e284-45c4-b80f-7bdb65e0449d@web.de>
Date: Fri, 12 Jul 2024 11:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liu Ying <victor.liu@nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 kernel@pengutronix.de
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
References: <20240712093243.2108456-10-victor.liu@nxp.com>
Subject: Re: [PATCH v2 09/16] drm/imx: Add i.MX8qxp Display Controller KMS
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240712093243.2108456-10-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x9ykM0EokxdM3FPtkxqlt9BWgSTGc7SN4QMfykDtXMfy4tE/R4V
 VIutO0wDF9pNtFqDiB2Sw/ippBTdON8SV/JXiqxA1GNrH0RlaXK9gPs+v22H8lJRlDFrZYb
 eg/WVdGIfHbFpD7NNh8SnaBSI5Qrdv4LCw8HoDuVRO4NyLTSmzQVpEiuQ4TQ84UTqmKKBCL
 AksP3YqG6upl26uMsoG4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cmvPTZFViww=;IPRzr2aMIAI2Eacf50wbgoYbdk5
 TOdtCR+2fvYykEtrSZrVUcSam1mZVyNtKhdnF4hk7dWgpdkejJ2bs+InkkcWWXphjw7vN7DZN
 Aotcw8N015YTbepLD7+93uloalx9djgetGsf1ELc2534uxqcOtZeGcRJt5UfmZNWBbXbnAyka
 geAXRUXxnHONW0Kic+v1ohsrzvxZFcqvTgXD0vXrsxE4hSme/yzlfAXSOaIVS/elAMIFvGC6A
 QzO0IKkcQrXxur/LyOfiv5zmDZJ6t2tYH9W1o7eE8TExFzFVL7g+NzoDOGkFhtG2LFGogPd4U
 IZ9r4lU84oKckhcj+FPv3ezk2tYrXTo4om2BxH6cqdB/LeExUZ6Q1qiDX3b3j38pW4fo+kJlj
 GJtyxvFEwOjFcXOaBsWsFSnUF/Dde4bKFsq5qPjrOzINVBc2xtbdKASuWr4MCxWDFr/DGggof
 +gUR701hj3xIQB8W4YYecYyynry81nAMDZ93ePD6h08My9PEAewu/jSgZumsa1NthBYX0aKEe
 f1A2WDyeclq67htJ4zOPjtq6SL5vzQT8S6NTIQjSUkEVEVEDAeAMyGzfM97lUxgK9op2adFJp
 yBYYzn033Rxe82PAImS+59rZ1HQCSfkqZVIpvaCKC3gbIoVyk0sASyUB0deNpejYtZSmvO+S8
 aaWSd8ckIIwyqtJ0o2jCDyqdRUk17b//UpHyGdVM5NTyE9Od2sJkCO7EPcPg1ZHs9i/dr9kn1
 gkhTdVRhOUtL7HSlfgLYblcS5DrolohfLnnEDDke/+St7e2CBw5M6yc+0CttQ7AvQSlHqdwwk
 CvIIwV8Mh+WKgvGJ80U/In0g==
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

=E2=80=A6
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -0,0 +1,578 @@
=E2=80=A6
> +static void dc_crtc_queue_state_event(struct drm_crtc_state *crtc_state=
)
> +{tglx@linutronix.de
=E2=80=A6
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc_state->event) {
=E2=80=A6
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irq)(&crtc->dev->event_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/spinlock.h=
#L567

Regards,
Markus
