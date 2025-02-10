Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F08A2F8CD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8D010E3B1;
	Mon, 10 Feb 2025 19:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PvAMsqFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6019010E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
 b=PvAMsqFVqyLFimvCSyLi25m+PfFuhxxh7sQCbk7oBX/IZRsF/mA/OaixvocvpWHxkt0/jj
 uN4N5Ed4hb27y3wYZgS8gbxhGg/DrnxDnTt61OIqJVDA7zDdbLHrUP8LZaodkH4s5s6JCl
 5Zk5iBgbWId32Js+IxueQOM7lYR3b80=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-OObMwROJPH-xEQMewDY5hw-1; Mon, 10 Feb 2025 14:38:14 -0500
X-MC-Unique: OObMwROJPH-xEQMewDY5hw-1
X-Mimecast-MFC-AGG-ID: OObMwROJPH-xEQMewDY5hw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43941ad86d4so7443995e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216293; x=1739821093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
 b=ADj6II9FyZZpj0LpjPHleRRtIQx+AcxzLFXt4cOGtwFuavzr9oU1Ro/EHAdGZexAP9
 ysrI8CAT+40+jL6U80AbUUqBpA+BwQghIqZTFobrns5I8K1TIvRdNZMgJkmgjcrPd+8w
 EW8TefCb91m7778+se1TRXMX0JChU0VEVjw6BZjsOf//zR9fqwLBMij55WZyB69KvU7v
 3eU3rxQeBvFbcFBwsCmd5ibiXFJxgJq9R0tDa+XktoOLP2O2zYHrHOWrboQ0+3vbe+4r
 iLRW79tR0SBCKHI8Bmwk2jC6/xOoxUffPi6hKJCHPThnN5Mj1VYKoVmxDy87AJwoZvrc
 yGqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9IbIKw0NctTCCuKTOFN+hN6ug9vc6ec360438dX7iUNibGNHOasu+rxB95Zd8Q/pWJulqlW/L69Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxivs7ZobF62FbOLuPxoFIvzxg7QIfioV/Ik75ZWHoVGhmcXzcf
 O652UzqyXvNWJe05Z2I6M/Jm8edFLjqX7wUQNswMZMXPvZOq/ZhSf1lbiIPCPpIJxgBgZgX8j/1
 QYNd9LPZ+mA9GKaMLdHTOc+ZfHlLa4gASZiaxOkQVqZUDu97YMD6qUKLpY19n+ID6jQ==
X-Gm-Gg: ASbGncuehJb5Yus8ujZTVAyaDMF4GPOuwJotgz76AMPf4puHzx2nih+oHNmyvWK9NW4
 +grGhcImv7zpMHQb7/gmnVdYFjAeyJBHDHSLQWa4Fd8tHuwccshPoWPkfUB6uh7DBIcyRJJ7HIP
 Nweyd0qKy5Y2SUTH66kar54/21KW4AtdfIaNWMHtT6Nnn1YYJFPfLCQ7jNBvkI8WAZg6He/Hb4m
 TjbDpMTmMouac6+Dg/GPpvWTdg5Ex0kDqUmB0AVWbmCug1JodOXHXdVHJVC2Yw/1F9Rdorg/i3T
 9ClzDM6zPJk3TeVNiOjWvEdUbNOzyslwmoA1J3lEejtDe5IMOcuBYm7Beytzip44qw==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-4394b9e47dfmr21358285e9.14.1739216292951; 
 Mon, 10 Feb 2025 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4p8WiTgagZxwnDzZ7MmocZCF9a1hUwQMJIvxH3cH5x6X+HJSMDirq9gM71FmkI7KhAXcpA==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id
 5b1f17b1804b1-4394b9e47dfmr21357855e9.14.1739216292555; 
 Mon, 10 Feb 2025 11:38:12 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43947bdc5c4sm26937995e9.23.2025.02.10.11.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:11 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 02/17] mm/rmap: reject hugetlb folios in
 folio_make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:44 +0100
Message-ID: <20250210193801.781278-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T3o1XJIAUBIodGrTVy6YnINBHPGIax9Qhj3Vfqc_4N4_1739216293
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.

In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
returned a page. In particular, hugetlb folios that are not PMD-sized
would never have been prone to FOLL_SPLIT_PMD.

hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
not really prepared for handling them at all. So let's spell that out.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7e..17fbfa61f7efb 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
 	 * Restrict to anonymous folios for now to avoid potential writeback
 	 * issues.
 	 */
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
 		return false;
 
 	rmap_walk(folio, &rwc);
-- 
2.48.1

