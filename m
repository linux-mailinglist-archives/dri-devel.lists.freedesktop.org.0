Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB965753217
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9F10E7C5;
	Fri, 14 Jul 2023 06:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D310E7C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:38:06 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2MHH369vzBR9sW
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:38:03 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1689316683; x=
 1691908684; bh=dBV2U+m3cL4V6sxQW7pPcNUrdDg9Y+1xV8p9CwQ1qno=; b=u
 Qb+fUCz+oAZ1SYDTvNn7/jff3FDmdfLZr4AT5rqN8zPWUFVqsZp3QaAlonzNjpMe
 aJZO4SHpjZNp6yvqQPvmW7IzJvaIcOXdTnD5W0acYBI9nZKMBiCxBfTWyy2KSMJG
 ItG+DIz5UCFRNYTCQ+Qz0XBfKOh0FLpH+cnvkxcvGRkP7Bd7hoNb/c8xku/VGxIv
 6HZSuBvD3vdzy9mZWCW+1VRiplTJUCZ6l3FncjvagU/R6wbhwUH49PD3r3vLOTF4
 r2gHg0I75WqrZwIc1w5y2EfZ4FqDQbP5cSu8FHm+88eOE8Luv2ng5sgGdRkL4uOf
 fsJTukJT6I3UE550tBfUw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dkOZ8VaOtgbI for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 14:38:03 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2MHH0G9FzBJFS7;
 Fri, 14 Jul 2023 14:38:02 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 14:38:02 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu/discovery: open brace '{' following struct go on
 the same line
In-Reply-To: <20230714063651.13980-1-xujianghui@cdjrlc.com>
References: <20230714063651.13980-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <ac2d3cb0173cd6f40faf57a6faaa2bb7@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_1191d5ed1971db54bdee65047febf359"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_1191d5ed1971db54bdee65047febf359
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Fix the checkpatch error as open brace '{' following struct should
go on the same line.

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/include/discovery.h | 33 +++++++++----------------
  1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/discovery.h 
b/drivers/gpu/drm/amd/include/discovery.h
index f43e29722ef7..eed394df36d5 100644
--- a/drivers/gpu/drm/amd/include/discovery.h
+++ b/drivers/gpu/drm/amd/include/discovery.h
@@ -32,8 +32,7 @@
  #define VCN_INFO_TABLE_ID               0x004E4356
  #define MALL_INFO_TABLE_ID              0x4D414C4C

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
      uint16_t die_offset; /* Points to the corresponding die_header 
structure */
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
      uint8_t instance_number;                /* Instance number for the 
IP */
      uint8_t num_base_address;               /* Number of base 
addresses*/
@@ -145,20 +138,16 @@ typedef struct ip_v4 {
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
+typedef struct ip_structure {
      ip_discovery_header* header;
-    struct die
-    {
+    struct die {
          die_header *die_header;
-        union
-        {
+        union {
              ip *ip_list;
              ip_v3 *ip_v3_list;
              ip_v4 *ip_v4_list;
--=_1191d5ed1971db54bdee65047febf359
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Fix the checkpatch error as open brace '{' following struct should<br />go =
on the same line.<br /><br />Signed-off-by: Ran Sun &lt;sunran001@208suo.co=
m&gt;<br />---<br />&nbsp;drivers/gpu/drm/amd/include/discovery.h | 33 ++++=
+++++----------------<br />&nbsp;1 file changed, 11 insertions(+), 22 delet=
ions(-)<br /><br />diff --git a/drivers/gpu/drm/amd/include/discovery.h b/d=
rivers/gpu/drm/amd/include/discovery.h<br />index f43e29722ef7..eed394df36d=
5 100644<br />--- a/drivers/gpu/drm/amd/include/discovery.h<br />+++ b/driv=
ers/gpu/drm/amd/include/discovery.h<br />@@ -32,8 +32,7 @@<br />&nbsp;#defi=
ne VCN_INFO_TABLE_ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x004E4356<br />&nbsp;#define MALL_INFO_TABLE=
_ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;0x4D414C4C<br />&nbsp;<br />-typedef enum<br />-{<br />+typedef enum=
 {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP_DISCOVERY =3D 0,<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;GC,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HARVEST_INFO,<br /=
>@@ -45,16 +44,14 @@ typedef enum<br />&nbsp;<br />&nbsp;#pragma pack(1)<br=
 />&nbsp;<br />-typedef struct table_info<br />-{<br />+typedef struct tabl=
e_info {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t offset; &nbsp;&nbsp;/*=
 Byte offset */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t checksum; /* By=
te sum of the table */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t size; &n=
bsp;&nbsp;&nbsp;&nbsp;/* Table size */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u=
int16_t padding;<br />&nbsp;} table_info;<br />&nbsp;<br />-typedef struct =
binary_header<br />-{<br />+typedef struct binary_header {<br />&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;/* psp structure should go at the top of this structure =
*/<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t binary_signature; /* 0x7, 0x=
14, 0x21, 0x28 */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t version_major=
;<br />@@ -64,15 +61,13 @@ typedef struct binary_header<br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;table_info table_list[TOTAL_TABLES];<br />&nbsp;} binary_he=
ader;<br />&nbsp;<br />-typedef struct die_info<br />-{<br />+typedef struc=
t die_info {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t die_id;<br />&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t die_offset; /* Points to the correspondin=
g die_header structure */<br />&nbsp;} die_info;<br />&nbsp;<br />&nbsp;<br=
 />-typedef struct ip_discovery_header<br />-{<br />+typedef struct ip_disc=
overy_header {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t signature; &nbsp=
;&nbsp;&nbsp;/* Table Signature */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint1=
6_t version; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Table Version */<br />&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;uint16_t size; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;/* Table Size */<br />@@ -89,8 +84,7 @@ typedef struct ip_discov=
ery_header<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br />&nbsp;} ip_discovery_=
header;<br />&nbsp;<br />-typedef struct ip<br />-{<br />+typedef struct ip=
 {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t hw_id; &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Hardware ID */<br />&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;uint8_t number_instance; &nbsp;/* instance of the IP */<br=
 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t num_base_address; /* Number of Bas=
e Addresses */<br />@@ -107,8 +101,7 @@ typedef struct ip<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;uint32_t base_address[]; /* variable number of Addresses =
*/<br />&nbsp;} ip;<br />&nbsp;<br />-typedef struct ip_v3<br />-{<br />+ty=
pedef struct ip_v3 {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t hw_id; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Hardwa=
re ID */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint8_t instance_number; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;/* Instance number for the IP */<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;uint8_t num_base_address; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Number of base addresses*/<br />@@ =
-145,20 +138,16 @@ typedef struct ip_v4 {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;} __packed;<br />&nbsp;} ip_v4;<br />&nbsp;<br />-typedef struct die_head=
er<br />-{<br />+typedef struct die_header {<br />&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;uint16_t die_id;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint16_t num_ips;<=
br />&nbsp;} die_header;<br />&nbsp;<br />-typedef struct ip_structure<br /=
>-{<br />+typedef struct ip_structure {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
ip_discovery_header* header;<br />- &nbsp;&nbsp;&nbsp;struct die<br />- &nb=
sp;&nbsp;&nbsp;{<br />+ &nbsp;&nbsp;&nbsp;struct die {<br />&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;die_header *die_header;<br />- &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;union<br />- &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;{<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;union {=
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;ip *ip_list;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip_v3 *ip_v3_list;<br />&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip_v4 *ip_v4_list;=
</div>

</body></html>

--=_1191d5ed1971db54bdee65047febf359--
