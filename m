Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866781F3217
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 03:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94866E9DC;
	Tue,  9 Jun 2020 01:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBEC89A14
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 01:45:55 +0000 (UTC)
IronPort-SDR: 84Gr+JJgxtoZshxCRWrfwS30fFwvwdASp6i+3jwHhv7u9ezMXHhCmtiaiWqKoUOyG5ZkD1PydM
 Vrau/swNfVNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 18:45:55 -0700
IronPort-SDR: jmJ9jh+uT03iIvLaD2I5xqbipPHwU1APUl1lUSh7ZiNJr0EDR+YzvPZZgcLtuzcpXyYTgOo8kO
 6sxB/lur4uhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="306119714"
Received: from lkp-server01.sh.intel.com (HELO 12d5c0ac8e64) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 08 Jun 2020 18:45:52 -0700
Received: from kbuild by 12d5c0ac8e64 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jiTKq-00006V-2k; Tue, 09 Jun 2020 01:45:52 +0000
Date: Tue, 9 Jun 2020 09:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/print: trace_arr can be static
Message-ID: <20200609014505.GA50763@37d9db08ab2a>
References: <20200608210505.48519-14-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608210505.48519-14-sean@poorly.run>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 drm_print.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index c4bef38921db1..a50d0b24c911f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,7 +69,7 @@ MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
 module_param_named(trace, __drm_debug_trace, int, 0600);
 
 #ifdef CONFIG_TRACING
-struct trace_array *trace_arr;
+static struct trace_array *trace_arr;
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
