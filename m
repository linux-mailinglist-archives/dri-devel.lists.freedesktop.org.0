Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BDD905B75
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5010E8D9;
	Wed, 12 Jun 2024 18:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yq8kldBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163E910E8DE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 18:50:15 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebed33cbadso1316501fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718218213; x=1718823013; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6NjYmegOgGYNhcpDDZKmoKBQxNKIEWn/rR4O3QSBcqc=;
 b=yq8kldByTAnScYiVXqP4//NraZNi59c4j7HZP6SazhKwIiAj+a6bUI0Al69UhOpIkC
 mi4HYu/zxVyjBw18s2Wi3nA0xcZ4AOcb/ALHSUAiRvdGeBa9MoI5cBTwVQP+CO/lUJHy
 XfLKj1YpJPFxFfsoaVYWTyIs6xOUGu5L1hX1WifQaut3kIB2YtU63VL6et+B3G+6FyQ9
 aZk0qIAjFrO3r7blw2RKnBVUCsbUvNeqSEm9/h/DOUggc0/tUqZOzFlNPBRjWLfkNffk
 XobB0n8lrk9PQKOATn9ZG1Borh4cltE97WOtXL67iVPKlf23aHoyffErMhWJQu92sRUU
 v7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718218213; x=1718823013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NjYmegOgGYNhcpDDZKmoKBQxNKIEWn/rR4O3QSBcqc=;
 b=wVuVSGdeN3iXLrp4TJstEAF1iI/9jAnwFk+dFU1hbp/dkL7rluyVkOZkmG++MKcAjG
 YbiQH9XW5KeZ6w2lr6fN1fq1P+26CvXN4cOR/txVNqP+fUHPzlG4nvLIx7zziKafWWRX
 uWX0Orpkr8s3fZ6SnV2BQ8bpXHzwrAY7SOAPS7ZCNFb/BeaM62fibacd9wvLql5NpOQc
 9HLediqOUPcB+V6N/Pr+KvTOLpBkCfys170yeCId43dNGkgyyblikjrK7NG7b41zO47g
 gxgoDmbJJEhOpX1gbVHeNnCNuQoaVkmwcocJd0NFjmGdgumZDr5acYaJq3ecEXuuFdTa
 n2dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2WvhCd77hTbTLFCtKj4j8mlZhQZRioWfXGN9S+Wd9l8qrTIRe9AKvwvQfKkRtcUWrRHCaW2Sj51dPddMrxTv68Enqr5P0NPT3jHqvu7vp
X-Gm-Message-State: AOJu0YwIrDqzG9w0zVPC0x9StDztdVQNnWiRX4JgWX2R8wjjxXT9a7Cw
 OecRnzWZrGy5wppTsXnKrVFF5cSp7fDB9XbCqZH95Ce+BHeqespkGwuzPCJ6r7U=
X-Google-Smtp-Source: AGHT+IGVSOtOEYm8t+tqYTfwcYnrU/mWmoEEN5ecTCoD/H46fXlyAPX3sCNCsVsHzssEPRHW+PHTpQ==
X-Received: by 2002:a2e:a30a:0:b0:2eb:1de9:bede with SMTP id
 38308e7fff4ca-2ebfc9abc5cmr15140731fa.51.1718218213391; 
 Wed, 12 Jun 2024 11:50:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ebe4169b35sm16677301fa.135.2024.06.12.11.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 11:50:13 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:50:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/panel: truly-nt35521: transition to mipi_dsi
 wrapped functions
Message-ID: <k5cfzjqguuievp6dg7eagnpk5v4yy7o2uwr4dbtubdmzdv2l2s@5eh6iqw2aene>
References: <20240612163946.488684-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612163946.488684-1-tejasvipin76@gmail.com>
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

On Wed, Jun 12, 2024 at 10:09:42PM +0530, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> sony tulip truly nt35521 panel.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Fix code style
>     - Changed calls to mipi_dsi_msleep
> 
> Changes in v2:
>     - Fix patch format
>     - Fix code style
> 
> v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com/
> 
> v2: https://lore.kernel.org/all/3288287d-8344-4b37-a333-722cf12fef13@gmail.com/
> ---
>  .../panel/panel-sony-tulip-truly-nt35521.c    | 433 +++++++++---------
>  1 file changed, 207 insertions(+), 226 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
