Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B1A34A3B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C2310EB31;
	Thu, 13 Feb 2025 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iGAWilrl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58ACA10EB31
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:40:51 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30737db1ab1so11437921fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464850; x=1740069650; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nsPlqa+XTMTRmx7s7nIfzGqoebmJYSoLC3HQNsZuS7I=;
 b=iGAWilrlf+UFGae90ShEmGcRn9ljiBJ7ZqCs9uVwcEbPwrXkeLeaYSLT7lhwMA6Qwc
 VW576xdv7meDawqPZtXlndFfrCZQJU1o72M3z/34yGWAy3cnG+oF+/UQ3xmmjL5LPp5o
 Op2rnMdGLOHqfuh1TlpfUC0jpoAbxLA1qpnCEZYe3KnAxqwo7Z7OY+b9HkM/GMef1qBv
 TZapMA8AYr8hN/+Br+dXrm/ErM/o8y9cvvD1REZ/7AiWHtVZU4EncTH5WPPMkSHUezkS
 PY1VL/pZqFADoObgTEf2Q6XDpXa74l5HJ/v8szz0Ji7vkAFvHcwVs4HTs8W6PN9m7RtQ
 I5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464850; x=1740069650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsPlqa+XTMTRmx7s7nIfzGqoebmJYSoLC3HQNsZuS7I=;
 b=eYFX+AMElYp9aFARWmA0x2+2Cl3aM3pxVdYkETITy0vVts8HL15bRV5AwwpWDb8YNr
 3gOuQ0appOhl0Hgma4KP0rJAZRmnZt0mMC06xlHbWCQvmaDVScEQiXVDEe/3PgESrf22
 42CM2vjvphBJCtacmViBP2sB96UYYZOzajjWjw0zC8UUhzoRQSTRL67t15E9/HM6xoZm
 hz7s2SEK9yLB49l9G+OZWzjdRh+GxYcxdy2HIduSB4lhXE2Q1jOQ5ceEsIBn9WTMXKuY
 j6sITsV1wNtqQ4IdpQGvIfLm/H5qrV6utBjhO2r6EN1LShMBMXwH+osox6h/mZc20yCH
 Dpyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkzeOJ1W7NAvMwK+wgF8CvHXZAUJmgj8YXUJ4/M7ydFqQthpBxZqxvkg+GPd3/HanjQVIbmsaVgNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYMHRwnUa83WpeVWJBqP8lorJt5t9ishEwJAYXfvYBnCPhnd9B
 yL5AFOdchK9MA6FmuZmz3j4N4x8lzOm4u+rpv3hAUxsvuGr6rnTtfiBmDa34TNw=
X-Gm-Gg: ASbGncuKSFwqdWmiSSWBO12X3wP4DzXbjP9mDWhgYw2UAxkc+kjIis9AOmibjAydYmO
 zO5d035AQ+Cy3SY5ZiCto6ty8aGqowOopx7e0UYieiHEWpHm+cyxFLYWtat1Ze32Ae8tySB2M2r
 RK0eYZEmxL9aDQYc2vUCW8Eh4lZkI/GzU6EoeoyN9B7ZkiGvLQCEs3yIsTOA1mhgrruJSkTg9ma
 7ByFNjBYtndegXkPIlmnhi+unfix84+ybfSXlrAsGLFvsGura/IKaWlWcyLit8rcNqKNpSgzwV7
 YL1ObR3P+5IlC/M57utvibYXCbwUcX/glfj9KSPMygS27aPuyS3nizdyTK1MMwiK6NZHS58=
X-Google-Smtp-Source: AGHT+IGip08e5QTGk3qyb9I5cPtwD3jegXUdt4j8V13l5pv6V2QbFSdwK/CpTAFSowcbbEVHqypdqg==
X-Received: by 2002:a2e:7c14:0:b0:308:f580:72a8 with SMTP id
 38308e7fff4ca-309037c2656mr26625411fa.11.1739464849643; 
 Thu, 13 Feb 2025 08:40:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309102767b4sm2462881fa.78.2025.02.13.08.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:40:48 -0800 (PST)
Date: Thu, 13 Feb 2025 18:40:47 +0200
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
Subject: Re: [PATCH v3 23/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_vblanks()
Message-ID: <demffp3zswofiu6e2mee6g3p42k6qvfchnbgirn2xok47t477i@aodrfqjpejho>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-23-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-23-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:42PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_wait_for_vblanks() waits for vblank events on all the
> CRTCs affected by a commit. It takes the drm_atomic_state being
> committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
