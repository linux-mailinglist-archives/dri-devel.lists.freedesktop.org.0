Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F24A6AD7C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BE910E6D8;
	Thu, 20 Mar 2025 18:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UI0/+tUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72610E69B;
 Thu, 20 Mar 2025 18:53:08 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85da5a3667bso37814639f.1; 
 Thu, 20 Mar 2025 11:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496788; x=1743101588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
 b=UI0/+tURpazc/iG1R3WN5nLc+UMPPhEwGxtjlWfKil9DFumkUeFidX7JytyocPnyq0
 WGyPUqDZbWxfOOXkV2vgpD7WCeyCe9oWgrYjELZ0NGow5MK9YS6PS5gZ5VUsXeO8Adiw
 iF20GrSj9TwT8n6+05EgWiMsQg3NjPUF6/dszkW5G0af2YNVROklI6I1m9kwEtfSiJWk
 9nhN+ruXuBkShS9Lm7KJuUm0PfCMl33vH8oUdU/FXtuAFcNt6PDO55ikn9hvOh7p3DKf
 sLYib//n0mEUYUfrmvrn9oyx7eC6oybom0KYW8LOirr3XQ+fE6iZiiuzh2SwFrjr3wEd
 59kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496788; x=1743101588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AN9v4KQ0PiEc7jM3vE8QrHxAiVUi2zmd1sx7ARoRMg=;
 b=c+Dn5uIPtLALjc4IszNzdurOyI7NABOzub1+YHmsVry9sBC5pIJ66BIW6zNcfNnx7v
 7URSkcMt8fvyS+9NR/Oa8eoabnd4TIohxDrn78eq7i6mt4Pr1p9c7DdmlctP6+50YnZl
 SBKG5or7dq59b1xYXq7gCRQGtRJUKF1wdUq9zLN9Li282FgqVQpNraR4GEvz0/TNGQ/e
 iLTxx5GNQs3HIroZNRyBVINhSPuQnZWD4d5eZ5HrndfdC/744razzbnZOigj8yozw2pi
 SfPi5MktQkK54NmNfEvBAbw7fmnvwcNyg0+KXWt+6tjvKi56jiXF4zFjuhLMpvOW3kBi
 KJcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUgc0aciCmEPryYB0Uxj0xa+TnhaEUFWMiHvK7JCaqiTvwPymCukshNpIwj/5oR3/DuiY+mfBw2Cdi@lists.freedesktop.org,
 AJvYcCUmlZeRNuHPmrnNmBZfoYv4Y4qRC891SpH3fVRVJ7gonUd70+ouiORYEZcOhOmla921s9itlUrqUhhNtVr38/6NbQ==@lists.freedesktop.org,
 AJvYcCW2YwVmjcmRoyhbzLb+hdyF3GFuwGBHVUNkjRzeq8pBRiRtWVC1/HSlGjiRG5CaGpLf+r6T7E+/@lists.freedesktop.org,
 AJvYcCW5H6dE3OLiMm+aauK0pWsuQcGlAkd/ZTOCEroMKkNPkwQQZ5zvZiDVEcVfgodwkCaklk4tijALACjE@lists.freedesktop.org,
 AJvYcCX4/R8Y6bbrQw77FsDDw6neH8+okup9edYZbLw9kaJjFZRyg7/hmjPbCMT/etnz6nGd6DsnA3Bzbbm7LT9Q6w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh2bbUltElv+OspMxlZJ/Wk0WEshK1UxX+KPbp5W5hnmQqxZeC
 basBEBparicmApGVv5D3/UHEkXezL91UBsWui1fs+s96RWrd4oLE
X-Gm-Gg: ASbGncuspUCzdQx/ziiWbWkQfLOVshpTkUd3IzajZZUhPoz88kNETRxTjCzTHXtOAwb
 PijW2wMjB78QXebej7ZDoQS/KjdXlHjoLWn4SfJAmfdB1Q/mNkMy3goJdNA8yamMVoPOiGEXpAm
 QatdKs/V5DopD4buivnjtn8GeKtGn6DtJ/q45i0E7M6QFfxjlHrYO+Dea2dI+DvU4k9M5bXtzat
 TSm8ZvmaoNeShob8J4PIt9ymhumXw5vDYCuYpv4vm9APDeQZudZmjzf9ys/LTHmUpjUIQgW4bAq
 N1PoqKPFryW0yUjUtrQR9mhrQef3T8dad4gihOJAlWy1u+MPBMtMwsLqGeTo1ew2nB8cl2anFFM
 MtQ==
X-Google-Smtp-Source: AGHT+IFbrrpvBNEPH58XZa57qwfTNPaqQ6djTba1ednjlTTFGKunOgWQUFpBMAPJ96poTWt2fyLc8w==
X-Received: by 2002:a05:6602:298a:b0:85c:c7f9:9a0a with SMTP id
 ca18e2360f4ac-85e2ca6f4e4mr41062239f.4.1742496787996; 
 Thu, 20 Mar 2025 11:53:07 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 06/59] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 20 Mar 2025 12:51:44 -0600
Message-ID: <20250320185238.447458-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..ac199293d203 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.49.0

