Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9597110CA52
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 15:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35016E82F;
	Thu, 28 Nov 2019 14:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7241F6E830
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 14:23:37 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B32A217F5;
 Thu, 28 Nov 2019 14:23:37 +0000 (UTC)
Date: Thu, 28 Nov 2019 14:23:36 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
Subject: Re: [PATCH v2 3/3] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
In-Reply-To: <20191126101529.20356-4-tzimmermann@suse.de>
References: <20191126101529.20356-4-tzimmermann@suse.de>
Message-Id: <20191128142337.1B32A217F5@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574951017;
 bh=bxffKAO0e4evJ3iMXSyJtmPAilfuSljbkg2RFoCOXJU=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:
 Subject:In-Reply-To:References:From;
 b=v0ClvEtJkwzqCdr5wEPIMYQLFor8C0SXqjpyKh4AoxjdLBivlhYhCNbmvvnig7Zt+
 oLUaQfum3pvZLQgEj18VUjyNYoyUmfaH/oMCouCZTevsZHGhPqUTT7M3mgThivewDk
 xuMN+hzHL32IZcR8S+FguIU2WoQneNv0HMfvL6jE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: , stable@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, José Roberto de Souza <jose.souza@intel.com>, Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1397655989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1397655989==
Content-Type: text/plain

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 81da87f63a1e ("drm: Replace drm_gem_vram_push_to_system() with kunmap + unpin").

The bot has tested the following trees: v5.3.13.

v5.3.13: Build failed! Errors:
    drivers/gpu/drm/mgag200/mgag200_drv.c:104:18: error: ‘drm_vram_mm_debugfs_init’ undeclared here (not in a function); did you mean ‘drm_client_debugfs_init’?


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha

--===============1397655989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1397655989==--
