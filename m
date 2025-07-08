Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95626AFDB2A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 00:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA31110E1E1;
	Tue,  8 Jul 2025 22:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HUkfwIrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9310E1E1;
 Tue,  8 Jul 2025 22:36:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 941845C4C0C;
 Tue,  8 Jul 2025 22:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A123C4CEED;
 Tue,  8 Jul 2025 22:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752014201;
 bh=5eoOYGA9ThdPasjjaFLkqUooNYXBJMphrUYEZiQOngU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HUkfwIrKYe4yXb5NBG1KoccZhUKQPBdFlNK62U9rIYDAPMr06PhwM7Q3Q6s52yQfy
 4IXqJh+w/vzYbPNAPc6V4QuLlSf1K1BJj6aV6E7ZFR1Vua/BgXPLarQox7ArKkTEXn
 ve5dDmBDoJKRiIGq+hxUrLIHHbFR9dmBUG28Fqf9ZhgHspjWSsh+rGns19+aFnTfSt
 kRxC9dbPMkibdZ8UUWaxKHnaVbth3nM6YNzjWLIv8MSdmdf/PGfvWHjm4n5XXM6PzI
 aosWu7wwL8AOyi/YVcg2OqnLxYEKiv+YnM+eELOHW4f+nZD5aTqAGxpJahDN5hNsal
 n14J5lPQiWGJA==
Date: Wed, 9 Jul 2025 00:36:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v4 0/8] Documentation for nova-core
Message-ID: <aG2dcwDOVlh3ePGa@cassiopeiae>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
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

On Tue, Jul 08, 2025 at 03:49:40PM +0900, Alexandre Courbot wrote:
> This series adds some documentation that was relevant to the FWSEC-FRTS
> [1] series, but wasn't sent alongside it as it was worked on in
> parallel.

Joel, thanks a lot for this series. It's great to have this documentation --
very much appreciated.

Applied to nova-next, thanks!
