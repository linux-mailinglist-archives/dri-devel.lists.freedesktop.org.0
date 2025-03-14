Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3DA60B38
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E72E10E339;
	Fri, 14 Mar 2025 08:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hkwD3EPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACFE10E339
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:23:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D9485C5A4B;
 Fri, 14 Mar 2025 08:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E451C4CEE3;
 Fri, 14 Mar 2025 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741940599;
 bh=1s++ZSJYRJcgQ+c8JYiNCM2fJc19mYYu/ys3sTIVp2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hkwD3EPW9wiwvqzLgJ/WlgFFsD0dnwBfDX+B70vpkoOqv9rGFD8ISY0UAXS8DVah0
 aOLoKxY1Im22LhmAfJ7xe1/mOVZFDXUZqFaZt1nfthh+WnzTudYH6+na8OA3HsIMRf
 lte2zDvUk+UNZmLvlGpgEbsP77astv5B/IjMDJjboEGbh4/9mFhgzb7cLf6Vxd6X+S
 p1zmzDc3VWILSPZNDj/CU0iR1wJ9nHuAU4HzGx6F2hkfY/SR+7sLoHlLdiNLQaaS6N
 4Nk9f2lieI380gLLR3s5gmyQ2fqTvSQu7E0gob+t3jP8E9+5UJ2irFFC/mUIjAjkaB
 I9ifBuR8qquWg==
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/2] drm/display: HDMI documentation improvements
Date: Fri, 14 Mar 2025 09:23:14 +0100
Message-ID: <174194058300.3849846.7214502528190866925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
References: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 12 Mar 2025 14:39:15 +0100, Maxime Ripard wrote:
> These patches improve the HDMI infrastructure documentation, in
> particular to mention that edid-decode can help debug and check
> infoframes issues.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
