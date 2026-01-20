Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB1D3C559
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F6E10E5A9;
	Tue, 20 Jan 2026 10:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ItOkN9MY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6D10E5A8;
 Tue, 20 Jan 2026 10:33:41 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dwNw04Jqzz9syt;
 Tue, 20 Jan 2026 11:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768905217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bznO928X63BpuNPc3aHg0HB2Cut2CBUhFRDL2rEY87E=;
 b=ItOkN9MY7OJWOweoAX0l8DaJum0wSjgw+HRGD4V+o64zCE2/57+WRpENvReAf4uTLiJknr
 gaYab5hui2/Gwm0Ywq2WlSz227j2OBuKLSl8IlnjSVvrtf9pIaccYzuk07uWgr0rEvGUuQ
 mci+WuMe7qjTOHB8InU+04wtuzjcehALMylVHreyp7lzgvT/a74iMZFJORINKNbafGgRV0
 DBRn1ILEtHUXdk2Ne7GnMG4dquWJgTiwOVaNL5XvC8KvgZ14ACf9wlo/96iB4hjobAEVXZ
 treGq7Vc1a+MV3euanftHmeD9LcCg/vHqjf79foDXe3Iy5T3tvMqDy1pSKaIqA==
Message-ID: <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
Date: Tue, 20 Jan 2026 11:33:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 15/17] drm/amd/display: Trigger ALLM if it's available
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-16-tomasz.pakula.oficjalny@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260119011146.62302-16-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: phybsiofapj33kj3s58z48atnib3xi3x
X-MBO-RS-ID: 45432365aa7fbee6d38
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

On 1/19/26 02:11, Tomasz Pakuła wrote:
> [Why]
> ALLM automatically puts TVs into low latency modes (gaming modes) which
> we basically always want for PC use, be it gaming, or using precise
> inputs like mice and keyboards.

How about e.g. video playback though?

It might make sense to let the Wayland compositor control this, e.g. via the Wayland content type hint protocol.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
