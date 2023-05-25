Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB617110C4
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5CD10E6BD;
	Thu, 25 May 2023 16:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67EF10E6BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:19:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6e68cc738so2220805e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685031573; x=1687623573;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oo9T7GK+jbRQ9eOS44On2zC9exINDDuwo1UWaQaAt78=;
 b=gMHY+8NdSrO5i4LyeBGwX3eZgd9bQRZnIwSprRznTz8Oen5wN/0a1Xr559oJ56z9JC
 fBwt0VK/RT2SVUjE/sju7D2xe98B4t3W+j1+bo9wqGd7OltURuwblH/LlpcqAsYOEibs
 bPXSqNj3wFvJujEsBEmugC8hQxIJiE64apYbm6WqZhXE/x5hQrIqT6uSMmXGvLkFtlRA
 9Q1jTNg392nqz+FnTA/vmbrq8VqapSgmd5UxyFwkvSqSoKz1xlZLJrqvK3Io6sfEGtFJ
 EGvF1ZWyhAJ67XvTdjU2AX0oACpQf7CwoQvOD4brzBKsgKiW4ivrAl2ejKcs20Y51rBY
 VQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685031573; x=1687623573;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oo9T7GK+jbRQ9eOS44On2zC9exINDDuwo1UWaQaAt78=;
 b=Fw4/9m5TizzrFgeJvbCtOQzRgkz+sLb4r/kyHZ2ShuGpGQpbt8TQo9610No3vcEfrx
 QrWuW/UDkFWP9ItvLFR2UmslW2qLi36pazhp1n0S9MJ9rRgF4A7tz285n6UlC6aG4yUh
 910PhxIwRYqJbGMcxTMWzrIltwTQGII1ZzWHuHss8d0Ag2R/YMJLYMAbdCDCc/5Lao5/
 hRcwgLV5WKGsC3op0QzWBUgYJk1JYRklcEpqCHT6rek/SSF0FVIE1xfBLDC83NvRXmjV
 lV0bkjsqojTb8fX9o+cjg1XMeTXCNGZ2wtalNHpdUAO5OBfnCjiCOWXd6bUfSHWR0xGC
 EIRQ==
X-Gm-Message-State: AC+VfDy/G1h4roMnBUE4Zld6lXJIHJa7T/RsHikukBHpjlIIn+du1ysF
 TeNpOc9M6w/J/dtErYOz4nOK4Q==
X-Google-Smtp-Source: ACHHUZ4DmL510dvOwiMbbDJ3r61jwvMEn4idjQJT0Vc/XDMbtesNIzQhRgVBeUKQJBad73ZX/RhuNw==
X-Received: by 2002:a5d:500d:0:b0:306:37a2:6e56 with SMTP id
 e13-20020a5d500d000000b0030637a26e56mr3123738wrt.5.1685031572900; 
 Thu, 25 May 2023 09:19:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056000194700b00307bc4e39e5sm2240017wry.117.2023.05.25.09.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 09:19:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230516071949.375264-1-alexander.stein@ew.tq-group.com>
References: <20230516071949.375264-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: tc358767: explicitly set readable
 registers
Message-Id: <168503157203.1160623.3275920622627092687.b4-ty@linaro.org>
Date: Thu, 25 May 2023 18:19:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 16 May 2023 09:19:49 +0200, Alexander Stein wrote:
> This map was created from register map from datasheet (section 5.1.2).
> Unused registers are stated by address, so they show up in debugfs as well.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: tc358767: explicitly set readable registers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=abd686b8c38a094631884aa7b8cb04cc32b6608a

-- 
Neil

