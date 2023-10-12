Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C27C67DF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8610E44D;
	Thu, 12 Oct 2023 08:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3F310E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:46:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8497561D0D;
 Thu, 12 Oct 2023 08:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BEC433C8;
 Thu, 12 Oct 2023 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697100359;
 bh=7mxnM53+nn0jTR8CYqrcjxMadVuQePPv6iqgMSWERGs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oAuNaEjXa8L/p9QRGnjlto5Qx0MSKD2ZvDCF57wGtahEndrebicCJbX2EWCOiTnLq
 IcYGnArQqOlYWWgaPMTUZBPH3bYM4EveAG8aImaebZ/BUrmuWTPaZ5Gv/SHoNyP6Ac
 paeHAo1cixoiqy/QqjRYz55skufzyT/0jOt55bzsM/u1dzCxSOI6whEYqIzyMBVh2O
 QpBZa6kcevMlmydUVjpj1e72gnr/JxU/5epxzGU+93LfxWd9Q0lWcYTZWrdlUuKe/l
 e7BrSjZVGbun/OiQP9fsmh9zyvS9haplBp8oFgovtirk4A2Hkf3NPNzhhbb8lgqv18
 5yywkpz5UzSjw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
In-Reply-To: <20231005135648.2317298-1-willy@infradead.org>
References: <20231005135648.2317298-1-willy@infradead.org>
Subject: Re: (subset) [PATCH] drm: Do not overrun array in drm_gem_get_pages()
Message-Id: <169710035649.2154889.9854709966386177590.b4-ty@kernel.org>
Date: Thu, 12 Oct 2023 10:45:56 +0200
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Oct 2023 14:56:47 +0100, Matthew Wilcox (Oracle) wrote:
> If the shared memory object is larger than the DRM object that it backs,
> we can overrun the page array.  Limit the number of pages we install
> from each folio to prevent this.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

