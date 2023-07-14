Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2C7532D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB3B10E7E5;
	Fri, 14 Jul 2023 07:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662410E013
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:20:56 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2Gvg6R9BzBR7b2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:20:47 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689304847; x=1691896848; bh=4RThHj/DNsNyooB75oPh9gIzWA4
 yeEuFdFd3SjfPcMY=; b=xbbO6lOgpFwD/BA1IFiZVSZDjHtlJSe9RMNxTkie6D9
 yU19LkyjYjax75jtvCX/ukSR8nupYhmz73JowPy7Y9HpgwTxvrc7k/5gRrGqdYml
 okGjarGNTNipRvqbWzqXy0hmwCOKGfRa2C5n2rfHEj1nlf/xXshg3egeOuhujlTY
 171xj6+ajhU0z4wqn+GOQZbxhclll25GXm/JUchqMzYmAs4VyJryaW71SxYmXjd0
 21eGWKUtZcpLXaShyOz3er0/UVS5X573SoKij3/4WTJIrIOtEYFFlO6DISkSUZnj
 Yf0aqfBgy2y6cl5jJ9AuFd4RD681IsP4boe8WUzi4TQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LruNFIOdB30T for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 11:20:47 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2Gvg3pGGzBJk54;
 Fri, 14 Jul 2023 11:20:47 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 11:20:47 +0800
From: shijie001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH] drm/radeon: ERROR: open brace '{' following function
 definitions go on the next line
In-Reply-To: <tencent_21616D4FB2F221FE67B71858B197C646AB08@qq.com>
References: <tencent_21616D4FB2F221FE67B71858B197C646AB08@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <50bf0cff1b048f24484f32ff0e5015f6@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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

Fix four occurrences of the checkpatch.pl error:
ERROR: open brace '{' following function definitions go on the next line

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_atpx_handler.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atpx_handler.c 
b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
index 6f93f54bf651..2a3c3f8b02e2 100644
--- a/drivers/gpu/drm/radeon/radeon_atpx_handler.c
+++ b/drivers/gpu/drm/radeon/radeon_atpx_handler.c
@@ -61,19 +61,23 @@ struct atpx_mux {
      u16 mux;
  } __packed;

-bool radeon_has_atpx(void) {
+bool radeon_has_atpx(void)
+{
      return radeon_atpx_priv.atpx_detected;
  }

-bool radeon_has_atpx_dgpu_power_cntl(void) {
+bool radeon_has_atpx_dgpu_power_cntl(void)
+{
      return radeon_atpx_priv.atpx.functions.power_cntl;
  }

-bool radeon_is_atpx_hybrid(void) {
+bool radeon_is_atpx_hybrid(void)
+{
      return radeon_atpx_priv.atpx.is_hybrid;
  }

-bool radeon_atpx_dgpu_req_power_for_displays(void) {
+bool radeon_atpx_dgpu_req_power_for_displays(void)
+{
      return radeon_atpx_priv.atpx.dgpu_req_power_for_displays;
  }
