Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFF18073F8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108210E74B;
	Wed,  6 Dec 2023 15:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1610E74B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:49:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F914CE1F39;
 Wed,  6 Dec 2023 15:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50267C433C8;
 Wed,  6 Dec 2023 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701877763;
 bh=+J1QdopcvWpX9zfxJIE8u/JzSE7fFRVzBYM2a7CKdXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2d41aRpP78BtGO5A+ZqppqUNq24L9RxjSDmHvlgFX2vgeXyTyAZHVXUESWvLQiGj
 7NyrI9V4FwSH2s14/MJWFedHMoU8y8K+2UZB3v6aRlgMcwfRlvtzd0cY3UkU9J4Fzj
 uCES3fjJnxyMNRLgFXZG78O42SFZXr2MK49uzZrLlbxd0XxRbLu/ZFIuN5QhAWqP8I
 3j+JmeZddkPH4Yp1VMn6eRvw+7hZa0AiB9HqEEXD3z3sguH1jPKaVH1GWkRMSszpMV
 zWStW2xd8YsZtKHuQIzE3SaoN2PrUzDX3pnXVmFtEZdSUhBVYp3mzoqvgHaB7FbFoU
 AKkwkO5aIka0w==
From: Robert Foss <rfoss@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: simplify some error checking
Date: Wed,  6 Dec 2023 16:49:16 +0100
Message-ID: <170187770273.918857.2541227849014994026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <04242630-42d8-4920-8c67-24ac9db6b3c9@moroto.mountain>
References: <04242630-42d8-4920-8c67-24ac9db6b3c9@moroto.mountain>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 18:05:15 +0300, Dan Carpenter wrote:
> The i2c_master_send/recv() functions return negative error codes or
> they return "len" on success.  So the error handling here can be written
> as just normal checks for "if (ret < 0) return ret;".  No need to
> complicate things.
> 
> Btw, in this code the "len" parameter can never be zero, but even if
> it were, then I feel like this would still be the best way to write it.
> 
> [...]

Added suggested by tag, to reflect Neils feedback.

Applied, thanks!

[1/1] drm/bridge: nxp-ptn3460: simplify some error checking
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=28d3d0696688



Rob

