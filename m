Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404559FEEC1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3962510E636;
	Tue, 31 Dec 2024 10:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dd+tey5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9148F10E464
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:55:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2163bd70069so10536845ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 18:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735527255; x=1736132055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1hOCNzn1u26zfwC5EVmnNPt6JsnGAZAdQcQkczE5MOI=;
 b=dd+tey5aOnnAe67tq6zVTz/6swB6XZGS3CvaW8NHH09xHVkACJsLqzKz/sVjCsPQ7d
 aI0y3s12eHswqBjFEb8Hgcl8+ERbYevOeoJmX1oSP2KVOTeqWZaHmhwz6Xj7NwgJSex2
 hF1QnM4zfk0rzeFSGHM956ScIZuz8nOxTcog3mjqZOIG3bpkPHxEkvuYrOdxvQt2hLVu
 sNsBQ1vuVmK3xzlg2sE890/aIk2QKWGEUpedmj/ot6OBR197b4yHpYBNoC5cuRJHPO+9
 G12puZbqvIGE/HAfK2eR4WzpZVuJrJY+zQQqL9rdERBk8FF+uxnYQhn/IJz0JjusmC7y
 dH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735527255; x=1736132055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hOCNzn1u26zfwC5EVmnNPt6JsnGAZAdQcQkczE5MOI=;
 b=jWcoM9wic6bl0ST0XdJv5B+C5wxXSiBclNqocWxiuAMQqFRNkgBs+5g/RxK8p4iM3a
 f3mS1caKgT7ItQ+2fJOLSne50Zj4AH9zIYLRnMov1LTKj1NghtKyn4EihER4dm7PaaOB
 dUnPPfjQO5pDsN0OFXynxzR1Nymh7x6n9oXNAsSoopkdtKoBdJ0mZm9m3Etv4HYypF4D
 gB3hpIO0hkIAyfkm5EJWMt3qqd62B5g7I/Uf1ODfqoEdny+RRvjEOonnjMXCG1kbazn4
 /oWHm6mI9zAcOkL+fL3xrkrw9Ei1VWugcEpHESwl2E2hd5XBJEzZV5WIxEjJGwmYeqmg
 VbGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVewLW1iY7nrk3sLNqWXrH6AhPpCz+Pl1ybRqbyu1Mhmcwxd8x/pNeP4ZMoZwB0Xle9PgAK5ZX431A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk0KOe/JgDOpB4Wh+3DhcFA3ZYbHB7ZicbQ3dzKZeKGUdJXDIT
 9Jly3QVYYmvWkvpNWt+VT9KCliZrQ2/NlIV4pELH2D6j4BJO7pEj
X-Gm-Gg: ASbGncsIzmmABE4SIq7eE/EVWuTrtRdIQZerSUOsSYGL/VF6ZMyOpXv/j55nr+NtNwY
 B7sBlXwAjT64NThHPmx+5M/cdN6klYn1W6VYmVnZegqbODkYNpbuMS+MnT88DGs1Du85CXbKM66
 eagScw6AQk26JB4IxfUDEjPKsbyNyggPsG319EtVpiHi58d84qu89iHSskO+DjqEcwr4teDTlGr
 fRyoTUFeuNRtnCWqCLOZPnfB+OUOcGi9TOVxxPq2c5mc+ok8T6aPmVt
X-Google-Smtp-Source: AGHT+IHj/Byn6Z/TryL91PlljX3v7lj8d0vU2WTjSaQqQP3l1D7Zl9YFQte4EjHg13nicR1o+Va6Sg==
X-Received: by 2002:a17:902:d2c9:b0:215:a3fd:61f5 with SMTP id
 d9443c01a7336-219e6e8917fmr452694535ad.5.1735527254984; 
 Sun, 29 Dec 2024 18:54:14 -0800 (PST)
Received: from geday ([2804:7f2:800b:1740:5148:eadd:af21:83dc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc964f09sm169823335ad.26.2024.12.29.18.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2024 18:54:14 -0800 (PST)
Date: Sun, 29 Dec 2024 23:54:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sound <linux-soundl@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <Z3ILTUU-t6Pb2x8O@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
X-Mailman-Approved-At: Tue, 31 Dec 2024 10:34:56 +0000
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

On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> Hi Geraldo, and apologies for resurrecting a 2 year old thread...
> 
> On 17/10/2022 13:04, Geraldo Nascimento wrote:
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
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> 
> I also had the HDMI audio clipping issue described here, on a RK3399. This was
> on a 6.1.23 kernel based on the one used by LibreELEC.tv with their out-of-tree
> patches for video decoding, 4k HDMI support, etc. When testing this patch I
> also updated my kernel tree to 6.10.3, and found that even without this patch,
> on 6.10.3 the problem no longer happens.
> 
> I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> the value is 4, i.e. insert_pcuv is already set.
> 
> According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> but before this driver sets the hw_params, and this patch sets it back to the
> correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> no longer necessary (but is a harmless no-op).
>

I found out that for my hardware even with 6.13-rc5 I still suffer from
really distorted audio if I don't apply this patch.

From 2cd8a7432afa9a02b4498832c912b8f90e347a5d Mon Sep 17 00:00:00 2001
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 29 Dec 2024 23:26:47 -0300
Subject: [PATCH 7/7] drm/bridge/synopsys: dw-hdmi: enforce PCUV bits for newer
 versions

For some strange reason my hardware boots without this set to
the default, testing has shown mixed results with different
kernel versions on different hardware, truth is, I need
this patch or more compliant sinks will misbehave when the
PCUV bits are not set

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 13 +++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h           |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f1c5a8d0fa90..fc45d10c7d42 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	struct dw_hdmi *hdmi = audio->hdmi;
 	u8 conf0 = 0;
 	u8 conf1 = 0;
+	u8 conf2 = 0;
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
@@ -101,6 +102,17 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/*
+	 * dw-hdmi introduced insert_pcuv bit in version 2.10a.
+	 * When set (1'b1), this bit enables the insertion of the PCUV
+	 * (Parity, Channel Status, User bit and Validity) bits on the
+	 * incoming audio stream (support limited to Linear PCM audio)
+	 */
+	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
+			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
+		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
+
+
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
@@ -109,6 +121,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
+	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index af43a0414b78..d7cbdc42d501 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -931,6 +931,11 @@ enum {
 	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
 	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
 
+/* AUD_CONF2 field values */
+	HDMI_AUD_CONF2_HBR = 0x1,
+	HDMI_AUD_CONF2_NLPCM = 0x2,
+	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
+
 /* AUD_CTS3 field values */
 	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
 	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
-- 
2.47.1

