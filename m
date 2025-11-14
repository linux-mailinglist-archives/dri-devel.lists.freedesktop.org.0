Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67150C5B168
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441A010E98E;
	Fri, 14 Nov 2025 03:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WX9k1MqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717F310E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:21:08 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b736cd741c1so27293866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763090467; x=1763695267; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5wmX3vv4vFKi28xDhKnQlE+jF8joyjiRYUba0nN3LQ=;
 b=WX9k1MqI+rz+wxIi/5nCOkQuGGrN33Q4xYrh2z3CEPwYxq1IqdjNli9M+MdyTgeRaX
 alVLHB3Kun7WnZx/VVSXn5y3rXW9tg4tguhe+Q6H8HLE5J7lBLAr4250RaJDdnoTNmIg
 YTW6CarxlCw7Ftywnhv2Qk8sjkg5F2zWokw0fdosyQ0rfPiTU3HGppP5gBcOJ3+bDl3r
 r05S4QYTw/EWgwM3BEdo0Dq9kRdTepIkbizeGdHF6Y4jVbnFa6VUwMFkKdoXbFy3YPu1
 RfEtD3j62+4CuAg7XnXxPANPc9hNMZrBy5DZaZbZeTNObHivSmXQ3UkAtkjWLApJD3w/
 qEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763090467; x=1763695267;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/5wmX3vv4vFKi28xDhKnQlE+jF8joyjiRYUba0nN3LQ=;
 b=Iy9J1zU0S3V1Vf97+ij/oNvkYs13jXYmukF5OpiKOWAXPadKhJFj0tJQ0gZDORwfMP
 JS6RY1rBYn96GK/kMnjult48F0Llo23RTWQ91abaLx+juOR40Bse8GlV/omyiHzYuHhl
 7lRIAnnxscrU0CxYGn3JYOJwZvsHJZYNvabdrXUBuay3kc2iXMMKIZ5loq4NS9yDC+hB
 yrzlIeDDboIpgKYFYDWDo5i6ItV0vEROTkDXkdN0R/mykO+0YDbJZRlrMTzBqCCEPN0K
 iW738wH2MErY95C9lK/DTV3BjEWuxrGJhQrGsUN+9aVKaR3EpqjghB4/6cHxzV+dBvoQ
 zjXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2qp2rOJwcwes6ukF3rSUn7rFNyjomw1/iZs7DvcRfcqfowzt5r0/d0QH6M4mTMDjZ31qVvcjELEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIqOVoe3aR5r38Zb6VIM2uOA9tCNoWLac1duKyFPnUmVYq5vhq
 /X2PyPfohKV85vG72zrbEU2tq5IR3+Y9Np6fWj9GZhx407mgXnRJXFAW
X-Gm-Gg: ASbGncucSWiU0GtMCbGdiHk095QTL7cU9G+VmlLQraR0JrEHIU2kwU1fQNTRsSucPld
 ScIV5U1c8MhpUc/OiVLPPcUcCLDGPjJpmAIRt6axalNJVqBnc4+EBzfY82Vjco8DLMh81OjilQ7
 zTnHb47etDyw/L5TKg6X+Y19VWylTAHWbDX4QKBnLXydxy9G8qrdgOI3wE6HTtawCP02XUITJou
 NGWhH/T5zBigvbnpfOgixSj8HzCpeS6cmZjOUsPQmaSxr7ZCE8cJPsaMbkZfmmyV3ZP6wnlUkbr
 wqOXJywxBFgyzbF93xCT/Hlxv/KgLZ7wCtGX/YI8QeB6Q9FG69V3AAW1YYpjgENVvLrJVyK0xtJ
 BMOEQaUc1DHXbYNH9WjG8jV77rw9W4bBzpColGLFDz57qWYynu80holPey7yD7zlbuOX5FszgD4
 PjO7VEe7qxI0pOb0KhJsJplzlz
X-Google-Smtp-Source: AGHT+IHbuUMBYx1gZ2NiTOoA/bD4B8HTfyo2gIrHxPc512K6tga1/jOkeezR+gJcq0oCl0G+5ceVCg==
X-Received: by 2002:a17:906:f59c:b0:b71:df18:9fba with SMTP id
 a640c23a62f3a-b736780caa9mr157876466b.15.1763090466739; 
 Thu, 13 Nov 2025 19:21:06 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdae69fsm289095866b.51.2025.11.13.19.21.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Nov 2025 19:21:06 -0800 (PST)
Date: Fri, 14 Nov 2025 03:21:05 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <20251114032105.sdkjaoiwpdmpynew@master>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114012228.2634882-1-balbirs@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 14, 2025 at 12:22:28PM +1100, Balbir Singh wrote:
[...]
>@@ -4079,6 +4091,36 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 	return ret;
> }
> 
>+/*
>+ * This function is a helper for splitting folios that have already been unmapped.
>+ * The use case is that the device or the CPU can refuse to migrate THP pages in
>+ * the middle of migration, due to allocation issues on either side
>+ *
>+ * The high level code is copied from __folio_split, since the pages are anonymous
>+ * and are already isolated from the LRU, the code has been simplified to not
>+ * burden __folio_split with unmapped sprinkled into the code.
>+ *
>+ * None of the split folios are unlocked
>+ */
>+int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>+{
>+	int extra_pins, ret = 0;
>+
>+	VM_WARN_ON_FOLIO(folio_mapped(folio), folio);
>+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>+	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>+

Compared with original logic, we did check folio_split_supported() and
check whether new_order is supported for the file system.

Currently folio_split_unmapped() only pass 0 as new_order, which looks good.
But for a generic helper, it looks reasonable to do the check, IMHO.

>+	if (!can_split_folio(folio, 1, &extra_pins))
>+		return -EAGAIN;
>+
>+	local_irq_disable();
>+	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>+						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>+						0, extra_pins);
>+	local_irq_enable();
>+	return ret;
>+}
>+
> /*
>  * This function splits a large folio into smaller folios of order @new_order.
>  * @page can point to any page of the large folio to split. The split operation


-- 
Wei Yang
Help you, Help me
