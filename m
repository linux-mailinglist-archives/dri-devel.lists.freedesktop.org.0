Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E81F8FAD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6E6E13C;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E3189786
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 19:32:34 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49knmf3GQgz9vC9F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 19:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcbOeXVFHIDa for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 14:32:34 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49knmf1W4nz9v90G
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 14:32:34 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49knmf1W4nz9v90G
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49knmf1W4nz9v90G
Received: by mail-io1-f72.google.com with SMTP id b11so8485687ioh.22
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=pJ20cKcKMnGm3+Riu7jtthOtL7g8EIT2MKkma1MPE6o=;
 b=XNWmcjhnocnx2PCeGekIOa6hmp/5qTxzXhmI/rnG/BdQUSUHtNzIw27S8a5v6/a0D6
 QHdgNQrOk9lqbEto8IVTmS3CbgaZdQCIKp+U8A2/9KOWjxuFB1itO+tJL+4z/o0I0PEu
 nYotRjHX1C7FW4T+5Ctpjbp/BVOqmhuyFsstGn5SB+ycEN9N13+5T5+20alrtR0bLrFa
 W8nGcO6mnr+f3ls1xudYP4uIXiOsTb9hgkK7R4fHPwxAXMajNQUC4isiBInG2sjgpTfJ
 wq288R8VLIDVgeRi7H3GKk2l4u7hD5cr1DYRAIEpPPXVX26pAYfpmg9utXKpYI56LSZ9
 E3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pJ20cKcKMnGm3+Riu7jtthOtL7g8EIT2MKkma1MPE6o=;
 b=VBk4cNbzW+1kLilPlbc4XJMftBsOSl72otvesnTq2Mi11xs6TPc2c0Oax0ktuxuJhY
 wwr/MFQj7H5icJa64FtMRHEICp4rlDkOdKoWjaynM/Fz2AMvD6Autw9hhTqFG2cuNgv1
 rrjq+z/UBEhv2pWwijuLNbZRzsbdxMsvwKpOzTPUtmdbG/+ykVZcqIHjV2khoY4uvFaW
 JtmZfBI+HlxNNismopUXIDGVzsgkG/dqZvfwtTeUumMQ40tEkZUdnnXJlscqCzLsxYfM
 BcNMt9D+xC0jHqi6ltJ8LWKPnRkZvRE/EiSl5taoruvT87/K4wZ4eYLiuoc1gLj7hnNB
 jINg==
X-Gm-Message-State: AOAM533yBFiZjgH3kaQDCHE6uaYvWMTZd9+WpE1ZoQQOBbmcmIxgwxWl
 QHU4Gg8Q4zXn4BJtPWLJ45q0scmcRKC4/sDfvJivRkREKo9Hp7R1N/5cclHGliAUHcPuhB6SAWq
 MHclHxV8eFUIwQ6gEehuqvHt5nKVJiOj3
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr14405838jaj.106.1592076753490; 
 Sat, 13 Jun 2020 12:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNb/Sk7PVT9zM53pVsCho9Wzso9hsmtHF+L1UVP9LJR0pCZeyktih4ZL5JuGWYbfJxALxufQ==
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr14405814jaj.106.1592076753173; 
 Sat, 13 Jun 2020 12:32:33 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id t63sm5383628ill.54.2020.06.13.12.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 12:32:32 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] drm/amdkfd: Fix reference count leaks.
Date: Sat, 13 Jun 2020 14:32:26 -0500
Message-Id: <20200613193226.21531-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, wu000273@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qiushi Wu <wu000273@umn.edu>

kobject_init_and_add() takes reference even when it fails.
If this function returns an error, kobject_put() must be called to
properly clean up the memory associated with the object.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index bb77f7af2b6d..dc3c4149f860 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -632,8 +632,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 
 	ret = kobject_init_and_add(dev->kobj_node, &node_type,
 			sys_props.kobj_nodes, "%d", id);
-	if (ret < 0)
+	if (ret < 0) {
+		kobject_put(dev->kobj_node);
 		return ret;
+	}
 
 	dev->kobj_mem = kobject_create_and_add("mem_banks", dev->kobj_node);
 	if (!dev->kobj_mem)
@@ -680,8 +682,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(mem->kobj, &mem_type,
 				dev->kobj_mem, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(mem->kobj);
 			return ret;
+		}
 
 		mem->attr.name = "properties";
 		mem->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -699,8 +703,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(cache->kobj, &cache_type,
 				dev->kobj_cache, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(cache->kobj);
 			return ret;
+		}
 
 		cache->attr.name = "properties";
 		cache->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -718,8 +724,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(iolink->kobj, &iolink_type,
 				dev->kobj_iolink, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(iolink->kobj);
 			return ret;
+		}
 
 		iolink->attr.name = "properties";
 		iolink->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -798,8 +806,10 @@ static int kfd_topology_update_sysfs(void)
 		ret = kobject_init_and_add(sys_props.kobj_topology,
 				&sysprops_type,  &kfd_device->kobj,
 				"topology");
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(sys_props.kobj_topology);
 			return ret;
+		}
 
 		sys_props.kobj_nodes = kobject_create_and_add("nodes",
 				sys_props.kobj_topology);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
