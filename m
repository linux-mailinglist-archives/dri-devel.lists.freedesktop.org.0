Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC4924A6B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5310E6DB;
	Tue,  2 Jul 2024 21:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfGz+Xuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3FE10E6D8;
 Tue,  2 Jul 2024 21:58:45 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f3cd802729so172614839f.1; 
 Tue, 02 Jul 2024 14:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957525; x=1720562325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/0f+WJi9XEdvmbVJJgJH3wGY/BCuH90DF46SNcsdjc=;
 b=UfGz+XukE+Jm2YCPv1g/tpuWwDvMfcnSQWU3gGesVVxUJ5WIqUb2MYyYOcafo6uh5J
 0xi7aUyDie/56nNmKshjdSw2QGyFG3UNvsetmCwqEl3j5L85QvnYoeGnld/pLyG6ZADJ
 yZcvbyeZDQD95VIibAm4NLmrhgNlTMQlosXGAth5PiwJ6rjZoz6t3XCJ2Q6QEcCJ+j8H
 /E1+FmbUvIreP9DQuAFdyOfhfjnfvz1Yx0+N68IHNgKmRqGodD6+AddSfjhg+hGvsiF4
 1iLcnNsgdjC3GCWlRZFrZhelVJFwf9oKTRPE9unbQgEKRHfUI6khhHB29SGWcV00BxPZ
 EVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957525; x=1720562325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/0f+WJi9XEdvmbVJJgJH3wGY/BCuH90DF46SNcsdjc=;
 b=b+T8fvVY0kR/iWbtWq9AtRMl4JG8h7+ljEayTtAXPHCwLyBSwunVTabBUoXiLipDz7
 v1IAlBW0yIReEXSNMm1fyIoGTCDG5hMGgvNwGIwdCq7i+jvjcQ4tayd/3r2tdkYySf9m
 SZYmoxqtRUn7i3VfeCTvJvmrCH4xwugIYMpZERneqJnUj/PcoytTu3kn3PHK8bJ0Fvhr
 6E8qto4SmJqWkrqt2pdmgvJAtn4MdGWaVAyyHfHtA0UnScykGqsamxgwfPKvpFz2dpHn
 oFz/+3CyBoUzrTT3EfkSFcZjlcSBr4ps0bsHJyYQ8Nkceoh1/LH6TvvGaTkxjnMmdSyX
 EgqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNHIW2l5XU/7uGiL717Cw+w8LFnnGYpXrJ7VwIX1U5hkLHx7Uibag6TLWj3JWYuOmyJ3eKfAJCFhMMDzbLQh2iWdFF6EpYTMmFO7QhUm30TdrCrb70anObmR/uOm9Ky9WCuZXmPMw9vyl1T3I+z2+NIfzkYlz4OGAyn48Eq7y3qqNlm3u4cJw0ZLhkfWolKq3N3M4CEsFiYXUwmBINkkNzBASs+Ou3HrZ9K6MI5aafnjYv+/Y=
X-Gm-Message-State: AOJu0YycDMs+I4gfn25O4RCEEc6OHGL6PZGLeeEu1y2XbLiJbKQK2xTq
 btOjDpJrKlFOWFZohrPARquMQvZIlKEoqyiXxge9aCCsy4DFZPHy
X-Google-Smtp-Source: AGHT+IHLfOgNFYNQh7piopnisG8tXecKttMpNNloe2nsbJJt7+ulnb0/PNAJxeVF6b/DwLmUpVs2Gg==
X-Received: by 2002:a6b:f212:0:b0:7f6:2b2d:8acd with SMTP id
 ca18e2360f4ac-7f62ee3d967mr1225918439f.8.1719957525100; 
 Tue, 02 Jul 2024 14:58:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 25/52] dyndbg-doc: explain flags parse 1st
Date: Tue,  2 Jul 2024 15:57:15 -0600
Message-ID: <20240702215804.2201271-26-jim.cromie@gmail.com>
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

