Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79953FF97
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BAD10E62C;
	Tue,  7 Jun 2022 12:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979110E62C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654606790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLkIExdSAfZXhKlnnfUm2v8chK83vx8JP1WYxXIWoTk=;
 b=NLmivx0qhhsWxleJ4DTvBvhIJxA+m3uW9htbHA0ua/4GWVv8ZodUmx3/aSa4S3PNY0E5xF
 djFP15KrDV4iCFXx+2z1IYU/MrMPQZY8eIrQbOS4g4piAHf7eTUP8W3IU1Xg0BcX20JTil
 WTqHhv8WUkicz5AGgmKog9DQ8Afwt70=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-tSO0tHdjONeA97LUl474Uw-1; Tue, 07 Jun 2022 08:59:47 -0400
X-MC-Unique: tSO0tHdjONeA97LUl474Uw-1
Received: by mail-wr1-f69.google.com with SMTP id
 bw25-20020a0560001f9900b002175d64fd29so1987457wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 05:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lLkIExdSAfZXhKlnnfUm2v8chK83vx8JP1WYxXIWoTk=;
 b=vgb+wcamUTrjmlSc+hJyHb9utUjWyGdxrubEZYDluhnwvGk4QrPJseEXVVD7P1obZX
 QYGJ7axOHQNgMuFINvQiMLSRcBZSAYt3tvNMMn1uogY5u7idNStfu+z3IU2tSTV2Z6X/
 iGU4EtgwQAqvUU6jTocnGGUiG5XCtvNxO6u9CY4CasLt1QaGBoKlNPEetaFvLjXs/i1V
 tWKwPI1vnm2Y9AiBBVUCQcrZyoXFkXEvJ8Op3/Neg5C7QxgyFUVpHoJ8yhzKK+Zsq+m6
 +T2TWZ6QcB6YlPz6Z0jB7RbO82K1B3A7YGUWV47XSXtN/+mYZU7d3BenvPY2XwP78jki
 jNpg==
X-Gm-Message-State: AOAM531a1VDJJD+kK/W+way4hfZWuJY4dX/VKoRaLYGdZ2VDdVK4I+9n
 E4nW9VPC1I2RAwnG1JSS1JDJpmbWYUSpkL+pgrM7hw2Aepry4KTtgPgWwa5lFv4qttCwi7jkFpa
 rSLT+tFaN63OiY7zBtqJd7NiwvfTG
X-Received: by 2002:a05:600c:154d:b0:394:880f:ae3a with SMTP id
 f13-20020a05600c154d00b00394880fae3amr57162978wmg.13.1654606786069; 
 Tue, 07 Jun 2022 05:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqobIROp0frQyRbHeDBQX0/wyK9D7b9XqZKUc3BVsApHVxTT80upGqI6zMshvJq/DgrW/pbQ==
X-Received: by 2002:a05:600c:154d:b0:394:880f:ae3a with SMTP id
 f13-20020a05600c154d00b00394880fae3amr57162952wmg.13.1654606785803; 
 Tue, 07 Jun 2022 05:59:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f?
 (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de.
 [2003:cb:c709:500:4c8d:4886:f874:7b6f])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a05600c1e8500b003942a244ee6sm20657928wmb.43.2022.06.07.05.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 05:59:44 -0700 (PDT)
Message-ID: <16c92358-0daf-94d0-0f73-92faef827d51@redhat.com>
Date: Tue, 7 Jun 2022 14:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] mm/slab: delete cache_alloc_debugcheck_before()
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
 <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.06.22 17:25, Daniel Vetter wrote:
> It only does a might_sleep_if(GFP_RECLAIM) check, which is already
> covered by the might_alloc() in slab_pre_alloc_hook(). And all callers
> of cache_alloc_debugcheck_before() call that beforehand already.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: linux-mm@kvack.org
> ---

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

