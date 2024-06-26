Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35456918296
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464DD10E8B2;
	Wed, 26 Jun 2024 13:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VpUa90C8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B02110E8B4;
 Wed, 26 Jun 2024 13:35:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9100B61A0F;
 Wed, 26 Jun 2024 13:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1116AC2BD10;
 Wed, 26 Jun 2024 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719408923;
 bh=K19aU+29zeZcJ3frko2cJmIO5k73MSNWKAXAl+XEBc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VpUa90C8RzRLUXLW75wKPDRjAYdM/dBQCSIJyjSydBxjjLnlUAXwzZQnCqoQbkdZ9
 ioyKJBWtz6Hi7vvOdYssfB4FFJvrm5RtY4/Ji+dIV1zeyxc3doUzJrrgVBqVu7/tjB
 aUMz5HzXIpY9twOKG6tzuFhLhu9ntJF5/uxAE7gZk2oLx9KzMrukvNxsB/9gjjux2o
 lu92igpTDXbVJVHM4+CKE5erX4w//mJzODnYU82pYWHC/VEyqtszPwZu9tJ2YzhtZ5
 MPw1zA5hnIHvqnlukMB1cT7ONRLVJItLb6wwZY7q7xziZiZQuKDxL9qljbCeOFT2d2
 P8CIPjwt9wmgg==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 noralf@tronnes.org, Chen Ni <nichen@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] drm/qxl: Add check for drm_cvt_mode
Date: Wed, 26 Jun 2024 15:35:12 +0200
Message-ID: <171940890752.2204713.11667399517595004219.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621071031.1987974-1-nichen@iscas.ac.cn>
References: <20240621071031.1987974-1-nichen@iscas.ac.cn>
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

On Fri, 21 Jun 2024 15:10:31 +0800, Chen Ni wrote:
> Add check for the return value of drm_cvt_mode() and return the error if
> it fails in order to avoid NULL pointer dereference.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
