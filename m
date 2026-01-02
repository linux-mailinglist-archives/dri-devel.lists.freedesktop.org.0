Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C93CEF400
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC810E0EB;
	Fri,  2 Jan 2026 19:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bDRSkhSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E1C10E0EB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:58:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4djZHq0nK8z9tm4;
 Fri,  2 Jan 2026 20:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767383895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUYu8XT3Nz/UFK8ip5o/E7e5B7G6lXEW26UvomGH+hU=;
 b=bDRSkhSjosmbnL+x5Zo08Qma2vvsC+HXqEfQTDV5v5GOJ8/PUV41eqs3lzjzjKyiw3YOwp
 q7tX2KhlJggbryx1JTyo9aa+p5zVpdwiHAtCRz8yjUIYRyGZzIOmrcf6u+/+lvcbDn2ZXF
 0s/UxZz+Tm4xpmXeAMIBh+1Iz4IPYwOVBqJVmeDNt7R1KOQjkDjWO+3zLKhuJq4N83r6Ta
 OUOFSNNCds+i/TdtGkAmW1LWAYW88NnqS6RtpBWnfgDVp7lj5M0vc0Q3UI4UMN7hhg1SG0
 rSES9/wgvNO0dwICFz5xdLikCvLj5SHrjgOQqR/K8MX579HdlG8EJPUuXM50EQ==
Message-ID: <aceda246-f4cf-4a3b-ba16-ff24fb17b06d@mailbox.org>
Date: Fri, 2 Jan 2026 20:58:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zcfcqb8bocmexte8gre9kc95fgsnucnc
X-MBO-RS-ID: d76068013051993f523
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

On 11/7/25 12:24 AM, Marek Vasut wrote:
> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
> 
> This allows this driver to bind on Renesas R-Car H2 which contains
> Rogue G6400 BVNC 1.39.4.1 .
Any news here ?
