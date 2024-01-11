Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977BE82A989
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088D910E83F;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 844AA10E09B;
 Thu, 11 Jan 2024 05:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=CIiKcgzxPMZ8uXTepi
 Qzs/+KtYuuMjNy2tKnVKnI3W8=; b=BZ6FIXfwsgEwKlXe1AsxtOW4wJy99p9se0
 rXcfSZuqsKmG5GvUQnzByYhWPnC6YnglPjKxqJUZsFPRA7LWDy0EcVrRqrtGk9oa
 bpoHaGwKhr7xpIiCqxJrmLWyRbQlmNb8sTWOwgBFhWJmxsdQ0X3ZjqnjERpzeP9g
 lpGTr7UBo=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDXH5HWf59lRw+gAA--.16881S2;
 Thu, 11 Jan 2024 13:42:47 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in discovery.h
Date: Thu, 11 Jan 2024 05:42:45 +0000
Message-Id: <20240111054245.8258-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXH5HWf59lRw+gAA--.16881S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4fXFyDWryUWF17Cr4kZwb_yoW5ArWxpF
 s3JFnrKF45JFyIgr17Xrs3Zr43t397Ka48GFyq934Sgr4j9r18ta4rtF4YkFyYga48WwnF
 qw1ktw15Aan7u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUxhLUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGBdixWVLZWY47gAAsT
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: chenxuebing <chenxb_99091@126.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/discovery.h | 32 +++++++++----------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/discovery.h b/drivers/gpu/drm/amd/include/discovery.h
index 7a9d473d0917..4a8b9eabcf03 100644
--- a/drivers/gpu/drm/amd/include/discovery.h
+++ b/drivers/gpu/drm/amd/include/discovery.h
@@ -32,8 +32,7 @@
 #define VCN_INFO_TABLE_ID               0x004E4356
 #define MALL_INFO_TABLE_ID              0x4C4C414D
 
-typedef enum
-{
+typedef enum {
 	IP_DISCOVERY = 0,
 	GC,
 	HARVEST_INFO,
@@ -45,16 +44,14 @@ typedef enum
 
 #pragma pack(1)
 
-typedef struct table_info
-{
+typedef struct table_info {
 	uint16_t offset;   /* Byte offset */
 	uint16_t checksum; /* Byte sum of the table */
 	uint16_t size;     /* Table size */
 	uint16_t padding;
 } table_info;
 
-typedef struct binary_header
-{
+typedef struct binary_header {
 	/* psp structure should go at the top of this structure */
 	uint32_t binary_signature; /* 0x7, 0x14, 0x21, 0x28 */
 	uint16_t version_major;
@@ -64,15 +61,13 @@ typedef struct binary_header
 	table_info table_list[TOTAL_TABLES];
 } binary_header;
 
-typedef struct die_info
-{
+typedef struct die_info {
 	uint16_t die_id;
 	uint16_t die_offset; /* Points to the corresponding die_header structure */
 } die_info;
 
 
-typedef struct ip_discovery_header
-{
+typedef struct ip_discovery_header {
 	uint32_t signature;    /* Table Signature */
 	uint16_t version;      /* Table Version */
 	uint16_t size;         /* Table Size */
@@ -89,8 +84,7 @@ typedef struct ip_discovery_header
 	};
 } ip_discovery_header;
 
-typedef struct ip
-{
+typedef struct ip {
 	uint16_t hw_id;           /* Hardware ID */
 	uint8_t number_instance;  /* instance of the IP */
 	uint8_t num_base_address; /* Number of Base Addresses */
@@ -107,8 +101,7 @@ typedef struct ip
 	uint32_t base_address[]; /* variable number of Addresses */
 } ip;
 
-typedef struct ip_v3
-{
+typedef struct ip_v3 {
 	uint16_t hw_id;                         /* Hardware ID */
 	uint8_t instance_number;                /* Instance number for the IP */
 	uint8_t num_base_address;               /* Number of base addresses*/
@@ -145,15 +138,13 @@ typedef struct ip_v4 {
 	} __packed;
 } ip_v4;
 
-typedef struct die_header
-{
+typedef struct die_header {
 	uint16_t die_id;
 	uint16_t num_ips;
 } die_header;
 
-typedef struct ip_structure
-{
-	ip_discovery_header* header;
+typedef struct ip_structure {
+	ip_discovery_header *header;
 	struct die
 	{
 		die_header *die_header;
@@ -357,8 +348,7 @@ struct vcn_info_header {
     uint32_t size_bytes; /* size of the entire header+data in bytes */
 };
 
-struct vcn_instance_info_v1_0
-{
+struct vcn_instance_info_v1_0 {
 	uint32_t instance_num; /* VCN IP instance number. 0 - VCN0; 1 - VCN1 etc*/
 	union _fuse_data {
 		struct {
-- 
2.17.1

