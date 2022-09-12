Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC05B63DF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 01:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DF410E498;
	Mon, 12 Sep 2022 22:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F710E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 22:59:45 +0000 (UTC)
Received: from maud (unknown [184.175.40.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A34A86601F54;
 Mon, 12 Sep 2022 23:59:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663023584;
 bh=6qs3iq7/cteC/lNtHpew9e8Z3NmRmVscilVlsOaWg0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a66cnwr+hxbdwJgIZBgOhWR57VldSLQA29xk5+qIfMhYjFGrzE4t9mKMlZT8OrbyJ
 KI98cc48kxIXmdD1Yz9f3GOIG6EB5yKcBXcTPdRyO8f2l/4p8yu9oMtcjR6QrgI3Fm
 ZIEuem007Smfb9uzIwG2PFj5Ac6CEyYK3GYPyggCRhfyjtEtg0+dkaHyJYBvBypS8x
 shOw410i1UuT09wHS/VI+MXZ44sGyBu8OhNNku0j40YAgM8iLSEaOKYA4WI5rEIxu0
 IqhF+1EvTSAWH4jOsPyAkgj6Mnp88/7rPAYmbSV5CBa3tf5j6tjCSu5lDX4pe1u+OX
 LoB09CU5hepdQ==
Date: Mon, 12 Sep 2022 18:59:37 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Give name to anonymous coredump object union
Message-ID: <Yx+52RO7cmClypn2@maud>
References: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912164413.2181937-1-adrian.larumbe@collabora.com>
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Have we checked that this actually fixes the Mesa build? If so, R-b.

> Commit 730c2bf4ad39 ("drm/panfrost: Add support for devcoredump")
> introduces one such union, breaking the Mesa build.
> 
> Give it a name, and also rename pan_reg_hdr structure because it will
> always be prefixed by the union name.
> 
> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7195
> 
> Signed-off-by: Adri??n Larumbe <adrian.larumbe@collabora.com>

In Mesa, we would add a trailer "Fixes: 730c2bf4ad39 ("drm/panfrost: Add
support for devcoredump")". If the kernel does the same (I don't
remember), we should do that here, seeing as the panfrost uapi headers
do need to build as C++.
