Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FD87300F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 08:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729D10EBC8;
	Wed,  6 Mar 2024 07:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="yH/ZJ/LP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B035810EBC8;
 Wed,  6 Mar 2024 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:Reply-To:MIME-Version:Date:Message-ID:
 From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=v2Qokh0H4nQ8Uerb1M5MYDQB0W979+jRDY/Cb/gZBOc=; t=1709711821;
 x=1710143821; b=yH/ZJ/LPxwC4gJStq/2weq+QZcg2BGNK7eAH2LCc0j/mk7SJte/PQC+cn+zje
 pYMSnOeGs2ooV9+4i+gAUxgfURIh8bS3iBaZ2p2jSGVVftfRoKl0j+vqkk7LqTydhLculqOCY6xEy
 5Ghtd/XzDDrsy1d1EOFOu1q9ziXJAPQWPZYRNNhbaG7iGYAYGhwRs9fI+wdIiR6XwduluiYh7b7ql
 /hNVhgYVpu3y3GJoeMyTB5HmF2Hop7biOcPZ8FHBs2AcmnRsjhgT/rNY9xQ9UtMbaPyQ2xLaXHB1r
 XUb3QfDi+c7uZyNBWgAxY5LAPtfqmjG5r3vGUM38WFXfWzTYrA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rhm94-0004A4-HI; Wed, 06 Mar 2024 08:56:58 +0100
Message-ID: <4e55f6fd-8875-4a61-9070-f0ecad8082ea@leemhuis.info>
Date: Wed, 6 Mar 2024 08:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] drm/msm: drm-msm-next-2024-02-29 for v6.9
Content-Language: en-US, de-DE
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAF6AEGtCq=CObbqKNOswWZdPw5dL8jq8BxD_hxP7kOCePUwNrg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAF6AEGtCq=CObbqKNOswWZdPw5dL8jq8BxD_hxP7kOCePUwNrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1709711821;
 06b6289e; 
X-HE-SMSGID: 1rhm94-0004A4-HI
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.02.24 20:04, Rob Clark wrote:
> 
> This is the main pull for v6.9, description below.
> 
> [...]
>
> GPU:
> - fix sc7180 UBWC config

Why was that queued for 6.9? That is a fix for a 6.8 regression that for
untrained eyes like mine does not look overly dangerous (but of course I
might be wrong with that).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
