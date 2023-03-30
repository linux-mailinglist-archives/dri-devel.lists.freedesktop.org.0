Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152136D0D89
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272FF10EF70;
	Thu, 30 Mar 2023 18:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C510EF6F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:13:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m2so19993374wrh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680200026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xwB7ckwceSp/wZ9DJYR6IF58FZg4kU5wJTyoorWtGWg=;
 b=lqINACUcUNc6OCM+HRdbgE0wgJ55qku3bVdsQZiOg6rloPtJli0rsUlmCEbguehs/o
 8jjo8jAXtUfYcpmcj+ky5OtoB5yEKl5hxoGuOMjIYSfms6NUTQfxkmq/0xaMqpgkDk0U
 ztyB0jnj+o/D1Yg3Wonx8neuYH8Ow2Lmt21rQw5cYTwwPkUGrNhGUqKazjP8rUyTd9wh
 v0RifFK7qt/VyoFQJkIi9GM/Nq6LorT2sAWpIDQfgsCT5BIHPx8RhtMePZWqnWVqvhfk
 4ZxzvCqn+r1mLKuz/2CeGTL/RXaBu845B3k6Z98u+iaCHEkIbwRHwZxK27AUf5f9vqu3
 NDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwB7ckwceSp/wZ9DJYR6IF58FZg4kU5wJTyoorWtGWg=;
 b=zLQyXyL7x7sPXYQ6cZWkUDbAHR+y8pWm7VzwHJg/7xRA+E3OxFkorEu+8MFLmHxU6M
 tBYmlAkxuZXF5PJGiZm+lMWQxsAel4Utb4q/CjweYgb6lMjgwbmYrUO30Ita2Sxuo4X0
 vOCP+/WiYEej33P7Hm96uiymU1EzZ4IflwnHxNMxH0YBF0onFfeuOyG+6WKniSKrhIt/
 RrEedtIUd5N/luN2kmSTlOzos05Qq44xI4/hs+UGs+MUwCHRTKjUEM2PGECo5UrvoAau
 ZZFbEWp/ezQ4F79trBznP3f5zXbRJNgk6qKHq0VUnPkcWVLJumxlHPBdG/2u5TGzapTG
 59yg==
X-Gm-Message-State: AAQBX9eM5LvzJAVu9QAsQCdbiEtfnwllnABV0MIeFz0dO5iZ7hdRdNao
 fTDe+4te3+OSSllroSDWhYKlRg==
X-Google-Smtp-Source: AKy350aY6V8fkNL32GAA39YdUTC+efxlh78Ug+GObvK9mZ+x22X8K8tmhZTYcrymbOke7TatTjrC+Q==
X-Received: by 2002:a5d:458f:0:b0:2ce:a703:1937 with SMTP id
 p15-20020a5d458f000000b002cea7031937mr17963239wrq.50.1680200026030; 
 Thu, 30 Mar 2023 11:13:46 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056000121200b002d24a188b64sm33459741wrx.112.2023.03.30.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 11:13:45 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Thu, 30 Mar 2023 20:13:24 +0200
Subject: [PATCH v3 2/4] checkpatch: use a list of "link" tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v3-2-d1bdcf31c71c@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=szBPPLNcIJlQZP3ZDgAq5KhMDW2VCGhntaAwnGlayqw=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkJdFWpPuHiuQZcR3cusRyAiveGgQMeQQfJsMSL
 txyVQQqx2eJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCXRVgAKCRD2t4JPQmmg
 c6uhEACB65qdO0Jk6m3WvqJ9FZSniQErwMQIYO77n/4+VWkIceqYibPja1CUPgSNfkdMmDMRL71
 /r5zIk0+TuixMynw4tbLQwu+nW0YciH2s1VUww7x7DEkU1bEmL5XbsT38ik9cCZFf9jhJYElhPI
 9K6Bx9EMQ63A2+5q/HgaPZxi292pXDQmZjHib1HKv1uCEfEMnccT+1QQOZHOFN1lwYnUv7QK6Wd
 AKMWrqMzfME717yP6RjHoNtIooFr4DsGH5zP2jahjgH1sx8P/cctI6Iuue1+Ghpg3G+3OSQ3GYC
 SM1i1oHcbCVgzx2itb5UQoSIGu+wwPcW3twO9pWEOieCudyDW5+IJdrEmN2TS2dsfCY9+XuywKd
 mqfxCDdeusm2bTorUzGf1f0j5NFWjR/u1qK/bcp+4p2HdbUhXlSNtorEaiY/YFSKRc/IexuRYhA
 FBQ3CO2Z2f8yEhqPj43NPxURfcC8u81KbzZVIgvy7HlWl/79mVBaaAibyeM9GFUlbRePZuIAt3X
 eT38ThRYHyLzVikdfZ4u357h9rT2oIELqSAHroL4FsTV1HCFo9uW6itM2/nQZnglldiB4xfT1AC
 aReqUkfDyaCPgEUDloo0sCGjRR6g92eo3cve/+go0VPDs7vs0T8q3lFeVMBj8XbAMrMLvq/z1vY
 LzRVsODSaL/matA==
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

The following commit will allow the use of a similar "link" tag.

Because there is a possibility that other similar tags will be added in
the future and to reduce the number of places where the code will be
modified to allow this new tag, a list with all these "link" tags is now
used.

Two variables are created from it: one to search for such tags and one
to print all tags in a warning message.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 scripts/checkpatch.pl | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bd44d12965c9..9d092ff4fc16 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -620,6 +620,22 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
+our @link_tags = qw(Link);
+
+#Create a search and print patterns for all these strings to be used directly below
+our $link_tags_search = "";
+our $link_tags_print = "";
+foreach my $entry (@link_tags) {
+	if ($link_tags_search ne "") {
+		$link_tags_search .= '|';
+		$link_tags_print .= ' or ';
+	}
+	$entry .= ':';
+	$link_tags_search .= $entry;
+	$link_tags_print .= "'$entry'";
+}
+$link_tags_search = "(?:${link_tags_search})";
+
 our $tracing_logging_tags = qr{(?xi:
 	[=-]*> |
 	<[=-]* |
@@ -3158,14 +3174,14 @@ sub process {
 				}
 			}
 
-# check if Reported-by: is followed by a Link:
+# check if Reported-by: is followed by a link tag
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Link: to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
-				} elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
+					     "Reported-by: should be immediately followed by $link_tags_print to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+				} elsif ($rawlines[$linenr] !~ m{^$link_tags_search\s*https?://}i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by $link_tags_print with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}
@@ -3250,8 +3266,8 @@ sub process {
 					# file delta changes
 		      $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
 					# filename then :
-		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
-					# A Fixes: or Link: line or signature tag line
+		      $line =~ /^\s*(?:Fixes:|$link_tags_search|$signature_tags)/i ||
+					# A Fixes:, link or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
@@ -3266,13 +3282,13 @@ sub process {
 
 # Check for odd tags before a URI/URL
 		if ($in_commit_log &&
-		    $line =~ /^\s*(\w+):\s*http/ && $1 ne 'Link') {
+		    $line =~ /^\s*(\w+:)\s*http/ && $1 !~ /^$link_tags_search$/) {
 			if ($1 =~ /^v(?:ersion)?\d+/i) {
 				WARN("COMMIT_LOG_VERSIONING",
 				     "Patch version information should be after the --- line\n" . $herecurr);
 			} else {
 				WARN("COMMIT_LOG_USE_LINK",
-				     "Unknown link reference '$1:', use 'Link:' instead\n" . $herecurr);
+				     "Unknown link reference '$1', use $link_tags_print instead\n" . $herecurr);
 			}
 		}
 

-- 
2.39.2

