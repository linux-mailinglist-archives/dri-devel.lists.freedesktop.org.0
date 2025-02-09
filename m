Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970BA2DA50
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF26B10E1CA;
	Sun,  9 Feb 2025 02:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lMyBY4Nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514E110E1CA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:01:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5450622b325so680933e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739066502; x=1739671302; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2PGp1XgnxteHu9RdPhVH5sY4q1WTjnO00NTGkJChuoM=;
 b=lMyBY4Nq75L7PQ6kx8wHffzpkE8SWXAShBnPVYhQTR1QgFvWwYNgmjpMACV1Y/Ei83
 PFFyIwWJgy5j4YhnAqDdD3tbu7DqHXLZQXEXYJD0drXbVt5ZOZMh6o1MxS+LdPrG7Lky
 qxXilwpdTEj7TGZpcRaiSQ6fgJbyV/oIPc1V670glp5Fgv6U4pflj1oFRWCIQrk7Y+x9
 0QRXaRtJKPBZgnelhwh/zZJMtUNq542qXIP4rd35SUcb47uBAmcazyrhagLSbLAkuv5l
 /JP6ySP159rjlmBzljpooHA6Zqlyt72e9pzWyv5AS/WtN1CfoIUrJqMxS4qM5GelL1+0
 Q2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739066502; x=1739671302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PGp1XgnxteHu9RdPhVH5sY4q1WTjnO00NTGkJChuoM=;
 b=TrHek4nxLjolxM8UcldrMTQRpsuuwYG1OExh9XTBm163P6+iJoTIW+T31uJZGb3O05
 ke4F6yRL5qiGpUdLABr8I+2DR9tKHx8FTI/kvcXOc4/WNQLBoqM6pCEY9oalJnoUQiPy
 5vC9/Wgb1K2R8LZcat1cNPnSi8AsOsXEAcFr/1bvPuzBCanAEvmbsM+hrGFxH+0Kcc87
 BSVsIvj01pLAK3YmcuCJn7ADJH8lyZjR8zQZg4xXkmSeomcPg10SjgTDC9YwE7Rxpreq
 nEmkTzOLfR7Yfjg40c3aYZ9HDybngaaAhIw+FxNP538VDWKVTov5BcCjUcVXfB0WQcJj
 lvKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvvdJjQ4+8paeklwELfesOJ6oEPn/UG2n8oOE8IczBghQ1Brflf3jAnItmbP5RuJijiQJxL51WW34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxefV/FTqQlq1+vhphC8cw1otQjyI5WDkaRMBdjcs3FTDZKzu4Y
 BSamTYvprYrb3tdMQsO0KWMw2xoscJK21HYaKTfBrXKoKQU6GtjtNuG4/gM9+Dc=
X-Gm-Gg: ASbGnctuY+WFwNcJ1zta0DwOYRDrz/+fhLoMOwKaNRJPJQUoTOWX4FfMIGCGUmzCTBu
 E0IiDYAlg+2leTGrweAhB0u0vmLXoS1U6sQDxL0DbvrSSnvRLqHyttdP5UAl0dB5f18/2x3oX0W
 LNzxxku8EVYEZHLfqzn6N6DXMpjt4OdHuyX6+tkVl3oyC46/fpc8SJxWf2+vBHi5G9WE67h8ylX
 AwwXtSe2ziWxlodTTZPNQhWvsvh+VYRsnyoYboGb7ifZBdEsYc3kvBfKzAhsOwlsttRHlKyHvD2
 28B+Y0dZ77pUkTyaqq+tl44i7aCDtHym08XTPS1b1S1DHTO0gvHzKUc77YEUxMXq9vWCBfI=
X-Google-Smtp-Source: AGHT+IGJS1+g4puxkPbuLs8WIzLmSKlUfwG5DYlgVtVpvbpfwu+I92SkzuZNAQBNdSTJnZpCoPa0/A==
X-Received: by 2002:a05:6512:159e:b0:540:1c18:4e38 with SMTP id
 2adb3069b0e04-54414aa88bemr2594802e87.28.1739066502582; 
 Sat, 08 Feb 2025 18:01:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a36fa4asm28876e87.167.2025.02.08.18.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:01:41 -0800 (PST)
Date: Sun, 9 Feb 2025 04:01:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_dependencies()
Message-ID: <ttjrs6vggvbwc7rprctmkigjusd6gog4pxysicxdxtweeojflp@zm7nh7zvfq5q>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:35PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_wait_for_dependencies() waits for all the dependencies
> a commit has before going forward with it. It takes the drm_atomic_state
> being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
