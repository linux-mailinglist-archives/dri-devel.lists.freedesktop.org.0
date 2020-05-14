Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB01D41E1
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 01:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA376E3BB;
	Thu, 14 May 2020 23:56:19 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017AD6E3BB
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 23:56:17 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so168047pjb.5
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
 b=hzggQepQrsKGGnBsKsAANMRY17+1T0uMxt3OSRHq07nFJRt3KU5oRuA+Eo5PsWfqs+
 PFCm8AqB0mGEx18uOYHt+Lq7Ec3Xank+8pNhj4oDSf+u4lUtGp76aHY4RkH+YZphAaRt
 R/ShiS2/ZyKNvNg3n6iPwASRzJF7ENniMAaps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
 b=Jd1B0PYnyoD/yK/0i8qBY8ht0jBEj+SMcvIN9+IpGJ3yQ/UYcDU3xdEjbKhdSJ4/+l
 Ith9CEcDyk9lcUx36+kGT26I7DnuVskWQQl9k5XWWt2N1GBH8SCFJBUTu65Xvn3ftTB9
 b8q2+xPXg/bbqes7rNMUu13IqbO9MtXw4aHVn9qromoeViaRLK6u5geB+13IxKfpplmK
 cNiUlz8BgJpiwDdrn/5Vs0PDqSJaW8FHZ9fhLbIgKrm2/SElMkiC1vJx4x7/kl4NqQ32
 MGfh1GyjeFAJIiiIeaWdzN1bNeGxGAOj5aUe70KtIqhNh66ChyFJOVlndC7oHEOWRdkT
 Flag==
X-Gm-Message-State: AOAM532G5VkDmwE4E7XWyFA7rloc5Fc/Xh7V4JPTR6bTooC6aI7dn114
 ozHG/YuIagF/E6yTtC54fZEoWQ==
X-Google-Smtp-Source: ABdhPJyi+LzUx1kJiRE6ItqiavOmXdW/8OwRjVGekQrbAMGtyQUoyeqnUTlfgO4bMCWn2eddMBgRCQ==
X-Received: by 2002:a17:902:c487:: with SMTP id
 n7mr979410plx.316.1589500577438; 
 Thu, 14 May 2020 16:56:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w14sm260208pgo.75.2020.05.14.16.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:56:16 -0700 (PDT)
Date: Thu, 14 May 2020 16:56:15 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200514235615.GT4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:13PM +0530, Sharat Masetty wrote:

> Subject: [PATCH 0/6] Add support for GPU DDR BW scaling

For anything but the first version the subject (for all patches) should
include the version (i.e. [v2, 0/6], etc for this series).

> This is a rework of my previous series [1], but this time based on the bindings
> from Georgi [2] + a few fixes which look to be fixed in v8 of Georgi's series
> [3]. The work is based on the chromeOS tip.

Chrome OS is irrelevant here, the series should be based on Linus' or
one of the relevant maintainer trees (+ the patches it depends on).
If it is actually based on the Chrome OS kernel tree (v5.4 I imagine)
there will likely be conflicts which will make maintainers unhappy.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
