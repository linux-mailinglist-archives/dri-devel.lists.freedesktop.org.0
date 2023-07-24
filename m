Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDE75E9FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 05:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85F10E0C8;
	Mon, 24 Jul 2023 03:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33A10E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 03:12:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8QFY26VPzBRYmP
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:12:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690168353; x=1692760354; bh=PeoMidOEMI3JSDJGBb091hI84X2
 Ct+kfKaZVoMaGZhA=; b=CH6gqrxpc/TianuFvYJ/o1QZcC1yio3PdkYEPj8TxoD
 enMsngN2X+B51XOUJWsQGAeOMmlauz4TL5j1aY1MmYQ5j4dIsQ6REDsGO5gFswvM
 RgRCdIQPAGgjxIvOppWpYJ62TicwJFftx+9P03XlzXbY8YJGIu4AoMlNWSFO/a4z
 c0x6EtYKxSKVMoAHSQG3x0WX0XuNAZ8SmtLbpLh39sRN6QxKEu0j6F1vXCSp1WCv
 XVpiiIf2A8Mm1HgVRlHN8j3xLXkKhDDlvso57Dr7Im3ScR16JNjTayokQGezd8zg
 MqnaO4xCtVUWaMJfD4BFS/3f1dpBVD8Hk/kMi9qVj+Q==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gey_000WqF1a for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 11:12:33 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8QFX6RcdzBRDrF;
 Mon, 24 Jul 2023 11:12:32 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 11:12:32 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: that open brace { should be on the previous line
In-Reply-To: <20230724031126.7694-1-xujianghui@cdjrlc.com>
References: <20230724031126.7694-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <3a9a96f2b98642a86bdc33c3149cac97@208suo.com>
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

ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/ni_dpm.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c 
b/drivers/gpu/drm/radeon/ni_dpm.c
index a101ba00ea30..1cf4de4cda23 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -625,7 +625,7 @@ static const u32 cayman_mgcg_disable[] =
  };
  #define CAYMAN_MGCG_DISABLE_LENGTH   sizeof(cayman_mgcg_disable) / (3 * 
sizeof(u32))

-static const u32 cayman_mgcg_enable[] = :621 {
+static const u32 cayman_mgcg_enable[] = : 621 {
  	0x0000802c, 0xc0000000, 0xffffffff,
  	0x000008f8, 0x00000000, 0xffffffff,
  	0x000008fc, 0x00000000, 0xffffffff,
