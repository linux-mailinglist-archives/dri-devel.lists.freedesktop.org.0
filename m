Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CB57E8B3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 23:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661DC93A81;
	Fri, 22 Jul 2022 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2713 seconds by postgrey-1.36 at gabe;
 Fri, 22 Jul 2022 21:09:00 UTC
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193AE939F0;
 Fri, 22 Jul 2022 21:08:59 +0000 (UTC)
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
 by m0050093.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 26MKJalr029775; Fri, 22 Jul 2022 21:23:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=+1AONTHeZKujAZlWUT0X+IkeKoRkI9kd867PknMVwg0=;
 b=EdVF8ZamAx9aTHgv1RBz/dVtJJ9wZvCxs2+SimSTrJOTl3iz4UJ83aSjs62HDnxEjxhU
 e4ItfkliZKeHTJ6jFvcitACPKia3q/PAJzLex92rWd1wktsCv/oZWFF9LsyNNCUWITBA
 5KfLICK3rOQIHgnfpznD2heBjmEvFL7Aw3++hZbIGiVH7BEhg/Tlsb4eOB3DoE470iAF
 sU/rWx5E41QASKF00nyASFKiLUwA1Yzqrv8qopECzyX9dc6TdsbNtQVJ15APQhdQLP+r
 KlD0s/qdGJltf7zMqZ4JQakIiTzmNz5w+azl+VuvcLU0uWxZyZphLaDnDMxZ7fFKydFn Zg== 
Received: from prod-mail-ppoint4
 (a72-247-45-32.deploy.static.akamaitechnologies.com [72.247.45.32] (may be
 forged))
 by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3hg0j46nf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 21:23:42 +0100
Received: from pps.filterd (prod-mail-ppoint4.akamai.com [127.0.0.1])
 by prod-mail-ppoint4.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 26MIt3Uk020881; Fri, 22 Jul 2022 16:23:41 -0400
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint4.akamai.com (PPS) with ESMTP id 3hbrptdm45-1;
 Fri, 22 Jul 2022 16:23:41 -0400
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 98D7716E;
 Fri, 22 Jul 2022 20:23:40 +0000 (GMT)
Message-ID: <9e34b45f-c091-223b-58ac-107cfbebd92c@akamai.com>
Date: Fri, 22 Jul 2022 16:23:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 12/41] dyndbg: add DECLARE_DYNDBG_CLASSMAP
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <20220720153233.144129-13-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20220720153233.144129-13-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220083
X-Proofpoint-ORIG-GUID: iVW3af7nY-wh7IXZ-qsYpdTMGZ_K4vj0
X-Proofpoint-GUID: iVW3af7nY-wh7IXZ-qsYpdTMGZ_K4vj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 adultscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220083
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



On 7/20/22 11:32, Jim Cromie wrote:
> DECLARE_DYNDBG_CLASSMAP lets modules declare a set of classnames, this
> opt-in authorizes dyndbg to allow enabling of prdbgs by their class:
> 
>    :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> 
> This is just the setup; following commits deliver.
> 
> The macro declares and initializes a static struct ddebug_class_map:
> 
>  - maps approved class-names to class_ids used in module,
>    by array order. forex: DRM_UT_*
>  - class-name vals allow validation of "class FOO" queries
>    using macro is opt-in
>  - enum class_map_type - determines interface, behavior
> 
> Each module has its own .class_id space, and only known class-names
> will be authorized for a manipulation.  Only DRM stuff should know this:
> 
>   :#> echo class DRM_UT_CORE +p > control	# across all modules
> 
> pr_debugs (with default class_id) are still controllable as before.
> 
> DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, classes...) is::
> 
>  _var: name of the static struct var. user passes to module_param_cb()
>        if they want a sysfs node. (ive only done it this way).
> 
>  _maptype: this is hard-coded to DD_CLASS_TYPE_DISJOINT for now.
> 
>  _base: usually 0, it allows splitting 31 classes into subranges, so
>  	that multiple classes / sysfs-nodes can share the module's
>  	class-id space.
> 
>  classes: list of class_name strings, these are mapped to class-ids
>  	  starting at _base.  This class-names list must have a
>  	  corresponding ENUM, with SYMBOLS that match the literals,
>  	  and 1st enum val = _base.
> 
> enum class_map_type has 4 values, on 2 factors::
> 
>  - classes are disjoint/independent vs relative/x<y/verbosity.
>    disjoint is basis, verbosity by overlay.
> 
>  - input NUMBERS vs [+-]CLASS_NAMES
>    uints, ideally hex.  vs  +DRM_UT_CORE,-DRM_UT_KMS
> 

Could the naming here directly reflect the 2 factors? At least for me
I think it's more readable. So something like:


> DD_CLASS_TYPE_DISJOINT: classes are separate, one per bit.
>    expecting hex input. basis for others.

DD_CLASS_TYPE_DISJOINT_NUM

> 
> DD_CLASS_TYPE_SYMBOLIC: input is a CSV of [+-]CLASS_NAMES,
>    classes are independent, like DISJOINT
> 

DD_CLASS_TYPE_DISJOINT_NAME

> DD_CLASS_TYPE_VERBOSE: input is numeric level, 0-N.
>    0 implies silence. use printk to break that.
>    relative levels applied on bitmaps.
> 

DD_CLASS_TYPE_LEVEL_NUM

> DD_CLASS_TYPE_LEVELS: input is a CSV of [+-]CLASS_NAMES,
>    names like: ERR,WARNING,NOTICE,INFO,DEBUG
>    avoiding EMERG,ALERT,CRIT,ERR - no point.
> 

DD_CLASS_TYPE_LEVEL_NAME

> NOTES:
> 
> The macro places the initialized struct ddebug_class_map into the
> __dyndbg_classes section.  That draws a 'orphan' warning which we
> handle in next commit.  The struct attributes are necessary:
> __aligned(8) stopped null-ptr derefs (why?), __used is needed by drm
> drivers, which declare class-maps, but don't also declare a
> sysfs-param, and thus dont ref the classmap; __used insures that the
> linkage is made, then the class-map is found at load-time.
> 
> While its possible to handle both NAMES and NUMBERS in the same
> sys-interface, there is ambiguity to avoid, by disallowing them
> together.  Later, if ambiguities are resolved, 2 new enums can permit
> both inputs, on verbose & independent types separately, and authors
> can select the interface they like.
> 
> RFC:
> 
> My plan is to implement LEVELS in the callbacks, outside of
> ddebug_exec_query(), which for simplicity will treat the CLASSES in
> the map as disjoint.  This should handle most situations.
> 
> The callbacks can see map-type, and apply ++/-- loops (or bitops) to
> force the relative meanings across the class-bitmap.
> 
> That leaves 2 issues:
> 
> 1. doing LEVELs in callbacks means that the native >control interface
> doesn't enforce the LEVELS relationship, so you could confusingly have
> V3 enabled, but V1 disabled.  OTOH, the control iface already allows
> infinite variety in the underlying callsites, despite the veneer of
> uniformity suggested by the bitmap overlay, and LEVELS over that.
> 
> 2. All dyndbg >control reduces to a query/command, includes +/-, which
> is at-root a kernel patching operation with +/- semantics.  And the
> symbolic sys-node handling exposes it to the user:
> 
> Consider whether these are/should-be 'exactly' the same:
> 
>    # force both 2 "half-duplex" relations
>    echo +V3,-V4 > /sys/module/test_dynamic_debug/p_VX
> 
>    # should these both do the same ?
>    echo +V3 > /sys/module/test_dynamic_debug/p_VX
>    echo -V4 > /sys/module/test_dynamic_debug/p_VX
> 
> IOW, half relations are suggested by the +/-, and enum control of
> individual behaviors leaves some room for this, especially wrt
> handling [+-]SYMBOLIC inputs from the user.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  include/linux/dynamic_debug.h | 55 +++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index 0f7ad6cecf05..84e97cd0e8c4 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -56,7 +56,62 @@ struct _ddebug {
>  #endif
>  } __attribute__((aligned(8)));
>  
> +enum class_map_type {
> +	DD_CLASS_TYPE_DISJOINT,
> +	/**
> +	 * DD_CLASS_TYPE_DISJOINT: classes are independent, one per bit.
> +	 * expecting hex input. basis for others.
> +	 */
> +	DD_CLASS_TYPE_VERBOSE,
> +	/**
> +	 * DD_CLASS_TYPE_VERBOSE: input is numeric level, 0-N.
> +	 * 0 should be silent, use printk to break that.
> +	 * (x<y) relationship on bitpos
> +	 */
> +	DD_CLASS_TYPE_SYMBOLIC,
> +	/**
> +	 * DD_CLASS_TYPE_SYMBOLIC: input is a CSV of [+-]CLASS_NAMES,
> +	 * classes are independent, like DISJOINT
> +	 */
> +	DD_CLASS_TYPE_LEVELS,
> +	/**
> +	 * DD_CLASS_TYPE_LEVELS: input is a CSV of [+-]CLASS_NAMES,
> +	 * intended for names like: ERR,WARNING,NOTICE,INFO,DEBUG
> +	 * avoid ? EMERG,ALERT,CRIT,ERR,WARNING ??
> +	 */
> +};
> +
> +struct ddebug_class_map {
> +	struct list_head link;
> +	struct module *mod;
> +	const char *mod_name;	/* needed for builtins */
> +	const char **class_names;
> +	const int length;
> +	const int base;		/* index of 1st .class_id, allows split/shared space */
> +	enum class_map_type map_type;
> +};
> +
> +/**
> + * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
> + * @_var:   a struct ddebug_class_map, passed to module_param_cb
> + * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
> + * @_base:  offset of 1st class-name. splits .class_id space
> + * @classes: class-names used to control class'd prdbgs
> + */
> +#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
> +	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
> +	static struct ddebug_class_map __aligned(8) __used		\
> +		__section("__dyndbg_classes") _var = {			\
> +		.mod = THIS_MODULE,					\
> +		.mod_name = KBUILD_MODNAME,				\
> +		.base = _base,						\
> +		.map_type = _maptype,					\
> +		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
> +		.class_names = _var##_classnames,			\
> +	}
>  
> +#define NUM_TYPE_ARGS(eltype, ...)				\
> +	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
>  
