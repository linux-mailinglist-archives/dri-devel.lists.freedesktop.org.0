Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6424D8EAC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 22:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79610E35A;
	Mon, 14 Mar 2022 21:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F10B10E35A;
 Mon, 14 Mar 2022 21:30:29 +0000 (UTC)
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EHH282022438;
 Mon, 14 Mar 2022 21:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=DnlH4WPaT9Z+jUCaFm11XFK9ptA8XNRWuJjN2W9g93A=;
 b=EimbgGbh3rA5Z8b9amifP2VN4lAbGo/mvUvrIFsrq80SeQ2W+4OOxnb0XOCWhFq+GEpL
 iVfZ7mUstOo1EAJmx80vdOEkyNu9hnD2HyXjFK7igxiHK7ciVTwuQBlVmTHQXquLXqJ7
 wf1m29IwaKeTDHVxjXGqoh/4153MWB0/tmvSaHWzVlm+zMG9zXPqasQoxYnQT8gdb+5e
 ATzvdVTMPlDqrKq/Z0uFfAODHKoRuhjIy6Nw2IdV3n+uqDrHkyAbZB1XKjM616gmu5tU
 o9O37ydl8d2w3X//Hkwn4obprJkBTBi4buFIZQrc8QPHN5uZVIQ9K12qlJufxkVH792I 4A== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60]
 (may be forged))
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3et611jdts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 21:30:25 +0000
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
 by prod-mail-ppoint5.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 22ELL2Gx031601; Mon, 14 Mar 2022 14:30:00 -0700
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
 by prod-mail-ppoint5.akamai.com with ESMTP id 3ertcekqsk-1;
 Mon, 14 Mar 2022 14:30:00 -0700
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 1E2C94C6C6;
 Mon, 14 Mar 2022 21:30:00 +0000 (GMT)
Message-ID: <0d00c529-3bac-f09f-e07c-584194251a06@akamai.com>
Date: Mon, 14 Mar 2022 17:29:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] dyndbg: add class_id field and query support
Content-Language: en-US
To: jim.cromie@gmail.com
References: <20220311044756.425777-1-jim.cromie@gmail.com>
 <20220311044756.425777-3-jim.cromie@gmail.com>
 <823e51e6-2af4-7854-9428-697a2af12488@akamai.com>
 <CAJfuBxxVti_pa1YPmas=Ub28yWUFFGeR13wxveLvPCYS61NxuA@mail.gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxxVti_pa1YPmas=Ub28yWUFFGeR13wxveLvPCYS61NxuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-14_13:2022-03-14,
 2022-03-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140123
X-Proofpoint-ORIG-GUID: B7Gi0uhxn_zgxI-N0lzstel1Fg851Rqd
X-Proofpoint-GUID: B7Gi0uhxn_zgxI-N0lzstel1Fg851Rqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140123
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/11/22 20:06, jim.cromie@gmail.com wrote:
> On Fri, Mar 11, 2022 at 12:06 PM Jason Baron <jbaron@akamai.com> wrote:
>>
>>
>>
>> On 3/10/22 23:47, Jim Cromie wrote:
>>> DRM defines/uses 10 enum drm_debug_category's to create exclusive
>>> classes of debug messages.  To support this directly in dynamic-debug,
>>> add the following:
>>>
>>> - struct _ddebug.class_id:4 - 4 bits is enough
>>> - define _DPRINTK_SITE_UNCLASSED 15 - see below
>>>
>>> and the query support:
>>> - struct _ddebug_query.class_id
>>> - ddebug_parse_query  - looks for "class" keyword, then calls..
>>> - parse_class         - accepts uint: 0-15, sets query.class_id and marker
>>> - vpr_info_dq         - displays new field
>>> - ddebug_proc_show    - append column with "cls:%d" if !UNCLASSED
>>>
>>> With the patch, one can enable current/unclassed callsites by:
>>>
>>>   #> echo drm class 15 +p > /proc/dynamic_debug/control
>>>
>>
>> To me, this is hard to read, what the heck is '15'? I have to go look it
>> up in the control file and it's not descriptive. I think that using
>> classes/categories makes sense but I'm wondering if it can be a bit more
>> user friendly? Perhaps, we can pass an array of strings that is indexed
>> by the class id to each pr_debug() site that wants to use class. So
>> something like:
>>
> 
> Im not at all averse to nice names, but as something added on.
> 
> 1st, the interface to make friendlier is DRM's
> 
> echo 0x04 > /sys/module/drm/parameters/debug   # which category ?
> 
> parm:           debug:Enable debug output, where each bit enables a
> debug category.
> Bit 0 (0x01)  will enable CORE messages (drm core code)
> Bit 1 (0x02)  will enable DRIVER messages (drm controller code)
> Bit 2 (0x04)  will enable KMS messages (modesetting code)
> 
> echo DRM_UT_DRIVER,DRM_UT_KMS > /sys/module/drm/parameters/debug   #
> now its pretty clear
> 
> If that works, its cuz DEFINE_DYNAMIC_DEBUG_CLASSBITS()
> plucks class symbols out of its __VA_ARGS__, and #stringifes them.
> So that macro could then build the 1-per-module static constant string array
> and (only) the callbacks would be able to use it.
> 
> from there, it shouldnt be hard to ref that from the module's ddebug_table,
> so parse_query could validate class args against the module given (or
> fail if none given)
> 
> Speaking strictly, theres a gap:
>    echo module * class DRM_UT_KMS +p > control
> is nonsense for * other than drm + drivers,
> but its fair/safe to just disallow wildcards on modname for this purpose.
> 
> it does however imply that module foo must exist for FOO_CAT_1 to be usable.
> thats not currently the case:
> bash-5.1# echo module foo +p > /proc/dynamic_debug/control
> [   15.403749] dyndbg: read 14 bytes from userspace
> [   15.405413] dyndbg: query 0: "module foo +p" mod:*
> [   15.406486] dyndbg: split into words: "module" "foo" "+p"
> [   15.407070] dyndbg: op='+'
> [   15.407388] dyndbg: flags=0x1
> [   15.407809] dyndbg: *flagsp=0x1 *maskp=0xffffffff
> [   15.408300] dyndbg: parsed: func="" file="" module="foo" format=""
> lineno=0-0 class=15
> [   15.409151] dyndbg: no matches for query
> [   15.409591] dyndbg: no-match: func="" file="" module="foo"
> format="" lineno=0-0 class=15
> [   15.410524] dyndbg: processed 1 queries, with 0 matches, 0 errs
> bash-5.1#
> 
> ISTM we can keep that "0 errs" response for that case, but still reject this:
> 
>    echo module foo class FOO_NOT_HERE +p > /proc/dynamic_debug/control
> 
> 

Ok, yeah so I guess I'm thinking about the 'class' more as global namespace,
so that for example, it could span modules, or be specific to certain modules.
I'm also thinking of it as a 'string' which is maybe hierarchical, so that it's
clear what sub-system, or sub-sub-system it belongs to. So for DRM for example,
it could be a string like "DRM:CORE". The index num I think is still helpful for
implementation so we don't have to store a pointer size, but I don't think it's
really exposed (except perhaps in module params b/c drm is doing that already?).


>> enum levels {
>>         LOW,
>>         MEDIUM,
>>         HIGH
>> };
> 
> I want to steer clear of "level" anything,
> since 2>1 implies non independence of the categories
> 
> 

Agreed, that was a bad example on my part.

I've put together a rough patch on top of your series, to make my thinking
hopefully clear. I also think that the module param callback thing could be
implemented in this 'global' space with the 0-14 low numbers, by adding
some sort of offset into the table. IE you would add the low number +
the offset to get the 'string' to add to the ddebug query. I commented it
out in my patch below b/c I didn't implement that part.

Thoughts?


diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 664bb83778d2..b0bc1b536d54 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -8,6 +8,14 @@

 #include <linux/build_bug.h>

+enum ddebug_categories {
+        FOO_BAR = 0,
+        DRM_A = 1,
+        DRM_B = 2,
+        DRM_C = 3,
+        //_DPRINTK_SITE_DEFAULT 63 is max
+};
+
 /*
  * An instance of this structure is created in a special
  * ELF section at every dynamic debug callsite.  At runtime,
@@ -23,9 +31,9 @@ struct _ddebug {
 	const char *filename;
 	const char *format;
 	unsigned int lineno:18;
-#define CLS_BITS 4
+#define CLS_BITS 6
 	unsigned int class_id:CLS_BITS;
-#define _DPRINTK_SITE_UNCLASSED		((1 << CLS_BITS) - 1)
+#define _DPRINTK_SITE_DEFAULT		((1 << CLS_BITS) - 1)
 	/*
 	 * The flags field controls the behaviour at the callsite.
 	 * The bits here are changed dynamically when the user
@@ -101,11 +109,11 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 		.class_id = cls,				\
 		_DPRINTK_KEY_INIT				\
 	};							\
-	BUILD_BUG_ON_MSG(cls > _DPRINTK_SITE_UNCLASSED,		\
+	BUILD_BUG_ON_MSG(cls > _DPRINTK_SITE_DEFAULT,		\
 			 "classid value overflow")

 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
-	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_SITE_UNCLASSED, fmt)
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_SITE_DEFAULT, fmt)

 #ifdef CONFIG_JUMP_LABEL

@@ -149,11 +157,11 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 } while (0)

 #define __dynamic_func_call(id, fmt, func, ...)				\
-	__dynamic_func_call_cls(id, _DPRINTK_SITE_UNCLASSED,		\
+	__dynamic_func_call_cls(id, _DPRINTK_SITE_DEFAULT,		\
 				fmt, func, ##__VA_ARGS__)

 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
-	__dynamic_func_call_no_desc_cls(id, _DPRINTK_SITE_UNCLASSED,	\
+	__dynamic_func_call_no_desc_cls(id, _DPRINTK_SITE_DEFAULT,	\
 					fmt, func, ##__VA_ARGS__)

 /*
@@ -167,7 +175,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #define _dynamic_func_call_cls(cls, fmt, func, ...)			\
 	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
 #define _dynamic_func_call(fmt, func, ...)				\
-	_dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__VA_ARGS__)
+	_dynamic_func_call_cls(_DPRINTK_SITE_DEFAULT, fmt, func, ##__VA_ARGS__)

 /*
  * A variant that does the same, except that the descriptor is not
@@ -180,7 +188,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,

 #define _dynamic_func_call_no_desc(fmt, func, ...)			\
 	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug),		\
-					_DPRINTK_SITE_UNCLASSED,	\
+					_DPRINTK_SITE_DEFAULT,	\
 					fmt, func, ##__VA_ARGS__)

 #define dynamic_pr_debug(fmt, ...)				\
@@ -284,7 +292,7 @@ struct dyndbg_classbits_param {
 	static struct dyndbg_classbits_param ddcats_##_var = {		\
 		.bits = &(_var),					\
 		.flags = _flgs,						\
-		.classes = { __VA_ARGS__, _DPRINTK_SITE_UNCLASSED }	\
+		.classes = { __VA_ARGS__, _DPRINTK_SITE_DEFAULT }	\
 	};								\
 	module_param_cb(fsname, &param_ops_dyndbg_classbits,		\
 			&ddcats_##_var, 0644)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 11c8d0771cd2..0f390638e46c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -39,6 +39,14 @@

 #include <rdma/ib_verbs.h>

+static const char * const cat_to_strings[] = {
+        [FOO_BAR] = "foo:bar",
+        [DRM_A] = "drm:A",
+        [DRM_B] = "drm:B",
+        [DRM_C] = "drm:C",
+	[_DPRINTK_SITE_DEFAULT] = "default",
+};
+
 extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];

@@ -55,8 +63,7 @@ struct ddebug_query {
 	const char *function;
 	const char *format;
 	unsigned int first_lineno, last_lineno;
-	unsigned int class_id;
-	unsigned int class_marked:1;
+	const char *class_string;
 };

 struct ddebug_iter {
@@ -136,13 +143,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}

-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%u\n",
+	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
 		 msg,
 		 query->function ?: "",
 		 query->filename ?: "",
 		 query->module ?: "",
 		 fmtlen, query->format ?: "",
-		 query->first_lineno, query->last_lineno, query->class_id);
+		 query->first_lineno, query->last_lineno, query->class_string);
 }

 /*
@@ -158,7 +165,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;

 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -172,8 +179,8 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];

-			/* match against the class_id, either given or default */
-			if (query->class_id != dp->class_id)
+			/* if class is not set fall through, ot check if it matches */
+			if (query->class_string && strcmp(query->class_string, cat_to_strings[dp->class_id]))
 				continue;

 			/* match against the source filename */
@@ -223,11 +230,12 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
+			v4pr_info("changed %s:%d [%s]%s %s -> %s\n",
+				  trim_prefix(dp->filename), dp->lineno,
+				  dt->mod_name, dp->function,
+				  ddebug_describe_flags(dp->flags, &fbuf),
+				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
-			v4pr_info("changed %s:%d [%s]%s =%s\n",
-				 trim_prefix(dp->filename), dp->lineno,
-				 dt->mod_name, dp->function,
-				 ddebug_describe_flags(dp->flags, &fbuf));
 		}
 	}
 	mutex_unlock(&ddebug_lock);
@@ -314,21 +322,6 @@ static inline int parse_lineno(const char *str, unsigned int *val)
 	return 0;
 }

-static inline int parse_class(struct ddebug_query *query, const char *str)
-{
-	int rc;
-	unsigned int val;
-
-	rc = kstrtouint(str, 10, &val);
-	if (rc < 0 || val > _DPRINTK_SITE_UNCLASSED) {
-		pr_err("expecting class:[0-%d], not %s\n", _DPRINTK_SITE_UNCLASSED, str);
-		return -EINVAL;
-	}
-	query->class_id = val;
-	query->class_marked = 1;
-	return 0;
-}
-
 static int parse_linerange(struct ddebug_query *query, const char *first)
 {
 	char *last = strchr(first, '-');
@@ -443,8 +436,7 @@ static int ddebug_parse_query(char *words[], int nwords,
 			if (parse_linerange(query, arg))
 				return -EINVAL;
 		} else if (!strcmp(keyword, "class")) {
-			if (parse_class(query, arg))
-				return -EINVAL;
+			rc = check_set(&query->class_string, arg, "class");
 		} else {
 			pr_err("unknown keyword \"%s\"\n", keyword);
 			return -EINVAL;
@@ -452,9 +444,6 @@ static int ddebug_parse_query(char *words[], int nwords,
 		if (rc)
 			return rc;
 	}
-	/* post-validate the query, set default */
-	if (!query->class_marked)
-		query->class_id = _DPRINTK_SITE_UNCLASSED;

 	vpr_info_dq(query, "parsed");
 	return 0;
@@ -616,6 +605,8 @@ int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
 	}
 	vpr_info("set_dyndbg_classbits: new 0x%lx old 0x%lx\n", inbits, *dcp->bits);

+
+/*
 	for (i = 0; (i < _DPRINTK_SITE_UNCLASSED &&
 		     dcp->classes[i] < _DPRINTK_SITE_UNCLASSED); i++) {

@@ -630,6 +621,7 @@ int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
 			  matches, dcp->classes[i]);
 		totct += matches;
 	}
+*/
 	*dcp->bits = inbits;
 	vpr_info("total matches: %d\n", totct);
 	return 0;
@@ -978,8 +970,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_escape(m, dp->format, "\t\r\n\"");
 	seq_puts(m, "\"");

-	if (dp->class_id != _DPRINTK_SITE_UNCLASSED)
-		seq_printf(m, " cls:%u", dp->class_id);
+	seq_printf(m, " cat:%s", cat_to_strings[dp->class_id]);
 	seq_puts(m, "\n");

 	return 0;
