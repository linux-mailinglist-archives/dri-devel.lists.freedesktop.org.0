Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13CA1390E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3C10E944;
	Thu, 16 Jan 2025 11:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UJwarFjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135810E944
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:34:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso4815445e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 03:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737027255; x=1737632055; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4MJGnyq9Jr4SltNGHPkGuJ4PxUjxoIzJSXslir8OU0=;
 b=UJwarFjSP62i4mGESJSETGPd0dukP3d875IiIfIzgPVmaM9AoBaCYXCZ8NHmplG+YD
 XRdxSxDAEfpPL1jyxryBdy6Uu/ErJruSxaAqSxsxiv1+IPi75/FaH0EFy9dQ7m34I7yn
 gTIN+uiNxW3IF3XA+3cQDTPjlL1qxqOdoU+XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737027255; x=1737632055;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4MJGnyq9Jr4SltNGHPkGuJ4PxUjxoIzJSXslir8OU0=;
 b=K6jmfrG4aIHj8+7BOXiQUmH9cEdMG493ohsT5O4JomqQszpHFLHmfLhDGTl32eeAUB
 wpDCWNAUxyzViKs0Lq+qfRoZpDM1CRyfNlz83gg22xrhjQJunrJ5GJcTzPATm2xsUL7y
 /2H9mHblq4xqDgHxxV3gT6uZ1XjFJkeraUNbX8bTaZ2253Dfvvb0kYi6e3PbtTKr+gdN
 dlTjMvusDC9ou74bYYJSCA7kdwcZ671c3wtpfRBpqQliNSh8VGJWeZXgxiue5DWaxdyk
 I8+9z3F0qAsw/10t+gTtZfkt9pMAFUs/D9UZ89ZFSNXDWujZLQL3xCne5VuJtDwUiCq1
 V4/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8yZigrJ0hULqyWtoXDN+3u4U1NDwQ/3UM6q1pMP/lFaY1r0rayyhj4llv80364pJQMJqM9d67pK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg7YEpelLABzJDFWl20TuwGJaCxzVbg1fo9+6D5OGt+IQOic/O
 DbYcPAQbCkFV943CgZEWxulHimgF2YuAQJZinGW3WLpuiFccI6Awd9QaFLjGG7ffGpqVlpa7LLn
 j
X-Gm-Gg: ASbGncuDKRaMfwS8sMIVsH8QARvaF4VyT/7m84xvChS/c+oRm60awhTUo5aIv+nLyE9
 ZRYmKge29XGXI3rDtGurIu7HJMn47ddMix5DxbFJAm6CvtToBwPbHjDPS8L4CFRUP0rybShjmRR
 NSOlRaBw5UFfL4PL31NV7sLVjofpWV/bz695KQVidHjRKrMgevYzWq6oL0Gn36cYa6QfEHS8yZr
 Ucf9RKmrG4xVGFaPu9nq9yjddhDXgoAkIVbodT7wmp70/BXeEsKgaj9dXWny0e2/tAm
X-Google-Smtp-Source: AGHT+IErj50kwukc85huKkCJYLaART5mT2IODUndO+0Igb2Ypw4ChGIORsEB547GA+IhAvPghnXWOw==
X-Received: by 2002:a05:600c:5125:b0:434:eb73:b0c0 with SMTP id
 5b1f17b1804b1-436e266f994mr334857565e9.5.1737027255152; 
 Thu, 16 Jan 2025 03:34:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7528076sm57644835e9.25.2025.01.16.03.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 03:34:14 -0800 (PST)
Date: Thu, 16 Jan 2025 12:34:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/29] drm/bridge: Rename atomic hooks parameters to drop
 old prefix
Message-ID: <Z4jutByAKEF0cPs3@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-22-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-22-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:29PM +0100, Maxime Ripard wrote:
> All the bridge atomic hooks were using the old_bridge_state name for
> their drm_bridge_state parameter. However, this state is the current
> state being committed for all of them, which ends up being confusing.
> 
> Let's rename it to bridge_state for all of them.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..8e18130be8bb85fc2463917dde9bf1d281934184 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -303,11 +303,11 @@ struct drm_bridge_funcs {
>  	 * there is one) when this callback is called.
>  	 *
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
>  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> -				  struct drm_bridge_state *old_bridge_state);
> +				  struct drm_bridge_state *bridge_state);
>  
>  	/**
>  	 * @atomic_enable:
>  	 *
>  	 * This callback should enable the bridge. It is called right after
> @@ -323,11 +323,11 @@ struct drm_bridge_funcs {
>  	 * chain if there is one.
>  	 *
>  	 * The @atomic_enable callback is optional.
>  	 */
>  	void (*atomic_enable)(struct drm_bridge *bridge,
> -			      struct drm_bridge_state *old_bridge_state);
> +			      struct drm_bridge_state *bridge_state);

Checked this one, and it very clearly passes the old state. Because the
new state you can get by looking at bridge->state. So this looks very
wrong.

If you want to fully update the pattern, pass the drm_atomic_state
instead, and let callbacks lookup any additional states they use as
needed.
-Sima

>  	/**
>  	 * @atomic_disable:
>  	 *
>  	 * This callback should disable the bridge. It is called right before
>  	 * the preceding element in the display pipe is disabled. If the
> @@ -340,11 +340,11 @@ struct drm_bridge_funcs {
>  	 * signals) feeding it is still running when this callback is called.
>  	 *
>  	 * The @atomic_disable callback is optional.
>  	 */
>  	void (*atomic_disable)(struct drm_bridge *bridge,
> -			       struct drm_bridge_state *old_bridge_state);
> +			       struct drm_bridge_state *bridge_state);
>  
>  	/**
>  	 * @atomic_post_disable:
>  	 *
>  	 * This callback should disable the bridge. It is called right after the
> @@ -359,11 +359,11 @@ struct drm_bridge_funcs {
>  	 * called.
>  	 *
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> -				    struct drm_bridge_state *old_bridge_state);
> +				    struct drm_bridge_state *bridge_state);
>  
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current bridge state object (which is guaranteed to be
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
