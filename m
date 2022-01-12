Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300748CBBC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 20:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40B10E2AF;
	Wed, 12 Jan 2022 19:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09810E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 19:17:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id C4AE51F453CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642015062;
 bh=Nm673CquIpUd7DH5oIeAGKy8gWnmmyZi5gLKio0coZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1NlySwXi9Mq46LTnbHlmU9+w5h9UFGwD/GT5S0E1nauO/9fTiAntg+rRVLqTRgcL
 bZ8L+P8HK5KjNnMmBqFHe4HF4u6dagvron5FRj0znfZx0KZnnfhFvCZwW23JXcuEJN
 no3XTJbFwfTyBoBOouG7XY4fmZfKpjywAtYbY9YBV2m+Ei+ieLgmxs7F3dWMKMilyB
 yj10+IErprgb6H1yn9eBHj0HFYG1HhLDCxZnjcu7v5v35hvpFRRhl0iIn64+xcQ66M
 0xYEXZgYNRZKhF0N6755n2MqTn68u6wBe//DK9ej9sKy6m2I5bDq621lSlKOMI9HFo
 KiBtKuFsuXhqA==
Date: Wed, 12 Jan 2022 14:17:34 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Remove features meant for userspace
Message-ID: <Yd8pTt2Bu/hITgva@maud>
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
 <20220109170920.2921-2-alyssa.rosenzweig@collabora.com>
 <c13f9381-120b-e891-bdda-86cfec39b31f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13f9381-120b-e891-bdda-86cfec39b31f@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> (although it's a good thing kbase never did this cleanup - it's a useful
> source of public information ;) )

Haha, yes. Actually, kbase did do the clean up recently (Valhall era
kbase, I guess). To be fair, I still don't know what some of these were,
like "T7xx pairing rules"... Presumably something dreadfully
Midgard-compiler specific.
