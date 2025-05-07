Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE77AAE0AD
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2210E19C;
	Wed,  7 May 2025 13:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Adca54Tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C70F10E19C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746624348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mQ87kutm7N8Rv0SzH5/nm6rEAqlaYfaTkXSKo8noDAM=;
 b=Adca54TtIplgeCbnZKyzYjdltWA/k/XI//U7jFlL87Yfi+3E38u+iB3iPeD/joS+jf1I/O
 LTtOKakubcG3S8xHqSi6W4XuHDBStrSJjDSTWLinrQNms8Zoh++SepQn+G0Hs98/+aEFGs
 LmUstn8EZTnEOaUip6xwkR2YPYXhcHk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-1Z6Ql5-oOhOA3THZcBSVkw-1; Wed, 07 May 2025 09:25:47 -0400
X-MC-Unique: 1Z6Ql5-oOhOA3THZcBSVkw-1
X-Mimecast-MFC-AGG-ID: 1Z6Ql5-oOhOA3THZcBSVkw_1746624346
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442cd1c84cdso531665e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746624346; x=1747229146;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mQ87kutm7N8Rv0SzH5/nm6rEAqlaYfaTkXSKo8noDAM=;
 b=Ye87T/fjc2OhvzVk9Wc8fqT3kk+JO9BlwMhrEENppPZXFleBEwJ9tPXVfGYwerEEFM
 FFr+SPKKVIoYYbSUjvYIxZOjBpjqxzxD4g7/aTj4C7RZgbtBN7+mosdnyJHvjIf0yJQN
 uOHamZRAP6REikBmps22OZQIjARatqF8IPyIwdV/BDFbjcuM/MmOsZYE1l+/qAirfX0/
 veBuANS31JetpPFVpzRe1VaFADnChdV7asMy2wjbJMpO5s0+zfDqtbPL07oVuA26yZgz
 Mf4cJRz5e1+980gAXdvgbxYHU79MPX1rbQKtxqd0LnNJmUy9lMSHD18O56VPpKQArZcz
 ZndA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCfE3rynm6RxRkf4Bs7nfZ9A7HqmahVobxuwi2FPA/Xj1/j1fODDsKxBC2UeClUzbq5EIQj9Uh7b8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5hgvy+tncnmU6snnClxFLnwJBm/JuA+9gxtrTumnmN360qgl5
 9aBk8bEfWEdnYvI6aeQfUdyDl4pvw8WFmjUm1NiXzyZ0IaGfVgsE+TR7kFlv9u49oi4vnFtwz2S
 5LX7MRHp0DhnoOgwLVWzJALRJNud/EDKb4U29654dOOfim0ocUeJsNu0wXJU6qPnjHQ==
X-Gm-Gg: ASbGnctqRYagP/KtVGqLJKewsw+RQZAFgbP+mLL/qRpfCwPY4ezNLW4s8e/1LKW23hq
 xmL8XyUgo7LPmXXOPKZbFZq21UfnEFT0bk73PGXmkJS0elNNzeTb654ZDcOZtvjKbMc4y5QB63D
 pYWiUR59RPwk7xFSykD9O1GJxtJ4fz74DpqTryAUeGsMWEYvAoj7Kc6oNBia/odzQDt9IQaXJfB
 A6FroWKwaIACLcisKTyq3+LR3+i8aeBu0eotWGOEFwSiB2B5z/BIS6Asci1iQISr5BUyUD8rDJX
 rN35Ig6R0weTt95mvDpB4JX45Dcgc7Ms6eMZUh7eZwxq/MD0iXMDgls/lV9DvDGMOo4CI2p/9lj
 paj/0ioioqvqjiEQ9of+TtJq+kIH4BkmlfRdOsg==
X-Received: by 2002:a05:600c:1d08:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-441d44c792emr31664465e9.15.1746624345738; 
 Wed, 07 May 2025 06:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+1Ky9C4coQ85osYWKKGHU+pocikhT4lHpCGTYLpjKz/iPr8oxTy+OB9C07fn9xoNI8fOezQ==
X-Received: by 2002:a05:600c:1d08:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-441d44c792emr31664025e9.15.1746624345291; 
 Wed, 07 May 2025 06:25:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628?
 (p200300d82f12d400ed3cfb0c1ec0c628.dip0.t-ipconnect.de.
 [2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd350d96sm941285e9.18.2025.05.07.06.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 06:25:44 -0700 (PDT)
Message-ID: <6fa60c1d-ccbe-4bf4-a572-39711ac379ee@redhat.com>
Date: Wed, 7 May 2025 15:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <b92e3a0d-b878-43cf-9b68-9f7c228e45fa@lucifer.local>
 <7035fb14-c9f6-4281-9f65-b220aaa8f5c3@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7035fb14-c9f6-4281-9f65-b220aaa8f5c3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 97updI-T0DnbyZGvJpiDDH2yiIKdIDL7Sj5etqH0lBc_1746624346
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

>>
>> Obviously my series will break this but should be _fairly_ trivial to
>> update.
>>
>> You will however have to make sure to update tools/testing/vma/* to handle
>> the new functions in userland testing (they need to be stubbed otu).

Hmm, seems to compile. I guess, because we won't have
"__HAVE_PFNMAP_TRACKING" defined in the test environment, so
the existing stubs in there already seem to do the trick.


+#else
+static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
+              struct vm_area_struct *new)
+{
+      return 0;
  }
+static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
+{
+}
+#endif


-- 
Cheers,

David / dhildenb

