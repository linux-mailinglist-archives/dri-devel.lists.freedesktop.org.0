Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D6824E23
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 06:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642310E16A;
	Fri,  5 Jan 2024 05:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466B310E0D8;
 Fri,  5 Jan 2024 05:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=WfYHZN02CLJH0ySpqHd7ao/46+BdoIRfnnU+Dxnoo5Q=; b=YhDTI9kIyHogx9w4rkPWVO6J8o
 992BEELaSHCa/YTd9ygz5ZVn2I3thTxG04j0ixaWLIDKEerNOSZzB1g+CT1Yh/yMtWVL1PgSryyGs
 UZkWtg6rJ6+lkPx86Y3YmdHVtNsVf+ww5Bu7Rou+TTjOOPO6PC02WCTuFXRzDUDUBsrZhhS8RM47u
 TKVA0ipEDn2H6i7ld1iLFiZpV/4d1OEyidHR9QG/rHE6Dn+lDtJ+BkSiHWp+eK8F9Opv1l9t3SUpj
 Tv+iJnrYbZk7Wee2dui2Jb8h4sjNs7nrF4QwaNab4g2DUSktKK3Hu3V5zf/68kCljAEc3tqb30U5j
 JRlHvf0w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rLcno-00FzF5-15; Fri, 05 Jan 2024 05:31:28 +0000
Message-ID: <f19a971d-5d58-4166-ba03-db915eb49fc6@infradead.org>
Date: Thu, 4 Jan 2024 21:31:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
 <009fcdc4-b10a-4ab9-b368-7cea75bb74e2@infradead.org>
 <0f04dd81-1b0f-4408-b4de-63a01895b0a5@oracle.com>
 <df7d110b-a50c-4293-b5d4-45913fa6909e@infradead.org>
 <70b16de0-b213-464f-a318-d9b96b76b967@infradead.org>
In-Reply-To: <70b16de0-b213-464f-a318-d9b96b76b967@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/2/24 19:10, Randy Dunlap wrote:
> Hi Vegard,
> 
> On 12/25/23 09:08, Randy Dunlap wrote:
>>
>>
>> On 12/25/23 00:30, Vegard Nossum wrote:
>>>
>>> On 25/12/2023 08:40, Randy Dunlap wrote:
>>>> I do see one thing that I don't like in the generated html output.
>>>> It's not a problem with this patch.
>>>> The #defines for DRM_NOUVEAU_VM_BIND_OP_MAP etc. have a ';' at the
>>>> end of each line:
>>>>
>>>> struct drm_nouveau_vm_bind_op {
>>>>      __u32 op;
>>>> #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0;
>>>> #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1;
>>>>      __u32 flags;
>>>> #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8);
>>>>      __u32 handle;
>>>>      __u32 pad;
>>>>      __u64 addr;
>>>>      __u64 bo_offset;
>>>>      __u64 range;
>>>> };
>>>
>>> Do we actually ever want preprocessor directives to appear inside
>>> definitions in the output? If not, I think this should work:
>>
>> Not necessarily.
>>
>>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>>> index 3cdc7dba37e3..61425fc9645e 100755
>>> --- a/scripts/kernel-doc
>>> +++ b/scripts/kernel-doc
>>> @@ -1259,6 +1259,8 @@ sub dump_struct($$) {
>>>                 $clause =~ s/\s+$//;
>>>                 $clause =~ s/\s+/ /;
>>>                 next if (!$clause);
>>> +               # skip preprocessor directives
>>> +               next if $clause =~ m/^#/;
>>>                 $level-- if ($clause =~ m/(\})/ && $level > 1);
>>>                 if (!($clause =~ m/^\s*#/)) {
>>>                         $declaration .= "\t" x $level;
>>>
>>>
>>
>> but that didn't work for me.
>> I don't have time to look into it any more today.  :)
> 
> I retested this patch. I must have really messed up my testing
> in the first round. This now LGTM. Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Vegard, do you plan to submit this as a kernel-doc patch?

Thanks.

-- 
#Randy
