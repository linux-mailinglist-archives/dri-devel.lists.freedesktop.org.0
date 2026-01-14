Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3ED20657
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AEB10E619;
	Wed, 14 Jan 2026 17:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="QQJERt0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1410E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1768410133; x=1769014933; i=markus.elfring@web.de;
 bh=bvtJ5D6PQisAG4ASgzXWMWrWNprZUu/F31yj9dv9ngs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QQJERt0gGQYr2igvLx6+duHgiF3ojJT4Qc9QAcI3kSlOwpOD9KiTH60fmQURsWkr
 swqLRGDhmI876qyTmoiX9mu+o9aKhjPIQb/3YCuzkcbMAyNmf9kO6tCSPsJclVyIb
 Rw7qh2kpY6itXa+Nj9hvjhHh8/+/pdpQHWmc4aoGnSMR+VzVdWoOeyzHXa/e6I2u+
 CuZFr5ejmpIpgZaAC8zVy27APj7XvvWQ/q/KGyuI3nK8JaiQZkBe5aq6ydRJZEE8t
 ycoc2mOINbgHs6XBuuFsoNHUYsn5dtjW3i65BrtWf6Jyo0Pw+MLYgpqXIi744mIsh
 78vS8o5a0Kp212qr4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGSU-1vWkru3c2c-00GWK3; Wed, 14
 Jan 2026 18:02:12 +0100
Message-ID: <fd22f4d2-b67d-4c07-9559-2b23eb558102@web.de>
Date: Wed, 14 Jan 2026 18:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Andrei Aldea <a-aldea@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Humphreys <j-humphreys@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>,
 Oded Gabbay <ogabbay@kernel.org>, Randolph Sapp <rs@ti.com>,
 Rob Herring <robh@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Tero Kristo <kristo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Subject: Re: [PATCH v2 2/5] accel/thames: Add driver for the C7x DSPs in TI
 SoCs
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n7pZjXYgBnoGD7L3ypb03MX8PEI4TDCN7kxLOh/RXb2CHpIWxXe
 CUHGXaqMwjYLsqygtK2Qwk0NWUbGdRO5L1/DvmGuJruwhWdcXTOxPOY+z3il3rCs3jiWi3q
 95h0RkGFkniWd6uYzhA+PRkTAKJcOahN2BEO85JXbVlhFyXrHnEFrtBbP3vP/jUvMFBGc5Q
 60pWRZWVzmGekf7qHBRog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5n5eIst/jLs=;6s0LnvUzCkzv35uoBLjcgvKqRFw
 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
 2djZQwCc=
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
> +++ b/drivers/accel/thames/thames_drv.c
> @@ -0,0 +1,155 @@
=E2=80=A6
> +static int thames_open(struct drm_device *dev, struct drm_file *file)
> +{
=E2=80=A6
> +	if (!try_module_get(THIS_MODULE))
> +		return -EINVAL;
> +
> +	thames_priv =3D kzalloc(sizeof(*thames_priv), GFP_KERNEL);
> +	if (!thames_priv) {
> +		ret =3D -ENOMEM;
> +		goto err_put_mod;
> +	}
=E2=80=A6

I find the identifiers =E2=80=9Cret=E2=80=9D and =E2=80=9Cerr_put_mod=E2=
=80=9D redundant here because the desired
exception handling can be specified in this if branch directly.

Regards,
Markus
