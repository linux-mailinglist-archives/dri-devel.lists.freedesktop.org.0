Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD43D3A7D3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713110E41D;
	Mon, 19 Jan 2026 12:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aJ+pWdo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5CE10E40E;
 Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1471B60140;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64FCC4AF09;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=uAgz6NVwdL1fSgq++5Vdt7SvGll1o/f20D2+Kc+Gl6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aJ+pWdo0Tq59ur1/vDvnzdzAODQB+0BpPcPaKhE1BlTE+naH79rJGPzNzNg/1DYRO
 ZUV4usc7G0oiHnnc1nCJ8BmhHcuFIAQi+U5TMFh7g5ea+Xf8vkV9wJoKQK3pamzf2H
 zRHfcHC0k3jFnAGzcMMtz+gowPOz/+p9rhsVfx6r5mnkcWWTg8x4E6jg+esUdgcWQ8
 VTxgxE7AAhpegUBy4MuwntcrXHF/92n4BwbmyFfo60gXGUPlaB35qqPKwb4JZgUuJm
 UynONt/lasjE6wBmtpgJZawth73DeUtHznc6z4v8o49JqNtDuMDsCanfOxRibMSXAH
 /Wvx5ONH91W8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjM-3Xkg; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 4/9] docs: kdoc: some fixes to kernel-doc comments
Date: Mon, 19 Jan 2026 13:04:59 +0100
Message-ID: <ec08727f22ad35e6c58519c1f425f216f14b701c.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are some typos and English errors in the comments of kernel‑doc.py.

Locate them with the help of an LLM (gpt‑oss 14B), executed locally
with this prompt:

        review English grammar and syntax at the comments on the code below:
        <cat scripts/kernel-doc.py>

While LLM worked fine for the task of doing an English grammar review
for strings, being able to distinguish them from the actual code, it
was not is perfect: some things required manual work to fix.

-

While here, replace:

    "/**" with: ``/**``

As, if we ever rename this script to kernel_doc.py and add it to
Sphinx ext autodoc, we want to avoid this warning:

    scripts/kernel_doc.py:docstring of kernel_doc:10: WARNING: Inline strong start-string without end-string. [docutils]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index f1f3f56edeb5..4e3b9cfe3fd7 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -9,9 +9,9 @@
 #       The rationale is that it shall fail gracefully during Kernel
 #       compilation with older Kernel versions. Due to that:
 #       - encoding line is needed here;
-#       - no f-strings can be used on this file.
-#       - the libraries that require newer versions can only be included
-#         after Python version is checked.
+#       - f-strings cannot be used in this file.
+#       - libraries that require newer versions can only be included
+#         after the Python version has been checked.
 #
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
@@ -88,16 +88,13 @@
 #    Yujie Liu <yujie.liu@intel.com>
 
 """
-kernel_doc
-==========
-
-Print formatted kernel documentation to stdout
+Print formatted kernel documentation to stdout.
 
 Read C language source or header FILEs, extract embedded
 documentation comments, and print formatted documentation
 to standard output.
 
-The documentation comments are identified by the "/**"
+The documentation comments are identified by the ``/**``
 opening comment mark.
 
 See Documentation/doc-guide/kernel-doc.rst for the
@@ -134,13 +131,13 @@ May be used multiple times.
 """
 
 EXPORT_DESC = """
-Only output documentation for the symbols that have been
+Only output documentation for symbols that have been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
 
 INTERNAL_DESC = """
-Only output documentation for the symbols that have NOT been
+Only output documentation for symbols that have NOT been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
@@ -163,7 +160,7 @@ Header and C source files to be parsed.
 """
 
 WARN_CONTENTS_BEFORE_SECTIONS_DESC = """
-Warns if there are contents before sections (deprecated).
+Warn if there are contents before sections (deprecated).
 
 This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
@@ -171,7 +168,7 @@ neither here nor at the original Perl script.
 
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings on a similar way to kernel-doc.pl"""
+    """Helper class to format warnings in a similar way to kernel-doc.pl."""
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
@@ -273,7 +270,7 @@ def main():
                         help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
-                        action='store_true', help="Don't outputt DOC sections")
+                        action='store_true', help="Don't output DOC sections")
 
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
@@ -302,12 +299,12 @@ def main():
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
         #
-        # Depending on Kernel configuration, kernel-doc --none is called at
+        # Depending on the Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
         #
         if args.none:
-            logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
+            logger.error("Python 3.6 or later is required by kernel-doc. Skipping checks")
             sys.exit(0)
 
         sys.exit("Python 3.6 or later is required by kernel-doc. Aborting.")
@@ -316,7 +313,7 @@ def main():
         logger.warning("Python 3.7 or later is required for correct results")
 
     #
-    # Import kernel-doc libraries only after checking Python version
+    # Import kernel-doc libraries only after checking the Python version
     #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
-- 
2.52.0

