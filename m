Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A3AC4F0A
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CFC10E4C4;
	Tue, 27 May 2025 12:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nGEVK+5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3958610E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:59:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A73EF61137;
 Tue, 27 May 2025 12:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD79C4CEEB;
 Tue, 27 May 2025 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748350784;
 bh=G/1KIyH80nzu3tilmQtmDuLXk1YCEor3aOc7I81yUtE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=nGEVK+5WcSP6gw5lYN53GnJvNCl0wmH7+luQtkCuTFmxUvzkU0JApCpHcBw2H+e8X
 J1kwhMPO0k4acu7J4zg0VLh044d4MlqsVlhW7yGUg2xy9rqxW+TMYTtQXkM8Y93EI4
 BfaivoB49rOs179bGLe6/uLn+ZpSpttyp37YG5Ckfl37R5Hwin6/jLsav0TmUwW3pB
 dzAnn2QoYtWZ6cW78sIs43M4goOHHck/RYjxXTpfTbcVo/Q+IBw1+gbSfn1+ibCr+3
 LFTQg6aGc1RlMl0Ru3f9p8sbtXTNg6+sq4zdFZ/T+aqkBwXfZFXG+MbRGs0MNjDKmT
 DjhcRnqywdabQ==
Message-ID: <b1b422178ef37cf1629dc18cbe5344c6@kernel.org>
Date: Tue, 27 May 2025 12:59:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jared Kangas" <jkangas@redhat.com>
Subject: Re: [PATCH v3 1/3] Documentation: dma-buf: heaps: Fix code markup
In-Reply-To: <20250522191418.442390-2-jkangas@redhat.com>
References: <20250522191418.442390-2-jkangas@redhat.com>
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mripard@kernel.org, sumit.semwal@linaro.org,
 tjmercier@google.com, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Thu, 22 May 2025 12:14:16 -0700, Jared Kangas wrote:
> Code snippets should be wrapped in double backticks to follow
> reStructuredText semantics; the use of single backticks uses the
> :title-reference: role by default, which isn't quite what we want.
> Add double backticks to code snippets to fix this.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
