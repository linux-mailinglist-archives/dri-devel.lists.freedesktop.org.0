Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B859A2DA52
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D60E10E1D5;
	Sun,  9 Feb 2025 02:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LKemN/fp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159B110E1D5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:03:17 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30227c56b11so34894061fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739066595; x=1739671395; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EeeZzWVf5/vhmXv9AEOt/1s5u145QYyGEt7ZWKzhLQM=;
 b=LKemN/fp3/NyMb2XHokWsK9kTnttLFbRUeAKAqo4QGAwBg6N4SjNzpmrqGMPzzahYe
 5JROvfoSyRDnUfFC3FRMIs0PhIRVGxfWRBauHzcCFPJv3h8hDctrdJLmN4niWdZ9cf7X
 BoONe/TIZzRXd5kG8mfENbBx8K9bDHSojdbo7NxglPVlUvK/RADtEMGYs4z/ugEQMFxj
 ZbjAuyFLaBf0+oX/Ya6r9BSeNq12kY1TWOxdX/z0L/M1ELA/LX1F1hA3gYiptNOTppET
 LjbWQxyb/rDtJNMCcQ31AZv4ZcvMM1lKW7vWBy48c1dvvQYon/HBikGYgWN4+ejZRc/d
 fwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739066595; x=1739671395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeeZzWVf5/vhmXv9AEOt/1s5u145QYyGEt7ZWKzhLQM=;
 b=P9KqKxek+hSjLsaoQPEsPXwOn1y4UbmN1AzwzmB+U9dDI9Oht9GtUranBb5P9sI8m2
 Buv5Ay779CB6SEuMiEaL5duyaQgj+gFctzwrPwdKpzAUw+ckgRLSPR1tTMblX6DmNCmG
 bh2Mg49JdOYNkn663c51XNsghxtnxu0Pgs1+2+gkwTrJS9VGs0gD/VKGEJ0YdEn31PAH
 XtqCPiQapcfX0GRL7UAS9pU+aCMafXh1catxAVp8fqB37s6IE6LHaHkNBL1ujFBqyhLw
 XD3+SsVz9mCqik802fYA4/2KA8ZICM6p0FLEwyLW4n9ETVkZWbGmTR9fxO7046TzaWec
 3w/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtuN5v782wn+uTCHd9p3OfkhBWpov5i6Zt85DNlfobLGrfWmF3puTENDHZ+DY55gVG0EHosMbUsWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+5XymATIyo9i+hwdv6VeCuQh2tuHbVEwdLBEz/wU4HivdZqw4
 zZrJf7XUEAYTNum3Lxi4kN0/lcMMxU/6FSdtrDrjaV4xpR7O0WkcDoC1PJqOrhU=
X-Gm-Gg: ASbGncvZ54LjmQairCr1adAH39lJPp/5VjIy5WJ5xi+zevdHnGn6Aq9JAv+GpK/o1Fu
 k3mDvczrQLwXo7R2ZGiUxTkZKbsUS+AL/gEZEdz7RL6p0cVW1G3Av5DhTy9DANJIBDPPdZI/k4B
 jhNpI8al2aTOdubCUqilGiziPACHCHBiMAJLRcxryld8Dub9Oiq7KBDRSsUsBHpHyGOe42SIhWw
 d987Gqo82I6h8CafebZPw1WNlz9y3Y5b1LWrDBMsMZhBYukaKZcVryJBort4YJJfGJ16YrhR/S+
 UxmdTlyg04vdOMJ1yzaFA1fjEvSZYLRzWcY6U2eltMBGvCcsRVMAPrkUN08tyrgTbI+76Bg=
X-Google-Smtp-Source: AGHT+IHY5xrwx7bXOZb5Z6RthMsSdn9sw/6mONLcYjPXUl5AfcW7b5fwlydWpYhPXPuU1dPWf8dH0Q==
X-Received: by 2002:a05:651c:1603:b0:302:210d:3b44 with SMTP id
 38308e7fff4ca-307e5a8de19mr26127411fa.35.1739066595390; 
 Sat, 08 Feb 2025 18:03:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2f8193sm8451191fa.111.2025.02.08.18.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:03:14 -0800 (PST)
Date: Sun, 9 Feb 2025 04:03:11 +0200
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
Subject: Re: [PATCH v2 08/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
Message-ID: <jmakx5twoivqyx2c5mkcwazgiuwi4csefsozmomussn7ppi2lu@pux4uen74old>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:36PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_tail() is the final part of an atomic commit,
> and is given a parameter with the drm_atomic_state being committed.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
