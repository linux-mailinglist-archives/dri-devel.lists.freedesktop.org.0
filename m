Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE9CCE27A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CFE10EC3C;
	Fri, 19 Dec 2025 01:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iI+N+97m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55C410EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:40:26 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-787da30c53dso12814617b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766108426; x=1766713226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nd7dLSH/2LNPg9M+6OkqNEaj91DJZUUxPtMRLObk/CU=;
 b=iI+N+97miC386sKv8F7eEG8TYxc3nUUHUkC8GW2HAl75KfAFfyHvcLVvGDxBYaM95k
 x7G3g7AAKw2ChdBc5gYLiw4PLvVsMxRG9bvdAi9vYDFNjmOcaQ0JjT4R9AXkRHZnvvaL
 4i6Kr+fPdzyn9bMFHEqXM5GiZnMmu2IZi9hvsXVysl/BwUGnmqK4EeM93bzB/etDn4S/
 yZPPIlHBN/fgXaJWHILOvcjGvxZQ1133qoyrGXes3LzTHcykcrTO+CN7gn8j2TJddrxa
 IjvCPYEAyeSjAB3Pgr5m/Xo3z/aDUXmll62BN/ZjrscYiJH/301K7l3BQ7Sonl2lUqDi
 qFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766108426; x=1766713226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nd7dLSH/2LNPg9M+6OkqNEaj91DJZUUxPtMRLObk/CU=;
 b=hqq+3A1iVXa5gWcV/X+o3dvyCY6zM2cyiQCQRkn18nGUcIKSPWe9kihewcu+UKKuUY
 x39zdLxi5R6v4vr878X8DkXUsMfozAtGFFSoyBr4pCiTtjE1LDq+SFlXriN1CHCnLHfb
 JtcSIwKAO5LQUMzmtfHwZ0TakU1cQau24VpoYH0GWH+/60AV6AJ6XsBnPANT7dAJcyEg
 0n8DR5uA0huvv3IROaG/l6kpZ+okxO6qPyihdaBY8F16f486yoj1rn69wlb6KcAicXXw
 bNhDmbTFb8GsiycKad2pCBmVQvv4qh83ogUBte6ELmrb6ifcZZa/ebeh8PU9/d3abpZl
 Otng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSBl0GZCHHV73Ph9Ous3GZjPS4rvKvg+YxXK3OI54UpHRPAKm/2AGheXV321aSkb6PzSM37q0Maqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9/RmkGfB3OsEXHXZlBypAlpbyvJoqtmY3b/DgFTDMrf7nO0ZU
 mkYb0JLJ4TsfN+Hvoa408YRX2l1x5xsk0vcM8BLIQX5lJgJj1m7475I6
X-Gm-Gg: AY/fxX4AfwxL04bs3mrjQ1hK6GMSIc9OYPyJrNBulHKiITgovUZNjhA1Jal4VXMYwlG
 sonYbHUwtPMV2NcS3j697lo2r6nnTYPCGlv1BslUdIyul7yJkqw2FN0Imh6MjAf0Ngran5/0NHZ
 u/GTVJ7vFKEVZpBgWTt5hpKdHAeL25ybqY16xrOAUcBIacNzt31rjn/1EN6V5n1KFmsyPFSytM9
 XpbshXgImdJx8syUSEsud+joM3AvxXjDLH2L8h/pKmNyHcxIPOk/VsLYxuDJvMcJrsDlv/eRlGl
 Aj+Kxa6mgqOmriGF+YyRWZxGxuQnI9Wsiq0p7nDTQy04To1/J5xWzi32NPtftT6mRYc3skO+N2g
 BdbYczm+fzTqFHPe0Bpatu4PnAy+Vspvzau3kgY9bspaXJ53DGHqsm/mz8i2Z79CzRR89WYu98Z
 XYucuce8P88lU=
X-Google-Smtp-Source: AGHT+IGj4vErXkivNcPDaKm/hE3vqzn7Jv2EbveO2FMxfRHgUcrVUKUl63HP3M4rW9y9FyxrhRxuhQ==
X-Received: by 2002:a05:690c:a8e:b0:788:182b:a79c with SMTP id
 00721157ae682-78fb41309d4mr10702687b3.35.1766108425857; 
 Thu, 18 Dec 2025 17:40:25 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb4376692sm4362217b3.10.2025.12.18.17.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id BE85043916EF; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Max Kellermann <max.kellermann@ionos.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mao Zhu <zhumao001@208suo.com>, Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH mm-hotfixes 0/4] mm kernel-doc fixes
Date: Fri, 19 Dec 2025 08:40:03 +0700
Message-ID: <20251219014006.16328-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=RJRIAcyQjDA0Y8yZ/8Tu6N5h+KfYiqNdzVSLTNcjx6Q=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuq+f5OYcHL0jrEuTKWuQ97emSvy6qUm0BRWeMGLrcl
 J5vdHXqKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESybBn+Gdbv7z63/Pnd28sP
 njM2YHx0zOL4JEkuEzeHcytM7BWSJjAy7D8We+uuyDHrtsBjHzMXb9rMJcEdymbdyWQWkGkSsmk
 BCwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
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

Hi,

Here are kernel-doc fixes for mm subsystem, based on mm-hotfixes-unstable
branch. This series is split from previous assorted kernel-doc fixes series
[1] with review trailers applied.

I'm also including textsearch fix since there's currently no maintainer
for include/linux/textsearch.h (get_maintainer.pl only shows LKML).

Enjoy!

[1]: https://lore.kernel.org/linux-fsdevel/20251215113903.46555-1-bagasdotme@gmail.com/

Bagas Sanjaya (4):
  mm: Describe @flags parameter in memalloc_flags_save()
  textsearch: Describe @list member in ts_ops search
  mm: vmalloc: Fix up vrealloc_node_align() kernel-doc macro name
  mm, kfence: Describe @slab parameter in __kfence_obj_info()

 include/linux/kfence.h     | 1 +
 include/linux/sched/mm.h   | 1 +
 include/linux/textsearch.h | 1 +
 mm/vmalloc.c               | 2 +-
 4 files changed, 4 insertions(+), 1 deletion(-)


base-commit: 980dbceadd50af9437257d8095d4a3606818e8c4
-- 
An old man doll... just what I always wanted! - Clara

