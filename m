Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F9A1B2CD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360CB10E937;
	Fri, 24 Jan 2025 09:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZAzlpI2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4E10E944
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:40:32 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-385e3621518so954204f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737711631; x=1738316431; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IkdPPp/+MED8ATVhe3nI0w778RyEvrM4KyJhH0kDjG8=;
 b=ZAzlpI2hqcs+hpodfs0GXqDQS3p5qDmBB9XcXve0Vq4XNer5xwIeuytR6ocZu4Jncp
 xLEfW4XwHV5fplKp/aa319wRCkBInQX2oQ97m4OuoBpk9c4lI/ClgLVJfctqK2YShDw3
 45Qxy9bYVS1RRI0LcHN5nO1bd0JPp9MKND4JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737711631; x=1738316431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IkdPPp/+MED8ATVhe3nI0w778RyEvrM4KyJhH0kDjG8=;
 b=v8C2MvVgtZl4TpK7sFcvkcTwz/s6sbi9l1NTGy9mfbBd8hDC7WU5kgjKI0JHwYG5hj
 PngDzjsFF/j0S0oxT1mU10VuJAmfJE1I5mXhW7GqHsx6shgznUiCFMTVGCtUZQi+6Me4
 xnd+ifzUcLWoBiUbixhpHXBH6sNKb+25ZbfK0M5M2o9yLDozFziZ3j+qdj2Y0wGb8Ovp
 dxuKncWOk/pKuus7q0Mbk9ue7pzMr09Ry0+s6drQWJ9Wg/9Hh/eb8N2Mbx2o45d+oxdW
 kcxhfXDNOSxSXn4QdtEny7mHLH2teZBh8v78GQECak42SwJsCLsIW+1oVnfYuX3BVlTz
 EQ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpytyNkKyn77JvliTmMXympUVxw7klGAO7iTowXr582JD6Rv+SLa3Vqsvy3Ftf2A2F+7VcCdgzG7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl9+Qp0nCi6qUkANagquslHC2+iqeY4IELDqZ/GfBFSTUPMb/i
 HBlmf8zs3L1A5Rvykl95GCksxaJcQ6ZrsSmVboh9+DIbd70FdH84RTTiMqbWCyc=
X-Gm-Gg: ASbGncvfMnQsP1eNFXUCrTZ3aa2NnLUJb+4O28ZprEz5S+dC2oUahlpA5GAjZZgy+Wf
 nC6jz7DeXus6v8t+Fhmjg5uj8h2CxrlEQzJC5TXjmTxIKvACcSiSJUOyGxFv7hmTyDRoqRncLIY
 ReUaJoxdkH/T5bqYQui6tP8W0qem074y81nzhYSw5ennUCfAEzfKOMH7Y3IEuLxUDZnajxXk5G5
 APh5tC6istMSQU3lvznUqzbF6At5FJl4SQ8j8RuGpNjXO3HrwzlRk/mcKPSqUcGId43F16HZ5Nw
 o1WPibza4v0eTobI
X-Google-Smtp-Source: AGHT+IFqTg+1FdOn8Hjo2TJQYIa43o1u+Diw99BiRdztYrMGteooQY3WzGMlmxn52PDTLPNzGmL3Ng==
X-Received: by 2002:a5d:64ee:0:b0:385:f1f2:13ee with SMTP id
 ffacd0b85a97d-38bf57b9426mr28026393f8f.46.1737711631085; 
 Fri, 24 Jan 2025 01:40:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb02dsm2147352f8f.70.2025.01.24.01.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:40:30 -0800 (PST)
Date: Fri, 24 Jan 2025 10:40:28 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: noralf@tronnes.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: =?iso-8859-1?Q?Re?=
 =?iso-8859-1?Q?move_Noralf_Tr=F8nnes?= as driver maintainer
Message-ID: <Z5NgDExm2ONu5Su1@phenom.ffwll.local>
Mail-Followup-To: noralf@tronnes.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250123-remove-myself-as-maintainer-v1-1-cc3ab7cd98ae@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123-remove-myself-as-maintainer-v1-1-cc3ab7cd98ae@tronnes.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

Dear Noralf

On Thu, Jan 23, 2025 at 05:34:25PM +0100, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Remove myself as maintainer for gud, mi0283qt, panel-mipi-dbi and repaper.
> My fatigue illness has finally closed the door on doing development of
> even moderate complexity so it's sad to let this go.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

As much as it pains me:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Was great to have you around while it was possible, I'll miss you. And
will you push this last one yourself?

Cheers, Sima

> ---
>  MAINTAINERS | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b038382481f99e336a2de0d2249537ec6781463..ed86d884ee0dfeede2ee185f7779380d04c5080b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7173,8 +7173,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
>  F:	drivers/gpu/drm/panel/panel-edp.c
>  
>  DRM DRIVER FOR GENERIC USB DISPLAY
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>  W:	https://github.com/notro/gud/wiki
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/gud/
> @@ -7279,15 +7278,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/mgag200/
>  
>  DRM DRIVER FOR MI0283QT
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>  F:	drivers/gpu/drm/tiny/mi0283qt.c
>  
>  DRM DRIVER FOR MIPI DBI compatible panels
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>  W:	https://github.com/notro/panel-mipi-dbi/wiki
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -7384,8 +7381,7 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
>  F:	drivers/gpu/drm/bridge/parade-ps8640.c
>  
>  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
> -M:	Noralf Trønnes <noralf@tronnes.org>
> -S:	Maintained
> +S:	Orphan
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/repaper.txt
>  F:	drivers/gpu/drm/tiny/repaper.c
> 
> ---
> base-commit: a9301e5bef12f8989a02d886109f13e89e1e51b0
> change-id: 20250122-remove-myself-as-maintainer-7540b245ab05
> 
> Best regards,
> -- 
> Noralf Trønnes <noralf@tronnes.org>
> 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
