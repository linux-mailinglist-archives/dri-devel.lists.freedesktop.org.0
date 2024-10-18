Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302149A42AD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41210E132;
	Fri, 18 Oct 2024 15:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iE2uVE0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9C110E132
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:40:55 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso25536421fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729266054; x=1729870854; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w3bvwu3OzUWCf73MooSLxJMXXTcmaKvPuHjhrRvynjw=;
 b=iE2uVE0lGPCf1QFeKmzMgnbPO6WovbZAc681UAXO919ipLNXnrUbdNyc118PxhYGjF
 vllwDUQriKuwmNMi4j9nd5aRuckzZeJhFuamgRe4jgaUXxNvvLG2AZa4k/fBkhJtq4Y1
 S1uVBrGKcWKheyE3wfo/MrxaP6hr5OCpro73JQhwisrgAf5952Y71xE2cl/AyirBLnG3
 r5RTGxzbB6rjiqj6Ii/YPhIQtdMivTA7Ja15zbpLO0JZRIVByOLZnFcf9147k8Ndy/fn
 vq3VuAj+2WSmyk/DlhHgQjZBF8jLu7XaTuWFpxz4lsLJ0F+j+bLg4Pr56BHq7q0Q1A2r
 wB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729266054; x=1729870854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3bvwu3OzUWCf73MooSLxJMXXTcmaKvPuHjhrRvynjw=;
 b=Oh8S34k/fyx1lG3k14x+PhPvRqqZVNDK1+uWuqIM8oLHmPrlKnf8Er/fU+Q0MMxZBj
 Jk0Vwxaesqw3BqtIA6PUw8MMeV4/Cs2ckQ0TIf1dwFd4xYOx1Xym2krnFYgU5LY6GrH5
 Gu97BnUi7OQjVxJR8pH65U/RuKxBqWoaDId/y5OaHFpAP7sCtQ7jjeWho5tm8ixEDZGA
 WZAXOOXSuMvO3pmOzUevWWq3B6f5/TpeIjS+668pBUakgc9n1AH7HG0qa0S4nPDNTCAE
 XtfDMDDTdAdxxZ2gmrbKTgUmm4c6sm6zXzHEqOhyrjwdmuVxkByIXGaFk9r97sp/oyvX
 +INg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7M4CR+AqfJmTrfDpW/Ar5GrLEcgx/7uvEtmMfCxypxYwU4ELQcG5OW4V4EZsK/+DshSMhXSWmiqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhGOofN0MW9DlVGmUQE5qLLP3YXUUP0oYke05Jjs06TprUrkt7
 Sis5I3b9lWs/petcv6cXUjLsklKjq0v+340zZzQVHd27M7MWPM6xu4Qr+utqt80=
X-Google-Smtp-Source: AGHT+IFNy+IiwoNEkyZ2thYD/crdC0LJwLRi3uLBZU4IijiXr13fyi0mObCfVy8zlYe+NMMkBbwE/Q==
X-Received: by 2002:a2e:7c16:0:b0:2fa:d84a:bd8f with SMTP id
 38308e7fff4ca-2fb831e6dfemr12851361fa.30.1729266053851; 
 Fri, 18 Oct 2024 08:40:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809a69fesm2479441fa.11.2024.10.18.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 08:40:52 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:40:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/drm_mode_object: fix typo in kerneldoc
Message-ID: <exqgw35skr7mdllf47k7dejcex3lh23kx5jh3vv6ln3m22nlig@zbefnqjlohsr>
References: <20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com>
 <20241018-drm-small-improvements-v1-1-cc316e1a98c9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-drm-small-improvements-v1-1-cc316e1a98c9@bootlin.com>
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

On Fri, Oct 18, 2024 at 05:26:51PM +0200, Luca Ceresoli wrote:
> Remove unintended extra word.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  include/drm/drm_mode_object.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
