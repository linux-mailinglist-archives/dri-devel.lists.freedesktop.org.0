Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD751A75D9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C52A89DBF;
	Tue, 14 Apr 2020 08:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE16289DBF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:23:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200414082330euoutp01cee4d040e5ae079fe6f5fd6d6914d6eb~FogqWw1OH0993909939euoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:23:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200414082330euoutp01cee4d040e5ae079fe6f5fd6d6914d6eb~FogqWw1OH0993909939euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586852610;
 bh=XWm+FkRkz908Xh/DgK0T3uwI1zjaPRHNrbSQEAu3hi8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Gx0Ti9qv2EN3Y0G1sb6rHKgmk9I3fG9Moetw4qe1lZKoU8VR+iH900qNbLZ/NZbHJ
 Mtvt84YAWDZ0cMCuIFuuXJYUoKbnS3Vd+uA/GfryTLtkz9Mt9jo3eRxFH8vsIM95ib
 6bOC4Sz/A5J5hIfeoC/UP9yQ/EUW61NWdpvHRu9Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200414082329eucas1p1c6a02857927abbd03468b0a9a40678ca~FogpoSbR91936719367eucas1p1G;
 Tue, 14 Apr 2020 08:23:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.B5.61286.103759E5; Tue, 14
 Apr 2020 09:23:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200414082328eucas1p2dd496cdd1415a9581ca2a4702e17a88f~FogpSeFs82943929439eucas1p2S;
 Tue, 14 Apr 2020 08:23:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200414082328eusmtrp139dfd9b0b6bb314508cec7778a55a087~FogpRpc6s2060120601eusmtrp1g;
 Tue, 14 Apr 2020 08:23:28 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-87-5e957301b6e1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D3.F9.08375.003759E5; Tue, 14
 Apr 2020 09:23:28 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200414082328eusmtip150a71b0e8d45451a2fc417fe495617f8~Fogo0OVAh0714207142eusmtip1m;
 Tue, 14 Apr 2020 08:23:28 +0000 (GMT)
Subject: Re: [v2 1/2] drm: bridge: adv7511: Enable SPDIF DAI
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <be860a7a-6e9a-d801-f5cc-e3dbe640513d@samsung.com>
Date: Tue, 14 Apr 2020 10:23:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413113513.86091-1-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMcRze99733ntLZ19X3EdZuGXEKo3pRSxm87YxGTay4vDumK7avYWw
 Kf2OKP2wrlo3SontKEnpB5FKc1q5KavFlK1Ut8rVNI7eezP993w+n+f5Ps+zfWlCMSh1pc+E
 R3G6cHWYinIkn775afJCfE7o+uRvTky6qU3C3G+1kczVxGyC+WC1UEz8XSPFmKeHCKZtxEwy
 qZnFMqartoBimm4cZeq+GgmmsiKHCHBih807WEt3oozNT8mTsq0ZnRJ2zGSSsdVTn6VsY+FD
 Gdt/rUXCjo8MyFhLg5liX6RnkexkhXuQU7Cj/yku7Mw5Tuez/bjj6fTH8dLIfHzBYjBLYlGh
 PA050IA3gj43SZaGHGkFLkPQPtkwN/xA8OfBTSQOkwg6LAbZP8lEj4EQsAKXIhgeUoqkUQQN
 dTNIODhjf7j2wCYRsAs+ANbxLFIgEVhPgOmLlRIOFPaE35U9dizH26HvVY1dTOJVYOtqtrst
 xocht9qGRM4iaMsbIAXsgANg6tcXuwGBl0P1aAEhYiV8GiiSCGaA02l43dgtFWPvgryiBELE
 zjDc8mSuzjJoz7pOivgK9JcJHEGcgqDqUc2cYCv0mmZmk9KzDp5grPUR1zugPDfDvga8ELpH
 F4kZFsKtp7cJcS2HlCSFyF4J/e+q5h5UQkmHlcpAKv28Zvp5bfTz2uj/+xoQWY6UXDSv1XC8
 bzh33ptXa/nocI33yQhtBZr9fO22lolnyNp5oglhGqmc5Bn7skMVUvU5PkbbhIAmVC5yozYn
 VCE/pY65yOkijumiwzi+CbnRpEop33BnKESBNeoo7izHRXK6f1cJ7eAaizQHj8T19kZ7vdq1
 jnKjPJ67p916y+5PeWuKlAYm7274GDj9XUNuXrA7RJF6uXINK82kxzx2BkS6Vxm3hfn1uQ1a
 C5rXGosndFOrm7lvHtWdSZnB98bq9hZl12lyTxr8zHuWHroUuGLneFCJNXTTy/r3S7Y89I0v
 9a5PeF3yMs7M9qtI/rTady2h49V/Abx2ORB4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xu7oMxVPjDLa8N7PoPXeSyWLliX8s
 Fk2tU5gtrnx9z2bRvHg9m8XV7y+ZLU6+ucpi0TlxCbvF5V1z2CwO9UVb7Hm8ntli86apzA48
 Hq+uOnq8v9HK7jG7Yyarx4kJl5g83p07x+6x/dsDVo/9c9ewe9zvPs7k8fHNE3aP9/uusnkc
 6J3M4vF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZ
 apG+XYJeRu/GZtaC2QIV7xdcZWpgnMvbxcjJISFgIvHp5gLmLkYuDiGBpYwSm59MY4NIiEvs
 nv+WGcIWlvhzrYsNoug1o8TfRTNYQRLCAjYS3av/MYHYIgLBEh//3mAHKWIWmMMscWLaTxaI
 jsmMEgfW9oGNZRPQlPi7+SaYzStgJ3H38E5GEJtFQFXi3+Wj7CC2qECExOOJ7YwQNYISJ2c+
 YQGxOQUcJL79eQi2jVlAXeLPvEvMELa8xPa3c6BscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnA
 yLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMNq3Hfu5eQfjpY3BhxgFOBiVeHgn+E+JE2JN
 LCuuzD3EKMHBrCTCuz53apwQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wMTUV5JvKGpobmF
 paG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkaXuB5dmZ4fSj4NIln1Gy5ILt6d
 JHRJxfjQ+aaeRy8/zYt3s3+zau/Eh0VJE0W2Ktyu4D3v+fjdlxmfm9WkDpZurv4yt1qJkYuN
 eUYMx5VuGdkca81bG9dyavI76H2Zx3LzY9f/krxTBpm+UpL9YbzNp77NujohZNKip5NfSd/N
 O/nhVpqE/gslluKMREMt5qLiRABVeFGyDAMAAA==
X-CMS-MailID: 20200414082328eucas1p2dd496cdd1415a9581ca2a4702e17a88f
X-Msg-Generator: CA
X-RootMTR: 20200414070644eucas1p150b35a8ea7531ab5172046b1d913d6f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200414070644eucas1p150b35a8ea7531ab5172046b1d913d6f7
References: <CGME20200414070644eucas1p150b35a8ea7531ab5172046b1d913d6f7@eucas1p1.samsung.com>
 <20200413113513.86091-1-bogdan.togorean@analog.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.04.2020 13:35, Bogdan Togorean wrote:
> ADV7511 support I2S or SPDIF as audio input interfaces. This commit
> enable support for SPDIF.
>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Queued both patches to next.


Regards

Andrzej

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index a428185be2c1..1e9b128d229b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -119,6 +119,9 @@ int adv7511_hdmi_hw_params(struct device *dev, void *data,
>  		audio_source = ADV7511_AUDIO_SOURCE_I2S;
>  		i2s_format = ADV7511_I2S_FORMAT_LEFT_J;
>  		break;
> +	case HDMI_SPDIF:
> +		audio_source = ADV7511_AUDIO_SOURCE_SPDIF;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -175,11 +178,21 @@ static int audio_startup(struct device *dev, void *data)
>  	/* use Audio infoframe updated info */
>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
>  				BIT(5), 0);
> +	/* enable SPDIF receiver */
> +	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
> +		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
> +				   BIT(7), BIT(7));
> +
>  	return 0;
>  }
>  
>  static void audio_shutdown(struct device *dev, void *data)
>  {
> +	struct adv7511 *adv7511 = dev_get_drvdata(dev);
> +
> +	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
> +		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
> +				   BIT(7), 0);
>  }
>  
>  static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> @@ -213,6 +226,7 @@ static const struct hdmi_codec_pdata codec_data = {
>  	.ops = &adv7511_codec_ops,
>  	.max_i2s_channels = 2,
>  	.i2s = 1,
> +	.spdif = 1,
>  };
>  
>  int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
