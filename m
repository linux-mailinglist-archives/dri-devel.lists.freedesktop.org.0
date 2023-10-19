Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1467CF596
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 12:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E50010E4BB;
	Thu, 19 Oct 2023 10:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C64210E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 10:46:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-40837396b1eso4269505e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697712366; x=1698317166; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bBFPC1W9JfYkOPUTHB+LS5qEIq4e4n3tK1Kfz+QseaQ=;
 b=dvTusXc3q9woobbz+1u/Kt/qldsvPFIE5Dk/TKyn9MkWPO6EH4YRcRXWMxROxm+iz2
 x2d1urwYbi2vGFuIQcrz1AuT5y1xUuqBi5g9iix/CpsSlKVT/yCZbA2Nq9CN4rXotQdw
 QkVn0ft/j5CNOcKtYKy8Hn6OZBQMRu+ucmeso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697712366; x=1698317166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBFPC1W9JfYkOPUTHB+LS5qEIq4e4n3tK1Kfz+QseaQ=;
 b=ABsBkKI0Ic43qUyT6hDcVnsKEprq3J8sVS6bosFB4Ii+4O9/XMB7x1a1L+MpbwP3na
 3VZKHgKvIUSlmzVf66LITfP04Bmq5F5T+X5R/PLGGEMS82mPiLAr3EKs/Q441yAEvcIy
 v7MAoYEh1QEN+wBlgpBBMVXjxmoh+IYI9cE5CC0hvle8JY1LIeLnfAdJC+a1wDo2vidl
 SDn1QAMVpeBmOypK9RNUKdGpy2vBvWyITCPrJJHnfyEIFL0Lxjdyd7oNtuWTp2bHgdB0
 w058lR7jlXONzEGzJBFF9wmdktZw1oI16S+i1WSHTIFW7AUaQXuwAvYLQmhtALT6onJi
 LDhQ==
X-Gm-Message-State: AOJu0YytUR42WEAnwcIczZwxEXvY+nvBrYvqoeEnTqVkj91hTXIUE5h3
 HZxoaBzNHXZ4ZNDRFX28FBsmCA==
X-Google-Smtp-Source: AGHT+IHIag6yx93aD79WIMVRKGT+miwBolzwjxU1ay/0wwOSTWLjJvKRZQX5PUfQf7c/e70mqJq7eA==
X-Received: by 2002:a05:600c:2256:b0:404:7606:a871 with SMTP id
 a22-20020a05600c225600b004047606a871mr1444242wmm.2.1697712365569; 
 Thu, 19 Oct 2023 03:46:05 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (44.red-81-39-191.dynamicip.rima-tde.net. [81.39.191.44])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004060f0a0fd5sm4105381wmq.13.2023.10.19.03.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 03:46:05 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:46:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-ID: <ZTEI6rcW9M8Q1Tqv@dvetter-linux.ger.corp.intel.com>
References: <20231019094609.251787-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019094609.251787-1-mripard@kernel.org>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 11:46:09AM +0200, Maxime Ripard wrote:
> Flaky tests can be very difficult to reproduce after the facts, which
> will make it even harder to ever fix.
> 
> Let's document the metadata we agreed on to provide more context to
> anyone trying to address these fixes.
> 
> Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Not that my opinion matters much since I'm really not involved in the
details, and no opinion on the specific format and all that, but this
sounds like a very good idea too me.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
> ---
>  Documentation/gpu/automated_testing.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 469b6fb65c30..2dd0e221c2c3 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specific hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regardless of
>  the result. They will still be run.
>  
> +Each new flake entry must be associated with a link to a bug report to
> +the author of the affected driver, the board name or Device Tree name of
> +the board, the first kernel version affected, and an approximation of
> +the failure rate.
> +
> +They should be provided under the following format::
> +
> +  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Board Name: broken-board.dtb
> +  # Version: 6.6-rc1
> +  # Failure Rate: 100
> +  flaky-test
> +
>  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>  -----------------------------------------------------------
>  
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
