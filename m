Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C28CC8E9
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29910EE31;
	Wed, 22 May 2024 22:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MpokEWdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7AD10EE31
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:16:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52327368e59so7860270e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716416213; x=1717021013; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
 b=MpokEWdDCsMGou2J58Bg4dm+g7/CUNKu29Me4Vd7bUOASnYT2JKCg7DiPxwgnR7Lg6
 06SwmRJ1zbUzheenPPrkwGc9eX9tb0q8Xyf/PBvdt2qodr4WDNE45JKRZiJOT4kdAecO
 kkASmN1ruBaCpzIuhqa1Q/xOnDdimZsHJr3uJ75YVMjuF1WIfWiKSl099J3RcvI5d6At
 RcSx0afpDTvxuxWANxJmMKAUbhFZD4z1YmIKg7//yXb/3AGBAv+a9q28BxkIO0Ybh26F
 lf3iu64wdZjt5fQ5zlkLENBMhGDSAl8Ftj0igfoFZoGA03BzGi1xqR8F8euZkqOhBSL2
 sDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716416213; x=1717021013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
 b=qp5DHyyOBELQOLDyZh7CoZ1ERPyQwJar4iatm2IivA6ArEDSAicmbGkQFNTPzGaiIX
 LLzdUe+h4vCS6rrvlzDiKvOkyEEKJfQb0dVxKMS1b1MpgnuaNnfuIK6l3Ezs2qDKR1sr
 E80ujKO9LUIk+4Vi2SZg0PDBI3YSwYP8jfNE5B3JCsJNITdC2uRkpEqRASwn0zOlnROb
 GYGx8dq22Bxnu7+kks/rCU8Ho+81wEfndfKiQl/4XE1M5pPKU53dwLzj7EoHk81mVwCe
 7K71u2FldJTMGZLoFpKuREWE71hxwKXnoKlGiKX8dkwn6b8IcLwrlRtOAESihq0rOT8B
 CzOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUffBQEmx1tHQq1OYvYI3iZxNuSCGvmjqBhcijoGG0q427G6ldQ1e4C8yzvwEqMOt0qghhkCZHkr67mU7oV8LlGSnRFINqfqIXsiyntww0X
X-Gm-Message-State: AOJu0Yy1XZy9bTupd3kQC5UGE5paZu0275J1LgI5ECrl38bdeS91ll0Q
 RXMi4Jq2Q/R/l6ha1aCVpTywoiC7hl750LKP3V7J6y5qsAT+PymHQAvymtmSS1s=
X-Google-Smtp-Source: AGHT+IEuFGymLQfp5rTalVoB9wZNPMs9O3YdvgJXkOez5hZ61Aob79NQskger3tI6SZIHM2Dj+fRCw==
X-Received: by 2002:ac2:5ec6:0:b0:523:8a79:ed62 with SMTP id
 2adb3069b0e04-526bed9e8famr2047667e87.3.1716416213020; 
 Wed, 22 May 2024 15:16:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5238f6fee2csm2840002e87.181.2024.05.22.15.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:16:52 -0700 (PDT)
Date: Thu, 23 May 2024 01:16:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 03/28] drm/tests: connector: Add tests for
 drmm_connector_hdmi_init
Message-ID: <ex52reilea7p7fkayf47cuewa4cpuaxpq2ezr7f6cvflmpugc5@bbeo6uvs32kj>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:36PM +0200, Maxime Ripard wrote:
> We just introduced a new initialization function for our connectors, so
> let's build a kunit test suite for it as well.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
