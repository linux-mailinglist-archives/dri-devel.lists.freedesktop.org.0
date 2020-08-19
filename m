Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC924AA16
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 01:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5566E885;
	Wed, 19 Aug 2020 23:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFEF6E882
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 23:56:40 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38189208E4;
 Wed, 19 Aug 2020 23:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881400;
 bh=Ff3pPByYsjxQjLFzhs86VHkGguD+kfERdf1KDCRglXo=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=1TWCRoWvJt0FJh9j6cMjsvRIJhym0XuhTj7w7nNMR+81x8BUkyn9w6rSRHJekXIJM
 uN8bWZelOYYpJbTwEldapiea7V+XM+KqQAhdols7qZ2e1TzJCjFiwvWhP1b1ue8Qnd
 vRGfCpvTYppba78YkGcxPvrByKWNIn/Ssi6XaQ74=
Date: Wed, 19 Aug 2020 23:56:39 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org
Subject: Re: [PATCH v1 3/4] drm/ast: Add commit-tail function
In-Reply-To: <20200805105428.2590-4-tzimmermann@suse.de>
References: <20200805105428.2590-4-tzimmermann@suse.de>
Message-Id: <20200819235640.38189208E4@mail.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 4961eb60f145 ("drm/ast: Enable atomic modesetting").

The bot has tested the following trees: v5.8.1, v5.7.15.

v5.8.1: Failed to apply! Possible dependencies:
    05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
    1728bf6402c3 ("drm/ast: Use managed mode-config init")
    2ccebf561e4a ("drm/ast: Move cursor functions to ast_cursor.c")
    6bb18c9be6d2 ("drm/ast: Init cursors before creating modesetting structures")
    beb2355eecbf ("drm/ast: Pass struct ast_private instance to cursor init/fini functions")
    e6949ff3ca85 ("drm/ast: Initialize mode setting in ast_mode_config_init()")
    fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via to_ast_private()")

v5.7.15: Failed to apply! Possible dependencies:
    05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
    1728bf6402c3 ("drm/ast: Use managed mode-config init")
    2ccebf561e4a ("drm/ast: Move cursor functions to ast_cursor.c")
    3a53230e1c4b ("drm/ast: Make ast_primary_plane_helper_atomic_update static")
    6bb18c9be6d2 ("drm/ast: Init cursors before creating modesetting structures")
    beb2355eecbf ("drm/ast: Pass struct ast_private instance to cursor init/fini functions")
    e6949ff3ca85 ("drm/ast: Initialize mode setting in ast_mode_config_init()")
    fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via to_ast_private()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
