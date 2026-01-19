Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BAD3A7D9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D420410E41E;
	Mon, 19 Jan 2026 12:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cQPLPDTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0921410E40A;
 Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1EC4F60155;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA878C19425;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=gIlHO7b2dpX1yT61k9PtOOKZE0nPF7btslse5y1Pu2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQPLPDTr9HIYOdHR/wEdulLJPp1fpkTVYYwVsquoQQPDk16XAoVJga5jcBtKxIhhH
 xtctZVCg8p4w1gGmntAfhG5XFNdd6DmXrpk0el86rDvwRVp+Sy/gjgMPlOOq6tsMlG
 7MRy+TppxhgzXmW4Yq0QKTKxqnucEuxHrL7LE79Du4BGlHDnug0AWDQaPUS1F8Ahty
 UDBXW/dbOYiFSBQ/RB4hMIIZHr/9ZywTNOBuk1mhEKWQ7GU0h8Uta7pu1QvAea5FLJ
 GvxoK00BLTRZ/L52HxqGhOfmko4ZxWKWOr8Cn4lzck97rWpm+QC0dldNFvTM7ajH6x
 Azgkup5ORkhNQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjI-3Qjw; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 3/9] docs: kdoc: ensure that comments are using our coding
 style
Date: Mon, 19 Jan 2026 13:04:58 +0100
Message-ID: <50e430acd333a500719205e80ab3b2d297edcd7d.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Along kernel-doc libs, we opted to have all comments starting/ending
with a blank comment line. Use the same style here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 1ebb16b9bb08..f1f3f56edeb5 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -3,7 +3,7 @@
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
 #
 # pylint: disable=C0103,R0912,R0914,R0915
-
+#
 # NOTE: While kernel-doc requires at least version 3.6 to run, the
 #       command line should work with Python 3.2+ (tested with 3.4).
 #       The rationale is that it shall fail gracefully during Kernel
@@ -12,7 +12,7 @@
 #       - no f-strings can be used on this file.
 #       - the libraries that require newer versions can only be included
 #         after Python version is checked.
-
+#
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
 #
@@ -197,8 +197,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
-
+    #
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
 
@@ -213,8 +214,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
-
+    #
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
 
@@ -235,8 +237,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
-
+    #
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
     out_fmt = out_group.add_mutually_exclusive_group()
@@ -248,8 +251,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
-
+    #
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
 
@@ -262,7 +266,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -295,9 +301,11 @@ def main():
 
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
+        #
         # Depending on Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
+        #
         if args.none:
             logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
             sys.exit(0)
@@ -307,7 +315,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -346,6 +356,8 @@ def main():
 
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0

