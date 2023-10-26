Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB617D8167
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26510E7B2;
	Thu, 26 Oct 2023 10:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F7910E7B3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:58:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A25D633C9;
 Thu, 26 Oct 2023 10:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B89C433C7;
 Thu, 26 Oct 2023 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698317934;
 bh=e6BxQapcGylzTPC35xsBUMrS/FoZiq7tCog+x91oBu8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=S7ITvb33vwjz0qqNrRQXfQ0pNSkGru0h4LPfftN/m9B5G7SIWwF4jmzsUtEHIrLrW
 3JqoJp6+VNwQOmM8UEpXg7RQHkD+OSXxpyetCIHjLrSEukn1/CEZTQQ+ZC7t/R9J4P
 XUfHBxjfcnZipLRpVrX6bfUaaoF84J3fgtyAZhF3bI2FYVOB956lGVoM6jPkQMhg8E
 0hByUWHs7BET3k0xnkQnWoRcJZlvRO3LA/1xRVmPhquP3G1YdB1CI+A7o+Hvbmfji4
 DLDXnf/i62zQKAp/wsHKQwWdDXpKqmin+XjADlPkix0qAzi40xco6jGimDfuMYFRNY
 mwiHyJzfNRkSA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231025142441.745947-1-mripard@kernel.org>
References: <20231025142441.745947-1-mripard@kernel.org>
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for
 flaky tests
Message-Id: <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 12:58:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
> Flaky tests can be very difficult to reproduce after the facts, which
> will make it even harder to ever fix.
> 
> Let's document the metadata we agreed on to provide more context to
> anyone trying to address these fixes.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

