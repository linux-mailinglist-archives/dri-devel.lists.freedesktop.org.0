Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9D5AC730
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97210E29A;
	Sun,  4 Sep 2022 21:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55610E133;
 Sun,  4 Sep 2022 21:42:28 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e195so5690551iof.1;
 Sun, 04 Sep 2022 14:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CX6qv1cFIAak2H7Dm87W0kPuSMznCRZBjCF+tQ4X600=;
 b=Q3cfmH2LyzD2M1ZLD1pNAYsFedbjIhzATxm909rJnzqncgvkGEna14g3zmelu6oNst
 yGRhbYN/jRA+ojsvvywLPGWaCcX47VMRUnKRP92jnlsGfo1gGsS/0pX+v8XIDy5+K1wv
 hcfhFf3zOBj2FBQR39ZiBbHIk3gixOCnKUR2CMrawaeq1wqnvitFf/VGPNqkBkPIpnls
 56wnzrcfUPLjZXmU8QQUnd4C5IE+42uE+JPwWFrONI+gkyiM0SOy/zS4gmQQTKnJrSEh
 AmFmI41xFzMh/EU0bL2Kwgx3PqC/fsLN3iAS+RAov2KWCcsxbl/Ax9pu0IhieIAi3uwK
 Zk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CX6qv1cFIAak2H7Dm87W0kPuSMznCRZBjCF+tQ4X600=;
 b=Otxeed0nn20MyKkmhAu5eOaYiPqKDYDsKNLS7B3IDgTY7U17oKqKJwBSY8YIP8Qu1v
 +DD4+qIqkkl4gI1964Dp59rWFLCQnXBz8epZq72jpvwrvKGReTBBwsrNySuGohmn2YAS
 5V5n9SBJJ5ZJUMYrgquw7+75iA0Ou04GtMZJQLBOavBOzrSkJ2d+L4framURc2PEN0SA
 SL1YhKQJnFkWB88lpV+xsdhnIa2tdnHh7tskXj1hhcpDNuN5S7ketd7lj08F/zPNw4hL
 kGt0HPQnp8zRSWbww5jYYfZePrSuxwOFm4Ceg4883aZDS/CBSI9bSWHpcSL90UCp0TJL
 eG9Q==
X-Gm-Message-State: ACgBeo0/0tino0LTnv8syzGYAWiXXAAT7BbfIe4d7NKLoX6ahy43CnzK
 xtSEdf0K+MXdmnLV+bTPXAw=
X-Google-Smtp-Source: AA6agR6FDmbgVlOi+VH2xD/wJEH/An47KuIR8rJmhUndQnxcZqdaaNF4vm3Z/VHoIzRdq/aFbHaolw==
X-Received: by 2002:a02:cb57:0:b0:34c:b847:d5fb with SMTP id
 k23-20020a02cb57000000b0034cb847d5fbmr9181329jap.32.1662327748378; 
 Sun, 04 Sep 2022 14:42:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 19/57] doc-dyndbg: edit dynamic-debug-howto for brevity,
 audience
Date: Sun,  4 Sep 2022 15:40:56 -0600
Message-Id: <20220904214134.408619-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 seanpaul@chromium.org, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework/modernize docs:

 - use /proc/dynamic_debug/control in examples
   its *always* there (when dyndbg is config'd), even when <debugfs> is not.
   drop <debugfs> talk, its a distraction here.

 - alias ddcmd='echo $* > /proc/dynamic_debug/control
   focus on args: declutter, hide boilerplate, make pwd independent.

 - swap sections: Viewing before Controlling. control file as Catalog.

 - focus on use by a system administrator
   add an alias to make examples more readable
   drop grep-101 lessons, admins know this.

 - use init/main.c as 1st example, thread it thru doc where useful.
   everybodys kernel boots, runs these.

 - add *prdbg* api section
   to the bottom of the file, its for developers more than admins.
   move list of api functions there.

 - simplify - drop extra words, phrases, sentences.

 - add "decorator" flags line to unify "prefix", trim fmlt descriptions

CC: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

---
fixup-doc: trailing colons for block headers, trim fedora numbers. Bagas
---
 .../admin-guide/dynamic-debug-howto.rst       | 235 +++++++++---------
 1 file changed, 117 insertions(+), 118 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index d8954ab05c7b..faa22f77847a 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -5,30 +5,19 @@ Dynamic debug
 Introduction
 ============
 
-This document describes how to use the dynamic debug (dyndbg) feature.
+Dynamic debug allows you to dynamically enable/disable kernel
+debug-print code to obtain additional kernel information.
 
-Dynamic debug is designed to allow you to dynamically enable/disable
-kernel code to obtain additional kernel information.  Currently, if
-``CONFIG_DYNAMIC_DEBUG`` is set, then all ``pr_debug()``/``dev_dbg()`` and
-``print_hex_dump_debug()``/``print_hex_dump_bytes()`` calls can be dynamically
-enabled per-callsite.
+If ``/proc/dynamic_debug/control`` exists, your kernel has dynamic
+debug.  You'll need root access (sudo su) to use this.
 
-If you do not want to enable dynamic debug globally (i.e. in some embedded
-system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
-debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
-modules which you'd like to dynamically debug later.
+Dynamic debug provides:
 
-If ``CONFIG_DYNAMIC_DEBUG`` is not set, ``print_hex_dump_debug()`` is just
-shortcut for ``print_hex_dump(KERN_DEBUG)``.
+ * a Catalog of all *prdbgs* in your kernel.
+   ``cat /proc/dynamic_debug/control`` to see them.
 
-For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
-its ``prefix_str`` argument, if it is constant string; or ``hexdump``
-in case ``prefix_str`` is built dynamically.
-
-Dynamic debug has even more useful features:
-
- * Simple query language allows turning on and off debugging
-   statements by matching any combination of 0 or 1 of:
+ * a Simple query/command language to alter *prdbgs* by selecting on
+   any combination of 0 or 1 of:
 
    - source filename
    - function name
@@ -37,107 +26,88 @@ Dynamic debug has even more useful features:
    - format string
    - class name (as known/declared by each module)
 
- * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
-   which can be read to display the complete list of known debug
-   statements, to help guide you
-
-Controlling dynamic debug Behaviour
-===================================
-
-The behaviour of ``pr_debug()``/``dev_dbg()`` are controlled via writing to a
-control file in the 'debugfs' filesystem. Thus, you must first mount
-the debugfs filesystem, in order to make use of this feature.
-Subsequently, we refer to the control file as:
-``<debugfs>/dynamic_debug/control``. For example, if you want to enable
-printing from source file ``svcsock.c``, line 1603 you simply do::
-
-  nullarbor:~ # echo 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
-
-If you make a mistake with the syntax, the write will fail thus::
-
-  nullarbor:~ # echo 'file svcsock.c wtf 1 +p' >
-				<debugfs>/dynamic_debug/control
-  -bash: echo: write error: Invalid argument
-
-Note, for systems without 'debugfs' enabled, the control file can be
-found in ``/proc/dynamic_debug/control``.
-
 Viewing Dynamic Debug Behaviour
 ===============================
 
-You can view the currently configured behaviour of all the debug
-statements via::
+You can view the currently configured behaviour in the *prdbg* catalog::
 
-  nullarbor:~ # cat <debugfs>/dynamic_debug/control
+  :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  net/sunrpc/svc_rdma.c:323 [svcxprt_rdma]svc_rdma_cleanup =_ "SVCRDMA Module Removed, deregister RPC RDMA transport\012"
-  net/sunrpc/svc_rdma.c:341 [svcxprt_rdma]svc_rdma_init =_ "\011max_inline       : %d\012"
-  net/sunrpc/svc_rdma.c:340 [svcxprt_rdma]svc_rdma_init =_ "\011sq_depth         : %d\012"
-  net/sunrpc/svc_rdma.c:338 [svcxprt_rdma]svc_rdma_init =_ "\011max_requests     : %d\012"
-  ...
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
+  init/main.c:1426 [main]run_init_process =_ "    %s\012"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
+  init/main.c:1429 [main]run_init_process =_ "    %s\012"
 
+The 3rd space-delimited column shows the current flags, preceded by
+a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
 
-You can also apply standard Unix text manipulation filters to this
-data, e.g.::
+Controlling dynamic debug Behaviour
+===================================
 
-  nullarbor:~ # grep -i rdma <debugfs>/dynamic_debug/control  | wc -l
-  62
+The behaviour of *prdbg* sites are controlled by writing
+query/commands to the control file.  Example::
 
-  nullarbor:~ # grep -i tcp <debugfs>/dynamic_debug/control | wc -l
-  42
+  # grease the interface
+  :#> alias ddcmd='echo $* > /proc/dynamic_debug/control'
 
-The third column shows the currently enabled flags for each debug
-statement callsite (see below for definitions of the flags).  The
-default value, with no flags enabled, is ``=_``.  So you can view all
-the debug statement callsites with any non-default flags::
+  :#> ddcmd '-p; module main func run* +p'
+  :#> grep =p /proc/dynamic_debug/control
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
+  init/main.c:1426 [main]run_init_process =p "    %s\012"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
+  init/main.c:1429 [main]run_init_process =p "    %s\012"
 
-  nullarbor:~ # awk '$3 != "=_"' <debugfs>/dynamic_debug/control
-  # filename:lineno [module]function flags format
-  net/sunrpc/svcsock.c:1603 [sunrpc]svc_send p "svc_process: st_sendto returned %d\012"
+Error messages go to console/syslog::
+
+  :#> ddcmd mode foo +p
+  dyndbg: unknown keyword "mode"
+  dyndbg: query parse failed
+  bash: echo: write error: Invalid argument
+
+If debugfs is also enabled and mounted, ``dynamic_debug/control`` is
+also under the mount-dir, typically ``/sys/kernel/debug/``.
 
 Command Language Reference
 ==========================
 
-At the lexical level, a command comprises a sequence of words separated
+At the basic lexical level, a command is a sequence of words separated
 by spaces or tabs.  So these are all equivalent::
 
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
-  nullarbor:~ # echo -n '  file   svcsock.c     line  1603 +p  ' >
-				<debugfs>/dynamic_debug/control
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd file svcsock.c line 1603 +p
+  :#> ddcmd "file svcsock.c line 1603 +p"
+  :#> ddcmd '  file   svcsock.c     line  1603 +p  '
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
 
-  ~# echo "func pnpacpi_get_resources +p; func pnp_assign_mem +p" \
-     > <debugfs>/dynamic_debug/control
-
-If your query set is big, you can batch them too::
-
-  ~# cat query-batch-file > <debugfs>/dynamic_debug/control
+  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd <<"EOC"
+  func pnpacpi_get_resources +p
+  func pnp_assign_mem +p
+  EOC
+  :#> cat query-batch-file > /proc/dynamic_debug/control
 
-Another way is to use wildcards. The match rule supports ``*`` (matches
-zero or more characters) and ``?`` (matches exactly one character). For
-example, you can match all usb drivers::
+You can also use wildcards in each query term. The match rule supports
+``*`` (matches zero or more characters) and ``?`` (matches exactly one
+character). For example, you can match all usb drivers::
 
-  ~# echo "file drivers/usb/* +p" > <debugfs>/dynamic_debug/control
+  :#> ddcmd file "drivers/usb/*" +p	# "" to suppress shell expansion
 
-At the syntactical level, a command comprises a sequence of match
-specifications, followed by a flags change specification::
+Syntactically, a command is pairs of keyword values, followed by a
+flags change or setting::
 
   command ::= match-spec* flags-spec
 
-The match-spec's are used to choose a subset of the known pr_debug()
-callsites to which to apply the flags-spec.  Think of them as a query
-with implicit ANDs between each pair.  Note that an empty list of
-match-specs will select all debug statement callsites.
+The match-spec's select *prdbgs* from the catalog, upon which to apply
+the flags-spec, all constraints are ANDed together.  An absent keyword
+is the same as keyword "*".
 
-A match specification comprises a keyword, which controls the
-attribute of the callsite to be compared, and a value to compare
-against.  Possible keywords are:::
+
+A match specification is a keyword, which selects the attribute of
+the callsite to be compared, and a value to compare against.  Possible
+keywords are:::
 
   match-spec ::= 'func' string |
 		 'file' string |
@@ -213,6 +183,7 @@ class
 
 	class DRM_UT_KMS	# a DRM.debug category
 	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
 
 line
     The given line number or range of line numbers is compared
@@ -239,17 +210,16 @@ of the characters::
 The flags are::
 
   p    enables the pr_debug() callsite.
-  f    Include the function name in the printed message
-  l    Include line number in the printed message
-  m    Include module name in the printed message
-  t    Include thread ID in messages not generated from interrupt context
-  _    No flags are set. (Or'd with others on input)
+  _    enables no flags.
 
-For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only ``p`` flag
-have meaning, other flags ignored.
+  Decorator flags add to the message-prefix, in order:
+  t    Include thread ID, or <intr>
+  m    Include module name
+  f    Include the function name
+  l    Include line number
 
-For display, the flags are preceded by ``=``
-(mnemonic: what the flags are currently equal to).
+For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
+the ``p`` flag has meaning, other flags are ignored.
 
 Note the regexp ``^[-+=][flmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-flmpt``.
@@ -324,7 +294,7 @@ For ``CONFIG_DYNAMIC_DEBUG`` kernels, any settings given at boot-time (or
 enabled by ``-DDEBUG`` flag during compilation) can be disabled later via
 the debugfs interface if the debug messages are no longer needed::
 
-   echo "module module_name -p" > <debugfs>/dynamic_debug/control
+   echo "module module_name -p" > /proc/dynamic_debug/control
 
 Examples
 ========
@@ -332,37 +302,31 @@ Examples
 ::
 
   // enable the message at line 1603 of file svcsock.c
-  nullarbor:~ # echo -n 'file svcsock.c line 1603 +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'file svcsock.c line 1603 +p'
 
   // enable all the messages in file svcsock.c
-  nullarbor:~ # echo -n 'file svcsock.c +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'file svcsock.c +p'
 
   // enable all the messages in the NFS server module
-  nullarbor:~ # echo -n 'module nfsd +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'module nfsd +p'
 
   // enable all 12 messages in the function svc_process()
-  nullarbor:~ # echo -n 'func svc_process +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'func svc_process +p'
 
   // disable all 12 messages in the function svc_process()
-  nullarbor:~ # echo -n 'func svc_process -p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'func svc_process -p'
 
   // enable messages for NFS calls READ, READLINK, READDIR and READDIR+.
-  nullarbor:~ # echo -n 'format "nfsd: READ" +p' >
-				<debugfs>/dynamic_debug/control
+  :#> ddcmd 'format "nfsd: READ" +p'
 
   // enable messages in files of which the paths include string "usb"
-  nullarbor:~ # echo -n 'file *usb* +p' > <debugfs>/dynamic_debug/control
+  :#> ddcmd 'file *usb* +p' > /proc/dynamic_debug/control
 
   // enable all messages
-  nullarbor:~ # echo -n '+p' > <debugfs>/dynamic_debug/control
+  :#> ddcmd '+p' > /proc/dynamic_debug/control
 
   // add module, function to all enabled messages
-  nullarbor:~ # echo -n '+mf' > <debugfs>/dynamic_debug/control
+  :#> ddcmd '+mf' > /proc/dynamic_debug/control
 
   // boot-args example, with newlines and comments for readability
   Kernel command line: ...
@@ -375,3 +339,38 @@ Examples
     dyndbg="file init/* +p #cmt ; func parse_one +p"
     // enable pr_debugs in 2 functions in a module loaded later
     pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
+
+Kernel Configuration
+====================
+
+Dynamic Debug is enabled via kernel config items::
+
+  CONFIG_DYNAMIC_DEBUG=y	# build catalog, enables CORE
+  CONFIG_DYNAMIC_DEBUG_CORE=y	# enable mechanics only, skip catalog
+
+If you do not want to enable dynamic debug globally (i.e. in some embedded
+system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
+debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
+modules which you'd like to dynamically debug later.
+
+
+Kernel *prdbg* API
+==================
+
+The following functions are cataloged and controllable when dynamic
+debug is enabled::
+
+  pr_debug()
+  dev_dbg()
+  print_hex_dump_debug()
+  print_hex_dump_bytes()
+
+Otherwise, they are off by default; ``ccflags += -DDEBUG`` or
+``#define DEBUG`` in a source file will enable them appropriately.
+
+If ``CONFIG_DYNAMIC_DEBUG`` is not set, ``print_hex_dump_debug()`` is
+just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
+
+For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
+its ``prefix_str`` argument, if it is constant string; or ``hexdump``
+in case ``prefix_str`` is built dynamically.
-- 
2.37.2

