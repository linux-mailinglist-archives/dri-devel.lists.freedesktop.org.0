Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7299AE3AD6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 11:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1236910E2D3;
	Mon, 23 Jun 2025 09:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FtLBcBlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF2C89D63
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:44:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C1A8A50D1D;
 Mon, 23 Jun 2025 09:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141D1C4CEEA;
 Mon, 23 Jun 2025 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750671846;
 bh=TSQKjKbpV0/LI0K3BCx+yaJWInH5iUqXSzO58gDQgoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FtLBcBlhaaLUav/6SGc+n+WgyyJMK2XGPcILTeS4d09jN2LOpK9c27uTYwEc+NlOV
 za1SnCuaWMR4SgWYR8O1tQdAGeImwGP5W7LuVIQkf7H87cEeX+nNlRUk5AgvYt6Ana
 5QhAwQoPy/T7Q7JYWQskdNgkz4gRcjQ0KK7oJy69bANFnfQMhjQNIChAehwbjSTHZb
 W7vy08VEEajpKDBK1oOE20/iOfGYIRSG60qKHy8oV2faHuk5E25KZ2XPUqBcSTJkoZ
 /7w6rxkLhEr+TCOcPzsfSJaJtJT4EOIe7HCbiov4Bb7jtI5VyCBLqVs9QO6RMueIAL
 LAhlCJceFzDLA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, daniels@collabora.com,
 daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Mon, 23 Jun 2025 11:44:01 +0200
Message-ID: <175067183351.289902.11645446324178175765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085033.39680-1-vignesh.raman@collabora.com>
References: <20250623085033.39680-1-vignesh.raman@collabora.com>
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

On Mon, 23 Jun 2025 14:20:26 +0530, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1455734
> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
