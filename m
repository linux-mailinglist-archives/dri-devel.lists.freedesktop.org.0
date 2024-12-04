Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181E9E3B5A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21E310ED13;
	Wed,  4 Dec 2024 13:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xx+Gd3xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20EA10ED13
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:36:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4349e4e252dso63267985e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 05:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733319411; x=1733924211; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7960s/O5mUmVapkBN/GngD9f9VoYAFaaF9ndN6PJOGg=;
 b=Xx+Gd3xva+nOQiZ8LQIJi5rxbNSCPdmkE45w9rZnEVS0mgX34VNKVwhFhzoEuSysA8
 9P+E3H4H/N6VuZUsS2Hyff40V9KgXa6wDJbNlbpXl7QYmYPJBtQuISoumXd+G2tyWVZH
 3a2Mx6DejpWT45IMRJzKxHBkYA5xrlbVGxHX/O1kpGUv+IlrzChPUK6QXEDZBDQg717Y
 yDqIxBn1g+ZVneSkNPoWzq665L1shA1oXnpD99AeeLzI1HJLaGixJsrF+80GjbJY06RG
 yRPOIds+cd5YRnUpzxiEXgOxzGjcDAtL+fnkhs52gG3HjIciVbFlEOOzi5io2c19NVbi
 qWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733319411; x=1733924211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7960s/O5mUmVapkBN/GngD9f9VoYAFaaF9ndN6PJOGg=;
 b=bT3YNOU7PEQu7mdPIy6v+7zBAymLHu3azNSDoSBP+3l9CcuV5A+bqP3qRDKcsyWCI7
 Y+W3zfU79omj5PV6IggzoroXS3zGOlPGz2UwIqDvPbojrd0/9Xbq7h4cNcWbcnlTFu18
 rNmpY+1WILsVJzC9xCmoAyTRnB78Rcyv90fIdqPtO/Xdja6qOAT3zUJuoQaKivNuQg2s
 zrCqaRf9M5N9ufl7IgamGOljIxAKlWRmVEKu78NP9gt2cFn/TkyE1I/+xVniC0AQAnHf
 RMsXX283D5SlD4xKE0w4mk6hRcGmtuFrElAbCou56AignhAKFSi/ikPY5shng9hJD5VE
 8DQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWv/bkkqWRKkjRnjpb/fL06OI3XSGRwM7KYG+O/5atWms8UEXs5w9pmMgPIqIR2j7wGTjmA6iD1YE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2co3als7i/0CaAANpUMVCAFIqkkouWmhju259/4Dut6A/Qoob
 Sz/Jpsdnf3Zg78uXTVmzVNZdXBKgAnGMpTWcz9Prpj7uDUQ9cZfl
X-Gm-Gg: ASbGncuDMUzMZwbKfzbUb+Spr7YgqztTG1afyISF8GWwTIk6k8zNRNc6kyMHpswY5HS
 2H5nSoKtSkf5KkeidT+qPl+bLddzPZP0fGu4eLLhOumOxuii+NSXx+nS0nvkh3//5JHHjVUoOW5
 7FOmLH8gsr//tceG6HyC4ISCXZgQ2yF23B5YTrXUt82CBddV7hyBJCIugTwhSD2LMw444hf0i0E
 ZAhdfmUGDf3SBWvrtk3GOW6IJmXa1/ehUbUsvzX1CTgBos3pV9/k3us2Xe2nzUoDZnCfyvHxHTj
 KuW6tcNEpg2Ih81jMq8Q
X-Google-Smtp-Source: AGHT+IHuqzXYWftCkApzMu0AjTlQnxeVbzqOP4HoXbEwEWHCLRq8r1nDjTgJnSq2bW4NJEewZimJmg==
X-Received: by 2002:a05:600c:3550:b0:434:a781:f5d5 with SMTP id
 5b1f17b1804b1-434d0a15047mr64205075e9.30.1733319411092; 
 Wed, 04 Dec 2024 05:36:51 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d43b8557sm23177705e9.1.2024.12.04.05.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 05:36:50 -0800 (PST)
Date: Wed, 4 Dec 2024 14:36:48 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <Z1Ba8CRrn9G7e6h4@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
 <Z1BVADAhfENdcc3y@tom-desktop>
 <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>
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

On Wed, Dec 04, 2024 at 03:33:09PM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 02:11:28PM +0100, Tommaso Merciai wrote:
> > Hi Dmitry,
> > 
> > On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > > > Hi Liu Ying,
> > > > Thanks for your review.
> > > > 
> > > > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > > 
> > > > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > > > and thereby support both JEIDA and VESA input formats.
> > > > > 
> > > > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > > > this patch actually only adds vesa-24 support.  So, to be more
> > > > > specific, the patch subject and commit message should reflect
> > > > > this rather than claim "Support VESA input format".
> > > > 
> > > > Fully agree, thanks.
> > > > I will fix that in v2 specifying vesa-24 like you suggest.
> > > > 
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > 
> > > > > Can you please send this patch with your Renesas email address
> > > > > instead of Gmail email address?
> > > > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > > > 
> > > > Thanks, for the point.
> > > > What about adding Acked-by: from my renesas email address?
> > > 
> > > Acked-by has a different meaning. I'd say that generally it's okay to
> > > have this light mismatch, see [1] or any of the emails that B4 generates
> > > for web-based submission.
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/
> > 
> > Thanks for sharing this example and for the clarification.
> > This is similar to my case :)
> > 
> > Then v1 procedure is correct?
> > I can use the same formatting (From: Sob:) for sending v2?
> 
> I think so

Oks, thanks for the feedback.

Regards,
Tommaso

> 
> > 
> > Thanks & Regards,
> > Tommaso
> > > 
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
