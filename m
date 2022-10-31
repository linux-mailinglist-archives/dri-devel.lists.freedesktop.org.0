Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E46145FD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BEE10E31A;
	Tue,  1 Nov 2022 08:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8180F10E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 21:07:07 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id p127so14027041oih.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aoGu1LT5tdMCaqSWoG2s2IJixpXTuun6P4SWBtcGda4=;
 b=hefAvQFJmfZtrwkG3wfLF/hqostOYNYo8Neqf03UhmWi6nUi6qRvn77CWrW0t+DrTJ
 Yc7AL4hzkBlQFq0FR8gIM8iBPDjcUMxzrrRgK0tPujo6YR/EK9gk6Kq9EdP5NPCJBu/G
 C3UaQv1J+10p6fHtoeBWrSfuXgaEpC7QKZAvN0NUP6XmqYtECXxoH48jkjhMOWw/t6Nx
 n8jh3h7VVeQu03549dJPPACz5MrKobJYZuyAWZc8Yy4JFaR6G0CrYp+rQgtt4wBv7duC
 +Wu2VY848mRtFROCtG5yAFYvQU0aSdUuhKzVE02wFhVYK81LXxHkzlxBUJeSJ1/2LG3w
 bw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoGu1LT5tdMCaqSWoG2s2IJixpXTuun6P4SWBtcGda4=;
 b=J10EH2O3IWvet0+g2rGe6lrYAMi/kbwXLGDRTpA7fkq4SPIgMNJbyLowjknnof2jIU
 QwnvszRZer64DiM2mlnWAhXs7ZsrxQ+If+1eZk//F+sCivEMWXdh/Cvdk/PicXv/xyLy
 FLePOygMk2an2MgbF5ymiYFFzSlYvwgeJeihMYnMYW+QPINiFnLvasbwMIULEd9++DMe
 pdPoUyncgeuwAg7oe0OvOJDSpREc8SYhcUN37UF6jSaduuckIVCKCtFQmu/qqap3F/9l
 ELUyut/i9MwvEKaNBkCfAz1b0Wl3ES0gbm6HskOApT7VTt/HikCpZ81amzdcL9xp6QNu
 m+bw==
X-Gm-Message-State: ACrzQf3+N6oucHtnkrRny7X4R6xSyndxuVCxiht+VjAP0Ux+ZeSNmMwQ
 zA2OAb3T29iJAFq/aWj1Nfs=
X-Google-Smtp-Source: AMsMyM4aOGm4pYEV8uqPuIxeESOzedWxDxSVqjuHMFZSJlWhiCUGgZ19BEd1LXTrLN6nV9bayhuP9g==
X-Received: by 2002:aca:f1a:0:b0:35a:f05:82f0 with SMTP id
 26-20020aca0f1a000000b0035a0f0582f0mr3072980oip.220.1667250426633; 
 Mon, 31 Oct 2022 14:07:06 -0700 (PDT)
Received: from geday ([2804:7f2:8006:16ea:99cb:fa89:7dea:3ae])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a056808057800b00342ded07a75sm2727069oig.18.2022.10.31.14.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 14:07:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 18:06:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <Y2A48a5ff+SyxqLR@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <e8b6eb23-4968-af6c-c2d3-8e5fa64d9473@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b6eb23-4968-af6c-c2d3-8e5fa64d9473@linaro.org>
X-Mailman-Approved-At: Tue, 01 Nov 2022 08:48:29 +0000
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
Cc: ALSA-devel <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 09:20:36AM +0100, Neil Armstrong wrote:
> Hi,
>

Hi Neil and thanks for caring.

> 
> On 17/10/2022 14:04, Geraldo Nascimento wrote:
> > Hi Mark, resending this as it failed to apply in my last submission. Added
> > Neil Armstrong to Cc: as hopefully he will be able to better review this.
> > 
> > Thanks,
> > Geraldo Nascimento
> > 
> > ---
> > 
> > Starting with version 2.10a of Synopsys DesignWare HDMI controller the
> > insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
> > for example, if we neglect to set this bit and proceed to enable hdmi_sound
> > and i2s2 on the device tree there will be extreme clipping of sound
> > output, to the point that music sounds like white noise. Problem
> > could also manifest as just mild cracking depending of HDMI audio
> > implementation of sink. Setting insert_pcuv bit (bit 2 of
> > aud_conf2 Audio Sample register) fixes this.
> 
> 
> I did some research and this insert_pcuv is already present in the 1.40a version
> of the dw-hdmi databook, so I wonder why suddenly this is needed.

Like I told you, I was unaware of this fact, but I have a hunch this bit
was being set to 1 as default before the 2.10a version of dw-hdmi. It
remains to be checked, I see you added Christian Hewitt to the Cc:,
maybe he can use i2cdump or printk() on older Rockchip  hardware, the
Radxa Rock Pi N10 is the only thing from Rockchip I own.

> 
> The insert_pcuv is documented as:
> -------------------------------------------------------
> When set (1'b1), it enables the insertion of the PCUV (Parity, Channel Status, User
> bit and Validity) bits on the incoming audio stream (support limited to Linear PCM
> audio).
> If disabled, the incomming audio stream must contain the PCUV bits, mapped
> acording to 2.6.4.2 Data Mapping Examples
> --------------------------------------------------------
> 
> 
> What's interesting is this register is only present if thre DW-HDMI IP is configured
> as GPAUD or GDOUBLE, meaning it must have GPAUD enabled. So it has
> something to do with it, so what's value of it when GPAUD isn't present in the IP ?

Would you like me to inject some printk() or dump some memory value
with i2cdump? I'm not sure I follow you because you obviously know much
more about this driver than me, but if you could elaborate a bit I'd be
happy to provide some answers.

> 
> And HDMI2 spec added this, even PCVU were required before:
> --------------------------------------------------------
> Note that PCUV refers to the parity bit (P), channel status (C), user data (U), and validity bit (V) as defined in IEC
> 60958-1.
> --------------------------------------------------------
> 
> So it has something to do with IEC60958-1 stream format, do maybe this
> insert_pcuv should only be enforced when the input stream is _not_ IEC60958-1 ?

Yes, the HDMI2 spec requires PCUV audio bits, and they borrow the idea
from IEC 60958-1 (Digital Audio Interface - DAI), but insert_pcuv definitely
needs to be set for newer Synopsys Designware HDMI hardware when we're
talking about Linear PCM - that's what my patch attempts to address.

Thanks,
Geraldo Nascimento

> 
> Neil
> 
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > 
> > ---
> > 
> > v1->v2: SoC->SoM on description, better commenting, minor style changes,
> > 	conditional application of fix for L-PCM only
> > 
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> > @@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   	struct dw_hdmi *hdmi = audio->hdmi;
> >   	u8 conf0 = 0;
> >   	u8 conf1 = 0;
> > +	u8 conf2 = 0;
> >   	u8 inputclkfs = 0;
> >   
> >   	/* it cares I2S only */
> > @@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   		return -EINVAL;
> >   	}
> >   
> > +	/*
> > +	 * dw-hdmi introduced insert_pcuv bit in
> > +	 * version 2.10a.
> > +	 *
> > +	 * This single bit (bit 2 of HDMI_AUD_CONF2)
> > +	 * when set to 1 will enable the insertion of the PCUV
> > +	 * (Parity, Channel Status, User bit and Validity)
> > +	 * bits on the incoming audio stream.
> > +	 *
> > +	 * Support is limited to Linear PCM audio. If
> > +	 * neglected, the lack of valid PCUV bits
> > +	 * on L-PCM streams will cause anything from
> > +	 * mild cracking to full blown extreme
> > +	 * clipping depending on the HDMI audio
> > +	 * implementation of the sink.
> > +	 *
> > +	 */
> > +
> > +	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
> > +			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
> > +		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
> > +
> >   	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
> >   	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
> >   	dw_hdmi_set_channel_count(hdmi, hparms->channels);
> > @@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
> >   	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
> >   	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> > +	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
> >   
> >   	return 0;
> >   }
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > @@ -931,6 +931,11 @@ enum {
> >   	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
> >   	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
> >   
> > +/* AUD_CONF2 field values */
> > +	HDMI_AUD_CONF2_HBR = 0x01,
> > +	HDMI_AUD_CONF2_NLPCM = 0x02,
> > +	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
> > +
> >   /* AUD_CTS3 field values */
> >   	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
> >   	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
> 
