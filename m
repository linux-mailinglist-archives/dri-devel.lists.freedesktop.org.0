Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E63627C4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 20:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8666ECBC;
	Fri, 16 Apr 2021 18:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DDB6ECBD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 18:32:32 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l131so23736884oih.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=x2Faa4bW9Ih3Uz91tHlzisPFZ7PHMjs2CKsrsSmC+qA=;
 b=ZkjeuWqF4eEmeJtPM0dRxgsEu28c1PoyJhnyJkRHk6dCeCtCqoGNWr0iCPi48+k1K+
 JewCv+jTkyUqadjgLqznk++0q4QIpGXZufLEw3dR7Mf2xjmZhkmAl52IlgcO5Z6GBjiB
 z2RGLJa40kG7JKQ6GBDrVDgBxBpw/qbRPkg2d/SFpZ0mGpgj/Ic8kcb5lgEIYaH9pl9y
 mjVBhrJLAYi/9ynl+tifqu1N24bumItgf3eojSUkDiYMS1sy0Qtjv/Pb4pLZ/nLdqM25
 t3AKmmW2Rn9PN7mix+YnzILNpILkYhDSyEzGGMNyjmjU1tokIDjiXw7XYO8a3DXyls2F
 nR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=x2Faa4bW9Ih3Uz91tHlzisPFZ7PHMjs2CKsrsSmC+qA=;
 b=B6eCmG3kK1l2/IKT/4vnR9fiGq+dWBuJk6LxohX8zcaHgE4M8Q1ngjboNyv+A/MrmC
 bxwqjaUZeqatY3d+gYomNcgxKx4BqdwljdqbMk8FXMd5GfGbbxWOZDPjVnUEIKYU4BIa
 5J5NQ1E5jI+3aTe9udAcS1CXqTxZRGDUYg/nZYGxGcF2mkTPXH4QDaA5i3avCRP6xW0D
 w2mKSV3mlfcDqRL0z3Y7y/5KbPlPNjSloXMGWFjLUWqCi4r5yD5rkM1CKPyTOLG9BUbx
 bR+gp9lAuvtxkHs7DZDcucO6GtxqFaPdOp8RZ4XPbLI94fIpaXnleWBc9wk35Pp4G1S/
 wcow==
X-Gm-Message-State: AOAM530uPZm3OBlSYZuHMZNCSWXrQp+p30tfge23yG9AAFsBy0oggJze
 ZKX7PfSdtN1a4mbj8jajw+JPGQ==
X-Google-Smtp-Source: ABdhPJwtBA1RFXylZ30dLKq1ofnccQ4RpOPqMUGiEullxWnyYeTl8mn9IN/vU1AkKE+ThDPbd/ykqQ==
X-Received: by 2002:aca:ab13:: with SMTP id u19mr7420620oie.116.1618597951848; 
 Fri, 16 Apr 2021 11:32:31 -0700 (PDT)
Received: from [100.68.194.111] ([209.107.186.33])
 by smtp.gmail.com with ESMTPSA id o128sm1169544oig.9.2021.04.16.11.32.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Apr 2021 11:32:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
Date: Fri, 16 Apr 2021 13:32:28 -0500
Message-ID: <178dbf4aa60.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210416103718.460830-4-matthew.auld@intel.com>
References: <20210416103718.460830-1-matthew.auld@intel.com>
 <20210416103718.460830-4-matthew.auld@intel.com>
User-Agent: AquaMail/1.29.0-1784 (build: 102900003)
Subject: Re: [PATCH 4/4] drm/i915/uapi: convert i915_query and friend to
 kernel doc
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0817366427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0817366427==
Content-Type: multipart/alternative; boundary="178dbf4ae3235f82817954ac2f"

This is a multi-part message in MIME format.
--178dbf4ae3235f82817954ac2f
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On April 16, 2021 05:37:55 Matthew Auld <matthew.auld@intel.com> wrote:

> Add a note about the two-step process.
>
> v2(Tvrtko):
>  - Also document the other method of just passing in a buffer which is
>    large enough, which avoids two ioctl calls. Can make sense for
>    smaller query items.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> include/uapi/drm/i915_drm.h | 61 ++++++++++++++++++++++++++++++-------
> 1 file changed, 50 insertions(+), 11 deletions(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index d79b51c12ff2..12f375c52317 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2218,14 +2218,23 @@ struct drm_i915_perf_oa_config {
> 	__u64 flex_regs_ptr;
> };
>
> +/**
> + * struct drm_i915_query_item - An individual query for the kernel to process.
> + *
> + * The behaviour is determined by the @query_id. Note that exactly what
> + * @data_ptr is also depends on the specific @query_id.
> + */
> struct drm_i915_query_item {
> +	/** @query_id: The id for this query */
> 	__u64 query_id;
> #define DRM_I915_QUERY_TOPOLOGY_INFO    1
> #define DRM_I915_QUERY_ENGINE_INFO	2
> #define DRM_I915_QUERY_PERF_CONFIG      3
> /* Must be kept compact -- no holes and well documented */
>
> -	/*
> +	/**
> +	 * @length:
> +	 *
> 	 * When set to zero by userspace, this is filled with the size of the
> 	 * data to be written at the data_ptr pointer. The kernel sets this
> 	 * value to a negative value to signal an error on a particular query
> @@ -2233,21 +2242,26 @@ struct drm_i915_query_item {
> 	 */
> 	__s32 length;
>
> -	/*
> +	/**
> +	 * @flags:
> +	 *
> 	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
> 	 *
> 	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
> -	 * following :
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_LIST
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> -	 *         - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> +	 * following:
> +	 *
> +	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> +	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> 	 */
> 	__u32 flags;
> #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
> #define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
>
> -	/*
> +	/**
> +	 * @data_ptr:
> +	 *
> 	 * Data will be written at the location pointed by data_ptr when the
> 	 * value of length matches the length of the data to be written by the
> 	 * kernel.
> @@ -2255,16 +2269,41 @@ struct drm_i915_query_item {
> 	__u64 data_ptr;
> };
>
> +/**
> + * struct drm_i915_query - Supply an array of drm_i915_query_item for the 
> kernel
> + * to fill out.
> + *
> + * Note that this is generally a two step process for each drm_i915_query_item
> + * in the array:
> + *
> + * 1. Call the DRM_IOCTL_I915_QUERY, giving it our array of 
> drm_i915_query_item,
> + *    with drm_i915_query_item.size set to zero. The kernel will then fill in
> + *    the size, in bytes, which tells userspace how memory it needs to 
> allocate
> + *    for the blob(say for an array of properties).
> + *
> + * 2. Next we call DRM_IOCTL_I915_QUERY again, this time with the
> + *    drm_i915_query_item.data_ptr equal to our newly allocated blob. Note 
> that
> + *    the i915_query_item.size should still be the same as what the kernel
> + *    previously set. At this point the kernel can fill in the blob.
> + *
> + * Note that for some query items it can make sense for userspace to just pass
> + * in a buffer/blob equal to or larger than the required size. In this 
> case only
> + * a single ioctl call is needed. For some smaller query items this can work
> + * quite well.
> + *
> + */
> struct drm_i915_query {
> +	/** @num_items: The number of elements in the @items_ptr array */
> 	__u32 num_items;
>
> -	/*
> -	 * Unused for now. Must be cleared to zero.
> +	/**
> +	 * @flags: Unused for now. Must be cleared to zero.
> 	 */
> 	__u32 flags;
>
> -	/*
> -	 * This points to an array of num_items drm_i915_query_item structures.
> +	/**
> +	 * @items_ptr: This points to an array of num_items drm_i915_query_item
> +	 * structures.
> 	 */
> 	__u64 items_ptr;
> };
> --
> 2.26.3


--178dbf4ae3235f82817954ac2f
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Reviewed-by: Jason Ekstrand &lt;jason@jlekstrand.net&gt;<=
/div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On April 16, 2021 05:37:55 Matthew Auld &lt;matthew.auld@=
intel.com&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Add a note about the two-step process.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2(Tvrtko):</div>
<div dir=3D"auto">&nbsp; - Also document the other method of just passing i=
n a buffer which is</div>
<div dir=3D"auto">&nbsp; &nbsp; large enough, which avoids two ioctl calls.=
 Can make sense for</div>
<div dir=3D"auto">&nbsp; &nbsp; smaller query items.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Suggested-by: Daniel Vetter &lt;daniel@ffwll.ch&gt;</div>
<div dir=3D"auto">Signed-off-by: Matthew Auld &lt;matthew.auld@intel.com&gt=
;</div>
<div dir=3D"auto">Cc: Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&g=
t;</div>
<div dir=3D"auto">Cc: Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;=
</div>
<div dir=3D"auto">Cc: Jordan Justen &lt;jordan.l.justen@intel.com&gt;</div>
<div dir=3D"auto">Cc: Daniel Vetter &lt;daniel.vetter@intel.com&gt;</div>
<div dir=3D"auto">Cc: Kenneth Graunke &lt;kenneth@whitecape.org&gt;</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div>
<div dir=3D"auto">Cc: Dave Airlie &lt;airlied@gmail.com&gt;</div>
<div dir=3D"auto">Cc: dri-devel@lists.freedesktop.org</div>
<div dir=3D"auto">Cc: mesa-dev@lists.freedesktop.org</div>
<div dir=3D"auto">Reviewed-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;=
</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;include/uapi/drm/i915_drm.h | 61 ++++++++++++++++++=
++++++++++++-------</div>
<div dir=3D"auto">&nbsp;1 file changed, 50 insertions(+), 11 deletions(-)</=
div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/d=
rm/i915_drm.h</div>
<div dir=3D"auto">index d79b51c12ff2..12f375c52317 100644</div>
<div dir=3D"auto">--- a/include/uapi/drm/i915_drm.h</div>
<div dir=3D"auto">+++ b/include/uapi/drm/i915_drm.h</div>
<div dir=3D"auto">@@ -2218,14 +2218,23 @@ struct drm_i915_perf_oa_config {<=
/div>
<div dir=3D"auto">&nbsp;=09__u64 flex_regs_ptr;</div>
<div dir=3D"auto">&nbsp;};</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+/**</div>
<div dir=3D"auto">+ * struct drm_i915_query_item - An individual query for =
the kernel to process.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * The behaviour is determined by the @query_id. Note th=
at exactly what</div>
<div dir=3D"auto">+ * @data_ptr is also depends on the specific @query_id.<=
/div>
<div dir=3D"auto">+ */</div>
<div dir=3D"auto">&nbsp;struct drm_i915_query_item {</div>
<div dir=3D"auto">+=09/** @query_id: The id for this query */</div>
<div dir=3D"auto">&nbsp;=09__u64 query_id;</div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_TOPOLOGY_INFO &nbsp; &nbsp;1=
</div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_ENGINE_INFO=092</div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_PERF_CONFIG &nbsp; &nbsp; &n=
bsp;3</div>
<div dir=3D"auto">&nbsp;/* Must be kept compact -- no holes and well docume=
nted */</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09/*</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @length:</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">&nbsp;=09 * When set to zero by userspace, this is filled=
 with the size of the</div>
<div dir=3D"auto">&nbsp;=09 * data to be written at the data_ptr pointer. T=
he kernel sets this</div>
<div dir=3D"auto">&nbsp;=09 * value to a negative value to signal an error =
on a particular query</div>
<div dir=3D"auto">@@ -2233,21 +2242,26 @@ struct drm_i915_query_item {</div=
>
<div dir=3D"auto">&nbsp;=09 */</div>
<div dir=3D"auto">&nbsp;=09__s32 length;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09/*</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @flags:</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">&nbsp;=09 * When query_id =3D=3D DRM_I915_QUERY_TOPOLOGY_=
INFO, must be 0.</div>
<div dir=3D"auto">&nbsp;=09 *</div>
<div dir=3D"auto">&nbsp;=09 * When query_id =3D=3D DRM_I915_QUERY_PERF_CONF=
IG, must be one of the</div>
<div dir=3D"auto">-=09 * following :</div>
<div dir=3D"auto">-=09 * &nbsp; &nbsp; &nbsp; &nbsp; - DRM_I915_QUERY_PERF_=
CONFIG_LIST</div>
<div dir=3D"auto">-=09 * &nbsp; &nbsp; &nbsp; &nbsp; - DRM_I915_QUERY_PERF_=
CONFIG_DATA_FOR_UUID</div>
<div dir=3D"auto">-=09 * &nbsp; &nbsp; &nbsp; &nbsp; - DRM_I915_QUERY_PERF_=
CONFIG_FOR_UUID</div>
<div dir=3D"auto">+=09 * following:</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 *=09- DRM_I915_QUERY_PERF_CONFIG_LIST</div>
<div dir=3D"auto">+=09 * &nbsp; &nbsp; &nbsp;- DRM_I915_QUERY_PERF_CONFIG_D=
ATA_FOR_UUID</div>
<div dir=3D"auto">+=09 * &nbsp; &nbsp; &nbsp;- DRM_I915_QUERY_PERF_CONFIG_F=
OR_UUID</div>
<div dir=3D"auto">&nbsp;=09 */</div>
<div dir=3D"auto">&nbsp;=09__u32 flags;</div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_PERF_CONFIG_LIST &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;1</div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2<=
/div>
<div dir=3D"auto">&nbsp;#define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID &nbs=
p; 3</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09/*</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @data_ptr:</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">&nbsp;=09 * Data will be written at the location pointed =
by data_ptr when the</div>
<div dir=3D"auto">&nbsp;=09 * value of length matches the length of the dat=
a to be written by the</div>
<div dir=3D"auto">&nbsp;=09 * kernel.</div>
<div dir=3D"auto">@@ -2255,16 +2269,41 @@ struct drm_i915_query_item {</div=
>
<div dir=3D"auto">&nbsp;=09__u64 data_ptr;</div>
<div dir=3D"auto">&nbsp;};</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+/**</div>
<div dir=3D"auto">+ * struct drm_i915_query - Supply an array of drm_i915_q=
uery_item for the kernel</div>
<div dir=3D"auto">+ * to fill out.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Note that this is generally a two step process for ea=
ch drm_i915_query_item</div>
<div dir=3D"auto">+ * in the array:</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * 1. Call the DRM_IOCTL_I915_QUERY, giving it our array=
 of drm_i915_query_item,</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;with drm_i915_query_item.size set to zer=
o. The kernel will then fill in</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;the size, in bytes, which tells userspac=
e how memory it needs to allocate</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;for the blob(say for an array of propert=
ies).</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * 2. Next we call DRM_IOCTL_I915_QUERY again, this time=
 with the</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;drm_i915_query_item.data_ptr equal to ou=
r newly allocated blob. Note that</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;the i915_query_item.size should still be=
 the same as what the kernel</div>
<div dir=3D"auto">+ * &nbsp; &nbsp;previously set. At this point the kernel=
 can fill in the blob.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Note that for some query items it can make sense for =
userspace to just pass</div>
<div dir=3D"auto">+ * in a buffer/blob equal to or larger than the required=
 size. In this case only</div>
<div dir=3D"auto">+ * a single ioctl call is needed. For some smaller query=
 items this can work</div>
<div dir=3D"auto">+ * quite well.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ */</div>
<div dir=3D"auto">&nbsp;struct drm_i915_query {</div>
<div dir=3D"auto">+=09/** @num_items: The number of elements in the @items_=
ptr array */</div>
<div dir=3D"auto">&nbsp;=09__u32 num_items;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09/*</div>
<div dir=3D"auto">-=09 * Unused for now. Must be cleared to zero.</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @flags: Unused for now. Must be cleared to zero.</=
div>
<div dir=3D"auto">&nbsp;=09 */</div>
<div dir=3D"auto">&nbsp;=09__u32 flags;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09/*</div>
<div dir=3D"auto">-=09 * This points to an array of num_items drm_i915_quer=
y_item structures.</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @items_ptr: This points to an array of num_items d=
rm_i915_query_item</div>
<div dir=3D"auto">+=09 * structures.</div>
<div dir=3D"auto">&nbsp;=09 */</div>
<div dir=3D"auto">&nbsp;=09__u64 items_ptr;</div>
<div dir=3D"auto">&nbsp;};</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.26.3</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--178dbf4ae3235f82817954ac2f--


--===============0817366427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0817366427==--

