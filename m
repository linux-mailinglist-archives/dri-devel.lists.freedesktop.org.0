Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384497EB02
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA4410E241;
	Mon, 23 Sep 2024 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tb/CsKkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B810E241
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 11:49:37 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5365392cfafso4281306e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727092175; x=1727696975; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V6bRS2Z4O7hfTBwHRyQc1l3okYOjMJYjPBNO68Gsqpg=;
 b=tb/CsKkm6eKBjEvu5oeoDub0LdmW8N/YFN3mlAKp4jWUb/LZ4nK3UseTq08Bq43mXf
 +ghia66EGbJYdXNWmZGEVbRaltOzh2ZT3Ca4T91T3kqhvA4m3JvlH8vJroN6s6vC4NhB
 3aFdUwnOdnG44jgeBakJq4/e/3bXLoA2eR1j6U36ufFeH8gw3J2wQQJVFXba0uZS7ZCh
 ILtvwST2fHPz6dwT2s9JURlP7vvQg2uxs3wz70PbZ+ggjrFT01LQfRSSqK3v/pNvKBkd
 c5R+GGUvO0UchLQDyIpryYA5IQdUFMVA+bP3l579TVi/JkM+9bEyIBqCTSKW+kc+pga4
 9e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727092175; x=1727696975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6bRS2Z4O7hfTBwHRyQc1l3okYOjMJYjPBNO68Gsqpg=;
 b=MObnUQXVzTAfqQ9Or1U0akYkUfIzFlIZcBC5tnxQo3LTWnXaaCK63vOLYdwXnlTqr0
 sa8dqEnFjVxz6YQbDxexF7vpRNRgrdQTDN9KBdZuMNMP0zRQSuZuCtRw761bTsoLiuHp
 /z3t9ehvGamVV4MHExaMYFfjM3hAH4dk/469wCBG/q5Y1qPS/+fdYwCCkDXVjNogLqVJ
 ghssSmpYUt+3I9Bqw9s4CRDZNyoQdvlhlNo7ep+/uKJFoS3Z4CvDNMa8UeFGElob/+L5
 6D5dxtE2DPOhhjziRVHQVKXH2G4venB0192osm42vI+ZutroR0UPR5ZRdcXry+4cgfRm
 a3Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSFZPyRIk32TH/5swehs9KA8O4Oc8dcWLwsMTlUAS1kJp2tge7Sey2kchKSj+uKJk1R6B4e43SLVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8Wz7Gg0HPE9/vSZtbep9gQl5QnwIxm4jSM0J2py4oAaZbgmsg
 KH7G94STfMmcCGXXNjFoQ049PCxgp1vYSWC+0CcHWlykUBGwYxU0W+rGux0H4c4=
X-Google-Smtp-Source: AGHT+IH5eHlDs92X1oOqMydop+/YnEnJFYVNxmxYyIaI8FUxaiDkS6ZoXHq8m0aKaIqt/4QABOTUVw==
X-Received: by 2002:a05:6512:693:b0:52e:a63d:e5c1 with SMTP id
 2adb3069b0e04-536ac2f5147mr5615655e87.30.1727092175081; 
 Mon, 23 Sep 2024 04:49:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da6dsm3267929e87.95.2024.09.23.04.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 04:49:34 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:49:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.Wu@ite.com.tw
Cc: treapking@chromium.org, Kenneth.Hung@ite.com.tw, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
Message-ID: <mkx63gnb2fobxxc5jc2f326d2oviix7dahyoh4sfeuiyypucln@hnklvrtv4q2u>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
 <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
 <a0a8f862018b4c9aa689672551e7a492@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0a8f862018b4c9aa689672551e7a492@ite.com.tw>
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

On Mon, Sep 23, 2024 at 10:45:49AM GMT, Hermes.Wu@ite.com.tw wrote:
> >On Mon, Sep 23, 2024 at 05:48:28PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> Changes in v3:
> >>  -add detials about fail item and changes.
> >> 
> >> 
> >> Fix HDCP CTS fail items on UNIGRAF DRP-100
> >> 
> >> DUT must Support 127 devices.
> >> DUT must check BSTATUS when receive CP_IRQ.
> >> DUT must enable encryption when R0' is ready.
> >> DUT must retry V' check 3 times.
> >> it6505 must read DRP-100 KSV FIFO by FIFO mode.
> >> it6505 should restart HDCP within 5s if KSV not ready.
> >
> >Still not readable.
> >
> >English text, please. Split the patch to fix one issue at a time.
> >Describe the _reason_ for the change. Annotate fixes with Fixes tags.
> >
> 
> with fixes tag include drm/bridge like this ?  => "Fixes: drm/bridge: it6505: HDCP CTS fail 1B-xx"

No. Please read the document that I have been pointing you to. It
describes all the tags and procedures.

> 
> About the reason about bug fixes. 
> 
> for example, the 1B-01 device count.
> will this readable?
> 
> " When connect to HDCP repeater, it6505 must support 127 downstream devices. "
> 
> And this will be only one change in a patch?

Let me repeat the phrase that you have quoted few lines above. "Split
the patch to fix one issue at a time." So, no, this will not be the only
change in the patch.

> 
> >> 
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 112 ++++++++++++++++++----------
> >>  1 file changed, 74 insertions(+), 38 deletions(-)
> >
> >-- 
> >With best wishes
> >Dmitry
> 
> BR,
> Hermes

-- 
With best wishes
Dmitry
