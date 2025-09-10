Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFDB50B4E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667DF10E832;
	Wed, 10 Sep 2025 02:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iByLIPC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92110E82F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:44:08 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7725fb32e1bso6817016b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757472248; x=1758077048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK0hEDM5Yyao3a7xqBzpr49p9H5HB+om5vfXDIKLdeg=;
 b=iByLIPC2D7tZ/iwfxkpZTSOUa/Qikm0MzjV4YSni5U5UvhSoD+6wKaU7UlL0JBgtXa
 Cgu4IX/IjJ7j4Zzsq4k3FAiEPp0/xl87GzxSeRnBeudAKdRXu4gN7/LDUpsLWSYvUXX9
 119x0VvRpRbVPrBBaCuklnWg9HAW1SQq215qDN03kLKAEIvdt7inG44PFgK3qKLeMiJI
 hr6V94QRuc2i3o6K0HzIXdO2d+Eiq12cR80PQ5N5ot0woS+wxhQ9siWd7YKoCrzxg0qH
 vDwQ8uMOM2OcO+Sk+An7bNPXDeo1wq2ZKOnolpO78tz6I1gK8zP5n653lAWaNJ9UI80D
 ghWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757472248; x=1758077048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fK0hEDM5Yyao3a7xqBzpr49p9H5HB+om5vfXDIKLdeg=;
 b=QbqT4vQJHfn5Z00xG/S3QlY0pNB2HAXput+BADQxVPbhfc20QRYg3sE95gEJkZM25u
 eX3129r35WSDFM65cvhlH8NODIUe/w9YlAsKSHHxLuGaQr9exoCfylKVXd/HCr7jNU/F
 HJ+EkIRNFpJvGpm+cJmoKHt9W5byNBVaVzZ9nipbB3nqz62radEbcAGSfGFjB4Cl9zxG
 EZP5TVcnCoNfg/f9v0QTp3VaxlbTy2NFSeQziQq4peXHNnFmNubKX9KL9WUVVx1O+jfo
 G+5WH/yIjQuPggfYC2B05fbnsLJECuIbgLVLuyUb2v6dT2gPo0UhotxsmJmo3hKTs2hf
 38Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtl6KJxxdVCpsh7CTG0bKyOOhyyajpMGoproreeKf7fsy9nfVNNRoA9/R5PgHAN2Jzj/hyQd80AV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bGfti7YNaFN2MKhr2CHqvgoLeFwyOrTPvDmNFGRxT/Wnv5Rd
 oVkEsmp2nW6mfDDv5c7lFmteyv16QQ22A9l4MbeUP03lEukMl4LxIhYy
X-Gm-Gg: ASbGncuD5EjCZm98FfnzIQDxDOPUN1ll2C900pEV4MdzXSRXLw9NF5n5mpZL1q+L51a
 jRfWTnf/P/DhNeny5v1Ox9mNfk8aXhlaixp1MYCOdtChu/MoPzHCI7TXeB3FDYtgxStHY8MrqeZ
 DXH2wK5jiOosVP3+CJimulC0s0ypc1SB5YsaBYUYE2gRbSkGubymbp6zGCVjFCFGj2AYCLfQfsp
 /2PMzO0ltfclrzFaIb/Ic5mjhoYGoncmTL19uv4hb36QFMEY6sPZYBsfVIZ7Saf7i4R0qjPxTzo
 2YMJW0GV9OxTStciSy/cDUZa/UNW5+EQ1MPpwnG7BpzmCS1cHVgZxKg1tm9By+soHr+YbwAToCo
 HZK/Wv0TdkjPqbgukGEz7i7rWXw==
X-Google-Smtp-Source: AGHT+IHubWrsefo+d87orOab1DSwsve/ArB2W06/xMLWCSAZ2PZ8eNr96v1SI6ir/qnxEBjX+/LG4w==
X-Received: by 2002:a05:6a00:2d16:b0:76b:f0ac:e7b2 with SMTP id
 d2e1a72fcca58-7742ddadd68mr16640975b3a.13.1757472247852; 
 Tue, 09 Sep 2025 19:44:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77466290d84sm3499051b3a.65.2025.09.09.19.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C367141BEA9F; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DAMON <damon@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 Linux BPF <bpf@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux KASAN <kasan-dev@googlegroups.com>,
 Linux Devicetree <devicetree@vger.kernel.org>,
 Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 tytso@mit.edu, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>,
 Andrew Lunn <andrew@lunn.ch>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ranganath V N <vnranganath.20@gmail.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 09/13] Documentation: filesystems: Fix stale reference to
 device-mapper docs
Date: Wed, 10 Sep 2025 09:43:24 +0700
Message-ID: <20250910024328.17911-10-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=bagasdotme@gmail.com;
 h=from:subject; bh=Ip9RCWVx3N2eFboDnh1dVntKjUKs5RT6sbpEBdmz23c=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHniixbj++M2M+e9AK28XZP75VaZfxL/rvM//ttckLa
 3oE7/o/6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBNZmb4p1i8uPKB8ZP13wum
 BPvKxR5SWdltK/h88a0CIW7J/3IPcxkZtk3KCLwZnfbq4QUbicP9bC8vlyYEbns3a5pPVM71i2f
 ecgIA
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

Commit 6cf2a73cb2bc42 ("docs: device-mapper: move it to the admin-guide")
moves device mapper docs to Documentation/admin-guide, but left
references (which happen to be external ones) behind, hence 404 when
clicking them.

Fix the references while also converting them to internal ones.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/fsverity.rst             | 11 +++++------
 Documentation/filesystems/ubifs-authentication.rst |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 412cf11e329852..54378a3926de7b 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -15,12 +15,11 @@ of read-only files.  Currently, it is supported by the ext4, f2fs, and
 btrfs filesystems.  Like fscrypt, not too much filesystem-specific
 code is needed to support fs-verity.
 
-fs-verity is similar to `dm-verity
-<https://www.kernel.org/doc/Documentation/admin-guide/device-mapper/verity.rst>`_
-but works on files rather than block devices.  On regular files on
-filesystems supporting fs-verity, userspace can execute an ioctl that
-causes the filesystem to build a Merkle tree for the file and persist
-it to a filesystem-specific location associated with the file.
+fs-verity is similar to :doc:`dm-verity
+</admin-guide/device-mapper/verity>` but works on files rather than block
+devices.  On regular files on filesystems supporting fs-verity, userspace can
+execute an ioctl that causes the filesystem to build a Merkle tree for the file
+and persist it to a filesystem-specific location associated with the file.
 
 After this, the file is made readonly, and all reads from the file are
 automatically verified against the file's Merkle tree.  Reads of any
diff --git a/Documentation/filesystems/ubifs-authentication.rst b/Documentation/filesystems/ubifs-authentication.rst
index 106bb9c056f611..9fcad59820915d 100644
--- a/Documentation/filesystems/ubifs-authentication.rst
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -439,9 +439,9 @@ References
 
 [DMC-CBC-ATTACK]     https://www.jakoblell.com/blog/2013/12/22/practical-malleability-attack-against-cbc-encrypted-luks-partitions/
 
-[DM-INTEGRITY]       https://www.kernel.org/doc/Documentation/device-mapper/dm-integrity.rst
+[DM-INTEGRITY]       Documentation/admin-guide/device-mapper/dm-integrity.rst
 
-[DM-VERITY]          https://www.kernel.org/doc/Documentation/device-mapper/verity.rst
+[DM-VERITY]          Documentation/admin-guide/device-mapper/verity.rst
 
 [FSCRYPT-POLICY2]    https://lore.kernel.org/r/20171023214058.128121-1-ebiggers3@gmail.com/
 
-- 
An old man doll... just what I always wanted! - Clara

