Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6FB8A9910
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352BE113BF7;
	Thu, 18 Apr 2024 11:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AEC/Av9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01081113BF7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA135CE17A6;
 Thu, 18 Apr 2024 11:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8071C113CC;
 Thu, 18 Apr 2024 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713441115;
 bh=5iEX6sYmBTqYbMZE9ykFUQH93wsKnNweXP0HaVJDx28=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=AEC/Av9HzgbqUBPiE0k8aiMEheEhQllz1n/GorWapovYFI9UdRlCzIfNROujSpTzG
 FvzVzRpOlga3pxwpKhis9I5bq4JwMSFqk8lo3nEwsiJFaWeUjSljMPGEoOfchN7FgO
 AS9r4wgdvgrHRqmUX4Zsiyv77AA7Xt5kcJ64uClfD9+sp8gwLdBGCHnN8f/sTgWXs4
 Q5EolDW758j5fG4+RnLLxEjmroJXGBvhrwSdVqCNukmk1vg6IJ9QI29tOKNpQxvukd
 HXoYazB+nizTnfSM2FHYGzI5x8WDyvVv8TxYR4A4znWcY3lCHbeK7iwozxUz20s9Bt
 4DpjxS0pj3xVg==
Message-ID: <e41a55b353be60bed11ec6da450e4c56@kernel.org>
Date: Thu, 18 Apr 2024 11:51:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 07/15] drm/vc4: hdmi: switch to struct drm_edid
In-Reply-To: <eabece3ca7fae28395dcad0d2c221113cd924180.1713273659.git.jani.nikula@intel.com>
References: <eabece3ca7fae28395dcad0d2c221113cd924180.1713273659.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 16 Apr 2024 16:22:21 +0300, Jani Nikula wrote:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
