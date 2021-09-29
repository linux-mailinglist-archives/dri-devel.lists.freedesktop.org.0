Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66141CDCB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 23:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F16F6E24E;
	Wed, 29 Sep 2021 21:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3E6E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 21:08:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210929210820euoutp017751a99fda7d6882724a5464714b9b86~pZxnk_Bv00544805448euoutp01a
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 21:08:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210929210820euoutp017751a99fda7d6882724a5464714b9b86~pZxnk_Bv00544805448euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632949700;
 bh=JeDKYp3j+cLtP10guMMLbCTqVUCBWHRZIj/Vin2I7wA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jOnF3U+bkEiKRKMGmpHeYhU93tmXUoxaQ4m7P1OdbQpvejinJRpuuc0tWcXq4qjLd
 RDCayWKPU8qnmT62xHVszJ17Z35k1NHk7k3ItKg/mOnpA050zVT6NBbZtVnc3PjYn0
 kqEhXDdZMZYYI+yhkWmMLhyZ1b+bQF3Pdwh4Lx4Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210929210820eucas1p1554a043127322d24d6f4dbb5a21b590e~pZxnJij3W2484424844eucas1p1E;
 Wed, 29 Sep 2021 21:08:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 47.7A.56448.4C5D4516; Wed, 29
 Sep 2021 22:08:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210929210819eucas1p2edb6fc892fbb9f87f025db20941ace98~pZxmQvOfS1126611266eucas1p2O;
 Wed, 29 Sep 2021 21:08:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210929210819eusmtrp1a0be77aec665cf8a5061fad9e0a9b4d8~pZxmQDUd_1010310103eusmtrp1X;
 Wed, 29 Sep 2021 21:08:19 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-3e-6154d5c40abe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.09.31287.3C5D4516; Wed, 29
 Sep 2021 22:08:19 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210929210818eusmtip15d4b1b25d400e882d89e270b2fe0cf3b~pZxl2qkpQ2505825058eusmtip1W;
 Wed, 29 Sep 2021 21:08:18 +0000 (GMT)
Message-ID: <e1c58c0e-b0d5-48a4-f423-3c7e0ff9b765@samsung.com>
Date: Wed, 29 Sep 2021 23:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH v2 2/3] drm/i915/utils: do not depend on config being
 defined
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210929183357.1490204-3-lucas.demarchi@intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7pHroYkGuzu5rBYfmYds8WVr+/Z
 LGZP2MxkcXnXHDaLp4+XsVk8fHCD1YHNY/Gel0wem1Z1snnc7z7O5PF5k1wASxSXTUpqTmZZ
 apG+XQJXxvWulSwFl0Qqjv09yNbAuEygi5GTQ0LARKK3u5mti5GLQ0hgBaPE/Qs/WCGcL4wS
 x18dZYRwPjNKTL05gwWmZcWZiUwQieWMEld2fGeGcN4zSix/1cQEUsUrYCdx4dkCRhCbRUBV
 ouf7ehaIuKDEyZlPwGxRgQSJ1/c2sYHYwgLBEp+P3QWLMwuISzR9WckKYosIBEr0bloGto1Z
 YBqjRGv3A7ChbAKaEn833wRr5hRwkDiw6BwTRLO8RPPW2WAXSQhc4JDY1NrJDnG3i0Tv41fM
 ELawxKvjW6DiMhKnJ/dA/VYvcX9FC1RzB6PE1g07oRqsJe6c+wW0jQNog6bE+l36EGFHiZYp
 JxlBwhICfBI33gpC3MAnMWnbdGaIMK9ER5sQRLWixP2zW6EGikssvfCVbQKj0iykYJmF5P1Z
 SL6ZhbB3ASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMCUc/rf8a87GFe8+qh3iJGJ
 g/EQowQHs5II7w/x4EQh3pTEyqrUovz4otKc1OJDjNIcLErivLu2rokXEkhPLEnNTk0tSC2C
 yTJxcEo1MPU0a7yfe5xD61FLr6eG9sk2H0HXK2Hbb7d8SxCXeyUr8yKx5ZfD7BNHv1hOTX9+
 Z3Fa5/W0VLF1HcnLVk3+ZFXYtOyR/VbFq71L5qa7y+m8r159xcdhYaZqU3Y/K3vTq9BsPba8
 l7L5AhIFTDOSjsh2lZ0+lRFvcL6Xt3Hiy1LhEMmQqcGFyXs++r10Z1siurLR0eZo+baz7tVV
 FTd2Pj4UtWkJj+KdAy8iNU5E3mK8UR7x7lTuZ/+jKVekLJi7M3V+iszaNjO80Pb2VaGDex4n
 HOE+/dp3K/ODZ9fi5izcFzAhh9vxo9UOLhFlV4sYF71UpTubF9buXhnRv+POAw9l5mM/jZv0
 2B7t/WrnqMRSnJFoqMVcVJwIAGeEummoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7qHr4YkGqyfJWyx/Mw6ZosrX9+z
 WcyesJnJ4vKuOWwWTx8vY7N4+OAGqwObx+I9L5k8Nq3qZPO4332cyePzJrkAlig9m6L80pJU
 hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jOtdK1kKLolUHPt7
 kK2BcZlAFyMnh4SAicSKMxOZuhi5OIQEljJKrNpzmxUiIS6xe/5bZghbWOLPtS42iKK3jBIr
 339gAknwCthJXHi2gBHEZhFQlej5vp4FIi4ocXLmEzBbVCBBYvLNeWBDhQWCJT4fuwsWZwZa
 0PRlJVhcRCBQ4snqZawgC5gFpjBKdM15zAKx7SSjxJnHy8E2sAloSvzdfJMNxOYUcJA4sOgc
 E8QkM4murV2MELa8RPPW2cwTGIVmITlkFpKFs5C0zELSsoCRZRWjSGppcW56brGhXnFibnFp
 Xrpecn7uJkZglG079nPzDsZ5rz7qHWJk4mA8xCjBwawkwvtDPDhRiDclsbIqtSg/vqg0J7X4
 EKMpMDQmMkuJJucD4zyvJN7QzMDU0MTM0sDU0sxYSZx369w18UIC6YklqdmpqQWpRTB9TByc
 Ug1MsQ6vTu3SNbsYeMa7/8uvl1efVZsJtn6saFZrrPxtwbdubcdcm43SVx4d5JHfGlSg27/j
 LvfDkON/mPyYrCt8IwW079rzzvJY/E/qSk9a0rNe6x2mspqLv7lb1VgcmewWvKiq/jHfgqnN
 fF43/j0xZNn9x3Bh9kytfudnX/luTBDXD01YZr5n8qEldrm9xttyntgeXOF1WeG3y3X1TZ+Y
 56uL/Hn4tfvVjDuSeQtNVjH8kfZfomv9ycqWZ/qUjRtE6zXbV88P3mVa0Fcs257zXqi8PM01
 5p7Ayo05JnpO2ioPj65cI7LLh+tYtV/uJA/tzQ4Va85M3rJhkyp/YHVKPM/zDN5C/p3zmszN
 9VYrsRRnJBpqMRcVJwIAunBPmzsDAAA=
X-CMS-MailID: 20210929210819eucas1p2edb6fc892fbb9f87f025db20941ace98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <CGME20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed@eucas1p1.samsung.com>
 <20210929183357.1490204-3-lucas.demarchi@intel.com>
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


W dniu 29.09.2021 o 20:33, Lucas De Marchi pisze:
> Like the IS_ENABLED() counterpart, we can make IS_CONFIG_NONZERO() to
> return the right thing when the config is not defined rather than a
> build error, with the limitation that it can't be used on preprocessor
> context.
>
> The trick here is that macro names can't start with a number or dash, so
> we stringify the argument and check that the first char is a number != 0
> (or starting with a dash to cover negative numbers). Except for -O0
> builds the strings are all eliminated.
>
> Taking CONFIG_DRM_I915_REQUEST_TIMEOUT in
> drivers/gpu/drm/i915/gem/i915_gem_context.c as example, we have the
> following output of the preprocessor:
>
> old:
>   if (((20000) != 0) &&
> new:
>   if (( ("20000"[0] > '0' && "20000"[0] < '9') || "20000"[0] == '-' ) &&
>
> New one looks worse, but is also eliminated from the object:
>
> $ size drivers/gpu/drm/i915/gem/i915_gem_context.o.*
>     text    data     bss     dec     hex filename
>    52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.new
>    52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.old
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_utils.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 02bbfa4d68d3..436ce612c46a 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -28,6 +28,7 @@
>   #include <linux/list.h>
>   #include <linux/overflow.h>
>   #include <linux/sched.h>
> +#include <linux/stringify.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> @@ -469,6 +470,9 @@ static inline bool timer_expired(const struct timer_list *t)
>    *
>    * Returns 0 if @config is 0, 1 if set to any value.
>    */
> -#define IS_CONFIG_NONZERO(config) ((config) != 0)
> +#define IS_CONFIG_NONZERO(config) (						\
> +	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
> +	__stringify_1(config)[0] == '-'						\
> +)


Quite clever trick, but I see two issues:

- gcc < 8.1 treats expressions with string indices (ex. "abc"[0]) as 
non-constant expressions, so they cannot be used everywhere, for example 
in global variable initializations,

- it does not work with hex (0x1) or octal values (01)

It is probably OK for private macro, but it can hurt in kconfig.h, 
especially the 2nd issue


Regards

Andrzej

>   
>   #endif /* !__I915_UTILS_H */
