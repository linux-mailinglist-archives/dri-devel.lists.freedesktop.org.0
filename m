Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADF41315E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC4B6E930;
	Tue, 21 Sep 2021 10:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B146E930
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:12:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q26so37450751wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ipUOFzWIov197fs5+28PM8Ix36c67adYXiR+puFnJwE=;
 b=wOLrBskZ10wQlvdXyuUTNcoSXUwlKkH3g6N3nLEIqDpo25BDo9mFJssl/rtimPNwQw
 pT74GJGWGgaxtevTvngcBQM7w+aEsB7SH5aEup6r6KqhiilxDPQTXzIwqY9Q5Hznh+TQ
 NA7uTnMjJPi5WRw6QOVPALjkKJun9qPbID4pYblrxxWOTMbMFUsJa3cwLyj6F1XltIu4
 fuyuOh5etg/MgBmJW2qCuKF9Q4Bc0FXD/5geVIyidiWq64TwGxTolK83qbeVjGSitlUC
 BrVRg4XusNhynS6glu6j+eCkrMDT5UTRzq8mlQfKsGxKiExSd3l0c5Pyo7dL+wfABK+W
 JTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ipUOFzWIov197fs5+28PM8Ix36c67adYXiR+puFnJwE=;
 b=MwdrgK5ZLQI+MN/yj9sj0VKxe26BhEIGrmA7rYH5KAOVE17dS1OoBZO75MP65Bl2Gq
 dzgfS7jZMidwzkhy7cQ/4tYPCDjvFnUwBAIzdhs3EXRRt9ASIosYGW9t6ECAUfiQTsw3
 CgP3roTQWtMPVl0La85PGK2ey3RD20XVadvJdsfdwjRdTU6Rqs1YLN4jOO14c19B65I8
 yZkfVQ2hkm82AzZMftDRcceHFAd7Bc5Aq1tbKc0hxFwdQnFNVOamNeI17/BasfBtukg6
 T6x/bDjItz7j3307HtoYleMsBzXohqgMiHvW3u0pqF5YvaRnlpghGHnpcTi1xDg/BegE
 PKJA==
X-Gm-Message-State: AOAM533AZCWYHYvGSvzIJMByhyGCruXdq+bZhEmkIHIwxa+FfzQG3TKf
 j3uG2ra4qZhwf1BSraUZsq5sXA==
X-Google-Smtp-Source: ABdhPJySFn0YTXs6HrRHkdv52Cx+lR/FqdAIWyFhFfJylOL+v+y94mPFp0V+n5G/xT+b1WXSZhcNAA==
X-Received: by 2002:a1c:3543:: with SMTP id c64mr3726784wma.78.1632219167559; 
 Tue, 21 Sep 2021 03:12:47 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id b7sm2264536wrm.9.2021.09.21.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 03:12:47 -0700 (PDT)
Date: Tue, 21 Sep 2021 12:12:46 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/6] drm/edid: Add cea_sad helpers for freq/length
Message-ID: <20210921101246.g7avjpzxmjmvc4gc@blmsp>
References: <20210920084424.231825-1-msp@baylibre.com>
 <20210920084424.231825-4-msp@baylibre.com>
 <87mto6tg0k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mto6tg0k.fsf@intel.com>
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

Hi Jani,

On Tue, Sep 21, 2021 at 12:49:31PM +0300, Jani Nikula wrote:
> On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> > This patch adds two helper functions that extract the frequency and word
> > length from a struct cea_sad.
> >
> > For these helper functions new defines are added that help translate the
> > 'freq' and 'byte2' fields into real numbers.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >
> > Notes:
> >     Changes v1 -> v2:
> >     - Use const struct pointers.
> >     - Add a check whether the format is actually uncompressed or not.
> >
> >  drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     | 18 ++++++++--
> >  2 files changed, 90 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 6325877c5fd6..28df422fbc03 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4666,6 +4666,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
> >  }
> >  EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >  
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> > +{
> > +	switch (sad->freq) {
> > +	case CEA_SAD_FREQ_32KHZ:
> > +		return 32000;
> > +	case CEA_SAD_FREQ_44KHZ:
> > +		return 44100;
> > +	case CEA_SAD_FREQ_48KHZ:
> > +		return 48000;
> > +	case CEA_SAD_FREQ_88KHZ:
> > +		return 88200;
> > +	case CEA_SAD_FREQ_96KHZ:
> > +		return 96000;
> > +	case CEA_SAD_FREQ_176KHZ:
> > +		return 176400;
> > +	case CEA_SAD_FREQ_192KHZ:
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
> > +	case HDMI_AUDIO_CODING_TYPE_PCM:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad byte2 field and returns the word length for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> > + *
> > + * Return: Word length in bits or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
> > +{
> > +	if (!drm_cea_sad_is_uncompressed(sad)) {
> > +		DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
> > +			 sad->format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (sad->byte2) {
> > +	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> > +		return 16;
> > +	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> > +		return 20;
> > +	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> > +		return 24;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> > +
> >  /**
> >   * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
> >   * @connector: connector associated with the HDMI/DP sink
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index deccfd39e6db..7b7d71a7154d 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -361,12 +361,24 @@ struct edid {
> >  
> >  /* Short Audio Descriptor */
> >  struct cea_sad {
> > -	u8 format;
> > +	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
> >  	u8 channels; /* max number of channels - 1 */
> > -	u8 freq;
> > +	u8 freq; /* See CEA_SAD_FREQ_* */
> >  	u8 byte2; /* meaning depends on format */
> >  };
> >  
> > +#define CEA_SAD_FREQ_32KHZ  BIT(0)
> > +#define CEA_SAD_FREQ_44KHZ  BIT(1)
> > +#define CEA_SAD_FREQ_48KHZ  BIT(2)
> > +#define CEA_SAD_FREQ_88KHZ  BIT(3)
> > +#define CEA_SAD_FREQ_96KHZ  BIT(4)
> > +#define CEA_SAD_FREQ_176KHZ BIT(5)
> > +#define CEA_SAD_FREQ_192KHZ BIT(6)
> > +
> > +#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> > +#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> > +#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> 
> I suggest adding DRM_ prefixes here.

Thanks, will do that.

Best,
Markus

> 
> BR,
> Jani.
> 
> > +
> >  struct drm_encoder;
> >  struct drm_connector;
> >  struct drm_connector_state;
> > @@ -374,6 +386,8 @@ struct drm_display_mode;
> >  
> >  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> >  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
> >  int drm_av_sync_delay(struct drm_connector *connector,
> >  		      const struct drm_display_mode *mode);
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
