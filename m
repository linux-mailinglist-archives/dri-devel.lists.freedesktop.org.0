Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43415898A6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15690360;
	Thu,  4 Aug 2022 07:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550E8FEA6;
 Thu,  4 Aug 2022 07:50:50 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oJVd0-0002Ss-4W; Thu, 04 Aug 2022 07:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@redhat.com>) id 1oJTmG-0002bb-CY
 for dri-devel@lists.sourceforge.net; Thu, 04 Aug 2022 05:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cev55DyzC4odc+3YqhUlZqMO2fmB6uB34qSnSGdGLMo=; b=EjjoIAY/QWfFQVh/G7V+Ud9HnA
 WyruQdWQIHSyFzJrsP17ZrJhQcpoXLPLCxDK0VfCW4bVxaQ4CycAhkrYLZEgWXRTFncA6D39IbEL+
 QluqPPEi4yDi4HwgnGPcOy9xUKCRC8QbKClR9S39w4yeW42UhAuzn50GzvTVtCFYKJus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cev55DyzC4odc+3YqhUlZqMO2fmB6uB34qSnSGdGLMo=; b=Y
 bVwI+GI7S5R5xm1ChWiwXGo9NKJTVJDSPgQCuaZW+0l3E8Tqe+retY87WJ3S7fLUO1f/X+nh2ux4T
 yB/6r0gN1Fhjtcby+tOJCjiPk2skwx7bqunsLP//HCSsr7OIdmk71KjiBNSD+JwTIJTX7J9iS8Y50
 f0XJfyG7Put3aSto=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJTmA-0000rH-PD
 for dri-devel@lists.sourceforge.net; Thu, 04 Aug 2022 05:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659592320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cev55DyzC4odc+3YqhUlZqMO2fmB6uB34qSnSGdGLMo=;
 b=c0v7ijXtWBjVMyhyjFwgcxMPpO0hYJCJ4pdf6lWwAJP3MZgeoCEPkQ52U9r4ViX8igAkgS
 nwi+Gz0Yl9Ga81XqITGK/HBRaB7anyS2Xr5cx1BH3ZvGIiLznyAANV0Lp5XgrjFE08yy8Z
 yjeGBaqvfhr+VB4izI8ibu3VD+zXpkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-xLw5-T0PN7S3FRc7P6Pr9g-1; Thu, 04 Aug 2022 01:50:25 -0400
X-MC-Unique: xLw5-T0PN7S3FRc7P6Pr9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D74F101A54E;
 Thu,  4 Aug 2022 05:50:24 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD38B2166B26;
 Thu,  4 Aug 2022 05:50:22 +0000 (UTC)
From: Dave Airlie <airlied@redhat.com>
To: torvalds@linux-foundation.org
Subject: [PATCH] drm/amd/display: restore plane with no modifiers code.
Date: Thu,  4 Aug 2022 15:50:20 +1000
Message-Id: <20220804055020.691656-1-airlied@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When this file was split in
 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
 Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> Date: Wed Jul 20 15:31:42
 2022 -0400 drm/amd/display: Create a file dedicated to planes 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJTmA-0000rH-PD
X-Mailman-Approved-At: Thu, 04 Aug 2022 07:50:43 +0000
X-BeenThere: dri-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Dave Airlie <airlied@redhat.com>, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.sf.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When this file was split in

5d945cbcd4b16a29d6470a80dfb19738f9a4319f
Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date:   Wed Jul 20 15:31:42 2022 -0400

drm/amd/display: Create a file dedicated to planes

This chunk seemed to get dropped. Linus noticed on this
rx580 and I've reproduced on FIJI which makes sense as these
are pre-modifier GPUs.

With this applied, I get gdm back.

Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8cd25b2ea0dc..b841b8b0a9d8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1591,6 +1591,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	if (res)
 		return res;
 
+	if (modifiers == NULL)
+		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
+
 	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
 				       modifiers, plane->type, NULL);
-- 
2.37.1



--
_______________________________________________
Dri-devel mailing list
Dri-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/dri-devel
