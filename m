Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39475822766
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 04:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA610E1B7;
	Wed,  3 Jan 2024 03:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7642F10E161;
 Wed,  3 Jan 2024 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=+wqhVrLRvZUgx/4O+BPqigJfeuY9KmuscSyp/l86YBk=; b=SDj6v7c05qdR+rdoLIzSylvMHD
 dSZVgKLaxVFQ5SV0gUZKJqwnX0RkffIzAI8qEmn4KEGbkXOVnEtS/3ZQuIoXFaEjNH7CHbo7Ay+Gt
 /6L0RG2vp8UTX73uqWvyUuyEP+5xqo3cz6/15WtMND5mBdQPU8cxV1u/d6wIsqvrxDkSpBM5MH3JD
 Zc/xa7ErX3wAdob8wjtHhn1MZAORk7hftuduzs3x2mU35yqyUKogP4cFc5q0NQ1yWsav2Eiqpt2Dh
 nPZ3zvDu2iyeQ5v7Yzp7/Ev8RvPrCD2g5T6ehi09YDkJCQh9dWth9sgHZ5L/xWd0zjf+xIg7V/MlL
 LNFqBs2w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rKrdt-009eXx-0t; Wed, 03 Jan 2024 03:10:05 +0000
Message-ID: <70b16de0-b213-464f-a318-d9b96b76b967@infradead.org>
Date: Tue, 2 Jan 2024 19:10:04 -0800
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
In-Reply-To: <df7d110b-a50c-4293-b5d4-45913fa6909e@infradead.org>
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

Hi Vegard,

On 12/25/23 09:08, Randy Dunlap wrote:
> 
> 
> On 12/25/23 00:30, Vegard Nossum wrote:
>>
>> On 25/12/2023 08:40, Randy Dunlap wrote:
>>> I do see one thing that I don't like in the generated html output.
>>> It's not a problem with this patch.
>>> The #defines for DRM_NOUVEAU_VM_BIND_OP_MAP etc. have a ';' at the
>>> end of each line:
>>>
>>> struct drm_nouveau_vm_bind_op {
>>>      __u32 op;
>>> #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0;
>>> #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1;
>>>      __u32 flags;
>>> #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8);
>>>      __u32 handle;
>>>      __u32 pad;
>>>      __u64 addr;
>>>      __u64 bo_offset;
>>>      __u64 range;
>>> };
>>
>> Do we actually ever want preprocessor directives to appear inside
>> definitions in the output? If not, I think this should work:
> 
> Not necessarily.
> 
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index 3cdc7dba37e3..61425fc9645e 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -1259,6 +1259,8 @@ sub dump_struct($$) {
>>                 $clause =~ s/\s+$//;
>>                 $clause =~ s/\s+/ /;
>>                 next if (!$clause);
>> +               # skip preprocessor directives
>> +               next if $clause =~ m/^#/;
>>                 $level-- if ($clause =~ m/(\})/ && $level > 1);
>>                 if (!($clause =~ m/^\s*#/)) {
>>                         $declaration .= "\t" x $level;
>>
>>
> 
> but that didn't work for me.
> I don't have time to look into it any more today.  :)

I retested this patch. I must have really messed up my testing
in the first round. This now LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
#Randy
