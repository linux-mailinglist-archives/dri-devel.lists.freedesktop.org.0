Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40AB643A4E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2126A10E326;
	Tue,  6 Dec 2022 00:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A010E2D4;
 Tue,  6 Dec 2022 00:35:12 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h6so2988361iof.9;
 Mon, 05 Dec 2022 16:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoWT3whneSiQzTAYd5Vl5dubMxD0/e5Afaj7/WmcC8o=;
 b=hI/CwpgBrv4FuN2UQf8ufrGEGWB3NLRMuEPL1gFEIujpHxwkfRV1QX1TD7RlOKnUjN
 wotsSjDJJYp77gKIDb6M6VvDv3dkVrpTi/b+lqk41/l+j3m1ZtggdhCEHN+9rnG09LXY
 EKqhFJSGtMtM4JE0WaHl49/OpjtHwTxZzFc1lkjFgGxgrx6ZkZR100GXh1qM/Gl4ZEe9
 j9xnM8mlK8JDE6gz+sVwd5f0SqLBK5v1oPwOTS6WkFSbE+XLSydLHJQXjEZWc+MJ3mQz
 42AuQhhU01H99SK0cwAuLJwvkCNpmI291UFZcFB++2WNpXQDgZVa6ehyw+7GUgdgLa/A
 knEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoWT3whneSiQzTAYd5Vl5dubMxD0/e5Afaj7/WmcC8o=;
 b=a/8Wuj4mHT1o6T2LYDL7YGXq+u2ZR0v6D4G2NYF+gWlHdyVkX2LAkwTr6r00UjT0z8
 s9fgm/coI5oF/jVmEhXMviEcImufXtgZRJ9NJaqOd2tbXJNfnIse+CltVx4VCMaxUw0B
 /P2YdtgulfQeNsf9YXO51mRASknKXGbcoExpSQH/dLXuQ01JsqJT8VfR+FDTv/DVHzUV
 xU5DrzslFn7MqxEgLktWWHjx2DEXOBnX0o/LJ7pNszAWeNpVy1jD55mwol5Rn3Qdm6wU
 UJH/DB6CX1V8/QgDzuqqcTsCoo5KdNKIGIhuUDlOjp4nabIuHLj65XB4Ovyw6LRMHVbV
 DuxA==
X-Gm-Message-State: ANoB5pkKEpWVtLyLRdHaeK06JD5bVVZpsJ7b6jTdvsKP9fll7Sc6plyN
 fXQsZHWOb/CtN5TkiOQ0pvw=
X-Google-Smtp-Source: AA0mqf6ZFOuU7OcSMzy2rMDNBXi5b1ArqAGWmJJqL2EE6cRi4TBp7GPbwMCqNP+DcXnAP9J5+j8DaQ==
X-Received: by 2002:a02:6a43:0:b0:375:4725:4b4f with SMTP id
 m3-20020a026a43000000b0037547254b4fmr39159172jaf.52.1670286912140; 
 Mon, 05 Dec 2022 16:35:12 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 13/17] drm_print: fix stale macro-name in comment
Date: Mon,  5 Dec 2022 17:34:20 -0700
Message-Id: <20221206003424.592078-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cited commit uses stale macro name, fix this, and explain better.

When DRM_USE_DYNAMIC_DEBUG=y, DYNDBG_CLASSMAP_DEFINE() maps DRM_UT_*
onto BITs in drm.debug.  This still uses enum drm_debug_category, but
it is somewhat indirect, with the ordered set of DRM_UT_* enum-vals.
This requires that the macro args: DRM_UT_* list must be kept in sync
and in order.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. emphasize ABI non-change despite enum val change - Jani Nikula
. reorder to back of patchset to follow API name changes.
---
 include/drm/drm_print.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 6a27e8f26770..7695ba31b3a4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  */
 enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/*
+	 * Keep DYNDBG_CLASSMAP_DEFINE args in sync with changes here,
+	 * the enum-values define BIT()s in drm.debug, so are ABI.
+	 */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
-- 
2.38.1

