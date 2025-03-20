Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CCA6AD63
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A3310E6A1;
	Thu, 20 Mar 2025 18:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TloQ0gdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D27710E69B;
 Thu, 20 Mar 2025 18:53:07 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-854a682d2b6so76707739f.0; 
 Thu, 20 Mar 2025 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496787; x=1743101587; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
 b=TloQ0gdravRCWZAJ8EWWTlANZaI+vv3K2ZAaarmAvMxvzHp5XxObFG5fjI0bUL894F
 TVkMr9pjcjvafcpxFChM2x4ZXDy0aD8yoPwe1l9HLNU1I53EHtaWrhQbqTDMGIuZNLWc
 VKw+ZSl8fTRsm5u+3OAPjeMNQodEDspebuSrYxp0vOFJVQeEE+2i2Hr2MP+HDXvObwlh
 7mvwx6IZGEOfJAssleMFlvCwm7rt/ukduT2cqsR1gu5EdyUqZ0QTwfyKmjyytWiVCEbW
 H5TwCodiLfMr6bX5VdLkKHvplfeIXm5nXVi1+EKmJeO/zUZDsExK94vxAmtioMN+l0JR
 QW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496787; x=1743101587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
 b=Bg4rk+FcP9ZccSoS1il4pIpnbona5vG67oymg+GGOMyymkkYr/1aTKC9uyls01dJEr
 dzoN0yKki10OYC7/+gq1+fFB9W13ZmyqekUofMQNy/tByst6rLdnceWkChWR7h0JwmB0
 QrO9u0vcwUtefMvWw2EZPLEajW/edesNGSSFtv3BejKt2AUsFQHdJ6q2haSHHguum6Kq
 NADxKySWgOsuyM9x0YVUW9RM+ttH8/CR0llnLB+c9lVCwvLflaChy1l+UsRJwj625FtY
 QgT9Y7siKThBw+nDP6cw3Vzn+BG8K8GFM63B8R/pINopTBEjLUV5JZU765azItVPMuDZ
 KzCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFGhFmlgef7JPmxxID6Mlrjs9+VGTWa2GJO411DlVWyeyDCkLilh9NcnZHtXd9RzxK3A2i5/36Og+RSmr8UXY3zg==@lists.freedesktop.org,
 AJvYcCVjVlq/UpX65bnuHDsD0kv3SlmEqSGE0FsGjogVhAc4kNPVXY1CuyBFOxBymvlpTIFRuoQkW9GnnM0FjT4OCw==@lists.freedesktop.org,
 AJvYcCX8pTWEHELhA/DAUoay0bcn6cYMR3BZiuSoPQXuvtWei2AfZUuR0YIrhujV32GgaXUhyiEdB/1cjPeB@lists.freedesktop.org,
 AJvYcCXZHRG5ziUFDEVegUoJsfm7Lxl0x+NvF7mm2v0LEJto3yiBTnA0uTWpyBS0sUohsHngJ4Jmcj3r@lists.freedesktop.org,
 AJvYcCXuvNaJgi4Bh1uhEYDs7kNGW1A0uShFVGFC5BS3omhfSujUDtewo95kwAvQIFuGnJ2u974DQZRMEVPj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbTGbT9BzcnShxMB+ab+XgGgKnZ97fRaVYhFUs7ToaJi/yNk81
 tQx6ZB0oIBhDun+HR2iSzmWq0Ywklb2B6niX6cSY9I0mImM0l72p
X-Gm-Gg: ASbGncv/cdte29A+OIpZGiqOmQ4MTGf/kwAbKA0U0eTtAPv/Am1RKY0++8vJYFv7lt7
 mKR6eLM0+ls34wI7lK2koUf1NhQ8O3X1jifFnzAubEcqU+buNQPJafjcHoAADprZFYsvfn+MA2x
 6WwrkrJCtsIEX6P6L9kPNZB8bQtR2OM0nD5vmyuJpLLhiBA8P5uo8Sh+AG9yDgLKAuvbdhMkMY/
 O2coDRzlzobhSF1LubZRvS6oP0ZjBKL3gEqYFSRJLeuowRMFmFoJhQ8qtW6M9SdGHJv3rnsN1ln
 I4eTmDOXVDgfDvvVlijZs7WmGW3AT3ROQpPxa7dPA+hE2s1dY3gNLM5QnkBMFFe16kQrZPY1pnE
 LNA==
X-Google-Smtp-Source: AGHT+IH6p6JbwuEedC2NHEExWYxKZwpUK/wnyzikTQHE9duUTCvqa379yLREiYl5a1vshzn3H//0+w==
X-Received: by 2002:a05:6602:750f:b0:85a:efae:2f15 with SMTP id
 ca18e2360f4ac-85e2ca305e5mr45152739f.1.1742496786850; 
 Thu, 20 Mar 2025 11:53:06 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 05/59] dyndbg: make ddebug_class_param union members same
 size
Date: Thu, 20 Mar 2025 12:51:43 -0600
Message-ID: <20250320185238.447458-6-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..b9afc7731b7c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 147540c57154..55df35df093b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.49.0

