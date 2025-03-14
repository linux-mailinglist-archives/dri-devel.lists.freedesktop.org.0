Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F4A61309
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535B10EA05;
	Fri, 14 Mar 2025 13:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF93010E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:50:00 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741960199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/5knLVWhNBfFd9leGBuomV+x3A+6TFi+unjjwXKU9A=;
 b=lOsXBqWeOxXWT0gOrCN3WOhGLcXDVZdCKgBO8Q1mGUvv40abQIWsL7ssDOv6qdWGheoAG9
 ezTredyQIJiwhlwKbxo51HTlHrdI5wW7lz5f6ccBvlsEBS6wOV4upPfOI0lDCKwD3qLrlv
 4iqOEr36zm0gf+YxEeruohTXmvW36Gmrug5lB/8m5uut7hkEWL9s/YfYNpfVhdtHhmhHrG
 SpNj/CcSrvhHCRUd+M7IPWRTVjsXFixjl62cP1UrvQIpN7mOFelLDws0e1hGJ9AC7oWEbM
 NppZ5wfWU00hKS7BKQ333bAqfizMSk+dNjWYANtOqQ1QEl+adFwoeyEOcYscgg==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20250310-apple-twiddled-modifiers-v4-1-1ccac9544808@rosenzweig.io>
References: <20250310-apple-twiddled-modifiers-v4-1-1ccac9544808@rosenzweig.io>
Subject: Re: [PATCH v4] drm: add modifiers for Apple GPU layouts
Message-Id: <174196019716.15076.15894537454426268004.b4-ty@rosenzweig.io>
Date: Fri, 14 Mar 2025 09:49:57 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On Mon, 10 Mar 2025 15:28:02 -0400, Alyssa Rosenzweig wrote:
> Apple GPUs support non-linear "GPU-tiled" image layouts. Add modifiers
> for these layouts. Mesa requires these modifiers to share non-linear
> buffers across processes, but no other userspace or kernel support is
> required/expected.
> 
> These layouts are notably not used for interchange across hardware
> blocks (e.g. with the display controller). There are other layouts for
> that but we don't support them either in userspace or kernelspace yet
> (even downstream), so we don't add modifiers here.
> 
> [...]

Applied, thanks!

[1/1] drm: add modifiers for Apple GPU layouts
      commit: c8619f5402cbcccfe58151b53421029852473e4c

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

