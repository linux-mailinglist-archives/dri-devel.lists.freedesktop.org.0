Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C229FE734
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A423710E4F2;
	Mon, 30 Dec 2024 14:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VEHUFlkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125310E4F2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:35:45 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aa69107179cso1523827866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735569284; x=1736174084; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=muZ2wW2hVnzwn4HfNxHAftduJN319MmGvILPV/RL4VU=;
 b=VEHUFlkFn33oWxuQkETu6V8IoUkEe0Q9QCioT2J5YGYU91yVWhIpqB8WLa7pTkFetW
 2G4V/NzlYsM86FGhiAsheN4sEMNK45ho0Aiz5NxTj+4J24rWt5ntk8E39kxE0KBYJYey
 EwloTK7N1ucDfkFBms53rBHKtJFQ7hm6BZpQ2+4dJ8wNs2QI/qHXBUesQy2n6zwNlUfu
 bzswjx8e4PQ4vfce051WI/352j1Rc3jyKFtVye7gogVPGPvuyFDXdWMSGNvqE9P5rXoG
 VKDFh73PKhsGt4WbM2OKffnEep4pva1e21xlYjBy7OBqSJnV1rwzAxLpQTogpJkbyAHo
 oC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735569284; x=1736174084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muZ2wW2hVnzwn4HfNxHAftduJN319MmGvILPV/RL4VU=;
 b=P6ikWsaGO3Su58OVLPDVSt+Il9b1KxGObpo87oJm2Wpo2UY5PuHeQ7jwWF+6UQ+hcJ
 gAUhvfERjwXdIygIPtiU6nc9wTxcjnLUq5hbrF9YhqCSl2BcVf3sQZfATjS9Siot0ptu
 MOH1qluadiDpa4kxykvRjp6w9E0l0chk8wLHHNeU7yBrLg01ehI9V2ApqZxAMvG95kE+
 4kuuHXBOLIyVq+Fv6iMYRKiVRLr0hjC1e0CeDAFTwtboiNvRt+kJ98bMVjOcFWB1Pa24
 y0H7MNDtaTH4H30i8dWK4VqEe7Mgs8WnjfaNgA5uGR7zEW1aQBFt1dtANnAbIZ3W67Tw
 2Zug==
X-Gm-Message-State: AOJu0YwSkgboWFoVrx52y86SDp1G5AcDkgDyB+mE1cB8kjo9XlRS3pNM
 oW5HoVZ2k8q4i1xOrdO3YfRTbE7zAZQTGpFIk+BqxKa8AK2DQFbU05wBcX0o5IhnIvz2m8fRcOJ
 q
X-Gm-Gg: ASbGnctrrCisrc6WIxGJPVnA40XKDb1fnqJmrD5WFNqRJIEFdPY8aJdHhQNUd9M3tEO
 QreAarYFjYdLqoluhxrbBKTkwzXlTaMg2HSFl166JReSVHUKjBkzeGWRGLN55chkPL4q7QxsjOw
 /ha3SN5/DjrJ/wuujJKNi5F/N6Cv/4CONcmbYxW9UTakDB5U7ICEUCWcy/j825cYRs6M5E/GYZ8
 GaJwDy3hUjWYx76URim2K3xCIbbdl3CGFhj2/hll44jYUIOpnT6qiAHqDVS6c4V25AJWHecCbdY
 7dFVxV0IelcnqYSk3ZzNy98tKg4hX2A8uy5C
X-Google-Smtp-Source: AGHT+IELLletuDZZY2FEsIO0g1lo0NFbtrTDZP5hEfJy9aoZGXu/1hXu+pek+4IbCm+nmUCo9daDCQ==
X-Received: by 2002:a05:651c:a0b:b0:302:2202:14dd with SMTP id
 38308e7fff4ca-3046854e2c0mr102995611fa.20.1735568806234; 
 Mon, 30 Dec 2024 06:26:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6c632sm34677061fa.21.2024.12.30.06.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 06:26:45 -0800 (PST)
Date: Mon, 30 Dec 2024 16:26:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jesse Van Gavere <jesse.vangavere@scioteq.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: ADV7511/13 implementing atomic ops and bus formats
Message-ID: <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
References: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
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

On Sat, Dec 28, 2024 at 09:20:17PM +0000, Jesse Van Gavere wrote:
> Hey all,
> 
> (Hope this is not a duplicate as my first mail didn't seem to have
> gone through) For one of our new boards I have to get the ADV7513 chip
> working with TIDSS, the driver for this expects a bridge chip to have
> atomic ops and provide bus formats.  Doing this for our own needs was
> quite straightforward but I'd very much like to upstream this as I
> think it could be helpful for others as well, I do have some questions
> I hope to get some answers on that could help me in writing an initial
> patch.  I hope you'll forgive any ignorance on my end as it's my first
> foray into DRI.
> 
> - For all needed atomic ops I added the drm atomic ops helpers, except
> for atomic_check, looking through the other implementations I can't
> quite figure out what I'm expected to implement here, what is the
> expectation for this function?

The atomic_check() function verifies if the passed set of changes (in
the form of drm_*_state) is valid from the driver's point of view. If
you have nothing to check, it's fine to skip the function.

> - Looking at the lontium 9611, only the input bus formats bridge
> function are added there, which seems sensible as the output goes out
> straight over HDMI, is it a correct assumption I'd only have to add
> the input bus formats for the adv7511 driver? Part of me thinks this
> might not necessarily be correct as it seems the chip can be chained
> further than merely to a connector and I'm not sure what this would
> (or could) expect

I'd say, it's fine to ommit the output formats handling. From what I can
see only dw-hdmi does sensible job of calculating output bus formats for
HDMI Bus. The it66121 simply returns MEDIA_BUS_FMT_RGB888_1X24.

> - Does Input justification matter for the bus format? My assumption is
> that left/evenly/right does not matter for the format as it only
> relates to which pins are used and it's e.g. MEDIA_BUS_FMT_UYVY8_2X8
> no matter which pins this is placed at so I should just focus on the
> actively used pins.

I'd say, yes, for non-DPI bridges. And I'm not even sure if
justification also isn't applicable to DPI bridges. Wait... you have a
DPI driver. Granted that Analog doesn't define D[23:0] format, I don't
think I can answer your question.

> - As it's a common driver for adv7511(w)/adv7513, would anyone know if
> they all use the exact same types of input styles (of course with
> varying color depth support) so that I could use ADV7511 as a sort of
> superset for all possibilities and work
> from there to define all the input formats?

No, each bus (DSI, DPI, etc) have it's own data formats. This means
ADV7511 (D[35:0]), ADV7513 (D[23:0]) and ADV7533/35 (4x D-PHY lanes +
clock lane) have different input formats.

> - There seem to be certain formats in there that don't exist yet, such
> as YUV444 12-bit VYU (if I do this right and read highest data bits to
> lowest, which I assume translates to MEDIA_BUS_FMT_VYU12_1X36), should
> I just write a patch for all missing formats to the uapi
> media-bus-format header or is there anything else to take into
> consideration?

Just uapi patch with explanation and justification.

> 
> Best regards,
> Jesse

-- 
With best wishes
Dmitry
