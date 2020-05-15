Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA31D422F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 02:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6D6E3C4;
	Fri, 15 May 2020 00:40:01 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D524E6E3C4
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 00:39:59 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u5so172035pgn.5
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
 b=ncWP6c8T/qeB5mTi8dmQ/2f++LBk5CizP09+SlPJnyCzgNs/XM3OV3LABFolMAuaaE
 UYHUIc3yE2lEXImqHTT1olFACAUL2RuRf0qtmuTLimsMw3ZEFjzxm4slAwvUIDb2cFT/
 wcJNyV8sDtE3sXgsivVXiTYvixU3wl/p0/67k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
 b=OLAwqBNXhUxgiCKxR8nEQf4OmXF7RneSaDwjMh2mdU5eT5tDZ2z3/gFKrkJJ3IpFRO
 2BsnAvvkUXI0nQg+rmt9hydESZMbLBszUSD/iO/yZHSlY7wNPycloue6p5boCoc5nC9z
 QXDsa7rCC2pTTVNdsq54sI039/DJF6SmkQGWfme9hUoimKZuK9SibRo2oEGg/moo7qZL
 0axX618WCqZhYHNbq4q4TmH6fFnDbtKk9hSIweI+1B8goEbOnG9ca+pA35hhLjLnHP7R
 jhOs0/lS2JZbG9qvskTthxB5Do4qhihM3MlpmkT3jkA2b7+wtSbHqp3R0HC6z9CAEury
 wJeg==
X-Gm-Message-State: AOAM531DfAWJWgozJyOpsujj2wA7fKz4Galc5a9pra6/Ax71CTo3Vevb
 ed0hGRhpK39q5ltxD2BB/ABDlA==
X-Google-Smtp-Source: ABdhPJyyWhg/HZloV77tc/5SwAYHguc5UciRxuk4OrFHLyBPk1weM70XMcLYipySphGQrca0OnCZSQ==
X-Received: by 2002:a62:3343:: with SMTP id z64mr1187982pfz.55.1589503199243; 
 Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 138sm334556pfz.31.2020.05.14.17.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 17:39:58 -0700 (PDT)
Date: Thu, 14 May 2020 17:39:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515003957.GV4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
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

On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> This patch changes the plumbing to send the devfreq recommended opp rather
> than the frequency. Also consolidate and rearrange the code in a6xx to set
> the GPU frequency and the icc vote in preparation for the upcoming
> changes for GPU->DDR scaling votes.

Could this be relatively easily split in two patches, one passing the OPP
instead of the frequency, and another doing the consolidation? It typically
makes reviewing easier when logically unrelated changes are done in separate
patches.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
