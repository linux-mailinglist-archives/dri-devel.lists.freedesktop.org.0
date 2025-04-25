Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E4A9D31A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 22:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF3310E9CF;
	Fri, 25 Apr 2025 20:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="McbFkg1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E8410E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745613421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CpUFuT49QYK3fR0dsNMkxP3fgvhL7PUWCGb2oz6iPXc=;
 b=McbFkg1DRY6wCeKKRGwRMB2hO6suJp4d9GCXku60AEXKSAJkBnT7NKlA6YIuASvM8RXuvw
 glG4avrTBd8siVCrS7TfK+Mn4ZQz/HHVa2RbTinnv14jUWbJ1hsOBTQKVJkLdRYsBj/XZR
 LS6a9mhFNh9PUiLx1H1uLlaCyns2yhA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-JIbEFVSJNouYNsxn5n6fHA-1; Fri, 25 Apr 2025 16:36:59 -0400
X-MC-Unique: JIbEFVSJNouYNsxn5n6fHA-1
X-Mimecast-MFC-AGG-ID: JIbEFVSJNouYNsxn5n6fHA_1745613418
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso12946085e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 13:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745613418; x=1746218218;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CpUFuT49QYK3fR0dsNMkxP3fgvhL7PUWCGb2oz6iPXc=;
 b=daFEZ0usp+gW2ZJ/Sh32ZZgLYrLtDjhfYMy00BwMU7G1A/iFQRrkWIWrrsynk5cBtX
 bg/RADKhXHDJrEgg3AWGBGMKVzs2/8RYqQYYpFL2fktFOb1z0QiH3UbuWvm2WA2h1EVA
 dlaTp033D30MwqKvbzJRu2yE7JKtYYo1GFDCKrA/n1lWhDbVxhMpXMG1DAysGmi96zif
 1yrEpxYmiDmBlyswsKVEwvoB10DI9lgnHs8m3txbl1MUTkG4s6aEE89CoK6rkejVjC0B
 9Vn5CoJNHqx/So8RtFdMa+83T7CaUw2rOzsT65wKo702dZUNoJGVaECefpeI1Ng9Siws
 nzxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQp6J7U8E6rQxeVfQ3Mv+OkAdG8HIZdqU6ObfmSK5f5oyfCGlluSI9MNSs4GEYrJnRHiDZ+zcQKMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRfZBDKUa6EY4ZYg7JbNinzVZ6C88ElV7mBh4zLCCnbZXedh5e
 E41YEebxFz/YBh0XrSAsFnd+w7BqqUAm2vUf1tiLKYcKo5pP8/5ihkGRG4f0H1YgptqGr9wtQav
 AEfGMcKqV54f5gG+tG+f7rB0HFf/qWBun7BqYsCvbgoslPMREP9Un0ooUxd3Zh/SOaw==
X-Gm-Gg: ASbGncu15seNzmx96fmUDYv3DumR5dNFwTnVw/bmJa6sFO3RQHm7fmMAyY+P/Kr02iR
 q3CQEv4fjIyPiw3/aoLpD41vg9e8TNSTOe/X2Qmp9wxIJR1Jxy+hVBzpokYQmUXFehOPu1LVm2e
 wEAmN3NWdcr3Jcu4K0w1kVHYjxdCIheMsIdwIxkBdbS0rsaoJCnTkzyut9apoSc92WImhRDK0yZ
 irTnKaQIiux1rpRnqxLWcoLquEJ7EAYakxaze3AuNUR3NdXXpPBNVbD8teAcq+YqZhxRXbykkaa
 hn0Fzwx+S64WpZwVLAgBEnp6NQVbqOos/aPsJsx/FtvBkAAwSFOedo2BLgi34smDx05mA7p4dNO
 fYOubmnd2hA7/LgGWH49GI4wzYK+8P/SfgiTL
X-Received: by 2002:a05:600c:c88:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-440a6693e9fmr30390435e9.12.1745613418376; 
 Fri, 25 Apr 2025 13:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdS9ZymIYN4ZA6xIbkv21zMROrnjORxXDTOvJmAPXiktbH2fpnT6UD8wE/LlrXVF31B+MV2w==
X-Received: by 2002:a05:600c:c88:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-440a6693e9fmr30390315e9.12.1745613417913; 
 Fri, 25 Apr 2025 13:36:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a?
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ac5a9sm68318335e9.23.2025.04.25.13.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 13:36:57 -0700 (PDT)
Message-ID: <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
Date: Fri, 25 Apr 2025 22:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com> <aAvvQ1h9bg11hiqI@x1.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAvvQ1h9bg11hiqI@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XXFxyYCYmzt3DckYZncZfqef-fZc0EEzDPXTYaSkRSc_1745613418
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.04.25 22:23, Peter Xu wrote:
> On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
>> Let's use our new interface. In remap_pfn_range(), we'll now decide
>> whether we have to track (full VMA covered) or only sanitize the pgprot
>> (partial VMA covered).
>>
>> Remember what we have to untrack by linking it from the VMA. When
>> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
>> to anon VMA names, and use a kref to share the tracking.
>>
>> Once the last VMA un-refs our tracking data, we'll do the untracking,
>> which simplifies things a lot and should sort our various issues we saw
>> recently, for example, when partially unmapping/zapping a tracked VMA.
>>
>> This change implies that we'll keep tracking the original PFN range even
>> after splitting + partially unmapping it: not too bad, because it was
>> not working reliably before. The only thing that kind-of worked before
>> was shrinking such a mapping using mremap(): we managed to adjust the
>> reservation in a hacky way, now we won't adjust the reservation but
>> leave it around until all involved VMAs are gone.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/mm_inline.h |  2 +
>>   include/linux/mm_types.h  | 11 ++++++
>>   kernel/fork.c             | 54 ++++++++++++++++++++++++--
>>   mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
>>   mm/mremap.c               |  4 --
>>   5 files changed, 128 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>> index f9157a0c42a5c..89b518ff097e6 100644
>> --- a/include/linux/mm_inline.h
>> +++ b/include/linux/mm_inline.h
>> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>>   
>>   #endif  /* CONFIG_ANON_VMA_NAME */
>>   
>> +void pfnmap_track_ctx_release(struct kref *ref);
>> +
>>   static inline void init_tlb_flush_pending(struct mm_struct *mm)
>>   {
>>   	atomic_set(&mm->tlb_flush_pending, 0);
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 56d07edd01f91..91124761cfda8 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -764,6 +764,14 @@ struct vma_numab_state {
>>   	int prev_scan_seq;
>>   };
>>   
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +struct pfnmap_track_ctx {
>> +	struct kref kref;
>> +	unsigned long pfn;
>> +	unsigned long size;
>> +};
>> +#endif
>> +
>>   /*
>>    * This struct describes a virtual memory area. There is one of these
>>    * per VM-area/task. A VM area is any part of the process virtual memory
>> @@ -877,6 +885,9 @@ struct vm_area_struct {
>>   	struct anon_vma_name *anon_name;
>>   #endif
>>   	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
>> +#endif
> 
> So this was originally the small concern (or is it small?) that this will
> grow every vma on x86, am I right?

Yeah, and last time I looked into this, it would have grown it such that it would
require a bigger slab. Right now:

Before this change:

struct vm_area_struct {
	union {
		struct {
			long unsigned int vm_start;      /*     0     8 */
			long unsigned int vm_end;        /*     8     8 */
		};                                       /*     0    16 */
		freeptr_t          vm_freeptr;           /*     0     8 */
	};                                               /*     0    16 */
	struct mm_struct *         vm_mm;                /*    16     8 */
	pgprot_t                   vm_page_prot;         /*    24     8 */
	union {
		const vm_flags_t   vm_flags;             /*    32     8 */
		vm_flags_t         __vm_flags;           /*    32     8 */
	};                                               /*    32     8 */
	unsigned int               vm_lock_seq;          /*    40     4 */

	/* XXX 4 bytes hole, try to pack */

	struct list_head           anon_vma_chain;       /*    48    16 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	struct anon_vma *          anon_vma;             /*    64     8 */
	const struct vm_operations_struct  * vm_ops;     /*    72     8 */
	long unsigned int          vm_pgoff;             /*    80     8 */
	struct file *              vm_file;              /*    88     8 */
	void *                     vm_private_data;      /*    96     8 */
	atomic_long_t              swap_readahead_info;  /*   104     8 */
	struct mempolicy *         vm_policy;            /*   112     8 */
	struct vma_numab_state *   numab_state;          /*   120     8 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	refcount_t                 vm_refcnt __attribute__((__aligned__(64))); /*   128     4 */

	/* XXX 4 bytes hole, try to pack */

	struct {
		struct rb_node     rb __attribute__((__aligned__(8))); /*   136    24 */
		long unsigned int  rb_subtree_last;      /*   160     8 */
	} __attribute__((__aligned__(8))) shared __attribute__((__aligned__(8)));        /*   136    32 */
	struct anon_vma_name *     anon_name;            /*   168     8 */
	struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */

	/* size: 192, cachelines: 3, members: 18 */
	/* sum members: 168, holes: 2, sum holes: 8 */
	/* padding: 16 */
	/* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
} __attribute__((__aligned__(64)));

After this change:

struct vm_area_struct {
	union {
		struct {
			long unsigned int vm_start;      /*     0     8 */
			long unsigned int vm_end;        /*     8     8 */
		};                                       /*     0    16 */
		freeptr_t          vm_freeptr;           /*     0     8 */
	};                                               /*     0    16 */
	struct mm_struct *         vm_mm;                /*    16     8 */
	pgprot_t                   vm_page_prot;         /*    24     8 */
	union {
		const vm_flags_t   vm_flags;             /*    32     8 */
		vm_flags_t         __vm_flags;           /*    32     8 */
	};                                               /*    32     8 */
	unsigned int               vm_lock_seq;          /*    40     4 */

	/* XXX 4 bytes hole, try to pack */

	struct list_head           anon_vma_chain;       /*    48    16 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	struct anon_vma *          anon_vma;             /*    64     8 */
	const struct vm_operations_struct  * vm_ops;     /*    72     8 */
	long unsigned int          vm_pgoff;             /*    80     8 */
	struct file *              vm_file;              /*    88     8 */
	void *                     vm_private_data;      /*    96     8 */
	atomic_long_t              swap_readahead_info;  /*   104     8 */
	struct mempolicy *         vm_policy;            /*   112     8 */
	struct vma_numab_state *   numab_state;          /*   120     8 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	refcount_t                 vm_refcnt __attribute__((__aligned__(64))); /*   128     4 */

	/* XXX 4 bytes hole, try to pack */

	struct {
		struct rb_node     rb __attribute__((__aligned__(8))); /*   136    24 */
		long unsigned int  rb_subtree_last;      /*   160     8 */
	} __attribute__((__aligned__(8))) shared __attribute__((__aligned__(8)));        /*   136    32 */
	struct anon_vma_name *     anon_name;            /*   168     8 */
	struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
	struct pfnmap_track_ctx *  pfnmap_track_ctx;     /*   176     8 */

	/* size: 192, cachelines: 3, members: 19 */
	/* sum members: 176, holes: 2, sum holes: 8 */
	/* padding: 8 */
	/* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
} __attribute__((__aligned__(64)));

Observe that we allocate 192 bytes with or without pfnmap_track_ctx. (IIRC,
slab sizes are ... 128, 192, 256, 512, ...)

> 
> After all pfnmap vmas are the minority, I was thinking whether we could
> work it out without extending vma struct.

Heh, similar to userfaultfd on most systems, or ones with a mempolicy, or
anon vma names, ... :)

But yeah, pfnmap is certainly a minority as well.

> 
> I had a quick thought quite a while ago, but never tried out (it was almost
> off-track since vfio switched away from remap_pfn_range..), which is to
> have x86 maintain its own mapping of vma <-> pfn tracking using a global
> stucture.  After all, the memtype code did it already with the
> memtype_rbroot, so I was thinking if vma info can be memorized as well, so
> as to get rid of get_pat_info() too.
> 
> Maybe it also needs the 2nd layer like what you did with the track ctx, but
> the tree maintains the mapping instead of adding the ctx pointer into vma.
> 
> Maybe it could work with squashing the two layers (or say, extending
> memtype rbtree), but maybe not..
> 
> It could make it slightly slower than vma->pfnmap_track_ctx ref when
> looking up pfn when holding a vma ref, but I assume it's ok considering
> that track/untrack should be slow path for pfnmaps, and pfnmaps shouldn't
> be a huge lot.
> 
> I didn't think further, but if that'll work it'll definitely avoids the
> additional fields on x86 vmas.  I'm curious whether you explored that
> direction, or maybe it's a known decision that the 8 bytes isn't a concern.

When discussing this approach with Lorenzo, I raised that we could simply
map using an xarray the VMA to that structure.

But then, if we're not effectively allocating any more space, then probably
not worth adding more complexity right now.

-- 
Cheers,

David / dhildenb

