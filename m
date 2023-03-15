Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BD6BC7DF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E8310EC52;
	Thu, 16 Mar 2023 07:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F910E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 17:45:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bp19so14746969oib.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1678902329;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JcpnRd9KGxwktUJz2QcJwDPb0n80h3k6W+inghf5zt4=;
 b=FiE39y0lrqFtnApWBcKn931tIXkxTX3G7p14TVWZUAz5w6Pv5qNbQqM3WXlkcDKxlv
 P899ckTC9Ink085c+MFQhcLyEmEiJs+N0UK4dsr9YAZxHkamZ9A2BGYwr+gjwnJQg9d7
 goLNeh5LHR7Xlw8RPoRo3ZCGzJiZLzEUiiJbtYA/AGYW3do2yMgg+f1/pCJtilr1O/jO
 2/faqrglNeOcUCL50Eymw6o0aROU/Q2Fk/HcX+4LMD21nsI8Pe/eaiv8obwfpFWbb1vq
 5jieIqMmo4yp92HoPh7vps/Xfm1YHDpRa7xFddziP1d2dta2/LIZvcjgYZMbC5Prg2D4
 EvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902329;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcpnRd9KGxwktUJz2QcJwDPb0n80h3k6W+inghf5zt4=;
 b=66ibPXkUAFr5LRviWA/+W6aRawxbUMd/XovcACWPAyBPEVkqL7iQ5QHJGk5vvRgugc
 yherAXIBYmQvWidbvteBKvRgzZvQdCJfi/zQE3AbukFGt69QmhWYAKiwiZf2XAIX+3a6
 iFWRYr/hzvMEiNXPM7F9jmz9fNnN+8aANwnst9CKjc+WKWGTkRIQtDxjHa1zp0LAHz7z
 GZY08xUM97bdhG+dJzcRt4NvASmJiRpV33uF/RkfN0sVRCLlcNRzJuvG5W6w0z41oGlk
 EE5DQlEWIA/FEArq6HFoBIcS8EnlTHXGa1mg971wrkXildDUgiFx1BvPHgtRWrumjBEe
 nClA==
X-Gm-Message-State: AO0yUKXJ5js0WnTMv82CX4Q4lQuMRc8/kqZE40Knb3bGqYwXBfI01w4q
 GmZ5Vjkaj4CkUdi9bMTSeWwFUg==
X-Google-Smtp-Source: AK7set/jK/V+OQWUZgCvj0iBPePp55Eb1qgFRDuXTspKvimH6UVpJlKLMpQL70jxRgulBrnu1Of6AA==
X-Received: by 2002:a05:6808:1d7:b0:386:9886:76d7 with SMTP id
 x23-20020a05680801d700b00386988676d7mr1604924oic.26.1678902328459; 
 Wed, 15 Mar 2023 10:45:28 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 p81-20020acad854000000b00383f0773beasm2381095oig.52.2023.03.15.10.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:45:28 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Wed, 15 Mar 2023 18:44:56 +0100
Subject: [PATCH 1/2] docs: process: allow Closes tags with links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
To: Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, 
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5155;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=kIvLRBTvUIxjcJYV72+FY3+0KHo+tFtG0Ql7UNi3fxw=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkEgQqe1WomYZceoqCAqo0xw1DY+Xv7jfyeYPrw
 59b7goiWNSJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZBIEKgAKCRD2t4JPQmmg
 c45JD/9OfQHo7mKZQwi5U2mPK61Zmy7PihJO9R40Lv5+y4WfDSWaA9ct8MdTQlhna7dqBxChOVZ
 6ChTPRDonjdZrCR9/gzbGlj4Ldwxxbg/JyLllreyMUetj4CleAGF4L2oAu1OcbXUh1838wtlJ4s
 9mCS/zoFZT19GJWxpXgqdZLiSWPjFRk1yzdqXd4PQ0/FNn7FUYuRTMVBcwG1l6Dm2/kz7z/mAY2
 mhTKs3M0mirVZNHQ5TPXHX7dsBbAMF6cbG3SX9g+1ZWt6OqO9FEiF3wmiKs0lAiadQ7i5PyHT64
 xFbutvKRLmNhlBj8ba0KTh03MvMn4SmshuqXB9eDtK6ylHqa6Tcbjuo1ZzI+lRRGXUFX7uSJDDX
 UK6fadsNmBSiytxKrJ2lY8UL3OiaYxVuG4JUZeGRzVja63wCWZwAcyN1ppovBqw54yMa6C8U7Al
 uEsOjBFTDu0usMWiVNFiH4E96ucseWEc5FMvdIg2z/4e+p6COqi7DLPMndh+30/xiiwk5Kcvj5P
 nPPa2nUNL6ojKPr1mFWVY2XuFAZDI7oqHp/irumD5pbDMcZJY54TFFXY08dBi/llxhECoNZTlJu
 hJQXtKvtcNiy8c2hy80A4So2rpKZwyTh1ObccfkPw/Thr3lT2RG/Qr+XQPqn6J0uS44JgTuYdtp
 OBjQPlB9mIBplUw==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
X-Mailman-Approved-At: Thu, 16 Mar 2023 07:56:01 +0000
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
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, mptcp@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Making sure a bug tracker is up to date is not an easy task. For
example, a first version of a patch fixing a tracked issue can be sent a
long time after having created the issue. But also, it can take some
time to have this patch accepted upstream in its final form. When it is
done, someone -- probably not the person who accepted the patch -- has
to remember about closing the corresponding issue.

This task of closing and tracking the patch can be done automatically by
bug trackers like GitLab [1] and GitHub [2] when the appropriated tag is
used. They both accept multiple tags but it is probably better to pick
one.

According to commit 76f381bb77a0 ("checkpatch: warn when unknown tags are used for links"),
the "Closes" tag seems to have been used in the past by a few people and
it is supported by popular bug trackers. Here is how it has been used in
the past:

 $ git log --no-merges --format=email -P --grep='^Closes: http' | \
       grep '^Closes: http' | cut -d/ -f3-5 | sort | uniq -c | sort -rn
    391 gitlab.freedesktop.org/drm/intel
     79 github.com/multipath-tcp/mptcp_net-next
      8 gitlab.freedesktop.org/drm/msm
      3 gitlab.freedesktop.org/drm/amd
      2 gitlab.freedesktop.org/mesa/mesa
      1 patchwork.freedesktop.org/series/73320
      1 gitlab.freedesktop.org/lima/linux
      1 gitlab.freedesktop.org/drm/nouveau
      1 github.com/ClangBuiltLinux/linux
      1 bugzilla.netfilter.org/show_bug.cgi?id=1579
      1 bugzilla.netfilter.org/show_bug.cgi?id=1543
      1 bugzilla.netfilter.org/show_bug.cgi?id=1436
      1 bugzilla.netfilter.org/show_bug.cgi?id=1427
      1 bugs.debian.org/625804

Likely here, the "Closes" tag was only properly used with GitLab and
GitHub. We can also see that it has been used quite a few times (and
still used recently) and this is then not a "random tag that makes no
sense" like it was the case with "BugLink" recently [3].

checkpatch.pl script should then stop complaining about this "Closes"
tag. As suggested by Thorsten [4], if this tag is accepted, it should
first be described in the documentation. This is what is done here in
this patch.

Note that thanks to this "Closes" tag, the mentioned bug trackers can
also locate where a patch has been applied in different branches and
repositories. If only the "Link" tag is used, the tracking can also be
done but the ticket will not be closed and a manual operation will be
needed.

Link: https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern [1]
Link: https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests [2]
Link: https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/ [3]
Link: https://lore.kernel.org/all/688cd6cb-90ab-6834-a6f5-97080e39ca8e@leemhuis.info/ [4]
Link: https://github.com/multipath-tcp/mptcp_net-next/issues/373
Suggested-by: Thorsten Leemhuis <linux@leemhuis.info>
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 Documentation/process/5.Posting.rst          | 9 +++++++++
 Documentation/process/submitting-patches.rst | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 7a670a075ab6..582d67eb2420 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
 by tools like b4 or a git hook like the one described in
 'Documentation/maintainer/configure-git.rst'.
 
+In the same category as linking web pages, a special tag is also used to close
+issues but only when the mentioned ticketing system can do this operation
+automatically::
+
+        Closes: https://example.com/issues/1234
+
+Please use this 'Closes:' tag only if it helps managing issues thanks to
+automations. If not, pick the 'Link:' one.
+
 A third kind of tag is used to document who was involved in the development of
 the patch. Each of these uses this format::
 
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 69ce64e03c70..88561a32b5cc 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -134,6 +134,13 @@ resources. In addition to giving a URL to a mailing list archive or bug,
 summarize the relevant points of the discussion that led to the
 patch as submitted.
 
+Note that it might be interesting to use the 'Closes:' tag instead of 'Link:'
+if the URL points to an issue from public bug tracker that can automatically
+close tickets when such patches containing this tag is accepted upstream. For
+example::
+
+    Closes: https://example.com/issues/1234
+
 If your patch fixes a bug in a specific commit, e.g. you found an issue using
 ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
 the SHA-1 ID, and the one line summary.  Do not split the tag across multiple

-- 
2.39.2

