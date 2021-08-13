Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF23EB78E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EEB6E855;
	Fri, 13 Aug 2021 15:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0206E855;
 Fri, 13 Aug 2021 15:18:44 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id v2so4999338ilg.12;
 Fri, 13 Aug 2021 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y3NByVIzuR3Rg/aPLIKVF1n0drDE97HGQ1NdBQG6G8o=;
 b=QnpkQH2HVm3ojYjzdiaaChBK+Emp8SfXFNRUbvXdbvrp78tb/00b1DQhs7B7tZTZhH
 BRp7vLkfbTBajWqS8jLdZfKMk2ScXlSjh5ecWh4jeqANdgxBVMzwUr/rRL4tyanLlCZ4
 Tip74R9NTZ/HieXKcZU6WmEeFZNBWhphySMvkzJcRdMhA9w27jGqAjk4W4XTbTz68xZ/
 h5Ck0SmVxzK9MUbFSPJCc98suiMsDXQ6P5NNzrsjptDlWSLSNyenlt2KhI8PVIFwLAgo
 rD5180F/GONDqegJeaNyY47boYZsGgshH8p5lewH5/lxWtPEEaiG8RPUFJr55uU/K56v
 VKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3NByVIzuR3Rg/aPLIKVF1n0drDE97HGQ1NdBQG6G8o=;
 b=HcnWOky9mXMAmU91wsqXimd7Lih5UR8j2vPXb/uDACX4Dft4AjAhALksJ4eOKX6JBs
 eMPL5WQjAKN6796QqBy8pju13qyOJlfzTiUxOKXoq2qIr3r00hQMGjjag0XMa5nw0xIx
 ClPOEhiu2nvlxjDsQ/ObYOEjftEJYAuhSU5Y0Ifn6EhT2Hnfn1dt7Q0l4ZRIxPbPdMRU
 BRmqTpOJtQ8qnlsvuzSWc5nsNpHabUqVK61jF1OgZhDAispCaCMcob/V0CGPVFFEtoi1
 jc3RIGrdPKEZda5+1GCQZnbEFDqolQZtcAXKgyYGVY8hU+w7HpJ1WCyH2wwU6OjV8RQL
 naqA==
X-Gm-Message-State: AOAM531X34r538f8CHjmSPqN3vCqZ2Qi2DXFUobqH+hEWHQiCqx6LjC2
 3z1qbAn/koieAiZ/n1jiuk4=
X-Google-Smtp-Source: ABdhPJzOROBmh/lPhbT34lBXsdIT6CwShQg8mlGrV0CnlXBeIDRyYZ1lyN4m6M2KBiUOmmVhCnMbRA==
X-Received: by 2002:a05:6e02:6d2:: with SMTP id
 p18mr2153126ils.44.1628867923564; 
 Fri, 13 Aug 2021 08:18:43 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:18:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, John Clements <john.clements@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Johan Hovold <johan@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Marco Elver <elver@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Patricia Alfonso <trishalfonso@google.com>, Jiri Olsa <jolsa@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Johannes Berg <johannes.berg@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/9] moduleparam: add data member to struct kernel_param
Date: Fri, 13 Aug 2021 09:17:10 -0600
Message-Id: <20210813151734.1236324-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813151734.1236324-1-jim.cromie@gmail.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
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

Add a const void* data member to the struct, to allow attaching
private data that will be used soon by a setter method (via kp->data)
to perform more elaborate actions.

To attach the data at compile time, add new macros:

module_param_cbd() derives from module_param_cb(), adding data param,
and latter is redefined to use former.

It calls __module_param_call_wdata(), which accepts a new data param
and inits .data with it. Re-define __module_param_call() to use it.

Use of this new data member will be rare, it might be worth redoing
this as a separate/sub-type to de-bloat the base case.

---
v4+:
. const void* data - <emil.l.velikov@gmail.com>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/moduleparam.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index eed280fae433..878387e0b2d9 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -78,6 +78,7 @@ struct kernel_param {
 		const struct kparam_string *str;
 		const struct kparam_array *arr;
 	};
+	const void *data;
 };
 
 extern const struct kernel_param __start___param[], __stop___param[];
@@ -175,6 +176,9 @@ struct kparam_array
 #define module_param_cb(name, ops, arg, perm)				      \
 	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
 
+#define module_param_cbd(name, ops, arg, perm, data)				\
+	__module_param_call_wdata(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0, data)
+
 #define module_param_cb_unsafe(name, ops, arg, perm)			      \
 	__module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
 			    KERNEL_PARAM_FL_UNSAFE)
@@ -284,14 +288,17 @@ struct kparam_array
 
 /* This is the fundamental function for registering boot/module
    parameters. */
-#define __module_param_call(prefix, name, ops, arg, perm, level, flags)	\
+#define __module_param_call(prefix, name, ops, arg, perm, level, flags) \
+	__module_param_call_wdata(prefix, name, ops, arg, perm, level, flags, NULL)
+
+#define __module_param_call_wdata(prefix, name, ops, arg, perm, level, flags, data) \
 	/* Default value instead of permissions? */			\
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
 	__used __section("__param")					\
 	__aligned(__alignof__(struct kernel_param))			\
 	= { __param_str_##name, THIS_MODULE, ops,			\
-	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
+	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg }, data }
 
 /* Obsolete - use module_param_cb() */
 #define module_param_call(name, _set, _get, arg, perm)			\
-- 
2.31.1

