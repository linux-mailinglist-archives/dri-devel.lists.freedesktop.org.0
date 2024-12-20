Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534AD9F8986
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A4510EE34;
	Fri, 20 Dec 2024 01:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wUku5OPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8510EE33
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:30:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5401be44b58so1405696e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658209; x=1735263009; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IRqTKoAE7HJ98npVyFYsMRTsxnV+I4SmvSDZ0TuvMfs=;
 b=wUku5OPX14H+dX9NTcdby9rAMfNbB23UsE6NbdrKyP79XeA8Zuh0YN8407ymRANn/v
 GRfEdavRcRzEaFkBecX2XsbHcA6tT3DJwlth32Hz7ZFOIGHwGzNhu6TJ517WWPgZZCt/
 zn3jAoToeZOBrshinRR7WmGU0CMZ/uYctKDkCQs8vDKAasHiXPpyt46FzdbOvwyr2VrO
 iq65CFQNU1oG8j0vqQ9RRZRbcCxdheBnvS6gLYt6abRYVABL//A2FgCsK3bYlh2NZ5qw
 FyUIRllCBTFag29CvyVkLau0Yot41aNtKTlcLYRaN/W++rf35njR+UEffIRCVVCizphb
 BwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658209; x=1735263009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRqTKoAE7HJ98npVyFYsMRTsxnV+I4SmvSDZ0TuvMfs=;
 b=gypkPZ2lRRbPumBCouCSGe8Ra6n+YIF1rrPIgLIm+Hp2uHExRxOdEzu2FltSW2Uufg
 vFt58kord5pLEw89xQRephT8GYBP3DGEmbJkySSCz2gSVWSaTulns5xP9GdLVIO8qNZk
 k8a3hW5P+QnF+bNtVwtEUb4zbqYCB6EsMi7n4GqJ2sXJzD8z/HFuzxQPHnMeIRZGmVtV
 lwEjcACbiHfFiC++MWa2wfeg4JuGJ1wRo8iqqb0r/vB4B3cXrw9tqi/jMgJzPi7dstU7
 0QYG8g19n4T2UDzREgYpIno9gEr9gDjKf3Kqziw6WM01X1YFEPRx1Hnb38NmdhjgZth9
 C3Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrIo9flBSCTcsPTxjtyBMpaz8RmhtTZFbDwy464cgrW+bbulPglYx7q0IuQZdXIiGXO5RSNoHvH9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJYtjVFW0RzH4XfuE08UN5dkddHdMtlfV7h3H7MCiq6VKrQWGZ
 Yq6Rej6YgAc9ih7dIsfeYHLsrGUFeFhOcOp8a1XDgR8KA/XY8c0cH4/S2UZidJw=
X-Gm-Gg: ASbGncvwLYItihF76Y/6taeh/QA5+50CSop8qzyANqWhgoDb1faYG4NMWwe9jyCcGQf
 TDJnIPcmrGP01mgIQLSkiD64yM8Rwvlx9hmj8eTb0T9GyUosLHi+jUeNEP0ti5QYTgD6wpRWyu2
 y2p/6VjNerkqw3l7PYuyAbfIF2BOqJAA5B5wULVCPMz2Jp9J96zf41fx+C7gauGBrIsDWVRRqPK
 hc0ttE5Yz3cVXtI/6xj9Muq3jEpeEvJltt8p3EXCkpQPNBreL4d87uzXk1Qe6808W+c/GDYvEWL
 pQm85uoNS29zhbuXUysXv79hGqO6kc0A1THK
X-Google-Smtp-Source: AGHT+IGlquI8KKTUHzMHBoJBkZ6k2s0Y3Yu3ZQlvtmHOQTkOMz1/CtvlXpiwmQGSPgAbRD9wIb6Z3Q==
X-Received: by 2002:a05:6512:2308:b0:540:3530:5a83 with SMTP id
 2adb3069b0e04-54229561aa3mr212914e87.36.1734658209611; 
 Thu, 19 Dec 2024 17:30:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813687sm331812e87.137.2024.12.19.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:30:08 -0800 (PST)
Date: Fri, 20 Dec 2024 03:30:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: bridge: adv7511: fill i2s stream capabilities
Message-ID: <g4beidwfuz7dtavflyovtkokdz5kcjgbmnw3q2r2ceycezxrwd@wlsorpagke3h>
References: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
 <20241210134254.2967524-2-olivier.moysan@foss.st.com>
 <rilzmak24odk34q3rglnkmi23e7warmd6dytx2opkhjl3kjujm@fqxqydwhcluy>
 <1a92bf78-1e29-4b84-8513-12ecb12c61bd@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a92bf78-1e29-4b84-8513-12ecb12c61bd@foss.st.com>
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

On Thu, Dec 19, 2024 at 03:49:45PM +0100, Olivier MOYSAN wrote:
> Hi Dmitry,
> 
> On 12/11/24 23:52, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:42:52PM +0100, Olivier Moysan wrote:
> > > Set no_i2s_capture flag in hdmi_codec_pdata structure to report
> > > that the ADV7511 HDMI bridge does not support i2s audio capture.
> > > 
> > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > > ---
> > >   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > > index 61f4a38e7d2b..28ae81ca3651 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > > @@ -234,6 +234,7 @@ static const struct hdmi_codec_pdata codec_data = {
> > >   	.ops = &adv7511_codec_ops,
> > >   	.max_i2s_channels = 2,
> > >   	.i2s = 1,
> > > +	.no_i2s_capture = 1,
> > 
> > Does it support spdif capture?
> > 
> 
> "no_i2s_spdif = 1" is relevant also for adv7511 bridge.
> I can add it in this serie.

I think you mean no_spdif_playback / no_spdif_capture. Yes, please.

> 
> > >   	.spdif = 1,
> > >   };
> > > -- 
> > > 2.25.1
> > > 
> > 
> 
> BRs
> Olivier

-- 
With best wishes
Dmitry
