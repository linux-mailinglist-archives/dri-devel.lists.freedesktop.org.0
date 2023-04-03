Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E16C6D4D7F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE5C10E50F;
	Mon,  3 Apr 2023 16:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB0710E50A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:23:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so549574wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680539030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ivRFBbBLsT8PENrIOkpzsl3GjnJNYg5q8GytdSeJd/M=;
 b=IOuF0a5uQ725wwgMaBOFJ1CIGIRMg0a9KPi6cU98t148Vl6+7OmVj3m4vuTchlNe4m
 ln5xNXcFJU7d/HfsdPdeYRXw87unX5BBGGmdXJ9dclX2NyTTRSjF68Y4WrSmDrwjQiI5
 NaP9sbOeRS4z8Z93HPVwO4uzOI4YdvS77w18+QXTDjIg9yhgxOfkaHpE1QRmHzoYDG/O
 50ZrgcLW3tpGg8CtVVmzU74njAoc+resf07vqVwJgQb2iasFhttyESDcpeTOyQTYmqOr
 CaXy0jl4cdU3DwcsMEz24jxJNfaYy6IDekqlrjD96ajWpXt3ErCjGjoEcNLeBpSoQFXm
 PVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivRFBbBLsT8PENrIOkpzsl3GjnJNYg5q8GytdSeJd/M=;
 b=AClXCGL08ix83TfyCKO36kxUUBUivpqfzYKiQWgOkctFZg7sA9YlRukca6nq9e3cdm
 pg/7YUjg/SHN8A+JgcUB8MTFlC+iDfZkUa8lCqFAKkGVFWW9u0HkcQwS4GcTLmUTZi0E
 jNz/NAqnY1i+IF3QSjJiPc/VqWuoyQWm9m/uZ2cFEo9LtEKtNB93o9C8qj4w7jAGveA6
 bcGJDiStnSsOzN0Q/jhZ8KqmM+G7+9pXODiKGU60AG29CHpRTyuNQI0rjR/TodwOkuGm
 WYYsGNvyIhPXeAhvVP82xGMzKYLKRxiPvtZepEsyMUFW4PhcCT6uZKLL3maURk1DZvCt
 h7yg==
X-Gm-Message-State: AAQBX9ehxi8eXfQe9a1sCTOjtezoeyB69hmbuS2WPDvHFZrjsms1f7OS
 l+qtQN7Zvdsf+gMOvg9ja8m3Sg==
X-Google-Smtp-Source: AKy350Y0dwdrloMLnmOxEX7aFVmeSuWrDX0m6xIcHULen5gHtETLS6bdzWdfZ5iK8mIL4Gtea3dHfg==
X-Received: by 2002:a7b:ca57:0:b0:3ed:95a5:3257 with SMTP id
 m23-20020a7bca57000000b003ed95a53257mr83037wml.2.1680539030512; 
 Mon, 03 Apr 2023 09:23:50 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b003ee2a0d49dbsm19829116wmo.25.2023.04.03.09.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:23:50 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Mon, 03 Apr 2023 18:23:46 +0200
Subject: [PATCH v4 1/5] docs: process: allow Closes tags with links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v4-1-d26d1fa66f9f@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
To: Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, 
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10687;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=CkDFVa9AtDJkV6ivMyRE3U4PFtLS27wF3tz/1GHYQv0=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkKv2TsAdkWH3G3vfoLHKBkzL+HAaPOCj2pvJ3X
 McK7SVIDPOJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCr9kwAKCRD2t4JPQmmg
 c5RCEADf8ycEKlMSTQFtUaePef5o8obyK4vywLLXq5jZ3fLrvLSrHhNQeoWc4UtR5gK3GUwKvbb
 ZrnMUDIhMWNL10vtutD85fKxLMkM/zLxtu9ZStR87lztFG94GgSnN/lOzRobVDLx6bkY30XuVw6
 3s4q1fsqa+nvILN2m++4Ya4Cv96AnJ6uhAyF1AA3QQw+Ld3vwEWcrrKG9qzOR9YKwiB2PweT0Jz
 Kep+owaTn1DfkzWPiHYAFizo0rL3cuQQsvo265itWrMQov82zNYc+b1G1Wr2vnXSerVnfFI8TGr
 S25SMciVp4CLzH/Re01nJhA1GAfRyirUd0zHUtHgwUZHWVLovT6tOkmGX0V8OnGbDvKGam0ME6R
 uaGWvRnXIUFRJnOopQ2SSTxWWLLq0d1KWkSJtQPquh8Bt0CoEZNxDGzKB9vdw+lWiHLHZyR37zE
 WAJKuHXUx8afiXMOzq35NUIP+AG7Sfmt5iuz7dIZoTPQClQ5STN8RxyBEmG8fD81DKq8pmzvseQ
 UaU6uefcXzDrgrJ2BtWwn47XK6G/7joq3r63toQa46miW83FK630s6hUGWKJlb8AJ8oRfqfm/AG
 d90TvmnlkY803/UKXpEDjOoh40or1fARp8XzNHhd3+c/PJEP5HD78yjrv0DGZRBNbk9kwUZprTX
 VUBBS0zr49vQKzQ==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
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
bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
bugzilla.kernel.org when the appropriated tag is used. The two first
ones accept multiple tags but it is probably better to pick one.

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
sense" like it was the case with "BugLink" recently [4]. It has also
been misused but that was a long time ago, when it was common to use
many different random tags.

checkpatch.pl script should then stop complaining about this "Closes"
tag. As suggested by Thorsten [5], if this tag is accepted, it should
first be described in the documentation. This is what is done here in
this patch.

To avoid confusion, the "Closes" should be used with any public bug
report. No need to check if the underlying bug tracker supports
automations. Having this tag with any kind of public bug reports allows
bots like regzbot to clearly identify patches fixing a specific bug and
avoid false-positives, e.g. patches mentioning it is related to an issue
but not fixing it. As suggested by Thorsten [6] again, if we follow the
same logic, the "Closes" tag should then be used after a "Reported-by"
one.

Note that thanks to this "Closes" tag, the mentioned bug trackers can
also locate where a patch has been applied in different branches and
repositories. If only the "Link" tag is used, the tracking can also be
done but the ticket will not be closed and a manual operation will be
needed. Also, these bug trackers have some safeguards: the closure is
only done if a commit having the "Closes:" tag is applied in a specific
branch. It will then not be closed if a random commit having the same
tag is published elsewhere. Also in case of closure, a notification is
sent to the owners.

Link: https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern [1]
Link: https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests [2]
Link: https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/ [3]
Link: https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/ [4]
Link: https://lore.kernel.org/all/688cd6cb-90ab-6834-a6f5-97080e39ca8e@leemhuis.info/ [5]
Link: https://lore.kernel.org/linux-doc/2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info/ [6]
Link: https://github.com/multipath-tcp/mptcp_net-next/issues/373
Suggested-by: Thorsten Leemhuis <linux@leemhuis.info>
Acked-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
v4:
- The "Closes" tag should be used for any bug report. Then also always
  after a "Reported-by" tag. (Thorsten Leemhuis)

v3:
- Allow using the "Closes" tag with any bug reports, not only the ones
  supporting automations, useful for regzbot, etc. (Thorsten Leemhuis)

v2:
- Add Konstantin's Acked-by: even if the patch has changed a bit, the
  concept is still the same, I hope that's OK.
- Mention "public" in "5.Posting.rst" file as well. (Jonathan Corbet)
- Re-phrase the new text from "5.Posting.rst". (Bagas Sanjaya &
  Thorsten Leemhuis)
- Clearly mention that private bug trackers and invalid URLs are
  forbidden (Linus Torvalds).
---
 Documentation/process/5.Posting.rst          | 22 +++++++++++++++++-----
 Documentation/process/submitting-patches.rst | 26 ++++++++++++++++++--------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 7a670a075ab6..de4edd42d5c0 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -207,8 +207,8 @@ the patch::
 	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
 
 Another tag is used for linking web pages with additional backgrounds or
-details, for example a report about a bug fixed by the patch or a document
-with a specification implemented by the patch::
+details, for example an earlier discussion which leads to the patch or a
+document with a specification implemented by the patch::
 
 	Link: https://example.com/somewhere.html  optional-other-stuff
 
@@ -217,7 +217,17 @@ latest public review posting of the patch; often this is automatically done
 by tools like b4 or a git hook like the one described in
 'Documentation/maintainer/configure-git.rst'.
 
-A third kind of tag is used to document who was involved in the development of
+If the URL points to a public bug report being fixed by the patch, use the
+"Closes:" tag instead::
+
+	Closes: https://example.com/issues/1234  optional-other-stuff
+
+Some bug trackers have the ability to close issues automatically when a
+commit with such a tag is applied. Some bots monitoring mailing lists can
+also track such tags and take certain actions. Private bug trackers and
+invalid URLs are forbidden.
+
+Another kind of tag is used to document who was involved in the development of
 the patch. Each of these uses this format::
 
 	tag: Full Name <email address>  optional-other-stuff
@@ -251,8 +261,10 @@ The tags in common use are:
  - Reported-by: names a user who reported a problem which is fixed by this
    patch; this tag is used to give credit to the (often underappreciated)
    people who test our code and let us know when things do not work
-   correctly. Note, this tag should be followed by a Link: tag pointing to the
-   report, unless the report is not available on the web.
+   correctly. Note, this tag should be followed by a Closes: tag pointing to
+   the report, unless the report is not available on the web. The Link: tag
+   can be used instead of Closes: if the patch fixes a part of the issue(s)
+   being reported.
 
  - Cc: the named person received a copy of the patch and had the
    opportunity to comment on it.
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 828997bc9ff9..12d58ddc2b8a 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -113,11 +113,9 @@ there is no collision with your six-character ID now, that condition may
 change five years from now.
 
 If related discussions or any other background information behind the change
-can be found on the web, add 'Link:' tags pointing to it. In case your patch
-fixes a bug, for example, add a tag with a URL referencing the report in the
-mailing list archives or a bug tracker; if the patch is a result of some
-earlier mailing list discussion or something documented on the web, point to
-it.
+can be found on the web, add 'Link:' tags pointing to it. If the patch is a
+result of some earlier mailing list discussions or something documented on the
+web, point to it.
 
 When linking to mailing list archives, preferably use the lore.kernel.org
 message archiver service. To create the link URL, use the contents of the
@@ -134,6 +132,16 @@ resources. In addition to giving a URL to a mailing list archive or bug,
 summarize the relevant points of the discussion that led to the
 patch as submitted.
 
+In case your patch fixes a bug, use the 'Closes:' tag with a URL referencing
+the report in the mailing list archives or a public bug tracker. For example::
+
+	Closes: https://example.com/issues/1234
+
+Some bug trackers have the ability to close issues automatically when a
+commit with such a tag is applied. Some bots monitoring mailing lists can
+also track such tags and take certain actions. Private bug trackers and
+invalid URLs are forbidden.
+
 If your patch fixes a bug in a specific commit, e.g. you found an issue using
 ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
 the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
@@ -498,9 +506,11 @@ Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
 The Reported-by tag gives credit to people who find bugs and report them and it
 hopefully inspires them to help us again in the future. The tag is intended for
 bugs; please do not use it to credit feature requests. The tag should be
-followed by a Link: tag pointing to the report, unless the report is not
-available on the web. Please note that if the bug was reported in private, then
-ask for permission first before using the Reported-by tag.
+followed by a Closes: tag pointing to the report, unless the report is not
+available on the web. The Link: tag can be used instead of Closes: if the patch
+fixes a part of the issue(s) being reported. Please note that if the bug was
+reported in private, then ask for permission first before using the Reported-by
+tag.
 
 A Tested-by: tag indicates that the patch has been successfully tested (in
 some environment) by the person named.  This tag informs maintainers that

-- 
2.39.2

