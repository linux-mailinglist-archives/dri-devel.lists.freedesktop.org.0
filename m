Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F90B3DA9A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC49910E379;
	Mon,  1 Sep 2025 07:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UhWxMfqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C6310EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:55:34 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-246648f833aso11818035ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756454134; x=1757058934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e1dzl/9HN9fCmWWoku2EUAe+4oZJtgdEcU9UZmXN/7A=;
 b=UhWxMfqBtJUUCL3i7HMO2PLCnGX9Wu9ipWtRiOuFI284pzXYZWAvKirNw23eUNH+C9
 3dafCSjaEZrm/WeV+xiJAQ9kjPY4VIlK4VQE7nY443RYnIX2Gc4/I1EFK7Ia1l1Cvuqu
 WZwb4yTLHAPUu7f8J3IyT5ZZ1O74avIzeJxSHrFuHuYEMEe09T4IxSIFqLO249MSbD1j
 lTCNvYN3oFMPEQb9eknIqaJloJhxWp1159KXc8h46yqkYXZSR38qf2KxGsVnhZAE+n24
 IYoZR43u8Qb/WOTvAwUdtC3TJI9cS+ava5s8XC+CBaHnPP7RYrFk1XByJkvj5crXYDZ1
 6Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756454134; x=1757058934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1dzl/9HN9fCmWWoku2EUAe+4oZJtgdEcU9UZmXN/7A=;
 b=oqSMjB8mNLJ2FX9bP3Z0ZmrQy9DpS7zKveI0J9ESmeD9QksikU+uYC041PYS2Vjr7y
 JubBZoKC8uHcwOIGaL0X3n8M/waxWCno44vp2DRdXAIi5at1+daEs+Fu8kfPrWMDrtGb
 1eSH7Sk/29Y/v5OcKDh2Fz0DPOTn3DBqICTdsYmFy0eeRmmNC55ru805y4x5txfqaOaW
 Gwu0qIDJHBr2fZcSi2p6m4Udh1ykMCo68+zKsQwsvF9ipyNHVQrAYYuzXruS3XNbdZAu
 ZwUUCtgoc9/kLS02XYN7rd0QWten0kJlr1VdI6vYbam6xPkmvnuNunNdxoMCqZoXMk5P
 dzhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbcnR21vO301InMOOM7lRwO2kITTnlvEMiNki53wHBlSRw9HmA8X50LW+NJcqs7F7bP4/tvLoPMoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs15o7IxwT2TU+095Kt6fYGmst8eW3TO94ALa0L3KXDGBwT+Th
 rKhV3H/gqxH6KmPHIfBsKi20AeefjtWSuxB2OddF3zN4Dkn9AbAkKnwl
X-Gm-Gg: ASbGncsb3RV6P56Qh817g/8USyCtt2jz829aHENqN6D4guPa6ZL4lTn2SrP6VncQrg3
 nCzPxjICG43LHDn3lMUfNlwMeG4gi/3fFqcDHeqcX6jDeTYx4SUHRcxKV8PtTQgFn3VNe5gSADf
 kWV7X0Lnyz8e3kiYZD4NxGd93NUBfoFJYDWWcFKCj1yPZsvXcNuVyRUGyeX5L2j0H20whzZDvqi
 Nfy4eq//aCAiw5zWwXP39VTdSD6XTg1aIdxPvPvikvkYDIpvXNSdcSj2ckCwrur2G8mScsM6+2g
 SThM4SeBFHUMZpNDSCiswvj52W6Rub52/W1A+ktI9T7zT74JhqirYixtupUlncgwMo1nXBYgVHG
 nrdkvIFFWlORUwG0+1NrT9MC+e2VLeqe+wuIA
X-Google-Smtp-Source: AGHT+IHHspv4kBSvuOju+syLfWNvxBR1WSkz7mrwJNK9paKzC+4NcNK8VdwZC8CcLSepusoSJLIitw==
X-Received: by 2002:a17:903:15ce:b0:246:c7dd:8da7 with SMTP id
 d9443c01a7336-246c7dd91f6mr219457635ad.32.1756454133503; 
 Fri, 29 Aug 2025 00:55:33 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249037043b3sm17009045ad.22.2025.08.29.00.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:55:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 92CC9411BF96; Fri, 29 Aug 2025 14:55:27 +0700 (WIB)
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
 Linux Kernel Build System <linux-lbuild@vger.kernel.org>,
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
 Zhihao Cheng <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>,
 Andrew Lunn <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
Date: Fri, 29 Aug 2025 14:55:10 +0700
Message-ID: <20250829075524.45635-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=bagasdotme@gmail.com;
 h=from:subject; bh=UJUK8/oCaP8or4xMM6dYj2gtHalMI9xq0zTRRM+Er48=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY17c4br6T35GuJHFF8Yt24416R5lZZr0d5nIjOkLd
 Wbtjd2k0FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJxIow/NNvVZZWvf59gvln
 8f09a96zlV1ddP/qfkeet3OelO1bF7GW4X+WSslpN8ZtovrZdcGNj+0m353MlHX12bkXf15P2h5
 ctoADAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

Cross-references to other docs (so-called internal links) are typically
done following Documentation/doc-guide/sphinx.rst: either simply
write the target docs (preferred) or use :doc: or :ref: reST directives
(for use-cases like having anchor text or cross-referencing sections).
In some places, however, links to https://www.kernel.org/doc
are used instead (outgoing, external links), owing inconsistency as
these requires Internet connection only to see docs that otherwise
can be accessed locally (after building with ``make htmldocs``).

Convert such external links to internal links. Note that this does not
cover docs.kernel.org links nor touching Documentation/tools (as
docs containing external links are in manpages).

This series is based on docs-next tree.

Bagas Sanjaya (14):
  Documentation: hw-vuln: l1tf: Convert kernel docs external links
  Documentation: damon: reclaim: Convert "Free Page Reporting" citation
    link
  Documentation: perf-security: Convert security credentials
    bibliography link
  Documentation: amd-pstate: Use internal link to kselftest
  Documentation: blk-mq: Convert block layer docs external links
  Documentation: bpf: Convert external kernel docs link
  Documentation: kasan: Use internal link to kunit
  Documentation: gpu: Use internal link to kunit
  Documentation: filesystems: Fix stale reference to device-mapper docs
  Documentation: smb: smbdirect: Convert KSMBD docs link
  Documentation: net: Convert external kernel networking docs
  ASoC: doc: Internally link to Writing an ALSA Driver docs
  nitro_enclaves: Use internal cross-reference for kernel docs links
  Documentation: checkpatch: Convert kernel docs references

 Documentation/admin-guide/hw-vuln/l1tf.rst    |   9 +-
 .../admin-guide/mm/damon/reclaim.rst          |   2 +-
 Documentation/admin-guide/perf-security.rst   |   2 +-
 Documentation/admin-guide/pm/amd-pstate.rst   |   3 +-
 Documentation/block/blk-mq.rst                |  23 ++--
 Documentation/bpf/bpf_iterators.rst           |   3 +-
 Documentation/bpf/map_xskmap.rst              |   5 +-
 Documentation/dev-tools/checkpatch.rst        | 121 ++++++++++++------
 Documentation/dev-tools/kasan.rst             |   6 +-
 .../bindings/submitting-patches.rst           |   2 +
 .../driver-api/driver-model/device.rst        |   2 +
 Documentation/filesystems/fsverity.rst        |  11 +-
 Documentation/filesystems/smb/smbdirect.rst   |   4 +-
 Documentation/filesystems/sysfs.rst           |   2 +
 .../filesystems/ubifs-authentication.rst      |   4 +-
 Documentation/gpu/todo.rst                    |   6 +-
 Documentation/kbuild/reproducible-builds.rst  |   2 +
 Documentation/locking/lockdep-design.rst      |   2 +
 .../can/ctu/ctucanfd-driver.rst               |   3 +-
 .../device_drivers/ethernet/amazon/ena.rst    |   4 +-
 Documentation/networking/ethtool-netlink.rst  |   3 +-
 Documentation/networking/snmp_counter.rst     |  12 +-
 Documentation/process/coding-style.rst        |  15 +++
 Documentation/process/deprecated.rst          |   4 +
 Documentation/process/submitting-patches.rst  |   4 +
 Documentation/sound/soc/codec.rst             |   4 +-
 Documentation/sound/soc/platform.rst          |   4 +-
 Documentation/virt/ne_overview.rst            |  10 +-
 28 files changed, 165 insertions(+), 107 deletions(-)


base-commit: ee9a6691935490dc39605882b41b9452844d5e4e
-- 
An old man doll... just what I always wanted! - Clara

