Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19E7531E0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB31310E1C1;
	Fri, 14 Jul 2023 06:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F4310E7C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:23:52 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2Lys3xdtzBR9sV
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:23:49 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689315829; x=1691907830; bh=22hHmkRO9TkU+Wjx8NhVjpSomcy
 bO0NSKa3A1lNZF14=; b=n91HPB3XgnslP02udG3Do0NmQKoiitEAyz4nKJ+gWEc
 9yxvXvjrwUw8izpYXSjoT0hBxURswf+JCngR2vfAbqyKOn1xcT9TG67UyDhrLgSS
 SovEydUEdgWBQOZfwjz2ycFMaBFAeL8ms4WdHIYVbShoKut4pQboaynhSzqJ8nqY
 YfL3QG7Zxptqe247DOh3KjOdaJUkWk2mALqoV7u7cSTInDYT70jl5K9NsE7532Mw
 Octolhxtvm+p/7BXPpegZgMSXaFsoyR9e4f4A+YidNQa9t5Ipds4s0GlHKJgHf2l
 GcyRpTLZs10tpoaFuJJimqIK0GMyxopgUfbi/xAXvpg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lWZh12qazu71 for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 14:23:49 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2Lys1d27zBJFS7;
 Fri, 14 Jul 2023 14:23:49 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 14:23:49 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd: open brace '{' following struct go on the same line
In-Reply-To: <20230714062152.13738-1-xujianghui@cdjrlc.com>
References: <20230714062152.13738-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <41b04a00f926becfd2ca9cd4c5406074@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the checkpatch error as open brace '{' following struct should
go on the same line.

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/include/atomfirmwareid.h | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmwareid.h 
b/drivers/gpu/drm/amd/include/atomfirmwareid.h
index e6256efd03ae..1ca5fe7b131b 100644
--- a/drivers/gpu/drm/amd/include/atomfirmwareid.h
+++ b/drivers/gpu/drm/amd/include/atomfirmwareid.h
@@ -28,8 +28,7 @@
  #ifndef _ATOMFIRMWAREID_H_
  #define _ATOMFIRMWAREID_H_

-enum atom_master_data_table_id
-{
+enum atom_master_data_table_id {
      VBIOS_DATA_TBL_ID__UTILITY_PIPELINE,
      VBIOS_DATA_TBL_ID__MULTIMEDIA_INF,
      VBIOS_DATA_TBL_ID__FIRMWARE_INF,
@@ -51,8 +50,7 @@ enum atom_master_data_table_id
      VBIOS_DATA_TBL_ID__UNDEFINED,
  };

-enum atom_master_command_table_id
-{
+enum atom_master_command_table_id {
      VBIOS_CMD_TBL_ID__ASIC_INIT,
      VBIOS_CMD_TBL_ID__DIGX_ENCODER_CONTROL,
      VBIOS_CMD_TBL_ID__SET_ENGINE_CLOCK,
