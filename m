Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5FC40247F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 09:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590418931D;
	Tue,  7 Sep 2021 07:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878C8931D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:38:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u9so12962170wrg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8qwm7/emMNXXyeEed6Pu1tnRIxl5fkWRKm12F1bQs5U=;
 b=Adt3LoKid9pjlsUHd/GVQuY/zAKXcWxkvOxFbdHy77ep6BFkJpi2gDHSocyKXvAM9W
 eP9yfPNlANX0VoRDo7VIIrv8+62rpLB8QVm8M5B8DPXsPSNvyoc82AD7m1V58cEI1VZz
 7yR1dqBjWIRBMgrxb5I+UAzKAw2Tin7oKt1p5Fx1bFUvuSkgLu5y8G8sl5VAE60c8xQj
 yqvpKbwIhWAzD9QXsz/dQQjZmWMh0DPelun2GY0Cmpuzh59fRUsjDJRxRmUzLkmZ/pKl
 hOjFYSz+1W+HYS7L+hob7+q7x8lQ7ljvA9XcyHws3g6pu52Asj3m0OWoM3E16/6zgPxE
 yc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qwm7/emMNXXyeEed6Pu1tnRIxl5fkWRKm12F1bQs5U=;
 b=RnQ2+/RDfvnNx239Vkzt0d1U2yTvbzXTIWyjKAlvi2UlP+pIufan7saB5s1P9fHR2h
 /ENzG7yV63NsKTJURjnHcwVWfne9W/h+tfchnEwTgbgOTv2+8kXq4OFLZ1vS4oBA0GC1
 ulHlt4us5npTvffdWLoDiYhCEM84r1KmNLws7F3Nv5f4Zg38pMX+fyxsytGss+0I8Qu8
 68d25d4KIrRUxyHo0AEwYtXiLHp4XsZNI+DVqilWfnbHeP4Eboi/y9bgBcgAX6xMfHL1
 Smy52n4sHwEleXdEYSauG1XgLbYQoKOGDA3PY9F5CgxclMeXYEXHkpsNRIeDwjSHExZg
 fRHQ==
X-Gm-Message-State: AOAM532+n2hfogcrHl4IFGjyVt6o1e4w3jny6Rzroe5xVOgo6U395jL9
 U2irsdQ6hHhwNbriCHAX5Mp3hw==
X-Google-Smtp-Source: ABdhPJwd8EVlWl6li4Wv/BlVhLOxLsdoqYOn1akqaEkKERYLSnux6cF/iFciUNMtifluNA4vDx39Fg==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr16599470wrx.40.1631000292301; 
 Tue, 07 Sep 2021 00:38:12 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id j17sm10040775wrh.67.2021.09.07.00.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 00:38:11 -0700 (PDT)
Date: Tue, 7 Sep 2021 09:38:11 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Message-ID: <20210907073811.becmcre7n5c4w72f@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-4-msp@baylibre.com>
 <YTZ3tJh2ZSLNQEMc@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTZ3tJh2ZSLNQEMc@ravnborg.org>
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

Hi Sam,

On Mon, Sep 06, 2021 at 10:19:00PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:26PM +0200, Markus Schneider-Pargmann wrote:
> > This patch adds two helper functions that extract the frequency and word
> > length from a struct cea_sad.
> > 
> > For these helper functions new defines are added that help translate the
> > 'freq' and 'byte2' fields into real numbers.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     | 18 ++++++++++--
> >  2 files changed, 73 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 81d5f2524246..2389d34ce10e 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
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
> > +int drm_cea_sad_get_sample_rate(struct cea_sad *sad)
> 
> It would be nice to use const struct cea_sad *sad here.

Thanks, fixing it for the next version.

> 
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
> > +/**
> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad byte2 field and returns the word length for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> Can you check or this and WARN (or drm_WARN) if this is not the case?

Good idea, I added a check, a DRM_WARN and return -EINVAL now.

Thanks,
Markus

> 
> > + *
> > + * Return: Word length in bits or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
> Again, consider to use const.
> 
> 	Sam
> 
> > +{
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
> > index 759328a5eeb2..bed091a749ef 100644
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
> > +
> >  struct drm_encoder;
> >  struct drm_connector;
> >  struct drm_connector_state;
> > @@ -374,6 +386,8 @@ struct drm_display_mode;
> >  
> >  int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> >  int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> > +int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
> >  int drm_av_sync_delay(struct drm_connector *connector,
> >  		      const struct drm_display_mode *mode);
> >  
> > -- 
> > 2.33.0
