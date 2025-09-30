Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F5BAC63F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465B210E54D;
	Tue, 30 Sep 2025 10:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p9T4fjwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3266810E54F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:01:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A609360478;
 Tue, 30 Sep 2025 10:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2219C4CEF7;
 Tue, 30 Sep 2025 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226467;
 bh=JPrT6KDCEnTENM59moZKSHIWKhaq+FH1wUwgHQEpfmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p9T4fjwXz0TPf5TpCFHj9E7v/Uo/A6jHmQQVxSyJwfJ31CR2aFKVhVOiYNUjNSQlo
 fNwkR2fa7S9oUg0Q1iX3+MVplPDLLPLUVTmDNtFUeu8sNjk3KL8KXZ4LwdfQ5KPzTd
 uJsFQhkP9m8vKu0ff357J+o0BTKjXbzO5arPktgrMhd+D0+OJOjj2TsutlG+rw5gaC
 B6fAaEWXNv0tTIVQEkeuX5dHDMx0B70j8r+TmE/GkNV8SX/f5w0Rzo6ffUntoChb5c
 wlFbVdRNA7aFVuWDnF9wp6QfooFp7unqFl4Y12KvVLQpZ7rf3KRg/A0+JXHLppSsHE
 iXsqvLodvZ+aQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 20/29] drm/tidss: crtc: Change variable name
Date: Tue, 30 Sep 2025 12:00:49 +0200
Message-ID: <175922644629.1134117.17213082084432830487.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-20-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-20-14ad5315da3f@kernel.org>
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

On Tue, 02 Sep 2025 10:32:48 +0200, Maxime Ripard wrote:
> The tidss_crtc_reset() function stores a pointer to struct
> tidss_crtc_state in a variable called tcrtc, while it uses tcrtc as a
> pointer to struct tidss_crtc in the rest of the driver.
> 
> This is confusing, so let's change the variable name.
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
