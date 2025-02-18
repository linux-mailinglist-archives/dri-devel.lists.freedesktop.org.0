Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED13A3A5D0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 19:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489110E06F;
	Tue, 18 Feb 2025 18:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KTBrZK4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770210E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 18:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77C525C61ED;
 Tue, 18 Feb 2025 18:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF4DC4CEE2;
 Tue, 18 Feb 2025 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739903999;
 bh=YnpuuOh5VaiRketHegrQjGYmcZ2o8O6xGHvTQK8T3IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KTBrZK4Dp19lYxVB4lLX4gCwVnNpFCsxRRmP7upEjFWM1vWK6QKxm6HsOj+41j3wg
 iA+YzZVnHFN5op2/h+nkoKpOdqgsC8OY6jBA3bIqYFDOKS2egEQRRwF0fEHIiZPcBz
 GD+JNCZAmzSxK7ov4LqGHXvw7yaMhb6HBaVloOV66yvfi0kPeFyJ80TI9427PcHw13
 SrFIw1Pj7tfQf/Nm3L/1vw+td/2xwL+2x02toNmohm/q9y1kNhO+gnaRuMwPhPgRgW
 rCNywBOYmMTl+zuxDgCSXCDTH+74OfKvLUtWh/E0giLEkEsWsHX/qOaFDCXUkyFJR8
 zy/3La9Q36/JQ==
Date: Tue, 18 Feb 2025 08:39:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Friedrich Vock <friedrich.vock@gmx.de>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
Message-ID: <Z7TT_lFL6hu__NP-@slm.duckdns.org>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <20250127152754.21325-1-friedrich.vock@gmx.de>
 <7f799ba1-3776-49bd-8a53-dc409ef2afe3@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f799ba1-3776-49bd-8a53-dc409ef2afe3@lankhorst.se>
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

Hello,

On Tue, Feb 18, 2025 at 03:55:43PM +0100, Maarten Lankhorst wrote:
> Should this fix go through the cgroup tree?

I haven't been routing any dmem patches. Might as well stick to drm tree?

Thanks.

-- 
tejun
