Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F186D1CA7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385A10F19A;
	Fri, 31 Mar 2023 09:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D9810F150
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:39:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1piBEB-00075I-BA; Fri, 31 Mar 2023 11:39:23 +0200
Message-ID: <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
Date: Fri, 31 Mar 2023 11:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To: Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 0/4] docs & checkpatch: allow Closes tags with links
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680255569;485fe311;
X-HE-SMSGID: 1piBEB-00075I-BA
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.03.23 20:13, Matthieu Baerts wrote:
> Since v6.3, checkpatch.pl now complains about the use of "Closes:" tags
> followed by a link [1]. It also complains if a "Reported-by:" tag is
> followed by a "Closes:" one [2].
> 
> As detailed in the first patch, this "Closes:" tag is used for a bit of
> time, mainly by DRM and MPTCP subsystems. It is used by some bug
> trackers to automate the closure of issues when a patch is accepted.
> It is even planned to use this tag with bugzilla.kernel.org [3].
> 
> The first patch updates the documentation to explain what is this
> "Closes:" tag and how/when to use it. The second patch modifies
> checkpatch.pl to stop complaining about it.
> 
> The DRM maintainers and their mailing list have been added in Cc as they
> are probably interested by these two patches as well.
> 
> [1] https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.1674217480.git.linux@leemhuis.info/
> [2] https://lore.kernel.org/all/bb5dfd55ea2026303ab2296f4a6df3da7dd64006.1674217480.git.linux@leemhuis.info/
> [3] https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/
> 
> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Maybe it's just me, but I think those changes do not make it clear
enough when to use Link: and when to use Closes. Find below an
alternative proposal how I'd do it for consideration that goes
'all-in' for the sake of simplicity.

[untested -- and I hope thunderbird won't mangle the patch]

Ciao, Thorsten


diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 7a670a075ab6..fc194b4d1674 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -207,11 +207,17 @@ the patch::
 	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
 
 Another tag is used for linking web pages with additional backgrounds or
-details, for example a report about a bug fixed by the patch or a document
+details, for example earlier discussion which lead to the patch or a document
 with a specification implemented by the patch::
 
 	Link: https://example.com/somewhere.html  optional-other-stuff
 
+If the URL points to a report about a bug fixed by the patch, use this instead::
+
+	Closes: https://example.com/somewhere.html  optional-other-stuff
+
+Ensure any such links are publicly accessible.
+
 Many maintainers when applying a patch also add this tag to link to the
 latest public review posting of the patch; often this is automatically done
 by tools like b4 or a git hook like the one described in
@@ -251,7 +257,7 @@ The tags in common use are:
  - Reported-by: names a user who reported a problem which is fixed by this
    patch; this tag is used to give credit to the (often underappreciated)
    people who test our code and let us know when things do not work
-   correctly. Note, this tag should be followed by a Link: tag pointing to the
+   correctly. Note, this tag should be followed by a Closes: tag pointing to the
    report, unless the report is not available on the web.
 
  - Cc: the named person received a copy of the patch and had the
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 69ce64e03c70..73611cf1c372 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -126,8 +126,10 @@ For example::
 
     Link: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
 
-Please check the link to make sure that it is actually working and points
-to the relevant message.
+If the URL points to a bug report that is fixed by the patch, use 'Closes:'
+instead.
+
+Ensure any such links are publicly accessible.
 
 However, try to make your explanation understandable without external
 resources. In addition to giving a URL to a mailing list archive or bug,
@@ -498,7 +500,7 @@ Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
 The Reported-by tag gives credit to people who find bugs and report them and it
 hopefully inspires them to help us again in the future. The tag is intended for
 bugs; please do not use it to credit feature requests. The tag should be
-followed by a Link: tag pointing to the report, unless the report is not
+followed by a Closes: tag pointing to the report, unless the report is not
 available on the web. Please note that if the bug was reported in private, then
 ask for permission first before using the Reported-by tag.
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bd44d12965c9..f9a7c2b856ae 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3158,14 +3158,14 @@ sub process {
 				}
 			}
 
-# check if Reported-by: is followed by a Link:
+# check if Reported-by: is followed by a Closes: tag
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Link: to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
-				} elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
+					     "Reported-by: should be immediately followed by Closes: to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+				} elsif ($rawlines[$linenr] !~ m{^closes:\s*https?://}i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}
@@ -3266,13 +3266,13 @@ sub process {
 
 # Check for odd tags before a URI/URL
 		if ($in_commit_log &&
-		    $line =~ /^\s*(\w+):\s*http/ && $1 ne 'Link') {
+		    $line =~ /^\s*(\w+):\s*http/ && $1 ne 'Link' && $1 ne 'Closes') {
 			if ($1 =~ /^v(?:ersion)?\d+/i) {
 				WARN("COMMIT_LOG_VERSIONING",
 				     "Patch version information should be after the --- line\n" . $herecurr);
 			} else {
 				WARN("COMMIT_LOG_USE_LINK",
-				     "Unknown link reference '$1:', use 'Link:' instead\n" . $herecurr);
+				     "Unknown link reference '$1:', use 'Link:' or 'Closes:' instead\n" . $herecurr);
 			}
 		}
 
