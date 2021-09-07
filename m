Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E44025CC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A72989DC9;
	Tue,  7 Sep 2021 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3D789DC9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:59:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i28so2037907wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YLD42w7bSc5CqE7OSE2flIo4sFSt4/kkmRcZl24JohQ=;
 b=MnU3S3vHEHvcdJRp8S9yPHVxsdJ/CgrGUgnCCtD87Wi7n/Mo5r3sqZ6nyLa6xThMWt
 +NhxvKHAvtFqAIMC8/VKsqK+vZ4QmyIZoA3pfKy4WESLr0zM3V8rKtqxgvMbCDDG7SLH
 TEWpojL1aaA9HgrpfH5/oSqo+ELMXMrNf01gBC9Eb+ovwiLeGMhYl+wvE+uVHc5mEthd
 R82omlFKujYeiyYQrz5dHvdSnI/2C+5MEFQUTOFSyB/biQqe2KMRjT1SZC+V6zeninRB
 2o/xLQTjpI1xtlXvy8gT0T4OFS7askcaS/IISRlndqlaGV8wskl/mi1w5qEpcWfoUTwa
 mn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YLD42w7bSc5CqE7OSE2flIo4sFSt4/kkmRcZl24JohQ=;
 b=owuOaf0m7rslkI8blfn+0vb2gIs5nhu4HIU32hXmWwyULIsIFH2hG/bmKUD6v6giwO
 GqW6P6pVMv7cuWnkb7lq2e4TqHnYPVmRweN9t/GdaGEeQHDeaRONxtL3Xv1/Rarbi4Jw
 so7didd9pAJoZF1X0SOjqrXJ/sBrUdajJDsiQs2xL03hWHOcMWVk5m7XMiueWmU3huN3
 A10yvPl6DBP+wfkpAdfg36El0n81WOa9UJ7Nx1zppBd43wv0xd/eGYixxqZgjZ5xFags
 I9mOE9iGt3egTXNISccyb5YPgPwm9J4xGGfIQ0elB1pKXE2VRSv2tqfnEDRwtqRgVSpk
 N+cQ==
X-Gm-Message-State: AOAM5307cAKJt84goncDI38QZBZksxPq7ivA3Uy63R4NldLfqtRJX+pU
 jabGoSZ+Bcbse4zgsYDWHAMClw==
X-Google-Smtp-Source: ABdhPJz9h7dVuC+1ZsWrhTh/RBFL3Ddlu1dPaIn211/rd/FhHaN3lezcEz5I4fzycnHO7DSQBIsmTw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr17256566wrj.270.1631005148747; 
 Tue, 07 Sep 2021 01:59:08 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l7sm1806773wmj.9.2021.09.07.01.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:59:08 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:59:07 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Message-ID: <20210907085907.aefskkspajero4eg@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-5-msp@baylibre.com>
 <YTZ6YvifP0EqGBzR@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTZ6YvifP0EqGBzR@ravnborg.org>
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

On Mon, Sep 06, 2021 at 10:30:26PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:27PM +0200, Markus Schneider-Pargmann wrote:
> > Similar to HDMI, DP uses audio infoframes as well which are structured
> > very similar to the HDMI ones.
> > 
> > This patch adds a helper function to pack the HDMI audio infoframe for
> > DP, called hdmi_audio_infoframe_pack_for_dp().
> > hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> > packs the payload only and can be used for HDMI and DP.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
> >  include/linux/hdmi.h |  4 ++
> >  2 files changed, 73 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > index 947be761dfa4..59c4341549e4 100644
> > --- a/drivers/video/hdmi.c
> > +++ b/drivers/video/hdmi.c
> > @@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
> >  }
> >  EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >  
> > +static void
> > +hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
> > +				  u8 *buffer)
> > +{
> > +	u8 channels;
> > +
> > +	if (frame->channels >= 2)
> > +		channels = frame->channels - 1;
> > +	else
> > +		channels = 0;
> > +
> > +	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > +	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
> > +		 (frame->sample_size & 0x3);
> > +	buffer[2] = frame->coding_type_ext & 0x1f;
> > +	buffer[3] = frame->channel_allocation;
> > +	buffer[4] = (frame->level_shift_value & 0xf) << 3;
> > +
> > +	if (frame->downmix_inhibit)
> > +		buffer[4] |= BIT(7);
> > +}
> > +
> >  /**
> >   * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
> >   * @frame: HDMI audio infoframe
> > @@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  				       void *buffer, size_t size)
> >  {
> > -	unsigned char channels;
> >  	u8 *ptr = buffer;
> >  	size_t length;
> >  	int ret;
> > @@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  
> >  	memset(buffer, 0, size);
> >  
> > -	if (frame->channels >= 2)
> > -		channels = frame->channels - 1;
> > -	else
> > -		channels = 0;
> > -
> >  	ptr[0] = frame->type;
> >  	ptr[1] = frame->version;
> >  	ptr[2] = frame->length;
> >  	ptr[3] = 0; /* checksum */
> >  
> > -	/* start infoframe payload */
> > -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> > -
> > -	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > -	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
> > -		 (frame->sample_size & 0x3);
> > -	ptr[2] = frame->coding_type_ext & 0x1f;
> > -	ptr[3] = frame->channel_allocation;
> > -	ptr[4] = (frame->level_shift_value & 0xf) << 3;
> > -
> > -	if (frame->downmix_inhibit)
> > -		ptr[4] |= BIT(7);
> > +	hdmi_audio_infoframe_pack_payload(frame,
> > +					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
> >  
> >  	hdmi_infoframe_set_checksum(buffer, length);
> >  
> > @@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
> >  }
> >  EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
> >  
> > +/**
> > + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> > + *                                    displayport
> > + *
> > + * @frame HDMI Audio infoframe
> > + * @header Header buffer to be used
> > + * @header_size Size of header buffer
> > + * @data Data buffer to be used
> > + * @data_size Size of data buffer
> > + * @dp_version Display Port version to be encoded in the header
> > + *
> > + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> > + * fills both header and data buffer with the required data.
> > + *
> > + * Return: Number of total written bytes or a negative errno on failure.
> > + */
> > +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> > +					 void *header, size_t header_size,
> > +					 void *data, size_t data_size,
> > +					 u8 dp_version)
> > +{
> > +	int ret;
> > +	u8 *hdr_ptr = header;
> > +
> > +	ret = hdmi_audio_infoframe_check(frame);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (header_size < 4 || data_size < frame->length)
> > +		return -ENOSPC;
> > +
> > +	memset(header, 0, header_size);
> > +	memset(data, 0, data_size);
> > +
> > +	// Secondary-data packet header
> > +	hdr_ptr[1] = frame->type;
> > +	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
> Any constant we could use or define and use here?
> Hard coding 0x1b is the less desireable option.

I couldn't find a constant for this, but I will add one.

Also thanks to looking for these defines, I found a struct dp_sdp that
could be used instead of the header and data pointers which I would
prefer, so I will fix that for the next version.

Thanks for your feedback.

Best,
Markus

> 
> 	Sam
> 
> > +	hdr_ptr[3] = (dp_version & 0x3f) << 2;
> > +
> > +	hdmi_audio_infoframe_pack_payload(frame, data);
> > +
> > +	return frame->length + 4;
> > +}
> > +EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
> > +
> >  /**
> >   * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
> >   * @frame: HDMI vendor infoframe
> > diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> > index c8ec982ff498..f576a0b08c85 100644
> > --- a/include/linux/hdmi.h
> > +++ b/include/linux/hdmi.h
> > @@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
> >  int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
> >  ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
> >  				  void *buffer, size_t size);
> > +ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
> > +					 void *header, size_t header_size,
> > +					 void *data, size_t data_size,
> > +					 u8 dp_version);
> >  ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >  				       void *buffer, size_t size);
> >  int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
> > -- 
> > 2.33.0
