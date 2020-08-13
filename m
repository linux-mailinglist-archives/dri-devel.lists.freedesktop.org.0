Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1E243D46
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 18:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40266EA4E;
	Thu, 13 Aug 2020 16:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5CD6EA4D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 16:25:46 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8634220829;
 Thu, 13 Aug 2020 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597335946;
 bh=+AR6QzAB/djo+8lI3KCMPQ1vWDhntWbmdv66b3lNJbE=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=JJg2Xp8A+JiXDzmUn8mjuYUFL/ktHkAf2ZHbMnftRRrwyAd2T/ZYVsG/BOiRlJfQV
 tuUedwNye+OdqwZGFGLbGGt/u/TQRpqUoK96J/M1vksSH7p4rCd468TFwt8zE4MyRJ
 /INkNmejq3rVy9HSBfqaPWDoT5NJpFdj7KpCC6Vw=
Date: Thu, 13 Aug 2020 16:25:45 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org
Subject: Re: [PATCH v1 2/4] drm/ast: Set display mode in atomic_begin()
In-Reply-To: <20200805105428.2590-3-tzimmermann@suse.de>
References: <20200805105428.2590-3-tzimmermann@suse.de>
Message-Id: <20200813162546.8634220829@mail.kernel.org>
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

The bot has tested the following trees: v5.8, v5.7.14.

v5.8: Failed to apply! Possible dependencies:
    05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
    fa7dbd768884 ("drm/ast: Upcast from DRM device to ast structure via to_ast_private()")

v5.7.14: Failed to apply! Possible dependencies:
    05f13f5b5996 ("drm/ast: Remove unused code paths for AST 1180")
    3a53230e1c4b ("drm/ast: Make ast_primary_plane_helper_atomic_update static")
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
