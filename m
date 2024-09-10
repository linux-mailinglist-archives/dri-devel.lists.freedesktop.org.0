Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA2973BFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179310E2FC;
	Tue, 10 Sep 2024 15:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="u2xgjajk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060E10E2FC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725982255; x=1726587055; i=markus.elfring@web.de;
 bh=eJC+kqRjyZcpC2/bebvTq1qfNAeGTMeo7J5yG0OUZXM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=u2xgjajknzGDhf+ssonbDZB7xsBJCSJgAqG+CIO7QQuQIzPrjPyLuHsXJTPy18SY
 ge5uMGdogVvVBYXdr9GaaQTY7yKyIqHywriI6PxPa5bNEGpkcFjv0UuB2844hs8+q
 bLJvyqaSfoe3DHVdPSJ/laj0Ga5aVqH16GJCwROUZAdPZmE5wP9pnmchrqg0T6KQZ
 a1wlo9b8JVJUIzVkL2mT4eIXVgWkhfgRYYhiln8e9uwZqVi2Pdx9MKxgiotKc9bAn
 6zCSEnHP1osIhjfltjnamJR9Ji52Ubn1tWgiFksUgtjBP9L3IaJVPKcWMiySg2bCZ
 AB718kmO++yVWpRADw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1u6n-1rqy5G2q4n-00w0J0; Tue, 10
 Sep 2024 17:30:55 +0200
Message-ID: <34e1ae43-0b81-46bd-8fa8-a5fcf48def3e@web.de>
Date: Tue, 10 Sep 2024 17:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20240910-xilinx-dp-audio-v3-3-75560793f4d0@ideasonboard.com>
Subject: Re: [PATCH v3 3/3] drm: xlnx: zynqmp_dpsub: Add DP audio support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240910-xilinx-dp-audio-v3-3-75560793f4d0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bySk54JGcMbhmtuQtab+ZIYd90iRLYDy4cyGodf0+0SKBhIHF4X
 2c7nU4+iyl0rHOUT//1JBqHbCk+M06V38dZH//XMeF1Bncayi0GhGAYdftI7S2SdALYfK+O
 iPfdacH6mUu0KaFaCvx/I/33rvvWyXaXi5dmiDfyd+PgZu1P0Q9R+O5skjy+AcQcbF1qiwy
 AQkwSv5n1sOz6PTCilFYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3ui97cDDXso=;dRaVWEMbGIXm9DghmuVlbauQK/2
 HqZexSToc1soV3sjJdCYw36x6MAjZ4WJjn0dbJWLOfh2iZ8xg5S6Siy3oJ6peT+27MYe4pC2x
 Fn0TdmOrP6yNueX1SeFa3tg2pDVMIdK1TMwUyfuMa14fQ2VBrh6ht7CqNXGdZS6AZst5y2CoB
 ImLYSDNNhE/j1nDMKcG9M5H+K2Yg7XYXqkNSZWDilWCJjGspmz2La181oN32+fVFYY0iFfgqw
 pg5v5wfX5i9Odk4mdKIRBqOx5XBE67/YHfa1KvKkyJ0ezCFyIC+s0klkwmlOxEJWkznhHmpoy
 V7WS7ZQ8RawDzL81Pb2crJDMDqtDLk5obpgR+6aaMs+/XwFU5pxC66jwjpXL5O59yAZ17mCfn
 gszaguKZ0DKWQA1t45KHCIudGHx8uho31+jij3Ir8ERuH2sErcGlnFmES6fUuSV20OWipZPA3
 9GD3WFh14/s/Xhx+pjqc2g8WBXVZltXUIfIg1CpbL/LkTYc3uZQDqxQfem0Jlr5QErO3bwybB
 vKgfriC0OAaFH+0XAe52zOWCodOuH0g1PsputHTVRK9pseUbtD/BPriY/1848w8ag6ef0L7pM
 dVUsNuO402D00FFrnJA8FTrEWBreQCsixpve3DW4bPCQ0BWVniOc/uSp47mHKSiTSIrTeLTHL
 Rd6A+/FMeCi/pVJ4+zLwK87YuT1+VK8suZUzGAGg+9RVW7OMi3FVot/BKJp4q2Hzc5HgyBE61
 wIpTNv1VzG8uP6sFSuhXRZ09HmnI1MQetRUuRaQGaFG5UYxn/2LbuBuICuJG3KV4Uc/R0tjdZ
 +3jpV8MW+5dFr2rpAtoaG4pA==
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
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> @@ -0,0 +1,461 @@
=E2=80=A6
> +static int dp_dai_hw_free(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *socdai)
> +{
=E2=80=A6
> +	struct zynqmp_dpsub_audio *audio =3D dpsub->audio;
> +
> +	mutex_lock(&audio->enable_lock);
=E2=80=A6
> +	audio->enabled_streams--;
> +
> +	mutex_unlock(&audio->enable_lock);
> +
> +	return 0;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&audio->enable_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/mutex.h#L1=
96

Regards,
Markus
