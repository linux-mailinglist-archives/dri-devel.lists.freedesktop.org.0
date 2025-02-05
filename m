Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADADA28BB5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 14:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368B010E144;
	Wed,  5 Feb 2025 13:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pG6IR3r7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7510E144
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 13:33:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30613802a59so74423031fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738762390; x=1739367190; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kdXlLzfvrhdUrBoR/jxzwmgrOFkrXyCts0ZtQTKixOA=;
 b=pG6IR3r7C7c2qDkGS3x3qTB23nAxC0iqpRWJqh5kcwny5se1OgnuU/eyQMh7J2XYDY
 f5/8HyHIkAHXvgdZZ/EeIh+vYKIE0F9XkVVMkhAy3dXg7TwtzIciXHtgzcfO15knviLk
 84kEY+xmfMMysjaoeRca6jYx5BvahvpLxrbGgdcinRuMK4JWG7Bbsnw9KE8ZxkP4SKX/
 cmhnvIjJFE/66c/KpJ0lp5M2BTI5GMpZADmjbP2ID/27XJbJ2X7R+iR9Uh9FkBasDxXB
 ov0rF89UAHKQtekfrV3dVlr+O2wUmSwnrcxEx1QV1EgodoJuH9CU6hZtCwV/Ogre5h4Y
 fVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738762390; x=1739367190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdXlLzfvrhdUrBoR/jxzwmgrOFkrXyCts0ZtQTKixOA=;
 b=Aa1F8iiHxsQZ9Sy78wAwKfL5PYHGmDIGzHqeuxJ007cw7Hcqp79KeMHC4odqGyOgq0
 XETJxYZSzIXJbc+LLtS9U/e1j2vad4lU/u/A9F3cWfNy7Wf3ZdDq4S0yWc9s6tTwypsX
 axrouhpWVF+sBDvtPAQ7xzkqwQwhgawn5W0FurxGgB/JSNXyClr0VonVsvulqGxWtGm2
 pWl38YGuVrQqDg34y7DUOryeijWcfjdPdfLiJkfYLyaF4NguYCIvTNyV4s4vbtgGzrEy
 GHiHjYAhOgbl9K28WYyQHkDZxiUQTFI8HEhKOkz6/iiVqSYdchwRBar3Bt/XMsdfgLLh
 YZHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyBjqmgjwNtVe60IEYJ38GDkKaOcJ1Jlwa+7PJPWohS8h+zEpE/FSWPVUiD6ff8cqfp3bxkOBpAKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM0XH2HqQow1DUSSvby41molwnTUJOC/TsuUBSQGPz+OPgcmm7
 FDhBKDHtu5lOOWRUbsZ0P1CcQAepakIvon2A1cfusNlYVcy1VeKvXM+EPzwt9vc=
X-Gm-Gg: ASbGncv0mScyRs410MUME5w0zNOMzH5eMb584ZN5Y+t8M5FnrxfnDhW4JtfV09CHa/X
 7qTQ1Eec1HyWs1Ldct7CGkCoXtYt60J+h4M84EFwk1n6VtXz3RFm4xEaxx03kiIcGjPLrixUn/M
 9V8JKN2s6tTSRCsKm1JnkyVc4Rpsmy+YKr4RvkIgLAO7SWqnbM/7SXLkbJ/oGbY5hs6Uxv3V5nf
 ZNKrIjjyj6CL6Ehl4DNyw8kkDIyQOJt0PnNbM75M+fv/FElEIPD3Wn0mR95YE7VigR6inMy5Ixy
 z1WkqQ7xwBk0E8iNbQkm6Onguz9CdLN6TgI7px6R9zBt8RCX27BQPQcuZ1x/gxIuwbwb01Y=
X-Google-Smtp-Source: AGHT+IH/JpYkjPT4o1aH6hbWn4YaPtyuTEBB++cHyhx+jQWDgamHA0JZbGwRwQNMWS0IvcKLXactkw==
X-Received: by 2002:a05:651c:b06:b0:304:9de0:7d9 with SMTP id
 38308e7fff4ca-307cf3146a8mr9900901fa.21.1738762390160; 
 Wed, 05 Feb 2025 05:33:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a30a522esm20942871fa.60.2025.02.05.05.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 05:33:08 -0800 (PST)
Date: Wed, 5 Feb 2025 15:33:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Harikrishna Shenoy <h-shenoy@ti.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, jani.nikula@intel.com,
 j-choudhary@ti.com, 
 sui.jingfeng@linux.dev, viro@zeniv.linux.org.uk, r-ravikumar@ti.com, 
 sjakhade@cadence.com, yamonkar@cadence.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
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

On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
> On 05/02/2025 12:50, Harikrishna Shenoy wrote:
> > From: Rahul T R <r-ravikumar@ti.com>
> > 
> > The mhdp bridge can work without its HPD pin hooked up to the connector,
> > but the current bridge driver throws an error when hpd line is not
> > connected to the connector. For such cases, we need an indication for
> > no-hpd, using which we can bypass the hpd detection and instead use the
> > auxiliary channels connected to the DP connector to confirm the
> > connection.
> > So add no-hpd property to the bindings, to disable hpd when not
> > connected or unusable due to DP0-HPD not connected to correct HPD 
> > pin on SOC like in case of J721S2.
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> 
> Why are you sending over and over the same? You already got feedback.
> Then you send v2. You got the same feedback.
> 
> Now you send v3?
> 
> So the same feedback, but this time: NAK

Krzysztof's email forced me to take a look at the actual boards that you
are trying to enable. I couldn't stop by notice that the HPD signal
_is_ connected to a GPIO pin. Please stop hacking the bridge driver and
use the tools that are already provided to you: add the HPD pin to the
dp-controller device node. And then fix any possible issues coming from
the bridge driver not being able to handle HPD signals being delivered
by the DRM framework via the .hpd_notify() callback.

TL;DR: also a NAK from my side, add HPD gpio to dp-controller.

-- 
With best wishes
Dmitry
