Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BDCA13486
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C610E8E2;
	Thu, 16 Jan 2025 08:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QMDlNVS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF0B10E8D1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33056A40ED7;
 Thu, 16 Jan 2025 07:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AC7C4CEDF;
 Thu, 16 Jan 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737014414;
 bh=BbVoGn76vuDWCsHdiB5VCwpt47bm/A6MCSEDwKDAx4w=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=QMDlNVS8PrmtpD5YAXEZobxigE6VkK2HjzFkV8qw2eHmU/nOyzlLROfBRtIsm5Coi
 hj5hpPbUdq9M6e855B5cYjocKGcVyYo/z+Gioy0MUni/J84bmy8x45xIJEGuI42950
 ZDTn1IgkSTpAwonOL92RNw6QSaIuWx0ROKdCjSASBxycmdd/2USgMym8nmDJpPfkau
 X525DxPYfWEqJWNyvxMwts7X+OMLduRC+6k6UoZfSZXRqbtrFWhT/VAwiTEx1I74Pu
 pXR2JEuxWglAD5UUwphR8yBq1+LYOtbaqT+q5bEKtDw+5hFVuvN6JmEEqSRYK0CnTy
 E9TLbRebR7K9g==
Message-ID: <5282fc2fa60da579d2b388361cfd2e33@kernel.org>
Date: Thu, 16 Jan 2025 08:00:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v8 8/8] drm/vkms: Switch to managed for writeback connector
In-Reply-To: <20250114-google-vkms-managed-v8-8-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-8-da4254aa3dd5@bootlin.com>
Cc: arthurgrillo@riseup.net, dri-devel@lists.freedesktop.org,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, nicolejadeyee@google.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 14 Jan 2025 15:05:50 +0100, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create
> writeback connectors. It is not an issue yet, but in order
> to support multiple devices easily, convert this code to
> use drm and device managed helpers.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
