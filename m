Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC6602485
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3C710EE9C;
	Tue, 18 Oct 2022 06:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284010E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 12:04:49 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u15so11846605oie.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92eFSiRgtqq3z5EJ8KsBZ5qnISbuSueBoNETN1Cx1TA=;
 b=fgqhE3ZUdXWnC6eM1lNwjXig8oOhKp3MVcCZtIjrn6qBcCKJwAdvo3M7/iELoKQ75Q
 wcGOh5TI2SysmzYZHvYK7jFNSNRsLC+ghzvB1xNDbXB4KL+IuLkKMxvkyRDLjAryPZPw
 uP+6d14Zc7N3UduAzwE88+S21jmVIDXV2AM+s+fa2qYwPaVl2Tsabgxu68/EH0dLgFKh
 S+KYFdYUkTbLUOpgf1P1MkgDE9ohZt+PQ1dnXC2X6kkqhmDwC5CR12Z5PSp7ZFv9VZzn
 vG9zMjGc2nEOVKzYRjg3a58ftU6brAF7oy3W3gjI3Woi5ORevMN3I5fOM7VcZM4chsST
 2WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92eFSiRgtqq3z5EJ8KsBZ5qnISbuSueBoNETN1Cx1TA=;
 b=1pJZXOEWqwUaOqVKVaxWpNOC6IziyrCRAzL3G0O1bDcdS+uajyhDSoeChJromImgCl
 UvGd0VOCwL7cBF5cZLomvzplLaWgueoCAHZ68TyTHGcl7sMLAqjDA/9eLc4gtp+N89gz
 eGzFxNSlQ/lYwLXUwYTn8buiyj1ICQLzOvfjkd7Dd19iVSVQ1HAt9XSCNCM34pWvESuq
 NUOQNMX6IA3/l6trtrl9V9ssJ95bns4MuAT76eRZXznZWrydlRBtFHfE6YSAGAnXOVml
 HrMXfwA0xSwvCyFM090H2fH43JTzanEhYSVoKbMF/WXakvKDC7dmwY9CV8X/9TJKBQDz
 6A2w==
X-Gm-Message-State: ACrzQf1lUVr7yx/8Xlfbfi44991DzVkP3s0esvlqF0/2Gpm3TAE7/J9/
 cUbGW/UeK5j2THTPvYT5Dcw=
X-Google-Smtp-Source: AMsMyM41jg79l77hpZPJFygjLg4+EFIdd+ccp3V91wKu43b1JYHdvyeocYzX/UgKFkPXaOXT8M9lYw==
X-Received: by 2002:aca:30c4:0:b0:355:24e0:8583 with SMTP id
 w187-20020aca30c4000000b0035524e08583mr4567774oiw.42.1666008289194; 
 Mon, 17 Oct 2022 05:04:49 -0700 (PDT)
Received: from geday ([2804:7f2:8002:5105:b46b:dcd9:d624:ab27])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a4ae611000000b00480b7efd5d9sm3292198oot.6.2022.10.17.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 05:04:48 -0700 (PDT)
Date: Mon, 17 Oct 2022 09:04:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if
 hardware supports it
Message-ID: <Y01E5MvrnmVhnekO@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark, resending this as it failed to apply in my last submission. Added
Neil Armstrong to Cc: as hopefully he will be able to better review this.

Thanks,
Geraldo Nascimento

---

Starting with version 2.10a of Synopsys DesignWare HDMI controller the
insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
for example, if we neglect to set this bit and proceed to enable hdmi_sound
and i2s2 on the device tree there will be extreme clipping of sound
output, to the point that music sounds like white noise. Problem
could also manifest as just mild cracking depending of HDMI audio
implementation of sink. Setting insert_pcuv bit (bit 2 of
aud_conf2 Audio Sample register) fixes this.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

v1->v2: SoC->SoM on description, better commenting, minor style changes,
	conditional application of fix for L-PCM only

--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
@@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	struct dw_hdmi *hdmi = audio->hdmi;
 	u8 conf0 = 0;
 	u8 conf1 = 0;
+	u8 conf2 = 0;
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
@@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/*
+	 * dw-hdmi introduced insert_pcuv bit in
+	 * version 2.10a.
+	 *
+	 * This single bit (bit 2 of HDMI_AUD_CONF2)
+	 * when set to 1 will enable the insertion of the PCUV
+	 * (Parity, Channel Status, User bit and Validity)
+	 * bits on the incoming audio stream.
+	 * 
+	 * Support is limited to Linear PCM audio. If
+	 * neglected, the lack of valid PCUV bits
+	 * on L-PCM streams will cause anything from
+	 * mild cracking to full blown extreme
+	 * clipping depending on the HDMI audio
+	 * implementation of the sink.
+	 *
+	 */
+
+	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
+			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
+		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
+
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
@@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
+	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
 
 	return 0;
 }
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
@@ -931,6 +931,11 @@ enum {
 	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
 	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
 
+/* AUD_CONF2 field values */
+	HDMI_AUD_CONF2_HBR = 0x01,
+	HDMI_AUD_CONF2_NLPCM = 0x02,
+	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
+
 /* AUD_CTS3 field values */
 	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
 	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
