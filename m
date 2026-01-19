Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B729ED3A74D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192FC10E404;
	Mon, 19 Jan 2026 11:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cHbdJKHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949410E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MNYkaF5OtQdFH6IQFd5I/u8GLkpxG7+sEBZgVb436sE=; b=cHbdJKHxTMBsq87vHDQx7+RKEH
 KKdLZ+YHlJIAtkEb9CaTluN4r7Ff80DoPrfGHQwJXQnUFWCn1edpVm4BgDTL5rBtBjDyjDpHmKR5/
 eDem6pErPMXby0h9fSorSOeiLoMZhb7VFFi/O3/jmivxxOxGGe18VHl9lVOn49mSc+xZ1cusFrCzP
 c++Wq6ZpWMuX6lHqIR9BmaiWQ/GopyTlom29s5QhreSHv+rFBFww/3/8kG4zeunnOmYSXgy9zV7gj
 oh5kgsROCVraHFVHzs3YuoMwWnsHhbELvwktS228DIMDomJz2/xHlrWJdgWKCiVCSXOBN8zz1SYIZ
 3eC2earg==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vhniy-0076tP-5M; Mon, 19 Jan 2026 12:47:12 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: kernel-dev@igalia.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
Date: Mon, 19 Jan 2026 08:46:40 -0300
Message-ID: <176882319672.64715.4277873452258123673.b4-ty@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
References: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
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


On Mon, 12 Jan 2026 08:51:35 -0300, Maíra Canal wrote:
> This small series intends to replace the legacy DRM_DEBUG/INFO/WARN/ERROR
> logging with the corresponding device-based drm_dbg(), drm_info(), drm_warn()
> and drm_err() helpers. I split the series in two patches to ease the
> reviewing process as the first one has a minor code-refactor.
> 
> Thanks for the review!
> 
> [...]

Applied, thanks!

[1/2] drm/v3d: Consolidate CPU job validation in a function
      commit: eaba54b8a67bdec7f834d61ff6cf5f0f3f4ea5bc
[2/2] drm/v3d: Convert v3d logging to device-based DRM helpers
      commit: f5520a1a844342af7295a72c35cc9690b7a9fdd1

Best regards,
- Maíra
