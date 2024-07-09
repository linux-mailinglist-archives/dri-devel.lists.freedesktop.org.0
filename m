Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D339892B1CC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 10:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E2710E4A5;
	Tue,  9 Jul 2024 08:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SVjSrTvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045110E4A5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85A4E6108D;
 Tue,  9 Jul 2024 08:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF56CC3277B;
 Tue,  9 Jul 2024 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720512704;
 bh=gNoHnlGde32LHrAOGcjhcjPV0cFHv6TjFdHQRtUc0ko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SVjSrTvAZP5rtVFuL1LZ3S9nNOdyF21742VJk9t+t6eSeZ1dI6haojEx2hwaQFzUL
 B/NI5iZ8Y3gNwVnRwt+fBu83NqaYioHVNNI96+glVuMWqXlwlaof8rDqn1J0krweCC
 udboAD4K8Vnrzg0NGtvM84Ssd6HraNQcgF4x3s6tIpGsoLoUosdawtyKCu4jRsay2z
 klQIBfAUq3RsHh7YU/fvYKE60+TiIaRMU+JPYlEYog641kvqfgpwjpU0KQidjmiSJR
 C6JZ8cKLLoaxfqFYcnUJuGTIyrR/Gkbo6Z4L2mVistJHgrxtSAiJ1bQJS8D8er6tqZ
 tV9zp0xAJJHbg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: (subset) [PATCH v2] drm/drm_connector: Document Colorspace
 property variants
Date: Tue,  9 Jul 2024 10:11:39 +0200
Message-ID: <172051269761.180041.16742785029859589902.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702143017.2429975-1-sebastian.wick@redhat.com>
References: <20240702143017.2429975-1-sebastian.wick@redhat.com>
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

On Tue, 02 Jul 2024 16:30:16 +0200, Sebastian Wick wrote:
> The initial idea of the Colorspace prop was that this maps 1:1 to
> InfoFrames/SDP but KMS does not give user space enough information nor
> control over the output format to figure out which variants can be used
> for a given KMS commit. At the same time, properties like Broadcast RGB
> expect full range quantization range being produced by user space from
> the CRTC and drivers to convert to the range expected by the sink for
> the chosen output format, mode, InfoFrames, etc.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
