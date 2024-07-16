Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594B933102
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515F610E844;
	Tue, 16 Jul 2024 18:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggIBJ7px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722310E82A;
 Tue, 16 Jul 2024 18:58:58 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-38373958e94so244955ab.0; 
 Tue, 16 Jul 2024 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156337; x=1721761137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/0f+WJi9XEdvmbVJJgJH3wGY/BCuH90DF46SNcsdjc=;
 b=ggIBJ7px65BXAgcxDszfOBXrquW0X6jTltIFnMH9348EwerDD0cWkatNc1joo3+Md0
 sheJ8U3fiCpHnw0VdkfxdfQTkldtnBalDcpO70UVG9ybjw9lEim0rQPDAtO2ivjckhd4
 6gj/lun9Zivo+FU5dS0HfOLg/i6q/xK8PJmJDyGIGrGMtjWYWn3H8jNBxTwD+mG+ErTd
 oTLxyg0eQdJJBg6P7SdXICl+bglxt8IbwbxoWk9EO9uuO2ju8VKvG6Oe/kgYfRn5E7g6
 6uKRxW5yqklgzMyjV+9eQP3nn6Pj3yCw98FjRKm8Cqechwdi/oqhOWsI2sxZrqw/hDTl
 J1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156337; x=1721761137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/0f+WJi9XEdvmbVJJgJH3wGY/BCuH90DF46SNcsdjc=;
 b=mQA2gm77D/ws8DvsZaH+/trprjSZB8TYr4iPsfz0xd/F2xFK25krPTITXXr/lnzfp6
 oNZyBCwLGnO+POtf2opJqPe7kdpw9U2+AnjfyP1+UU5Erc+ZPl3bKWLOjekwJHeR2pCV
 ntmd6cXg0kTKbYGkWDpB4SZjiT8JRTU0+fjbkAyHOylbK9M2rwMrZAp4QPq3cfXR4Xoi
 plmaqQZw89in6sNjbXMrBbsMjt6yPNgJYqRg7Y9QUnO+GPg2XBORuvOi5L75CZwahzXj
 t24cUMAx6NsQ1cXYE7rgF2XNGWM3GR2kA/mIvU8b9KHkRuO3Fp1/Zk6mestJ349XZWKD
 Ll6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL+ObxWyLQ+Nl9YAwns10yJjASLEX28wWNV/ewOjX5wJ1ZsfdBFkBAhgJmHUmfWqehJA7twL+1oNpOfR9C58+sa2iWWjOj/QrebD1X3A+5eTElHW1ntR8R/UGRBIEsSsAG+djIKbL6MRvZmSkTMmB0vvsUJ5BcGnPczuIvHsboxJTV833a597p4ip1PVB8xhQ7QyzqVhyiz5Eq1MyuvfFmSvScDsecz2n7jm6rKltTyG4t7s0=
X-Gm-Message-State: AOJu0Yx7hikf+mYCO6nCTYNhc+SUwcURDmtwGHCuzXL/oFLZ5ehitzHi
 /bthH1OR8HeKYtxeiBb80zyJy5gdJtoJv289kky/pdjsIBZGMD4M
X-Google-Smtp-Source: AGHT+IEi4sdjxzQ0oudUt7GMdorsoDaH0Xjh0/KlGssDHL3rDixHQ7EbnOzUaj0Aj/gbK9+Ua+nMLA==
X-Received: by 2002:a05:6e02:1a04:b0:380:92fd:c4fc with SMTP id
 e9e14a558f8ab-3950f2854b3mr2319965ab.14.1721156337088; 
 Tue, 16 Jul 2024 11:58:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 25/54] dyndbg-doc: explain flags parse 1st
Date: Tue, 16 Jul 2024 12:57:37 -0600
Message-ID: <20240716185806.1572048-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
the only required field.  So if the flags draw an error, then keyword
errors aren't reported.  This can be mildly confusing/annoying, so
explain it instead.

This note could be moved up to just after the grammar id's the flags,
and before the match-spec is detailed.  Opinions ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7b570f29ae98..ccf3704f2143 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -106,6 +106,16 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
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
2.45.2

