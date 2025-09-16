Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9DB5959A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3640510E369;
	Tue, 16 Sep 2025 11:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="Ix3XtjE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BBD10E369
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=9BnqEj9RHHv7quzPDQGpxHMHL8zNwveBfzJJlOw44Vo=; t=1758023700;
 x=1758455700; b=Ix3XtjE3fxAa1tQSRkkNijsLVusH2UM4QNGJLXeE+LI1Xx+/zcP44qXplbRud
 g5aDo/xo8779wh3pq8osfwf6leX8KklYvfSwtq+fprl/TdgG+7eGrFuaTF+07hrWheVF/24FbeCTJ
 h5ZXA/cZpYqkzHS/jDFtlwDbKa2bt5HwSCmIHgtt8v2QbOXKikMvCesBh+4+Km5ceRQnyL1sme+f1
 8T0v3FR3VjgQGiVld96GD8S0LH2Z5HuN9EfoZkiXpOVUFgn5DYCMGxBFVU1u1M63l4MVXreXcyY+u
 1xyrbkn/s9sHNM009nI5Oshzq+JkFchzVltPy/0i+7j08xn7hQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 id 1uyUGt-001mgL-0H; Tue, 16 Sep 2025 13:54:55 +0200
Message-ID: <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
Date: Tue, 16 Sep 2025 13:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.16 fae58d0155 prevents boot of google-tomato
 (mt8195)
To: ninelore <9l@9lo.re>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1758023700;
 ee98ee77; 
X-HE-SMSGID: 1uyUGt-001mgL-0H
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

Lo!

On 16.09.25 01:22, ninelore wrote:
> 
> starting with the bisected commit
> fae58d0155a979a8c414bbc12db09dd4b2f910d0 ("[v2] drm/mediatek: Fix
> device/node reference count leaks in mtk_drm_get_all_drm_priv") on
> 6.16.y my chromebook codenamed google-tomato with the SoC MT8195
> seems to hang while initializing drm. Kernel messages over serial
> show CPU stalls some minutes later. I am attaching the full kernel
> logs below.
> 
> This issue is present in 6.16.7, however not in v6.17-rc6

A problem caused by the upstream commit of the change you mentioned
above was fixed for v6.17-rc6, see 4de37a48b6b58f ("drm/mediatek: fix
potential OF node use-after-free") or
https://lore.kernel.org/all/20250829090345.21075-2-johan@kernel.org/

I wonder if that might fix your problem. It's currently scheduled to be
included in the next 6.16.y release.

Ciao, Thorsten
