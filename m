Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBEBE8C39
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82F610EBE4;
	Fri, 17 Oct 2025 13:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OHAtMdhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2510EBE4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:12:10 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso321940066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1760706729; x=1761311529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgUY5Sh0rfJq1KKqF6+/Wc6CUelq32S/uGrkwA/yIwI=;
 b=OHAtMdhUddavDeV5IGeqOh8v8ekLmry4XFrGgegeE0XaYgBzGLD6tIV50d9uWUEpPP
 4LZx8Q2w5z/7tKRIr2qEbccLYCbi95OV5rTEgSUeq5Aiqdo46rI6agBPr4NAyveoDDHs
 i2wJxj2TauYyxqWxPmaBmfVCvaS270eYaiRYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706729; x=1761311529;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PgUY5Sh0rfJq1KKqF6+/Wc6CUelq32S/uGrkwA/yIwI=;
 b=gNobQVb37h8xPtS3n+iomdAAOTkZQ0vpYWLhNRWSmbmecuz8Q1bbBwRwLBgLLGwzMP
 kDRER12AGYZhr0ZPQqmshH4C6KOC0TF2zpiaiRGWP6xRsU3CZcx987KcCsyldOM6SRcw
 gwNOzHkBW+alt22KBKwtlphlKoATuMI9WNW4uN//2AcrpCDqM2y7KikEZvXv6yPtLoAS
 NFgsjJahzBmDrcMdCpvB4vS5qHr3NPDu+QZ29GXEciCWwgz0LBEANTT8urQK1CVWbjp8
 7IDXPZTI3d6UCV5Vsigery1XV5yIkNIIgNcylzhvGUailGqPJXLJWcBZx2xhbyBCn1zf
 Zmbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbLgD+E3cc08oDJ/Xga87uffYTiLQV1cveuFt0UG/qov++i0NMDRB3ZKbc0OZ+c7F+QPgn0uxqPTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI9zDQznre8UcchxwqrDd4l8okhvH9hLXwKNlw0sgJklxfC9o4
 rxMlI1D+iyNPh5WQe1/3FGtMn8WD6G16zr3MqCe02WRRZuHNOkyP9RQR3Eq6GB+ciRA=
X-Gm-Gg: ASbGncuBH6RlPKRE+jmU5aal8hGKTifLboxoFjSWIOclxKvAJ3ZKXnGAEHRr4b/s94l
 u++0XlaINcqVV0EaiTsqAll/zMClvn9NH01CoibYpqUBBl64ldMhlRvaHAFHSQqHhpScuCEYeth
 MlMtYxZ/8TDaRpQQiK34sgYpsrqhNEPmRkdsJ6ksBxQ00O8egIVtiVWYhdO+fhWoRTxOgAjLq/8
 ODuoVAnTIyMpom3BuumTmRQZOHVFZYnvpnJObdUnhOMAHEUHkKD5lqQbGmOL6zoPtAdkVM00jYX
 pNkbRGDltnBP0iiIjNm6KRp2Lvtcyz5/OmJ4w2bj4DQbN6+2IfpSRDymyUDEFyZfxdb12WFOzLs
 avk7wHWlt55qrZN9awGd5NVcU5v6z95lhyrM/pEONK9TNNf+cwqx/24rg7XGcdMsPn9zK9SXBRq
 gA0FO89M4W6Ta5usuQdXuzGw==
X-Google-Smtp-Source: AGHT+IEKJKBY+0fizVvFsqzngTvfJFKfmdqtA2X0XMv1Ygn3W4CU5xTRfa+7CtVte/CnbEhrkIy3mQ==
X-Received: by 2002:a17:907:7282:b0:b2a:e961:6e13 with SMTP id
 a640c23a62f3a-b6473950334mr382724966b.34.1760706729216; 
 Fri, 17 Oct 2025 06:12:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccccb5132sm807933566b.54.2025.10.17.06.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 06:12:07 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:11:56 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/29] drm: Implement state readout support
Message-ID: <aPJAnPWneXod2REH@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <abd349f5-48eb-4646-aca3-d70dd9f4bff0@suse.de>
 <20250923-spry-aloof-bullfrog-4febcc@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-spry-aloof-bullfrog-4febcc@penduick>
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

On Tue, Sep 23, 2025 at 11:15:55AM +0200, Maxime Ripard wrote:
> Hi Thomas,
> 
> On Tue, Sep 02, 2025 at 04:13:21PM +0200, Thomas Zimmermann wrote:
> > Hi Maxime,
> > 
> > there are a number of patches in this series that can be merged immediately,
> > and likely should.
> 
> Ack, I'll do a first pass to apply the preliminary patches if (or when)
> they get reviewed.
> 
> > Is the state-compare code really necessary? Doing this separately might ease
> > the review.
> 
> My understanding was that Sima wanted to be part of it, but I guess we
> can introduce it later on if she agrees.

Yeah I think without readout state comparison fastboot is nigh impossible
to validate and keep working. For merging splitting things sounds fine,
but for enabling in production I'd be very vary to ship this without.

I think a module option for developers and testing would be good here to
make this happen: -1/default means you only get fastboot when the entire
driver (including all bridges) support both state readout and comparison,
and then you can override that with 0/1. And this should be a tainting
module option I think.
-Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
