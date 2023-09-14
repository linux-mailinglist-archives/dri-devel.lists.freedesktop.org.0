Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5757A0FE0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 23:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1830910E58D;
	Thu, 14 Sep 2023 21:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D98710E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:30:39 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58d9e327d3aso18773817b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 14:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694727039; x=1695331839;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tHD/q/SJLFYWSfqzhKThHqH+If9tHeimdGSeLbCxs0o=;
 b=fx8mvjfTB46z3jybINWn4SufMmEgQk627PfVB9d08qh6BN2wydXlK3NH2coaJwixIQ
 tDSr2uZwCRmBXYAFB6c8dfObMe288gfdN6rWsI4Y7ladMHkLDDcy2q/V+XjijPSWfIbG
 izFqpxIKgZjMOfM+h33cGZrpEUl4Nt/PFUw4VaebX+FImssNM7UR2tR4O6t0BjCyJKgr
 zLDAluUPc7FgjGyqCaeO7GxyQBIrEJhS4qinrlbf2/zJR2KKq1S850Ea6zPXzHb2Y19i
 O2cEvWsaWnKIJV1DDUNHKC90UIP6AIQvPwRFUkyLakk1zr//DXyQdOMa0TIgracltmIW
 8iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694727039; x=1695331839;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHD/q/SJLFYWSfqzhKThHqH+If9tHeimdGSeLbCxs0o=;
 b=acyaHGsV9s6abI5N8NsAO0EcmgVTtNdo+OEoMHtSy/88H3i/7TlIsLh2ugZkeyt0k/
 6H/vCjx9nGXYBQT1zJSdX7Qw35UmsvdalqYE8Hj0AX4NZis2kUA7udZsNLO5PuvJjV4N
 B61Tf8zq4mFTiKphA7hDPdZ6Numku2VGL4Vswag8h2sfH0XCkNlq/mS1um7jbNw9XxKt
 hc8myJvmOFPwoLKek4Qsjk1nji0oOR/TL7so27qWIV9ciHXGzhfuVHUehbBiX6CuLYqc
 rrRS/MMjvdutnUQZRRsT6UCQCIzvIJzYJn9jD4m4F//t/NDbs+mY1+ApIXcX9Z0Ojy5G
 CVng==
X-Gm-Message-State: AOJu0YwJlusq64+N7+E+p4/KpS2scj3+wYfdUajXZ077du6vUunfv4xC
 +Nk74qK224NfwwzMvdXCsuY8iQIfRbzxfdHMnA==
X-Google-Smtp-Source: AGHT+IGX8yvrtUoKVn7mJlx7ANqKychzQ3OooCdQznWtzGJrkQcp6QG1fyYuUP8f+T6DjKoeAxURtoAR54eD/SD2gQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:450c:0:b0:586:a8ab:f8fe with SMTP
 id s12-20020a81450c000000b00586a8abf8femr176035ywa.10.1694727038901; Thu, 14
 Sep 2023 14:30:38 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:30:37 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHx7A2UC/x2NQQ6CQAxFr0K6tgnMqBGvYlxgKdhEy6RlJhrC3
 Z24e2/x/t/A2YQdrs0GxkVcFq3SHRqg56Azo4zVIbQhtn13RF9NKX1xNClsjnPKld+oSy48ZNQ
 iE9JLWFckvIRHDSme+1OEupmMJ/n8/273ff8B4I28qX8AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694727038; l=1659;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Q5CFsZyxCfw6hgNgrBpo5UsVYRuZcWL5zSBOa/5AHCg=;
 b=J+RLdusJNzQ1fs2a8n+U6McsahNsvZ0DMJXnqsKtVDvGrjExGw+WOkTee3/eBqCw8pmFfoQkt
 3+dBjHWINIqCOHsLbFQ4KpmqaC+OrdCs40Utc/nsxWtXyWMQ05+y3O9
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
Subject: [PATCH] drm/nouveau/nvif: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
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
Cc: nouveau@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated and as such we should prefer more robust and
less ambiguous string interfaces.

A suitable replacement is `strscpy_pad` due to the fact that it
guarantees NUL-termination on the destination buffer whilst also
maintaining the NUL-padding behavior that `strncpy` provides. I am not
sure whether NUL-padding is strictly needed but I see in
`nvif_object_ctor()` args is memcpy'd elsewhere so I figured we'd keep
the same functionality.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.
---
 drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index a3264a0e933a..3a27245f467f 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 	} nop = {};
 	int ret;
 
-	strncpy(args.name, name, sizeof(args.name));
+	strscpy_pad(args.name, name, sizeof(args.name));
 	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
 			       name ? name : "nvifClient", 0,
 			       NVIF_CLASS_CLIENT, &args, sizeof(args),

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-82b023c36953

Best regards,
--
Justin Stitt <justinstitt@google.com>

