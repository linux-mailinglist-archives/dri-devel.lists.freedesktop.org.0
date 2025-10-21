Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2ABF5289
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12310E58A;
	Tue, 21 Oct 2025 08:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LfvFfLxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFD810E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:07:49 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b64cdbb949cso859958766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761034068; x=1761638868; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
 b=LfvFfLxOBjC1Hox86yAZnJo3sp2jj8q1pp9bNr/nmGhAXghfPdMB2qwv6Pyt4FhZaS
 y60RO65Bc54FOkKKf6QC3N1295nDpHHEBuSPGmpYKjaun8CqDZTLmj+FhCKFypUlJmPn
 lA8XTUZhmwaK6tWNrNJqeorMFbs9hYhIREp0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761034068; x=1761638868;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
 b=MMb8y81NkCIztjDqMGi10dlLNEePDCQWl78KwVv21xSnYeSg1L51haoNrCnLAJgiK8
 uDhn4sL8pGk9273WJ3Z9+KD2iam2lu3pgQhhjg8C/e+SPDAZRZddqZH8cWHsLb+Bp/I9
 H4pcvnLrv/v6qe/DSpu0dOjs+iF/aPIsGbFDqKLFZJX7TyJBz5auRcGawUaMqPLCYL+b
 LkzTqC5W415wGiLGRPmNNvQKr/NywdFWamT/nS0tariNz/ArdDV+LDw9FOLQEQY0OyYb
 UpnrV9aDVofr7ZZ1a1/mtl/+2wj7kK/Bw2lWwJVaTissILovePYHPX+ahxOekKZGDfMc
 xpiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5dhubokp5hq1G8yQF7kAg8cMZzrHd2LoiWunk/1kDk2iugF3MO0/ry/Mcyc28LMYVajoPFVGIKCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeuoETWUTrGjtlFqBv0a8nXme5fV4EUaNCi/dJ/K47VspH3Hal
 kezB70UB+HAMhfNZN5vveojRLOrbvY/k3qOXN920r9mhpMCLAa8dgjyB7Nq5Ux8zhgU=
X-Gm-Gg: ASbGncsRSDR8lsy7tfYmJvk7cZPQfbRjn97KWKpNQzqp1/5K+yM79/Y8YoZUatJL1Vb
 Nq91CBmqmeYJ6CYk+FGagtdLur+nIDt13eoAbUduzxgnBdRjI33JzBEgYfCUi76f36a5hxmS7US
 YA95/Barq5GD1Im/kFRxNem+ATZzoT0t89B8YzCpceAFw7nE2k6aWaPizphfuE8qAxcwuyjjFFr
 2FplHvg6W6yUjJT45m5zSwQsbD3LKkaetiLCjXnnS2qdTAzrjHbiQJmRDgBz0CF/TC5sOTfANIq
 aFtWLfFGKWAwcwUif5K++XkLl28lkYPy2TyolmaXpj2ueHN+Hq2RzF4VSHkYMbuA5HlasW4MLqW
 GkIV0Q/0rpVHtCYnz8q5xfdGPpYuSpj1sYjsfGAfPVgrj536qEoJqzxq/2IGl/OoyFdJ8yxzkNs
 kHER7jt9teqYQnqCdwDGsLXQ==
X-Google-Smtp-Source: AGHT+IEGcQ2tB+9FLkcsMzH3Z3OqGyaRZtqOqXHeWD/7JycNzUq8R6JyQRoeUwJtVWAc3tO+BkBXoA==
X-Received: by 2002:a17:907:2d23:b0:b5c:74fb:b618 with SMTP id
 a640c23a62f3a-b6472c61933mr1959457166b.12.1761034067061; 
 Tue, 21 Oct 2025 01:07:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab65d6sm8600484a12.14.2025.10.21.01.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 01:07:46 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:07:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc_UBy5-e6HIW9I@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
 <aPc-Wad85lQWbqfa@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Oct 21, 2025 at 10:03:37AM +0200, Simona Vetter wrote:
> On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > in HDMI and DisplayPort to describe the audio stream, but hardware device
> > may need to reorder the IEC958 bits for internal transmission, so need
> > these standard bits definitions for IEC958 subframe format.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Would be good to get a formal ack from alsa maintainers before merging
> through drm, just to be sure.

Sorry wasn't fully awake yet, I meant that it should be recorded in the
commit. dim has a check for this stuff now and it fired for your patch.
-Sima

> 
> Thanks, Sima
> 
> > ---
> >  include/sound/asoundef.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > index 09b2c3dffb30..c4a929d4fd51 100644
> > --- a/include/sound/asoundef.h
> > +++ b/include/sound/asoundef.h
> > @@ -12,6 +12,15 @@
> >   *        Digital audio interface					    *
> >   *                                                                          *
> >   ****************************************************************************/
> > +/* IEC958 subframe format */
> > +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> > +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> > +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> > +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> > +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> > +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
> >  
> >  /* AES/IEC958 channel status bits */
> >  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
