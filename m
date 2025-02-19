Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF6A3BE67
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9303410E2CF;
	Wed, 19 Feb 2025 12:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cJy0g+CY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1555610E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:45:47 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so68014141fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739969145; x=1740573945; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
 b=cJy0g+CYYuYKGTlMpPTIaM13eWvhW+5NkO+AhLTKDRm6LGSQr5kEomIrKX+6S1nltS
 ZupvT7eknY9O+m1FOImDWYIyD4G0QxcEW8Pf/AfAiT7IxKEcHfZHfJgoRch2IA1G1rXe
 h8jjJgdUBl39dqvuyvfqcJBaScz05zPxmkastaA1NJvvmFKmuoknLiRaGGGlcF+sxAta
 qJXBuqMeaIWJkx2kcnaLYjaOK1lXirL5tsPSLG5NVGCxUvb+70UDBEB2X9OzJuDe/lT5
 J5PK5MR635ela83tWuK3198y9tyP35pC7tGUkCqhN3RRrbJmLNF0dS0JisAuoMOcva0c
 nhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969145; x=1740573945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
 b=Qq117WVB/UnWJSNwlf7xRewfD6Mc+9hJwrt6DIrjir7ZRUEsd8vLIbFdqJTE10jiQH
 9P1elEHqXvqId4HDfi3sDNyedNI/AGyl0oDxEj47oGrAWOMKRHnmw54fCEw1Ko45lqTZ
 0sOcI9ZmnoeC4v2uCGFw2t49NBSX1w3CLtC0YPoliPx9WaPIDqjxlWk6r6VxHOqI3jCI
 bxLBENf80EZpdaQOYy34ek+NgYwieW5SMWd/jlL/9+Pj1NgZQ0yBkl6Vcj4Z1cyvunvH
 nZ7Yl7vSIYzsjnzJrXSNsv8W95wWW22AfjPjyrYyC/1goqHYRl+IChpeYLbka8f63WbG
 +65Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7f+voplZIStk4UKv81E/T37f6xKItWUaPQKZCJgGWbgZsmAGj63zex2i4PGP7rGx6k3RRR7GFPDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp72J7LZvytpd/ULbbRrcsCjlSMJYRq68cjML/eAeiDYqexcYE
 +QBazLtHT8EhsvEUw9rAbIZ9DT5AKkbMSenxbJxB4F2qejBQnBhOAiPvaF8Lza+GQhNhWIcX0lm
 v
X-Gm-Gg: ASbGnct5p5V0IMVSSSC2OjBEL1dTAxY6cqBYRyw4jxGbPljLyP78++etfUg+Xpcsw9T
 J+xZxrA97XvIz+L7hEKSRx2hquowalCdRES6Li6tX0KNT6HLo/c4PDlh3DzxelS5yQmyhc24M41
 m7yseus2P/zzfjM37L/hgcvfbd18TXwyFsqibE2p2/V3hCr8DmJMbNVuCA9U19vbuXyt4flHklH
 5Auf9B/CuwSoCIKGYUyzcoWg5hpsIqeGJcPA4xgZmG98mVW1iSdbobRFqMNd5o46RxWWh3v7itj
 YXeeqaFleOKwsnRS23w4kY+kwr/8/hSFQ5NS7lyGYG2lpSei682AONH6ig9gf4zCpELBFL4=
X-Google-Smtp-Source: AGHT+IHqzXvswBBHdB6BuGTvdIaOpP/9m10nx1rxuNNktCu7rOUQ1riauWad8Yd8fM2T5tKt6/n/Ow==
X-Received: by 2002:a2e:780c:0:b0:302:40ee:4c2e with SMTP id
 38308e7fff4ca-30a44dac851mr10131541fa.2.1739969145292; 
 Wed, 19 Feb 2025 04:45:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3092fb236cbsm14835491fa.69.2025.02.19.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:45:44 -0800 (PST)
Date: Wed, 19 Feb 2025 14:45:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 jonathan@marek.ca, quic_jesszhan@quicinc.com, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Message-ID: <lwtvnlt7rfmsbdgyo32fs4mx2xbcyrnjsjq53nkk5pdzrpqgox@nn27ythhg23k>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
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

On Wed, Feb 19, 2025 at 12:07:12PM +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
