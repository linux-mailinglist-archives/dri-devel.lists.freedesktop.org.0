Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306C924AA3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584E10E6FB;
	Tue,  2 Jul 2024 21:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hth3+2CI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBFB10E6FB;
 Tue,  2 Jul 2024 21:59:14 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f38da3800aso181537439f.0; 
 Tue, 02 Jul 2024 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957553; x=1720562353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzxAaDu6jznCkYGTIESxKGj+agIaj+uEvHm/3W7k4f4=;
 b=Hth3+2CIAq7jrogl2z/nR0BgvcTWbiM+lrJXwsT8HI/wvxlhRAynHglgnvBsPxBubA
 iinpBDIIDRzofavxRyKqKaiwFMb84FDkFtqo5lNcf/Kd1VGdIR2GolNO5kVUhynsXD4i
 87zAuL7CKGfi+glhXmA7XaKzRTBjm6cresXxb3afQwBSiXrHsp+7/AjhG0S1h7N0GWSH
 fkovmSzKnkmp4rY7N+R/GFmKQoVYtWK5FGswsYleYo3g9YupbiZV3tQCQ3TsZRebg7sp
 9n42YopQ/ZefbMRGxFZiNpaTnVQpy9A+lB9AC4A9Gb6sia1FuOaAa3eAVRNhdfhx45bu
 zBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957553; x=1720562353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzxAaDu6jznCkYGTIESxKGj+agIaj+uEvHm/3W7k4f4=;
 b=UUzxZUWTzTEDv4n8xKPz78yyQZqdqY99UqLpbxnmDSNwcMeSwRvZ90gyLtPjAxKHOk
 zNw6Uac7kmfAD0Qd53aAKg/8ARtbyPmwyVv9LyPvnDQbFTPUDV4n4NprJX680YLBjhiF
 dZs5Lg1MWgUcMDYwqwltptaaynZ7IGLt31Zgx57/U7CzIa7saCRCrCy4kvukF6op5IuK
 NJ8udA/ab4prq2RLM/YilVn7HXfuD9gE5koOszqemKKn+vLo66uM1yPg6iqN0iwJeqzX
 vFt78VWAOZ2lK/Ong8ku0xHF1SZFcc0qxLBNDQxKj/rI44JimBFV1kSP3LWy8f6GazGf
 Ez7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Np1Bv72HRh6C91m3WsqdR8gSiA0Ji4ecgJElks01nggdqoheX5iriYAxvKds/IS/gMexPOW27v09reFodxcpsOFsjV+M5HJGChgfPvDeiYGzzfi2YCEKSkQfpv387SyPH+Zxb4Kji61t3b3q7iQTfX+7eTLlrPbH+dXy+47YttpNMe3p5Ej4pXuPZNpOZzDusKbV/qsU1W5i9/n+Jr0zD6rGbByl5YvVzCzmqD5klwtLjWc=
X-Gm-Message-State: AOJu0YygomLXcZy52Qcbt5k+l2JaDovnzttNWAFhy2HxZv1CTkadq+04
 TKf+/t+sx5OEHepDJMBdXDYVjNpiDzQoD/KIL6sBMfx4SuvVVWQX
X-Google-Smtp-Source: AGHT+IF2IV262mxUL5Fv2D4fSAIWDRHFT00nSwPai7dQls4045AmbHQ4mcu0vY1Ry054DisDUO53kA==
X-Received: by 2002:a5d:954e:0:b0:7f3:c683:2257 with SMTP id
 ca18e2360f4ac-7f62ee79dacmr1311983139f.19.1719957553542; 
 Tue, 02 Jul 2024 14:59:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 41/53] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Tue,  2 Jul 2024 15:57:41 -0600
Message-ID: <20240702215804.2201271-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c4617675..9cab48bd0581 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -33,6 +33,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.45.2

