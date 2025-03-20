Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F78A6AD8E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED92A10E68C;
	Thu, 20 Mar 2025 18:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y4+3BvpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDB910E68A;
 Thu, 20 Mar 2025 18:53:40 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-85da5a3667bso37831939f.1; 
 Thu, 20 Mar 2025 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496820; x=1743101620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JojmC+9FxP2Ro0EyDJ7vhOxZoHEZd1XTtPdoBZyU2s=;
 b=Y4+3BvpA8UADqsgKrDpdgEiDq3Dz91jdI/9DZKdmFOL6V3IQfuo+KG7NKH1thoqM81
 h2lK3pFmbKI54iA5CbeiPnIhcA42/uDa5JwyYEpka3trvgoKdDd7Fca+meiKSx+INtGf
 6Yd2jVNCyQ6y5Wht/w/LLJHmMboktUUvPBgsKB0OjhvLtGcgDBmeDrSqSx+Oa+ZoHqVe
 mDuWzrxjkRhtpVsar8kGT5jG723d0WHtfdEkFU+AWrVoxcdQeL8TSw71j5lObvbw5UMJ
 BDf/VLeONoBQqKPfj08WWGXcfNYLGZZkD42Cx5PDOEFgOgJTAurel1SIWx8PW9TTL+OJ
 5sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496820; x=1743101620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JojmC+9FxP2Ro0EyDJ7vhOxZoHEZd1XTtPdoBZyU2s=;
 b=egmJL6PKvtErXYHGeA6mgz+h4LcOyLPkl0oevCrxN0XANdYsayJwC+oGHB1X6o5dmc
 DwEOGne+dRwg6fT3IfZIJXbFAnyLuR1zkrFJSaLBuaa/oKSEgTWy68q+e7g67QNaIxIe
 Uq0CCZB+mUdEC/Vslq38ggs5xeQVzdLK26+n8+bICxCZP5pZzHpOsBSyh/vPiEj9UMq9
 WEO7pwa90mfLNAyD78O3acAy+d385h0QKxYdvqREWdZtWyvd36jpVByFctNlx6dO85oJ
 OEr1ESTgij/w1o9c/EGFIAXqFoYws9Ydr3ESoB+JB/Tiqkz/iul9Ln9x4x0g7sxYvwsy
 tePw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2/89fDPttbr3hn46BA4Qd9d8oCAKa2xkT52LtVcRqgui7GAinTxVJiOjRLWDlfhWIAmstdeHtMoz4@lists.freedesktop.org,
 AJvYcCWEglOVD57KYEh/Nx92ZN1krug8MEIMvlyr2yvtdermOTTd0y8J5WVqLMf7tomGrOcDtMiEjRPhgsko@lists.freedesktop.org,
 AJvYcCWzJh9xIzkh0gi/TW2cUrZvJsDd7a/ori6ODtFifntq9LEy8ffJbUaq7oKEQ0uBR3Mvr8cShU3c@lists.freedesktop.org,
 AJvYcCX3dzlh2Z3eEBavMHrdFfU6LwtRmhzHTPX1+maWM5FRdD1feLBA+Odo5V04/b9rY8UTFJAAkFLPOKOeM+okoA==@lists.freedesktop.org,
 AJvYcCXQtksER0qC52ZUs2g9ACt+YCmn0QqreddmLZzoI/JFZunh/9k9/CFvoZ7iukHgdMvvsbYOK0CdPgS/fcA8EKv8kg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD9AV6Ff//PpPXnDFDflb7nksKyLCCYArbAxh3WV0D3ctCRYm1
 MGesgZXlcCAPij3AViFqABgPX7cTd+B0jAMxeZh1IB7VuOpT+iSb
X-Gm-Gg: ASbGncsj1lV/OQ8uAeB+gvdFvUvGiUT268lVJazobMWVx9q9t2KNKbKBlIdxIVmTUvN
 S6AvA1ElxD1aAA+VkjcF691lNNfOKnJpdstIMruEuM/fY+M9NjzCDmOp2uYlClV8mEiPY3BRR2c
 8nVxgpL9ON/HkZsETfCRAIRLV8AE8qnIU29n/gx9EOpoqTFur4uPlE9zHPpKdDL0ZM5HH2tKvgQ
 FNTquH95QmMIhsZYL4upXDs7E5dlPDPFYLJiWL7Jt/oHwJwWV6iZh+IGoqnUgzsoAEGXM1O2KEN
 oJYtHoNnUKoIGj6Xzg+hyHXNPrJ1YsJgdggxuq9VrBKuoz7ghotnCpUckUvkaNHTkcH/Wj2oHy1
 9WI7MXIyypBYP
X-Google-Smtp-Source: AGHT+IG04lf95fJO+S+3AZcgEaNcIF03DKuyxl+Fgiex9RLp35StpaNvWFb8uwJT3IqqzXUNqAF8Fw==
X-Received: by 2002:a05:6602:398c:b0:85b:4ad1:70e with SMTP id
 ca18e2360f4ac-85e2ca8a7acmr52986639f.6.1742496820040; 
 Thu, 20 Mar 2025 11:53:40 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH v2 32/59] docs/dyndbg: explain flags parse 1st
Date: Thu, 20 Mar 2025 12:52:10 -0600
Message-ID: <20250320185238.447458-33-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 8e2083605bd7..d2928884c92b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -112,6 +112,16 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
-- 
2.49.0

