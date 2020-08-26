Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56DB253078
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 15:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6736F6EA8E;
	Wed, 26 Aug 2020 13:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB456EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 13:53:53 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FE9A22B40;
 Wed, 26 Aug 2020 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598450033;
 bh=4p6wpkWaDcp9XBZaMAKxdaroTMtymsvOF4iCoZOz7AQ=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=zIXOwAjNkqy1Y0BBPQPd6iGWmS7EcbtVAtTtUYgh6uwUInse5lLZ8qnFTFWeI1ryV
 fJZmnXraCB9uF8aZM+r5CxyaJ536vgBLlYde7Tf4TdRGODHYCYaSjvaQljwIHs0icJ
 rlghIFWFA/ASfT/gw77ydZYvMyHY/25dKIuSthUc=
Date: Wed, 26 Aug 2020 13:53:52 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org
Subject: Re: [PATCH v1 3/4] drm/ast: Add commit-tail function
In-Reply-To: <20200805105428.2590-4-tzimmermann@suse.de>
References: <20200805105428.2590-4-tzimmermann@suse.de>
Message-Id: <20200826135353.4FE9A22B40@mail.kernel.org>
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

The bot has tested the following trees: v5.8.2, v5.7.16.

v5.8.2: Failed to apply! Possible dependencies:
    05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
    1728bf6402c3 ("drm/ast: Use managed mode-config init")
    2ccebf561e4a ("drm/ast: Move cursor functions to ast_cursor.c")
    6bb18c9be6d2 ("drm/ast: Init cursors before creating modesetting structures")
    beb2355eecbf ("drm/ast: Pass struct ast_private instance to cursor init/fini functions")
    e6949ff3ca85 ("drm/ast: Initialize mode setting in ast_mode_config_init()")
    fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via to_ast_private()")

v5.7.16: Failed to apply! Possible dependencies:
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
