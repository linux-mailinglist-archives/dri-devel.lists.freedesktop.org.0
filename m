Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D541D3D5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDCE6E314;
	Thu, 30 Sep 2021 07:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197358808E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:01:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210930070130euoutp02cbabfac5c2e257a2a931fe92cdd1c0f9~ph3hIzsPa0220002200euoutp02v
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:01:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210930070130euoutp02cbabfac5c2e257a2a931fe92cdd1c0f9~ph3hIzsPa0220002200euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632985290;
 bh=eW1eEXG11Bypoi+FV8uiotGNCEojVR4mkRgvwylIyMI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=n4ifgIDrP2fs0YjViVnhghZStSeMkUJKeYw07rW4617KPJRnA1Ijich0lBl3AYFr6
 +EGSAf9cGWMcMTrVN7TDqhX1kvgbe5OB/jUXcj4/FILDUumi0r5XLg/4W5rziZEXCG
 fhbgDsjGBHn3QqAC/4lJd3rvjTi0HxrAkvLhcqu0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210930070130eucas1p11d6ee47400095ab39a21a45745240a83~ph3g_prRW1326013260eucas1p1Y;
 Thu, 30 Sep 2021 07:01:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 41.C6.42068.AC065516; Thu, 30
 Sep 2021 08:01:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210930070129eucas1p1c6b125c2814aaa411fbb1e947ccfeda1~ph3gfVwP90109601096eucas1p18;
 Thu, 30 Sep 2021 07:01:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210930070129eusmtrp1cd969802e2fb15e366ec5d7073a2927c~ph3gel4ss1326113261eusmtrp1I;
 Thu, 30 Sep 2021 07:01:29 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-aa-615560caddc1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 20.6B.20981.9C065516; Thu, 30
 Sep 2021 08:01:29 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210930070129eusmtip28d7df6ec940314fd751080be28efd822~ph3gCEHsy2177221772eusmtip2C;
 Thu, 30 Sep 2021 07:01:29 +0000 (GMT)
Message-ID: <3bf2b596-ad7a-c62b-77db-89f1a252d3f8@samsung.com>
Date: Thu, 30 Sep 2021 09:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH v2 2/3] drm/i915/utils: do not depend on config being
 defined
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter
 <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210929225433.7z76swcouyas7upd@ldmartin-desk2>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7qnEkITDdYdE7BYfmYds8WVr+/Z
 LGZP2MxkcXnXHDaLp4+XsVk8fHCD1YHNY/Gel0wem1Z1snnc7z7O5PF5k1wASxSXTUpqTmZZ
 apG+XQJXxvqV7WwFl5Qr1rXUNjDOkO1i5OSQEDCRuN/4nrGLkYtDSGAFo8SNVfPYIJwvjBL3
 VjYwg1QJCXxmlDjVkgzT8XfefxaIouWMEjt/r2GGcN4zSjz6tBUow8HBK2AncbExFaSBRUBV
 4vj1t2CDeAUEJU7OfMICYosKJEi8vreJDcQWFgiW+HzsLlicWUBcounLSlYQW0RAT2LXketM
 IPOZBbYzSux+0QPWwCagKfF3800wm1PAVmLCrnWMEM3yEs1bZzNDXHqBQ2LepWAI20XiwYGT
 LBC2sMSr41vYIWwZidOTe6Di9RL3V7SAPSMh0MEosXXDTqhB1hJ3zv1iA3mMGWjx+l36EGFH
 iZYpJxlBwhICfBI33gpCnMAnMWnbdGaIMK9ER5sQRLWixP2zW6EGikssvfCVbQKj0iykUJmF
 5PtZSJ6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMBUc/rf8S87GJe/+qh3
 iJGJg/EQowQHs5II7w/x4EQh3pTEyqrUovz4otKc1OJDjNIcLErivElb1sQLCaQnlqRmp6YW
 pBbBZJk4OKUamKSm7Lkx7de/kquzcv6x5adHn9b9HHQ2/ihjJ1ubLCMfJ8ejnOk+azwvXnwS
 O8PEV5XLuT9078L+zb/eXvzea/bHuK+qbaPIow6v5csCP3/zZrvdXlKjwi9f78JrKTjhT6We
 1xbmcs2jH6ezuB4/O+XWg7r53ffvRYUxhVTk8M+aP8vrSsnFWxduKayomypzo+n06ZoXoh4a
 q1r3VF82VZ65JvzYo4tn9uq84JT+lbfHwmqR8Cl/1fqV609rfwp323CFt2/V3qvXdecLNLY/
 uTpty/bddQXf173wt7L/+3M5T1LxHpnJh+9Z3bNYc+veUifnhtf6PlVl7SuX/TDWnaqnv+cj
 c8I/bdlMiV121wqUWIozEg21mIuKEwEXXLMXpAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7onE0ITDXof6VgsP7OO2eLK1/ds
 FrMnbGayuLxrDpvF08fL2CwePrjB6sDmsXjPSyaPTas62Tzudx9n8vi8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY/3KdraCS8oV61pq
 GxhnyHYxcnJICJhI/J33n6WLkYtDSGApo8SSnQ+ZIRLiErvnv4WyhSX+XOtigyh6yyjx981O
 pi5GDg5eATuJi42pIDUsAqoSx69D1PMKCEqcnPmEBcQWFUiQmHxzHiuILSwQLPH52F2wODPQ
 /KYvK8HiIgJ6EruOXGcCmc8ssJ1R4l3rCqhlG5kkZm+fCDaVTUBT4u/mm2wgNqeArcSEXesY
 ISaZSXRt7YKy5SWat85mnsAoNAvJIbOQLJyFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS
 9ZLzczcxAiNs27GfW3Ywrnz1Ue8QIxMH4yFGCQ5mJRHeH+LBiUK8KYmVValF+fFFpTmpxYcY
 TYGhMZFZSjQ5HxjjeSXxhmYGpoYmZpYGppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB9DFxcEo1
 MC3LevFMP5R961vBYys1HD36Cn4fZ59l/MOl4YzsFJGfd3bVm23hMr6578vSINfPh3b7Sa7V
 cNjIcfKNncDs29objN9NY3+u0uH9UbbJtsXzypPDF+uqprLo9Kz9XGEo2HD4xKZHN2ycotm2
 qLTPCDmQvvSnjOzK1UydtuvnLny4c+OWhrry7GKbWwmxosbzwq7x3p8Soyq2/uHp3jP76zlN
 jp2K6rC0v3ur3LK5uD711o8wB71DtwszAs/+OF1yz0iWceP9b7JZwU17Zz1Yp/9OdO/jp8+E
 7h3QYWaeNGO5We69O03hNlJqxm+1I3o35S3cb6jw4zvfi8LkdNaPX5fYbxF/c2blrcB1oat5
 PQ4osRRnJBpqMRcVJwIAGJwrfzkDAAA=
X-CMS-MailID: 20210930070129eucas1p1c6b125c2814aaa411fbb1e947ccfeda1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
 <CGME20210929183439eucas1p1de30c3fb5681a8c8d250f482954f92ed@eucas1p1.samsung.com>
 <20210929183357.1490204-3-lucas.demarchi@intel.com>
 <e1c58c0e-b0d5-48a4-f423-3c7e0ff9b765@samsung.com>
 <20210929225433.7z76swcouyas7upd@ldmartin-desk2>
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


W dniu 30.09.2021 o 00:54, Lucas De Marchi pisze:
> On Wed, Sep 29, 2021 at 11:08:18PM +0200, Andrzej Hajda wrote:
>>
>> W dniu 29.09.2021 o 20:33, Lucas De Marchi pisze:
>>> Like the IS_ENABLED() counterpart, we can make IS_CONFIG_NONZERO() to
>>> return the right thing when the config is not defined rather than a
>>> build error, with the limitation that it can't be used on preprocessor
>>> context.
>>>
>>> The trick here is that macro names can't start with a number or 
>>> dash, so
>>> we stringify the argument and check that the first char is a number 
>>> != 0
>>> (or starting with a dash to cover negative numbers). Except for -O0
>>> builds the strings are all eliminated.
>>>
>>> Taking CONFIG_DRM_I915_REQUEST_TIMEOUT in
>>> drivers/gpu/drm/i915/gem/i915_gem_context.c as example, we have the
>>> following output of the preprocessor:
>>>
>>> old:
>>>   if (((20000) != 0) &&
>>> new:
>>>   if (( ("20000"[0] > '0' && "20000"[0] < '9') || "20000"[0] == '-' 
>>> ) &&
>>>
>>> New one looks worse, but is also eliminated from the object:
>>>
>>> $ size drivers/gpu/drm/i915/gem/i915_gem_context.o.*
>>>     text    data     bss     dec     hex filename
>>>    52021    1070     232   53323    d04b 
>>> drivers/gpu/drm/i915/gem/i915_gem_context.o.new
>>>    52021    1070     232   53323    d04b 
>>> drivers/gpu/drm/i915/gem/i915_gem_context.o.old
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_utils.h | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_utils.h 
>>> b/drivers/gpu/drm/i915/i915_utils.h
>>> index 02bbfa4d68d3..436ce612c46a 100644
>>> --- a/drivers/gpu/drm/i915/i915_utils.h
>>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>>> @@ -28,6 +28,7 @@
>>>   #include <linux/list.h>
>>>   #include <linux/overflow.h>
>>>   #include <linux/sched.h>
>>> +#include <linux/stringify.h>
>>>   #include <linux/types.h>
>>>   #include <linux/workqueue.h>
>>>
>>> @@ -469,6 +470,9 @@ static inline bool timer_expired(const struct 
>>> timer_list *t)
>>>    *
>>>    * Returns 0 if @config is 0, 1 if set to any value.
>>>    */
>>> -#define IS_CONFIG_NONZERO(config) ((config) != 0)
>>> +#define IS_CONFIG_NONZERO(config) (                        \
>>> +    (__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < 
>>> '9') ||    \
>>> +    __stringify_1(config)[0] == '-'                        \
>>> +)
>>
>>
>> Quite clever trick, but I see two issues:
>>
>> - gcc < 8.1 treats expressions with string indices (ex. "abc"[0]) as
>> non-constant expressions, so they cannot be used everywhere, for example
>> in global variable initializations,
>
> ugh, that would kill the idea - having the strings and additional
> runtime checks would not be good. Maybe if we check with
> __builtin_constant_p() and do the simpler expansion if it's not
> constant?


I think it is just matter of disallowing such construct in places where 
compiler expects constant expression.

If accepted, the expression is apparently evaluated in compile time. See 
[1].

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18


>
>>
>> - it does not work with hex (0x1) or octal values (01)
>
> indeed, but I guess that would be fixable by checking (s[0] == '0' && 
> s[1] == '\0')?
> However, it seems kconfig doesn't support setting int options to hex or
> octal.


I've spotted in include/generated/autoconf.h following line:

#define CONFIG_ILLEGAL_POINTER_VALUE 0xdead000000000000

It corresponds to following kconfig entry:

config ILLEGAL_POINTER_VALUE
        hex
        default 0 if X86_32
        default 0xdead000000000000 if X86_64

Grepping shows more: grep -r --include=Kconfig -3 -P '^\s*hex' .

Anyway do you really need to handle undefined case? If not, the macro 
can stay simple, w/o hacky constructs.


Regards

Andrzej


>
> If I try an hex value in menuconfig it says "You have made an invalid 
> entry."
> If I try editing .config or setting via scripts/config --set-val, it
> just gets reset when trying to generate include/generated/autoconf.h
>
> Lucas De Marchi
>
>>
>> It is probably OK for private macro, but it can hurt in kconfig.h,
>> especially the 2nd issue
>>
>>
>> Regards
>>
>> Andrzej
>>
>>>
>>>   #endif /* !__I915_UTILS_H */
>
