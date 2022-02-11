Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56984B2AE5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7730210E25C;
	Fri, 11 Feb 2022 16:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8010E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644598154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PP4TELWylzhqvbTRyqntJ6du2uBGE5WicD7gyfPqb1s=;
 b=in9NxXfX8RVNZPiPHuo7lCX+pmokppTJFh2uUEca9iJY9q9CFFDQs8HyJdSEc+yPRj34gZ
 cEFoPNexqzt8oAgOIMezv5k0V14x4rHvLvM1XP/vNSdx3HdJYJHJhWbrb7z0oAger22a7y
 8feS0Hm7K0WR6w5ST/l9K93Y03B1Lyc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-3xIjzgOqOYa_W7-gtbxO_w-1; Fri, 11 Feb 2022 11:49:11 -0500
X-MC-Unique: 3xIjzgOqOYa_W7-gtbxO_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so6154198wmb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PP4TELWylzhqvbTRyqntJ6du2uBGE5WicD7gyfPqb1s=;
 b=O9FgnzEf/aNVH482b/nJaGtqlEA8TGy750ziwT5p3KGprsO/KP3Z1W0t+CMtVDMX8u
 ay3V1jD2t0og0m+CAYnG5SWIK0UsgBhqpCoIy15GH75lq7xj7DsBzreymnRozuoNfg+J
 IQz8kchIWuWqy0wrOCvdF1v/xlo9+PhsNWY1oJVysYVJU6EnG8CGy19e1f+qPDWlC8Uw
 uWUjNSJyEaR7egneHqs6dtXZm8/EFZAiDAljyjzWjeTwJp8oWhKp72B3V0AMnaFMMZT7
 3rtlLG0R9KiXK+PF/qp/lNdkQZU94hcLGLEJGuVWgRzB+jDcz+sE8gZuTf0jRyukKxub
 xlZw==
X-Gm-Message-State: AOAM531wmi1K3TzswXsWdbvrUknAImNI1kk63j2X5eA98znLy+YndSIi
 2PZAIpXqlhkiTH9iyw4KHk0y2eDktcSVs/3evZiUJhCCBZ3lPoGqn+y/nVUAqeUEDb4sDGql1RW
 fJk3NeruR9Fb6nd3yn24vVDeuhLvX
X-Received: by 2002:adf:e94c:: with SMTP id m12mr1981421wrn.383.1644598150266; 
 Fri, 11 Feb 2022 08:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7WIrAF58deu+37aUiWlRp/W5UJhe80Crx1E3d+PpeeyE61InCn2g0DPuWCXNpzEMPcQYA7w==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr1981411wrn.383.1644598150072; 
 Fri, 11 Feb 2022 08:49:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f?
 (p200300cbc70caa004cc6d24a90ae8c1f.dip0.t-ipconnect.de.
 [2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f])
 by smtp.gmail.com with ESMTPSA id f1sm3214049wmb.20.2022.02.11.08.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:49:09 -0800 (PST)
Message-ID: <6a8df47e-96d0-ffaf-247a-acc504e2532b@redhat.com>
Date: Fri, 11 Feb 2022 17:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <20220211164537.GO4160@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220211164537.GO4160@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.02.22 17:45, Jason Gunthorpe wrote:
> On Fri, Feb 11, 2022 at 05:15:25PM +0100, David Hildenbrand wrote:
> 
>> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages
> 
> Currently the only way to get a DEVICE_PRIVATE page out of the page
> tables is via hmm_range_fault() and that doesn't manipulate any ref
> counts.

Thanks for clarifying Jason! ... and AFAIU, device exclusive entries are
essentially just pointers at ordinary PageAnon() pages. So with DEVICE
COHERENT we'll have the first PageAnon() ZONE_DEVICE pages mapped as
present in the page tables where GUP could FOLL_PIN them.


-- 
Thanks,

David / dhildenb

