Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D74D1B674
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42A10E54B;
	Tue, 13 Jan 2026 21:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AN5crtGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F416A10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768339999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jP7f0lQJG9KXkNw18KBRK9Mc0gzLz/Z1noHFWbbNo8Y=;
 b=AN5crtGLe8p+QbWIoKGZodnuFRiLHIGwxLH60JsUj435whgJqrLg5DtQKK+VrX3ESBJ0Q1
 T60OD3Or0kvyob/E9EdzDoEt3n/G+oH8JwSrVJ6wGOHGDVYOevpAS/ABvl8s55Vhecwv1/
 7QAMjgmDHSCsWTtZY65UYpX9O8tVamA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1pC_MO76OwGUZY2PuK68PQ-1; Tue, 13 Jan 2026 16:33:15 -0500
X-MC-Unique: 1pC_MO76OwGUZY2PuK68PQ-1
X-Mimecast-MFC-AGG-ID: 1pC_MO76OwGUZY2PuK68PQ_1768339995
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso326386841cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768339995; x=1768944795;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jP7f0lQJG9KXkNw18KBRK9Mc0gzLz/Z1noHFWbbNo8Y=;
 b=AciAhv+jUgl75xQf3YJ78HKPiDW2og+5aaZ6qYOS/8ZC/CIOZSl5j6rzayIITl5w74
 tACegB47/gSHTPhQ5OQSkgJMSJa90Afd4kb7Oc0ou5I6tGL42+SLXJWOqoDYbQb438aP
 y07G3tduoOG1534s3crMm1a1Cj14LxnNjxxCE6RIH7T7UF7PrGpjkXyVEyx0qiL/YKp4
 41OVnsam1FhegkNa0nrYxyfeJ1KhvhBr8gdrcknmJaKGMWgYh9ux7uF4oicYzRMLiKjY
 dqMRIys7ymk10hgYo5jIJ/QFR2JkkBWwqoLKsoHJFHojHjzP21b30BCFgIQgAEX6X10e
 PNbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqb9BmafqEvdh4w900A8eRhWlvkGSBRCpGLxcYACJ4QQpqWvU7SqxD/C4j0hrr4b8jRaQq/ME9mr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIBXgkKSE4ZQDrp5JxFSdFCx3dbyCkjfg0Er7CKHYV5lZq7NYG
 pMwM0yRFKqNYNZXMNoMy2clO+yKhyAwM1tDS6CdMEULtnVKgMK4RpOBHPIYdOom8Udv4INe1jCr
 TNThbRzbr6LGBlj9FsUJSM93eVTqqnB3DPJrfr/KatHhAEw+AzB0QeBrrsztiY6zBqdec5g==
X-Gm-Gg: AY/fxX53Z5XqnbOYlJ/VCJTaCcfqG1CX/QpI7JHsBsO1yViiuT4gpuiWpkHM5mmmPtr
 OgND7tylIyYwlBWQaOXwY61UuWRvh3QLuAn5usi9CoWMrQq84RSSyXHAWh7wLfhOmv/Se5mgW4o
 lAo6u4Nbg+EgSQkRrYsOWswewIq6yGtWwY039D/FNDGq5i57IXvgpl5VUYHaJNTNAZm6RhC7Gkq
 38tpp9Uc/HSZMWYfTLnDzQyc42BlLbvVVGeRITAGXndc7VYvySv9lZ+TGDNcTUHYmoqQMivBfNr
 HGTGirOhsb7S1iH2r7GRFiwpR65T/tFGA+9W2d8cDUOrZx+7+cPfq1s9LLXqSh+CT9OeHJOzCyc
 13goajuH3CibCV0oCWnpEB0+tOKQcVANMf0neILfdG3hrG9QcOS8=
X-Received: by 2002:a05:622a:c6:b0:4ee:19f2:9f1b with SMTP id
 d75a77b69052e-5014822bafemr8156901cf.37.1768339995143; 
 Tue, 13 Jan 2026 13:33:15 -0800 (PST)
X-Received: by 2002:a05:622a:c6:b0:4ee:19f2:9f1b with SMTP id
 d75a77b69052e-5014822bafemr8156571cf.37.1768339994692; 
 Tue, 13 Jan 2026 13:33:14 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89077268016sm164280926d6.46.2026.01.13.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:33:14 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Date: Tue, 13 Jan 2026 16:32:43 -0500
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXNQQ7CIBCF4as0s3YaoILVlfcwLkaYFha0DVCja
 Xp30cTlt3j/2yBzCpzh0myQ+BlymKcKdWjAeppGxuCqQQllhBQKXaTHOqBnWjC/c+GIkaMd0fa
 Gul46YzqCOl8SD+H1S9/u1UOaIxafmP5BLZWU8txJYdqT1sdeo0L+3q6Or4mdp9LaOcK+fwCrp
 AtLqAAAAA==
X-Change-ID: 20260102-dmabuf-heap-system-memcg-c86a381d663a
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aTsMtK2ZN5YFriMwu1QblGR60__Oc3nLmeG7MS6BUio_1768339995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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

Capture dmabuf system heap allocations in memcg following prior
conversations[1][2]. Disable this behavior by default unless configured
by "dma_heap.mem_accounting" module parameter.

[1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
[2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com/

Changes in v2:
- Add a module parameter to enable dma-buf cgroup accounting, disabled
  by default.
- Split system_heap logic in its own commit.
- Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanude@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

 drivers/dma-buf/dma-heap.c          | 5 +++++
 drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>

