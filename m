Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA19CBD989
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022610E457;
	Mon, 15 Dec 2025 11:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZA8o+pLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984F910E454
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:48:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34c718c5481so922336a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799324; x=1766404124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8E8ZSVvZ3A1H5XIeWol9WzN+P6GbKkkMDrw9AgBsXoI=;
 b=ZA8o+pLdenaY7b1WQq8JeHbcSBD2udxgkbCcGsx+xl6o0CMn365cqTnsvK2W5fgoGb
 a/34UOrjJCjyofL7kbqDxxmpeDUZPuaeNUHVAmn1uj2hOCsLv2If3lIhIcOfAGt1vp5A
 IyMqD6KRgbrFsZx7ENdu3v7/WVOQIo7vFU8HaOXYqfBC+hJep5sfaYZdfxKuuIJ+DC7D
 +Zo0V55sWSV0idAlvA06hBeciksDd3JefU2ib0SCxiLqvqarUtNHDhvgAbt5TDfOxJJ6
 INzko3req9SY29R5+kPIKI18lNEQcdexXVJem8gzTZ28w0aEDMjvvk/Jp+44JkQLNZ8l
 wdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799324; x=1766404124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8E8ZSVvZ3A1H5XIeWol9WzN+P6GbKkkMDrw9AgBsXoI=;
 b=r+NHMhSZNsrkz0WAT26puJjIyyc0k0lHlOWQR0P+cEppaU970w3OvSrO2BSED/9qZS
 FMl+gs4IYD4VMDtPuCTX3WPP8RayjgkejN5exCBFOGGB1uP4+GOTeGmf7jQL9KX4eM3p
 c0zExnQrdIS8GwLd3Qpkny4msXaFFT6t4Y7U7gqNczAdQAnAvPDHiOvt4R4YYpjqggY8
 unvDT6quw1RBvY3RayMgNMEeOOxPlGPiRNeFn+M1nAY1O3C7Ob29eutrWr9SfSmilBwU
 MV5EFR8Aexhw2qMd9hOl+KqxA7hfPegxM9p5RnOWFIOqpXdmG9xo5Q6LbeV+9O/SBNcU
 jtPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPVA2iPmuBItK6e0GOJx20MAuH+vlQMlIH2D9WRgzk2i6pxxn3vs59eZE5qsUutbzcneoq18jn9yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFVG3iTDP0Ksau2EGnr8zwbjmLFh4r8tgi4Drq8cteGc3ZH7gc
 tWxwIuYTQqxOQ3Iti+rz/wnOjf/DhxlaZ6fMVB5VU+dvKAESbdy9GZxY
X-Gm-Gg: AY/fxX7ttm0pvHGYASbk+qCua2erqoP0D9JClp7FhnCBXS7zokHguPKlRWpCWAhLBPj
 sext4kPIQJQcEHxT5l1IBz+QgD2umY7qfT+ncM+oyeljqGboxZNGL8mTndM75rjrOLr3JEKFXGd
 BLKAE6mTRmVQRf9OoyoA5iouGm33juYyVqGD1EfKUp81mFuMPgjbzHdBH5UI65XELd0RmWlFaMe
 h7ZppyTUcY5Ms/hhvUlAZvYXv69894KPhrgNBryMrjgGPOTbHhnTGeUh3afQNU9H1rw0Lr5lZX2
 Gwnyad7KeMgis+wLBa+tg6hCteiu1piKOCpLRwE6AkZ1YL3l7JBT0aRb3tgeiRfmxbIrbRKeyRx
 jK9UJJP3fOeOYheMkWu8pD+r+4bunO1oEHTJVfAckQBYkY8mly/MRd6yrKvLKHMF0NvSMIZ+gQp
 GiAWIhDShLHYRdh/acyHkWig==
X-Google-Smtp-Source: AGHT+IFGPLXocnh0bsYmKlmGLz0U7nywcuz+b0WgS325GJYSuSdFNXAMsV5RYXPrF9APc0Uu9mi/Dg==
X-Received: by 2002:a17:90b:2692:b0:340:54a1:d6fe with SMTP id
 98e67ed59e1d1-34abd6e705bmr9983263a91.15.1765799324036; 
 Mon, 15 Dec 2025 03:48:44 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2c48bf7asm12763568a12.32.2025.12.15.03.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:48:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 711C5447330D; Mon, 15 Dec 2025 18:39:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org,
 kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mateusz Guzik <mjguzik@gmail.com>, NeilBrown <neil@brown.name>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 14/14] net: bridge: Describe @tunnel_hash member in
 net_bridge_vlan_group struct
Date: Mon, 15 Dec 2025 18:39:02 +0700
Message-ID: <20251215113903.46555-15-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215113903.46555-1-bagasdotme@gmail.com>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=bagasdotme@gmail.com;
 h=from:subject; bh=Q9RPGjCwe41o18D04IVKznpQEFsNHpWb2BdI9cEOKh8=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n0POW63OZ/vV5HO1nI0n8+fcu08SpWN+KD02YL721
 ObASlnjjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExESpiR4Y+mRyzDrR2tsxn8
 /5W9nMso8ZF7PQPXv0v9ETpvN1g+X8rw39Gt4w5/EGPqsSVHKrba3jn4a/bV+2uL/9ts2fkotu6
 9MRMA
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

Sphinx reports kernel-doc warning:

WARNING: ./net/bridge/br_private.h:267 struct member 'tunnel_hash' not described in 'net_bridge_vlan_group'

Fix it by describing @tunnel_hash member.

Fixes: efa5356b0d9753 ("bridge: per vlan dst_metadata netlink support")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 net/bridge/br_private.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 7280c4e9305f36..bf441ac1c4d38a 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -247,6 +247,7 @@ struct net_bridge_vlan {
  * struct net_bridge_vlan_group
  *
  * @vlan_hash: VLAN entry rhashtable
+ * @tunnel_hash: tunnel rhashtable
  * @vlan_list: sorted VLAN entry list
  * @num_vlans: number of total VLAN entries
  * @pvid: PVID VLAN id
-- 
An old man doll... just what I always wanted! - Clara

