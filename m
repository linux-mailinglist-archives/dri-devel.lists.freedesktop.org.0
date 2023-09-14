Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3367A10BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F010E59A;
	Thu, 14 Sep 2023 22:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com
 [IPv6:2001:4860:4864:20::4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246A10E598
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:17:10 +0000 (UTC)
Received: by mail-oa1-x4a.google.com with SMTP id
 586e51a60fabf-1bf00f8cf77so2111198fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 15:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694729829; x=1695334629;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NmiSL1hPoXorfA2q6qNOq7ioFso4QUSjYQj36GecrTE=;
 b=4NHC88f2WhlJmE0KoWA/AJKoHQeRYJ3quFC3mmItLpcYzlMvh39C45Uon88EwcDva9
 Ce6dlm3u2qOkiPvFb7K0E3cBrztBJEvusR8JXqE+tyMVyRQXZdp/KyLtftJT/yssbXHp
 /6l3iWvsx/UAdKiCwIS9HRWAt99ED8ajWc8mmbdecYjUxguK9kpmMqA7VuXcRINHRkfX
 2uGUPj0NzPuymFx5LUVblm4oQx1G4Q41TZZh26UPLKYIqHT3l5nQh5iiWqv2FhSmS95J
 +xB7FHySH8Ir8hqsIH+2oDWTxMjpw60NLmdFgDsEqdkVRNRCZVYbhffNy7UTxco8fdcu
 LIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694729829; x=1695334629;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NmiSL1hPoXorfA2q6qNOq7ioFso4QUSjYQj36GecrTE=;
 b=qK0ejDv2J0zv9kYcW0+1MDfB67vis6KrZW5xj7Iwt23F3+s6G+uO2R9Rtp3Qku9m1w
 5OWZvH8VK3svLsWjx0HcU5pPypWw5hRg0XPgBx/GGzLTA5RCq0bp1hk9ieAGWvDzbFg1
 gjK2H8qHU3JZlud4dTLDMfZbCWImGqCUVbttaqk5yjt/acLI/zyIeZrF+5+dzL0/VEDX
 L/20IaqfsQOUtZxJPyfpW6Gq/6kd19JCY1KTlF3fkjTVhdUC+Z9zxt9V6ESJYqbcAg29
 ytx08iF5CqZwEKfnipF2mj1rumRCY8J+fGOLZZlU7Cd6hIFVvHfjZtogCI3Ifs8Yc1r1
 MrQw==
X-Gm-Message-State: AOJu0Yzhilg26i3JXeHkQlSqWcnayDCW2cCEBWvxinJ3INDywQGDoxMd
 jwtQ7J0ts82gMkhqXUZjLocutRh20STnhYGBoA==
X-Google-Smtp-Source: AGHT+IFwcROu4zar64CAvXwI9J0nMFhba4+cLsta+BCeiKNlxnKo7O4A0MBXBGcuyAHHg0RNV0zPR7a2HtcCyI3FeQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:5b17:b0:1d6:6175:e8b7 with
 SMTP id ds23-20020a0568705b1700b001d66175e8b7mr704oab.4.1694729829605; Thu,
 14 Sep 2023 15:17:09 -0700 (PDT)
Date: Thu, 14 Sep 2023 22:17:08 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGOGA2UC/x2NQQqDMBAAvyI5dyFqodqvlB6SuEmXkjXsamgR/
 97Q28xl5jCKQqjm3h1GsJLSyk36S2fCy3FCoKW5Geww2rm/gm7CoXxhEaooCqnsjTPwuld0O3B
 9Z0BOxAglg3eKEGCcfJzDbfLBRtPaRTDS5/99PM/zB65MP5KHAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694729828; l=2319;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=RxOj2KRPJoHaPbd44NSfvp7xlYOfBBUfmUGMt4NplWM=;
 b=DjqYwwhRW21CQ5QMz9Kq/kMZK/2XQMBC1ojIhEn54/lvBB1ZMdiXQOPyCP7EYWc+wzaWYIxZw
 urNwQ6OfNmeAjWVrv9S1uYW4YBYQvugcZXBlGnwgHVmMTJgXi8klaNc
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
Subject: [PATCH] drm/nouveau/pm: refactor deprecated strncpy
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

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
index 8fe0444f761e..131db2645f84 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
@@ -462,7 +462,7 @@ nvkm_perfmon_mthd_query_domain(struct nvkm_perfmon *perfmon,
 
 		args->v0.id         = di;
 		args->v0.signal_nr  = nvkm_perfdom_count_perfsig(dom);
-		strncpy(args->v0.name, dom->name, sizeof(args->v0.name) - 1);
+		strscpy(args->v0.name, dom->name, sizeof(args->v0.name));
 
 		/* Currently only global counters (PCOUNTER) are implemented
 		 * but this will be different for local counters (MP). */
@@ -513,8 +513,7 @@ nvkm_perfmon_mthd_query_signal(struct nvkm_perfmon *perfmon,
 			snprintf(args->v0.name, sizeof(args->v0.name),
 				 "/%s/%02x", dom->name, si);
 		} else {
-			strncpy(args->v0.name, sig->name,
-				sizeof(args->v0.name) - 1);
+			strscpy(args->v0.name, sig->name, sizeof(args->v0.name));
 		}
 
 		args->v0.signal = si;
@@ -572,7 +571,7 @@ nvkm_perfmon_mthd_query_source(struct nvkm_perfmon *perfmon,
 
 		args->v0.source = sig->source[si];
 		args->v0.mask   = src->mask;
-		strncpy(args->v0.name, src->name, sizeof(args->v0.name) - 1);
+		strscpy(args->v0.name, src->name, sizeof(args->v0.name));
 	}
 
 	if (++si < source_nr) {

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-38bf9c78bc0f

Best regards,
--
Justin Stitt <justinstitt@google.com>

