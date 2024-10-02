Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3207998CF4E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCB510E6D0;
	Wed,  2 Oct 2024 08:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="m6VzFZ0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528610E6CD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1727859410; x=1728464210; i=markus.elfring@web.de;
 bh=bS8/Xo3kRqtJJnblPciGzaxgOW4xTAy+DHMyFQruVtM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=m6VzFZ0yBUDS1oCExgnIui3IEtH7mkn99HbiFEK7ylIvyGriIQ5hoIYYurbVgltt
 2PFKL/Nq05L2SgfbSRNsPrYlrlcumaK+c96DbVNSeSDJ5utsPaeol4Nb8FS+doCDC
 uDpqxOL7cJ3k6niYTS+DwaUZdFMESs4wyX2rWGRxnIbGr04EM/Xg3OXuM3bxtEY3u
 Cn7XGa/uIzf7BxgPo3v/zIh9LSGKs4HCXRkOjX70os3MRB+K6snBJTuog1+Sqt4Ar
 wYDHQ4VpgrWNcglp+LZGFa0fYkPccK2ehfbe4LKdNumH/MAl9DEFhLZcRkfsO/mV3
 0zKLwksD0Ya1pG8RUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW6Z-1sYdeB3FsT-00P6Px; Wed, 02
 Oct 2024 10:56:50 +0200
Message-ID: <b671e4d2-e969-4b9a-a7ff-b3b688689ee8@web.de>
Date: Wed, 2 Oct 2024 10:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241002033807.682177-3-lanzano.alex@gmail.com>
Subject: Re: [PATCH v8 2/2] drm/tiny: Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241002033807.682177-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vhLcqF0l3a1X0tEXBQvzRNAEyzfq1m372/WAvOxH0gS0gZSBK2O
 tCsVmgDAgiOZiw5OetbQvcOa/+cbIK+Q+iyCim8FwFNTx4ta//XJhV9D6TF9RGzQhRHGVWV
 u4r5aD03tsvkq2VkZhjTPcdc1Tsqvj9uV0SPbxruvh+Qm1zFt/J0vtOf+W1rzHriomrGGPN
 wpdniAA0lVwzDGSlBDmWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2NpKZLPepfU=;OSLZD+gSJ/tWmd3PAiHH6gnDnQX
 liX5Mc6vboAfHQGI6OOGMV/ZNas2zszXWEcONymMRa35Aq8zw3V5VMfwe09BKWIb/QJ1HT2zo
 5BI/Q/gwr0G3Efzm0QpAvdGpbqim5crQHFDrMVGM4S44p5fjr/EgrVT6ll9XumlQfN3oqMi4R
 nYYj0Z6Ifv4FPwtmK+nuBHcSZ157LypZsj0dLX67lT1sMt327Of+OHtHtR9IuNAo4GWTSEEG4
 TIVfTONS/oQBnnGVWhw8MQoPlMwN5bqLbBDGA1l7ZWr28g23ThYpkJCv0heW4KlzSHQZ1ZNGF
 kIr3xvI68pvaCDXhn7WH9GvC77oBcuIIfwQ7k1lKhyxV8fV/cAqiH9xeHKOu5hbKmP68/paRL
 ZL9xVrg8d7IALPIMM70AKERLl66PiY6fDK3FZIyJjG7hcl5pH/jr5bLQYKSzZBO68wF1onFCK
 opIHE4U41wWA3DBp03wcRiR+MZzCD24I97lMH/V1yK3MG7g6rYllkI0IdCmKzjkFysukJwVPx
 CJGrKjfRzQlpJv+PWqYBM3Y16tnaKU7epCKI3YQFRxphWDRF/YNP0ICc84git46f6Zz2rWOUE
 E9s9/gMqoqZvnIZP81wZClKpW9F6z+TCjr2Wy/zrJmb+NuJ0RX5DNQ+djBrs21kCIN7dwwgK4
 zsi/hRlzHmqqTE75ZC7A1NfxVit5fPh7IAp2p4LSkE9ym7GIwa/1LninDNWYSTgaQPMXzs0E3
 kY5hBEF8Ky7YyJa4OE9+eJgjF4ZSRzjKUy74hPVkVEuWpo8xjmoxyYdfySNstt3dUGhZ8uEEK
 zsf+6I1O8TWUXYceHOdiJcWQ==
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
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -0,0 +1,681 @@
=E2=80=A6
> +static int sharp_memory_maintain_display(struct sharp_memory_device *sm=
d)
> +{
=E2=80=A6
> +	u8 *tx_buffer =3D smd->tx_buffer;
> +
> +	mutex_lock(&smd->tx_mutex);
=E2=80=A6
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
=E2=80=A6

Will development interests grow for the application of a statement
like =E2=80=9Cguard(mutex)(&smd->tx_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc1/source/include/linux/mutex.h#L2=
01

Regards,
Markus
