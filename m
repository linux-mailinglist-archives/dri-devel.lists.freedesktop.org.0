Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80434545CA3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 08:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4911A6DC;
	Fri, 10 Jun 2022 06:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578711A6DC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 06:51:07 +0000 (UTC)
X-UUID: 37e00a594830492caea8424b78fd9833-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:686e8da0-cc57-4f90-837c-3a3c94e3f6b5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:6cf45de5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 37e00a594830492caea8424b78fd9833-20220610
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 321019867; Fri, 10 Jun 2022 14:51:01 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 10 Jun 2022 14:50:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 10 Jun 2022 14:50:59 +0800
Message-ID: <ad31ed6f7a70babddbb2fa859b1b9c8199705f70.camel@mediatek.com>
Subject: Re: [PATCH v10 04/21] drm/edid: Add cea_sad helpers for freq/length
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>
Date: Fri, 10 Jun 2022 14:50:59 +0800
In-Reply-To: <62abad94-fe4a-2505-506d-6e4bc6b425ff@collabora.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-5-granquet@baylibre.com>
 <62abad94-fe4a-2505-506d-6e4bc6b425ff@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-25 at 14:26 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> > This patch adds two helper functions that extract the frequency and
> > word
> > length from a struct cea_sad.
> > 
> > For these helper functions new defines are added that help
> > translate the
> > 'freq' and 'byte2' fields into real numbers.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   drivers/gpu/drm/drm_edid.c | 74
> > ++++++++++++++++++++++++++++++++++++++
> >   include/drm/drm_edid.h     | 14 ++++++++
> >   2 files changed, 88 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index 561f53831e29..61ef1b1c972c 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4758,6 +4758,80 @@ int drm_edid_to_speaker_allocation(struct
> > edid *edid, u8 **sadb)
> >   }
> >   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >   
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from
> > cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample
> > rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing
> > failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> > +{
> > +	switch (sad->freq) {
> > +	case DRM_CEA_SAD_FREQ_32KHZ:
> > +		return 32000;
> > +	case DRM_CEA_SAD_FREQ_44KHZ:
> > +		return 44100;
> > +	case DRM_CEA_SAD_FREQ_48KHZ:
> > +		return 48000;
> > +	case DRM_CEA_SAD_FREQ_88KHZ:
> > +		return 88200;
> > +	case DRM_CEA_SAD_FREQ_96KHZ:
> > +		return 96000;
> > +	case DRM_CEA_SAD_FREQ_176KHZ:
> > +		return 176400;
> > +	case DRM_CEA_SAD_FREQ_192KHZ:
> > +		return 192000;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> > +
> > +static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
> > +{
> > +	switch (sad->format) {
> > +	case HDMI_AUDIO_CODING_TYPE_STREAM:
> 
> As far as I know, bit 0 is reserved, so HDMI_AUDIO_CODING_TYPE_STREAM
> should
> never occur here?
> 

Hello Angelo,

because we do not know whether "HDMI_AUDIO_CODING_TYPE_STREAM" is
compressed, we decide to change this function name to
drm_cea_sad_is_pcm to prevent misunderstanding.
For this, I will drop case HDMI_AUDIO_CODING_TYPE_STREAM

> > +	case HDMI_AUDIO_CODING_TYPE_PCM:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> 
> Also, I think that implementing a
> drm_cea_sad_get_compressed_max_bitrate()
> function should be pretty straightforward... the spec says that this
> is
> 8 bits, byte 3 (your byte2) contains the max bitrate divided by 8kHz,
> so to extract it, you read byte2 and multiply it by 8000Hz.
> 
> /**
>   * drm_cea_sad_get_compressed_max_bitrate - Extract maximum bitrate
>   * @sad: Pointer to the cea_sad structure
>   *
>   * Extracts the cea_sad byte2 field and returns the maximum bit rate
>   * of a compressed audio stream.
>   *
>   * Note: This function may only be called for compressed audio.
>   *
>   * Return: Maximum bitrate of compressed audio stream in bit/s or
>   *         negative number for error
>   */
> int drm_cea_sad_get_compressed_max_bitrate(const struct cea_sad *sad)
> {
> 	if (drm_cea_sad_is_uncompressed(sad)) {
> 		DRM_ERROR("Not supported: tried to get max bitrate for
> uncompressed format: %u\n",
> 			 sad->format);
> 		return -EINVAL;
> 	}
> 
> 	return sad->byte2 * 8000;
> }
> 

After sync with Jitao, we think this function is not correct.
refer to table of "Short Audio Descriptor" in [1].

[1]:https://en.wikipedia.org/wiki/Extended_Display_Identification_Data

BRs,
Bo-Chen
> > +/**
> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad byte2 field and returns the word length
> > for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> > + *
> > + * Return: Word length in bits or a negative errno if parsing
> > failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
> > *sad)
> > +{
> > +	if (!drm_cea_sad_is_uncompressed(sad)) {
> > +		DRM_WARN("Unable to get the uncompressed word length
> > for a compressed format: %u\n",
> > +			 sad->format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (sad->byte2) {
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> > +		return 16;
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> > +		return 20;
> > +	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> > +		return 24;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> > +
> >   /**
> >    * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync
> > delay
> >    * @connector: connector associated with the HDMI/DP sink
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 37c420423625..7a939cb95b38 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -373,6 +373,18 @@ struct cea_sad {
> >   	u8 byte2;
> >   };
> >   
> > +#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
> > +#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
> > +#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
> > +#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
> > +#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
> > +#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
> > +#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
> > +
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> > +
> >   struct drm_encoder;
> >   struct drm_connector;
> >   struct drm_connector_state;
> > @@ -380,6 +392,8 @@ struct drm_display_mode;
> >   
> >   int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> >   int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad
> > *sad);
> >   int drm_av_sync_delay(struct drm_connector *connector,
> >   		      const struct drm_display_mode *mode);
> >   
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

