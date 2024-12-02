Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385B9E0CE4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 21:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623FA10E160;
	Mon,  2 Dec 2024 20:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FSyWn66b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED48610E160
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 20:17:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53ddb99e9dcso4775512e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733170651; x=1733775451; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSOZUaWM6UVq98PpTNnQpkrkRkDljZofVJ+kuHxXceE=;
 b=FSyWn66b1+K0yvxOMnSNx5y9gTGuybHBhdgUkcysqUZFkk9z9URo9HnltUQff9m7Fc
 oP+mJE7YKF9xwApMvyR/WGv03oNpi2JlF9EIuRwsEVDwmOHnX7bR7TqsASVKDDG+jDGV
 z9AvpbEV38+zCRa1mQws5//5Ils8XI+It2tDGWAnkMFw+MtsSrL2Z+USQTOsAMj7G5od
 L+44a1bdSrZVpe+194/3+5TBYRe+9irN/3UBfwc/9mY80rSdqQBTIHzbKCyrQiqBcJV9
 rUCaQ3wgG3+3iQ38xQmuclAVxqoneqZ9GCJJRMt50H0UxQGF1a3EosDA2eChFK64XYM+
 yb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733170651; x=1733775451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSOZUaWM6UVq98PpTNnQpkrkRkDljZofVJ+kuHxXceE=;
 b=mfbaFWxtK3+qLq8JT8tjjLnlsrUKNanoDDo74xbIsoedJIcC1lSm6gBqVi+RveXv3g
 YuktNQ2VNK8YzqUCmE1nZ+2D4AdWuOLz4ebwEnx/q0JvGDYZpi+zfgBHOE+BeYeM71zr
 Z47r52mO0PaEQ7U23QXugnugatSva3InB5daWzR4i5KbxyRQo8IyGuatP5VBXG26ckR6
 KqOVY9yL2BDBYeZqDPhLs6BEg6w0aANvS2JQJDyu4aedtUOVbNZzH7r8ONxCW6IAtdGx
 82tYKsjagTWyQTBjASOXMkmsPgHlzk+CxXAlZ8uP+TJ40W1FzDSmMbTxqVlXiyVMKwEI
 gujg==
X-Gm-Message-State: AOJu0YxHCCLCgfvEBRmAh+dB7qGWDxxSFcYyxeg4ZoEtI5ohzOPzOC/O
 ed5fdQCEdzq17NfN3w/Dj3Tq1xu7Uw/DpaDrupPuyquODFEQ9POmalOrJLmlwnU=
X-Gm-Gg: ASbGncumrrUsTWHEVNo9Gv8N6YyOIKMu0nenw+PtTqUg16z7wUk9R7oLdqjFIBk9tm6
 NJzRE3cBA+b0oBhBNkDJpoFTmQ3Tus4voIL++kihAyh1tlTcgTToZ2DX5e5qihF2LlOhkHITB87
 0zvju2MyKmnxHVYcB+SPwXuI3MxisInLdS76mpbCBJYU8ua751hHVOUg7h1n7dIsbrfK1nvlzSX
 ww3d2KAAuA6JwMhIcwLCJG870olXLuh3J7nV1YPHgsPIen3Pw5RHJZ8D1tNHuygtzimjNzI3B+r
 m4Y1T7lRkou4Vhjt9aYkT4xyoWwfYg==
X-Google-Smtp-Source: AGHT+IE8ST0bwLbSj51EGqesWa2zKUzT5iGs/kOniciw/rDW3u1+BgMZbowH6eYd76ohoaRbreQM3A==
X-Received: by 2002:a05:6512:3e14:b0:53d:d44b:57bf with SMTP id
 2adb3069b0e04-53df00d79e7mr14006935e87.20.1733170651018; 
 Mon, 02 Dec 2024 12:17:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6431206sm1564903e87.19.2024.12.02.12.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 12:17:29 -0800 (PST)
Date: Mon, 2 Dec 2024 22:17:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Derek Foreman <derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, kernel@collabora.com
Subject: Re: [PATCH] drm/connector: Allow clearing HDMI infoframes
Message-ID: <iwup4nwc7bedssvvjvgks7leownk4gki45nrwlc3x6ubimjzi5@tim26dsdjq5u>
References: <20241202181939.724011-1-derek.foreman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202181939.724011-1-derek.foreman@collabora.com>
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

On Mon, Dec 02, 2024 at 12:19:39PM -0600, Derek Foreman wrote:
> Our infoframe setting code currently lacks the ability to clear
> infoframes. For some of the infoframes, we only need to replace them,
> so if an error occurred when generating a new infoframe we would leave
> a stale frame instead of clearing the frame.
> 
> However, the Dynamic Range and Mastering (DRM) infoframe should only
> be present when displaying HDR content (ie: the HDR_OUTPUT_METADATA blob
> is set). If we can't clear infoframes, the stale DRM infoframe will
> remain and we can never set the display back to SDR mode.
> 
> With this change, we clear infoframes when they can not, or should not,
> be generated. This fixes switching to an SDR mode from an HDR one.
> 
> Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
