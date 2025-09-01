Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D848B3E2A7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928610E433;
	Mon,  1 Sep 2025 12:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f+s5Pljh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715510E433
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756729519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry3HTsvjDYn6ZhWkEuXZ7HIdFuNl7/b7zLeVSRNzby4=;
 b=f+s5PljhWQ2mvi86o2wC+whlY9Z9dih0SpRtWq/tg4YwLw/FHCXG6klictWrp/yYMsOaKA
 TsgCSbTW/Z58oaRD0P8A3BaH04CMN8g1eyiB2qBNspyKMwzb3Fp0ggK2qQBdgpbPQEazdV
 MTnZP2rstkZ89npOSTN2BUsVe9vzKCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-kIRvTld-M5WnlF_3d00RCg-1; Mon, 01 Sep 2025 08:25:18 -0400
X-MC-Unique: kIRvTld-M5WnlF_3d00RCg-1
X-Mimecast-MFC-AGG-ID: kIRvTld-M5WnlF_3d00RCg_1756729517
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b8f4c2f7fso4663615e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729517; x=1757334317;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ry3HTsvjDYn6ZhWkEuXZ7HIdFuNl7/b7zLeVSRNzby4=;
 b=YJ8uqCS1sG4qTtl+rXJ05SJFLnf2WvuGTUHepSvlhBVq4AOrW6x5gLAUTx4XkhoCnc
 a+nNY9+i9H9bUTjtywn7KiTWGimEXQvV32ZRJyDKZDYjRqpY1S/hrN8LZVRR3ON6f8mF
 QLnW8L6mscIZPC5+A97g+m7yNtno4oaPX9S0fhPHBzRC4zgttEGecfRpiBcGtrXJgI8X
 f21YZF6Qq8lcMsDt+2HaD8nMm+b+1/2/X+N5fQ/vMLxcR1g5L2WnoJD5IaH9WiBexZyn
 tTWVM3Vu2Rfat1rOtWCGTRK9D3kklux4iNB8IwC44soJLPs2ZXPMkP55AUkVZbZjN0G6
 GswQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNNum1w9yvyge9UO+7EvV7SK8jFlidmHtJcsnFPcDXjoH550o4lidPrLtBP3yYZcbeAbVCu/DfZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp2y+p/rJU/um27gZX0ucAQm2X5L4hC5nZ1eNi4f5QDOB0P4IV
 QLWWULtqYxUZEzYsdzz1aU9fMhG59VXz0UQDWEK+f6GeXw4VPJXflWws760HoGssSHlG35Z0NU6
 nFVIa9Vc0x/Qj2aq2Zm+E+4wcJfgCjuce5L63555r99vhj2lUYBfhcvkjuXdS8h3HvXA8QQ==
X-Gm-Gg: ASbGnct6Yb+f9g2TBbGyiogHaIb2aAjI4NGDWR3QUbkHXbl7Ln2iZ4INF3K3703Hql7
 AtueNoT6fHgYSeFZtGYHKLP8oYRVyR0dPVNhf683qxCYAHP6DyllIQlwtfjFEJm5oKFvzOlKPm0
 DaKS05UmqE5mGC/cN7ioWfXMz46PgyjlzrLjm1mm1/cgvms5MXDqn7UekhNyUVvT2YX51RJBEQO
 X3d1PtHZaFb7GCj0O2/b0rcITX22IGK007V4MubD0YwB0jh9lid2vvwUxVzgWSmdL5BdK5oYQMX
 evi3s/Rh5GPUKE9WZCBEBp/EVnyrQsE/BtldW5UbQTTPrkLef/WiIqq36z6gH7nspuIBG9GzK5H
 DGK+xlXesyUAClSvYx5MQlqrdIT6+ZaZrHS+RZRtyshBSRN7996VT36WNfgQiS4oeccM=
X-Received: by 2002:a05:600c:1e89:b0:45b:88ed:9558 with SMTP id
 5b1f17b1804b1-45b88ed9bc3mr51982175e9.30.1756729517127; 
 Mon, 01 Sep 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMGDtOgsZk0c5UDFaUJZJgP3BXCuLTMzz4/00ieMVST2ui2ccALyIM8NlgAkQyyG7Klnzysg==
X-Received: by 2002:a05:600c:1e89:b0:45b:88ed:9558 with SMTP id
 5b1f17b1804b1-45b88ed9bc3mr51981875e9.30.1756729516581; 
 Mon, 01 Sep 2025 05:25:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4?
 (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de.
 [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6dc1sm237238175e9.1.2025.09.01.05.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:25:15 -0700 (PDT)
Message-ID: <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
Date: Mon, 1 Sep 2025 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
To: Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?=27Thomas_Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?=27Michal_Koutn=C3=BD=27?=
 <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250819114932.597600-5-dev@lankhorst.se>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RW2QMi4kPJmFSx73DrGFPGgYz5TK6qapYiTvmjScySo_1756729517
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

On 19.08.25 13:49, Maarten Lankhorst wrote:
> When exporting dma-bufs to other devices, even when it is allowed to use
> move_notify in some drivers, performance will degrade severely when
> eviction happens.
> 
> A perticular example where this can happen is in a multi-card setup,
> where PCI-E peer-to-peer is used to prevent using access to system memory.
> 
> If the buffer is evicted to system memory, not only the evicting GPU wher
> the buffer resided is affected, but it will also stall the GPU that is
> waiting on the buffer.
> 
> It also makes sense for long running jobs not to be preempted by having
> its buffers evicted, so it will make sense to have the ability to pin
> from system memory too.
> 
> This is dependant on patches by Dave Airlie, so it's not part of this
> series yet. But I'm planning on extending pinning to the memory cgroup
> controller in the future to handle this case.
> 
> Implementation details:
> 
> For each cgroup up until the root cgroup, the 'min' limit is checked
> against currently effectively pinned value. If the value will go above
> 'min', the pinning attempt is rejected.
> 
> Pinned memory is handled slightly different and affects calculating
> effective min/low values. Pinned memory is subtracted from both,
> and needs to be added afterwards when calculating.

The term "pinning" is overloaded, and frequently we refer to 
pin_user_pages() and friends.

So I'm wondering if there is an alternative term to describe what you 
want to achieve.

Is it something like "unevictable" ?

-- 
Cheers

David / dhildenb

