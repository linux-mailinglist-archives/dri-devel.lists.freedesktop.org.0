Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F951929977
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 21:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0580B10E0F7;
	Sun,  7 Jul 2024 19:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="t4zTqFiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7924910E0F7
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2024 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720379778; x=1720984578; i=markus.elfring@web.de;
 bh=HpVhmSFtzON7k/kxUt6F5NBNpe3eHQDTjf7HXZ5TLHc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t4zTqFiPG2YraCTWWNdBbZ0NaWTtRRv9ZLVvakDJRZ7qoyTYAMiHBkU+FltcQKxc
 Sbs29+AsOVGgjsdb6w5IczZBv+hvMOzbLDPnw09q+TG9zmc5QiOLmEju2DNt5hRS2
 8iNJZEcVBjkghY5EjyLjP9g+TRF6EaZ93jhlSJBGKKWaGbmwPLUHlbdRhk16p5hVp
 Tcg3VbsMDC2muY10UOQv1dgh8U8JYaKcP0mAdMzuulYvy1aDmRXv75d8s388yzkZk
 mEEqmdNgtprEPBtMWvRpkbLMHMU/YoJWbfLpE00OWxEj8brl8K27a2bfw0ih8ou3z
 a7xAS0VQaZMFhvcRWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgT9-1rxU5Z2lb9-00ZSii; Sun, 07
 Jul 2024 21:16:18 +0200
Message-ID: <6595d4fa-2e83-4380-b36e-9c4d910aadea@web.de>
Date: Sun, 7 Jul 2024 21:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Subject: Re: [PATCH 09/10] drm/imx: Add i.MX8qxp Display Controller KMS
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705090932.1880496-10-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BSrBkb6rhvczLmYeSgdT//Y/uo96tFPip1dEiQkbIMsjOh8QFM4
 A7IVWC7EcyQ/KZcDPsaWGp71I575en122+B8epvrnB9Nz99RzMbiIq6gEAS+PbGYHHOEn8a
 d08CG2xGWnDe1YhDRig6pFToeA0rXmA7dOp39cCkLC2iD8v4yYGb9YUCzdP3+swnkqFgg5A
 4I1ayNAJ3g5h9GyplrKBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lYPIniv/oRE=;gGAwQ8UWT0BLUt100cN7vxC3wkg
 uFH5ifJkNGYKApKqUX1aMklfKcuW/CQd0/AochTXerwFaBKr6/pYhwbMhYWZBO4mmwubfFyCz
 4reb6xNPLMXPTeEVKpVNYO+lE2gDHYU1a2bwaU8x8QQaFBggNTSgAqAH6j1CgOdUm5nXY5qB4
 r7/23dwn74L+TnlS7r3r+GE52vHCTgIFkNL5qLsva2K2BsN0x1j4Lt7p6Znsn+tcmiKJIlBT9
 kY0wAsVEEpCvJ/BzMnMAbviqfyw16tW2gFtefvaKPyM0rHfoYnV991QkNp9E4cAugZe4iQpy2
 D4FqYg8/nDqNwnU2TrR5FBTyxNrv87VlRHuR/4R97hT7Kjtpw3S5Q7eLdDS3P7DGfRlxer/sJ
 ACl0HBKMlWVAFgiI9Q3Qp12Z5sRjxzA3Od00HiHNCiPWfZMlMgpEBJTMepG0a1y3jwXId3LwD
 dkApKiCRJrhrfzXjvrBfC9of/BZGNr1wCvNzhfMOSKKvuaL5sZX1ZXlagoHCL3StCIcke3vk/
 91ndGo12nB81Sbq1C9URQi/DNUT3qPMy9f/Q+ZnQaGp49m2Q+V7ifFhUQ/Myc3xCer0+ZeLqx
 U+2fvBmH3LC79mYzfCrmREUCQ1ijCKQgLY0+vGYxESWZvd8rBMp4E/2MrUX4efa5PA0Jzj81n
 W1JP5YL1r4G0sa3NUpMxmP6MPVhV9Lx9ZGUawlyMGc1n0EEf20MZaVMOLqNlL60yRRh+snnY6
 3Kx/6/9LOq6UtfojYfGmmxh9+1VjsnlVNaz8iw96gqqkG2vJDX34h26t5GyDBl3nn6wY9Oo0O
 fL7zq8mVZ98ol4jwvhAVJk9sekUdFH6F5Ry0QMLYOs5KI=
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
> registers of the display controller is accessed without command sequence=
r
=E2=80=A6

Wording suggestion:
  The registers of =E2=80=A6                  are =E2=80=A6


=E2=80=A6
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -0,0 +1,578 @@
=E2=80=A6
> +static irqreturn_t
> +dc_crtc_dec_framecomplete_irq_handler(int irq, void *dev_id)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +	if (dc_crtc->event) {
=E2=80=A6
> +	}
> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +
> +	return IRQ_HANDLED;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&crtc->dev->event_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/spinlock.h=
#L574

Regards,
Markus
