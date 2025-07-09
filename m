Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9CAFE999
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8118110E7E1;
	Wed,  9 Jul 2025 13:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GUpkfdsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369810E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:04:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F16E061424;
 Wed,  9 Jul 2025 13:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B46EC4CEEF;
 Wed,  9 Jul 2025 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752066266;
 bh=xSlEba7/Me3MBHgdbdrycEQgNguAjPGNbCQq1OYfDv0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GUpkfdswKkVMSkrYctRRZXgOaoqsJsZM9z6KVLamhZN5f12dIyAMDDI84YkbWn9Xc
 t3ABZnOj4z71vXBJkSxBDSN86whXk8lDk1WZ5qFIPMkXJz9vUwMGLyoQsRfPvo+S9D
 umAyPd469Qb0s0fMz36B9p7KjJUCypNkS0MbWLFQz2QtcpA4tAzbJBiNNgOk4WUMEo
 YhDM/oO5rJscxZj6W3YzGuAbbSogPGfOW8x1jePdYvZPHT3nqMQsR5CQnSt3ifIaRy
 KF62Zx68aTMuTkw7iDzyyETlKugI35ktVqVIbkvjM43kU1CYMENFjdG8Z4+sK/8LsQ
 /poFrUiCbGaDA==
Message-ID: <a73a568ac9d3fa59cc491a1c9b1c299d@kernel.org>
Date: Wed, 09 Jul 2025 13:04:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 4/6] drm/panel/kd070fhfid015: Use refcounted allocation
 in place of devm_kzalloc()
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-4-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-4-630902123ea1@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Simona
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

On Tue, 8 Jul 2025 15:35:16 -0500, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel. In the call to the new API, avoid using explicit type and use
> __typeof() for more type safety.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
