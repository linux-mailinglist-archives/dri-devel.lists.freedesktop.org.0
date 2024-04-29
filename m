Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA798B620B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EFC10F73B;
	Mon, 29 Apr 2024 19:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mi6O1Llg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420F10FF53;
 Mon, 29 Apr 2024 19:32:13 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7ded214dbdcso45341939f.0; 
 Mon, 29 Apr 2024 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419132; x=1715023932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ap0abnHnzuA+pCntBOpzm99vZ6Zv5ODzcROoP3CQSrg=;
 b=mi6O1Llg4T8iPYSPY4dZRdRD5ptH15bS1o1PcSNxcU1RR8gpbq9XjR3Qu670OiEKeT
 fnk3QpJjSVm/ivqrE3eNV4C9ZONvXnmYmTXNneXliFkX7xySAYRbzGN647UREoQzDyKz
 QZjy69u5vv/Me03XY7TedrhYqaV4xxFlV/ApnYzWmN5fd+bL2C4U/bVQfJOJSUVWJKKO
 gIy1223JaadnWfjUxYiRcVPiDZGOMHrUcyT9QtmSAcceEq4GwJ0kBNV3poIJjqO3Md8U
 BTSRHve0Fwp4U7o/R1WWoVMvV2zTwkASGExOHDTKGHeNw4VRjgpLOy91L0FZ3zhua3+Z
 qbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419132; x=1715023932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ap0abnHnzuA+pCntBOpzm99vZ6Zv5ODzcROoP3CQSrg=;
 b=qneV7WUulwBTDVwJg9T9twQnz2agYkYCcqUfl+GO15ptqEj/AnVE03IqyMt+h9se8Z
 vO1z184kuxXuNtm7eeINwJlmTCS8X9xxgO7SfM/uEnksYatSm0g52OZOuI6IkT6QJU1P
 2F1opO8XWTEXli1yVK9ZFC6fmzt8FkzqcwoZjd5kCWah4DQDHG/NZ0hg8VpKgkHTnvM/
 ZH91hFaHzP0at22K7Ajwj42kSCw98ztniTrxAV4503CmGzkJOnDO2wBV+qyronBHvg9H
 ms6SLx0o1aMoLLRjFmRggZN+28/nv4IDleMR7ouGKdgRpuZfNWkAbEyTcPmVYYoawJY0
 7MwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw7Yicg6VTK8JesJh9VbSUp+I4qQnViIrDoqFKrTqtyW2uGu/mJkCCrpkejcuc2VJOJewAyE6uib8RMmeRSl9CEdZ/WFGcou+LvgvsupRH1X8YnlA3GRmpqZ9WNKZX6BxUo95pzGg91MkxUCCgIlDNk+qIG5KR1rMt271BFS3VGpQ2pnDGHPZBNR8SAqJjHcfxSXaHoq4CXMTaxJvmFjJ8BjXr/ZLkaVoDIJ7xUy+L4Y1cLWQ=
X-Gm-Message-State: AOJu0YwAdrFuTaeXGPtAsQUjNcfp+4mptTHjWnGL+Ust8ZEfYU1hD40d
 TyGBTbrOqfuqUGJN0yOYR/vmZhvnoyplyHal+w3Ef1CkYzpQ5XeE
X-Google-Smtp-Source: AGHT+IGRdeeN+u2zMfjhDij9Il5S46oy16VyUUR7QmAHR8HDMNzTIxpnF8fD58yH4IXlMsHdP3l6HQ==
X-Received: by 2002:a6b:6417:0:b0:7d0:8cff:cff3 with SMTP id
 t23-20020a6b6417000000b007d08cffcff3mr13514911iog.8.1714419132083; 
 Mon, 29 Apr 2024 12:32:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v8 01/35] dyndbg: fix old BUG_ON in >control parser
Date: Mon, 29 Apr 2024 13:31:11 -0600
Message-ID: <20240429193145.66543-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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

Fix a BUG_ON from 2009.  Even if it looks "unreachable" (I didn't
really look), lets make sure by removing it, doing pr_err and return
-EINVAL instead.

cc: stable@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c78f335fa981..f2c5e7910bb1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -302,7 +302,11 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 		} else {
 			for (end = buf; *end && !isspace(*end); end++)
 				;
-			BUG_ON(end == buf);
+			if (end == buf) {
+				pr_err("parse err after word:%d=%s\n", nwords,
+				       nwords ? words[nwords - 1] : "<none>");
+				return -EINVAL;
+			}
 		}
 
 		/* `buf' is start of word, `end' is one past its end */
-- 
2.44.0

