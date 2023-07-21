Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B575BCD2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 05:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65210E612;
	Fri, 21 Jul 2023 03:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DA710E613
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:32:09 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R6ZqW19DYzBRDtJ
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:32:07 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689910327; x=1692502328; bh=DgngVkhS4Y2EpAg4Rz03E9/o90m
 U59SYiP+mSo3EkDk=; b=L92kgOZBjYxTAwTQMpz91K3P04x5FIHueeyz09mIhMH
 H2DAXpE9oaPeNeswRrcoTz+sRb5TuyVYRLwC0seqzyIyizXUVkrbpsU2rzMcZefm
 WhTozeLPQ+U31bhe+zPmc7JpPwAWTcCtCtwBFNlhDMHr67+SL6PKZhvtwIU3IN3o
 UtzXYA9w1ilXdcIFpDyAvf1/MQBarZBawBr0xrIakCHU4aA71Htd5XN9M1zk8Ew4
 r2i0U8JRSE5BN03n5JLjlTCCiXVCsSs5yBl2uUgwLvCN3k40ZVMVEDuxwqFsEBtJ
 gMM9m3jHEAbnMamkMsm2PTREL/mgTaIllwNQg/qYA/g==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ALEeqtzWXWus for <dri-devel@lists.freedesktop.org>;
 Fri, 21 Jul 2023 11:32:07 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R6ZqV5jSmzBRDrd;
 Fri, 21 Jul 2023 11:32:06 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 11:32:06 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: open brace '{' following struct go on the same
 line
In-Reply-To: <20230721033048.4840-1-xujianghui@cdjrlc.com>
References: <20230721033048.4840-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <d0906df99cdf6f76220e298bebaa5029@208suo.com>
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

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h 
b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
index 52045ad59bed..eec816f0cbf9 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
@@ -24,8 +24,7 @@
  #ifndef __AMDGPU_PM_H__
  #define __AMDGPU_PM_H__

-struct cg_flag_name
-{
+struct cg_flag_name {
  	u64 flag;
  	const char *name;
  };
