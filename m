Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED247A11C6C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B29C10E566;
	Wed, 15 Jan 2025 08:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GXiR539S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427FA10E566
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17D8EA41923;
 Wed, 15 Jan 2025 08:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B9C4CEDF;
 Wed, 15 Jan 2025 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736931037;
 bh=GdB0s3esCm0Taj9qiopz0AL7rQJL+qDQQcnoixILlIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXiR539SdOIS5+z1lRuAb0gIU/FZe1caxq8gN3Vkd2FWFaSwxtVbO1SNEIDuWgLpV
 my2eJO6BpJA6eerEUw8l0FjTbZ8/YhN+t/2/i6T4/4gSckFVoEvWUYKK4dnWF6fCTx
 jlb9nGGONVvH8UGcxLsPb55OleS5GM85f3n/AqMOdud/UDgkNmo2RGlC79Buh9TbDk
 UR640S7vo8Fk/JkrpSp55Pvtj6DES7si/CJwoq5Im49H4xaCtJWFFtOv01NFQkEcyn
 OuipZOo+4iTf7TRZQ2Z/nYefssD3ZpNLu9ITFS03kl2Fs9HsEZyIwM1MdPu/U87W/e
 AtF8lF8a20Mbg==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Date: Wed, 15 Jan 2025 09:50:28 +0100
Message-ID: <173693101810.2804074.2827818197131810241.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
References: <20250113092608.1349287-1-mripard@kernel.org>
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

On Mon, 13 Jan 2025 10:26:05 +0100, Maxime Ripard wrote:
> The dmem cgroup the page counting API implemented behing the
> PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
> potential build breakages. Select PAGE_COUNTER.
> 
> 

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime
