Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E070A54F77
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9F10E2BF;
	Thu,  6 Mar 2025 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cmwn1x+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C010E839
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:48:03 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-223cc017ef5so15935895ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1741276083; x=1741880883;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/OI6qWkzSL42ENObYHFHYvCUsETCfZznWv+xdQF4mt4=;
 b=cmwn1x+MgxgT+9ihQ0qa/6Gog+9E5XxhVXiql+1xFZtB1223z3wmEqjdtIWjO8xl+A
 juW937lk1PO8/S0gWYsEiXyhXlMqTP1hvUOCTmBcaSLrB3hsyknX40X3bZmZML5lb/gI
 n7kpVyFMdzBJmkcl+48irN0fN3TO2H+i3GBZr75Rp6I8Bj2SjPhJ6ngZoVupSsJwsXHo
 HHrC/QSuOEMcQ2orgxzT1i/oLyN3i55p3gXsR2BpAUk9vkf9OItzzzKTWs0V5gbqGVMA
 rX/OPuU9tKcH/DhM4Wp+XLNhpcb/k367CHEEQPTnX2xJv1NLgcXbbTA1h33ehfP1ydOc
 ka1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741276083; x=1741880883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/OI6qWkzSL42ENObYHFHYvCUsETCfZznWv+xdQF4mt4=;
 b=CwHWTUgcH3hMJvl9RW81Db/knpkC0pfKLPjeeV5An9ND5JWGipCK9vqe7fSlNcuYj0
 xvyRT92y9bmYzXQQjAF9aSRFdHEV1rGngWTzmoy0wX+EZQJZcxzoRMHBzeobm0ULVo30
 xc6K/TEJXpljUpKXto3wGnz2Fj1bbswwjrA1MtAtRE/AED9VEGBTeBLguP4EMQtMUmKG
 oRadE/HXs/ZlYs+9lSOQahrxtkPVtCdY7/qr1+dFnHAThfS40Qa6vB+gRiXUOsmtY/sY
 6Pg/KfP+vE9wSZ39U4hhjsX6/9C0dtsxv0uofaIqZMJ+ySDrZDzhE/eyfpO6FRf6OAxQ
 HD/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXARwXoVunZzOogn7QWrrUGmKqjo51YXLZfwlr8Mx3A2cHSHxbyuDfBLfNep3tDQV4FE0KF81wGlks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN7NPAjHWxuBPVUfk02tpdFnO7um425/+htR4J16MYw5md4FgS
 CFSsmCTvIBlsfreXyrcaDxX1R0B2B0kv5g1awQ5KKHV6LNaLNal+TdkxcbLijL0K6fjAlcXlZE0
 6rJrIv2rWrocO0AoccaQowI0PgWVGr2yqojVApQ==
X-Gm-Gg: ASbGncuKyv4o3MQk5Cees72/at/CqAd4wb0LXJrJSu/wIh1opkUwYj3BBxXDyT2ws23
 li8SNmiCJP8TkdukFvh9eP2Q3cJ1dDCYVnOiMLYdHasvzX2FXV/nvc4CM5fjoFpkWyYlBxOxKRn
 M+tMFGm6aTVyB2xPK3TE9OHJg+xJ9cMtqMeHKEJSiMKOfCxD1ThOrUYVS64w==
X-Google-Smtp-Source: AGHT+IHdH9LY7zK/Q0pWZb9VOvETaJ79jmjeJJTfURtSwN6QJfJvhZaPVX/aXAeMTzGfATxm32kbiX1wlMowGWPYNJg=
X-Received: by 2002:a05:6a00:2d9a:b0:736:4ebd:e5a with SMTP id
 d2e1a72fcca58-73682cfa781mr11104081b3a.20.1741276083262; Thu, 06 Mar 2025
 07:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
In-Reply-To: <20250306-delectable-quixotic-polecat-ecd2c3@houat>
From: David Turner <david.turner@raspberrypi.com>
Date: Thu, 6 Mar 2025 15:47:27 +0000
X-Gm-Features: AQ5f1Jqspy5s7bBncwIT9FkLCyjrZ2w8bgfIcgASFwW7Hu0kjHYkImdZGmJ3bSw
Message-ID: <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

On Thu, 6 Mar 2025 at 13:39, Maxime Ripard <mripard@kernel.org> wrote:
> It looks fairly generic to me. Is there any reason you didn't put it in
> the HDMI audio helpers?

I originally wrote the downstream patch last year on 6.6, before the
generic HDMI audio code existed.

I just had a look at doing this.  At the moment drm_hdmi_audio_helper
doesn't manage the snd_soc_card (needed to setup the jack) at all,
that still lives in vc4_hdmi_audio, so I can't see an easy way to move
this over without a lot more reorganising.

David
