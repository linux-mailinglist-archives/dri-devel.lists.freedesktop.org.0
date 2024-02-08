Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE48F84E7CB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7810E9F2;
	Thu,  8 Feb 2024 18:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="BGxokrw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73B10E9F2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 18:39:51 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
 by cmsmtp with ESMTPS
 id Y9InrUBEf80oiY9JIrEtvS; Thu, 08 Feb 2024 18:39:44 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id Y9JIriCyaax1eY9JIrjMVM; Thu, 08 Feb 2024 18:39:44 +0000
X-Authority-Analysis: v=2.4 cv=UeXyS7SN c=1 sm=1 tr=0 ts=65c51ff0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=7YfXLusrAAAA:8 a=T15muJCMmG92BHH_wWsA:9 a=QEXdDO2ut3YA:10 a=9cHFzqQdt-sA:10
 a=PUnBvhIW4WwA:10 a=AjGcO6oz07-iQ99wixmX:22 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5xlR+PchHqlP/opq6mXiFMNRonuQZr3pt2zbgzQpycs=; b=BGxokrw4FW8DcMHK4jGi7CMrdL
 J8+Qy8SmgTyBsDsIiFqT2RNVrmqOVPE6ovpC/3s9S0dOq52p4MFSXU9cvy3nhqcVNZhebJURVylwc
 LhwcpL23/WedIYeMqT1g+S8lPRtOQ2dawlrMDKwIFG02sDRJfYQrI4KBDMUlVzJtk2J4+LUtZ1yZl
 1WtkZaT6LEkD2MWikvIQNkbc/3pkxuNkP/J1bLdgaYv+nsupDznhTZ1mZHh8CxDKB6Hm9FDk8Fs3V
 AktZpXttMw3E7NlajwisQoiW3HfzW+cPHAPwMERYxWGw0S7/puyujrR2L4UeIRvSrqhH8RPw+Lf11
 VDmbW0ow==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56476
 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rY9JH-003Uke-1E;
 Thu, 08 Feb 2024 12:39:43 -0600
Message-ID: <cd710b96-d295-4b2e-8af7-58b5d3f3c1f1@embeddedor.com>
Date: Thu, 8 Feb 2024 12:39:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add flex arrays to struct i915_syncmap
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240208181318.4259-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240208181318.4259-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rY9JH-003Uke-1E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10])
 [187.162.21.192]:56476
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOWwNJTuuGQL3ctP33tfsxBzpze/Iq5Z5pPGkzqzOiO+Liku8ShCAM/UXgO441tlfPwTI11+xBZHsTlvQVFZh7MN8s91C45xI0QmI1ghMGH41Hh4ALTV
 C7Ec0Ru7azOY3Gt3/DD0cumKeFgHqqr9WSfRcBDAzLozvyPpUvZb6yRuF62eF/jkr9N4Tmm8cpB+Fvc+aYQZvNlEDAIIPwYSdcDSGrHp7CC1Xvg9dA+prvZ5
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



On 2/8/24 12:13, Erick Archer wrote:
> The "struct i915_syncmap" uses a dynamically sized set of trailing
> elements. It can use an "u32" array or a "struct i915_syncmap *"
> array.
> 
> So, use the preferred way in the kernel declaring flexible arrays [1].
> Because there are two possibilities for the trailing arrays, it is
> necessary to declare a union and use the DECLARE_FLEX_ARRAY macro.
> 
> The comment can be removed as the union is now clear enough.
> 
> Also, avoid the open-coded arithmetic in the memory allocator functions
> [2] using the "struct_size" macro.
> 
> Moreover, refactor the "__sync_seqno" and "__sync_child" functions due
> to now it is possible to use the union members added to the structure.
> This way, it is also possible to avoid the open-coded arithmetic in
> pointers.
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Nice transformation!

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/gpu/drm/i915/i915_syncmap.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_syncmap.c b/drivers/gpu/drm/i915/i915_syncmap.c
> index 60404dbb2e9f..df6437c37373 100644
> --- a/drivers/gpu/drm/i915/i915_syncmap.c
> +++ b/drivers/gpu/drm/i915/i915_syncmap.c
> @@ -75,13 +75,10 @@ struct i915_syncmap {
>   	unsigned int height;
>   	unsigned int bitmap;
>   	struct i915_syncmap *parent;
> -	/*
> -	 * Following this header is an array of either seqno or child pointers:
> -	 * union {
> -	 *	u32 seqno[KSYNCMAP];
> -	 *	struct i915_syncmap *child[KSYNCMAP];
> -	 * };
> -	 */
> +	union {
> +		DECLARE_FLEX_ARRAY(u32, seqno);
> +		DECLARE_FLEX_ARRAY(struct i915_syncmap *, child);
> +	};
>   };
> 
>   /**
> @@ -99,13 +96,13 @@ void i915_syncmap_init(struct i915_syncmap **root)
>   static inline u32 *__sync_seqno(struct i915_syncmap *p)
>   {
>   	GEM_BUG_ON(p->height);
> -	return (u32 *)(p + 1);
> +	return p->seqno;
>   }
> 
>   static inline struct i915_syncmap **__sync_child(struct i915_syncmap *p)
>   {
>   	GEM_BUG_ON(!p->height);
> -	return (struct i915_syncmap **)(p + 1);
> +	return p->child;
>   }
> 
>   static inline unsigned int
> @@ -200,7 +197,7 @@ __sync_alloc_leaf(struct i915_syncmap *parent, u64 id)
>   {
>   	struct i915_syncmap *p;
> 
> -	p = kmalloc(sizeof(*p) + KSYNCMAP * sizeof(u32), GFP_KERNEL);
> +	p = kmalloc(struct_size(p, seqno, KSYNCMAP), GFP_KERNEL);
>   	if (unlikely(!p))
>   		return NULL;
> 
> @@ -282,7 +279,7 @@ static noinline int __sync_set(struct i915_syncmap **root, u64 id, u32 seqno)
>   			unsigned int above;
> 
>   			/* Insert a join above the current layer */
> -			next = kzalloc(sizeof(*next) + KSYNCMAP * sizeof(next),
> +			next = kzalloc(struct_size(next, child, KSYNCMAP),
>   				       GFP_KERNEL);
>   			if (unlikely(!next))
>   				return -ENOMEM;
> --
> 2.25.1
> 
> 
