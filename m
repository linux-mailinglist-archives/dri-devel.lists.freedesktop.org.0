Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F163B08F7C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B60510E7C7;
	Thu, 17 Jul 2025 14:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NStf+bRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360FB10E833
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4XPkkckc/DJj54bqsY25CUcSeyCxJKTjldAJQY1yZtQ=; b=NStf+bRwA+1XPwz5vtOrZzbrej
 tbj0VAlnxSL3dXMD04GbyIa8ZhQx0MVqvlQMAVlFmJ7M+0p6ZTSSsiGCt5h3M+5y2L/WqeDDyaZ/N
 IvoBOwT4SJn0A7SDjOZchd/DSBSTC9U41Pb91nmPKM2MtjWzKfX32zDMhiC57ce9CdwAX9kunSKY/
 imcIiCO3k9VqpUvrftOUvcD+4RQlPIHKo29Ni9YR8JfU7Nx8CqjM1y5kpeABwW3vXCTRDAV0cbDSx
 f641ruE5SAXF/qA7baaLTvemoKvrewICcUysMGjxU7UranmrD3ub7bW7NujMYnPKNsZUG0alrCxOu
 1P3ER4Rg==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucPfC-000BBJ-QY; Thu, 17 Jul 2025 16:32:47 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: "Juan A. Suarez" <jasuarez@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: kernel-dev@igalia.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/v3d: Expose global and per-context GPU reset
 counters
Date: Thu, 17 Jul 2025 11:31:31 -0300
Message-ID: <175276268275.480028.16171876563541540745.b4-ty@igalia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
References: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
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


On Fri, 11 Jul 2025 12:18:30 -0300, Maíra Canal wrote:
> The GL extension KHR_robustness requires a mechanism for a GL application
> to learn about graphics resets that affect a GL context. With the goal
> to provide support for such extension in Mesa, this series implements
> global and per-context GPU reset counters that user-space can retrieve
> using the DRM_IOCTL_V3D_GET_PARAM ioctl.
> 
> The corresponding user-space implementation for this series is available at [1].
> 
> [...]

Applied to drm-misc/drm-misc-next, thanks!

[1/2] drm/v3d: Add parameter to retrieve the global number of GPU resets
      commit: 5774b3cfdedb3624ef0d2c82cccbfd61bcb60fd5
[2/2] drm/v3d: Add parameter to retrieve the number of GPU resets per-fd
      commit: 769c153cfc3c6669c7b318f66c2b21ec3951fb4a

Best regards,
- Maíra
