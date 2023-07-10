Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D64C74CE24
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA3B10E1C0;
	Mon, 10 Jul 2023 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525A010E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:11:37 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzttY0sS2zBHXgy
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:11:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688969492; x=1691561493; bh=azaJMEJAgL47SIIml1shBWGLWae
 rskcRy12zpLCLts0=; b=dA5Ro6S2v9dpjMVbyDn97YTVeqaEvSTZRHV9OmE6O4n
 KAFHOMBfDzniX1jwJk5AW4EZLg7SKBt6BTyR+SpYlk5o5E3JqH7P39BbRxaNQz+A
 cwc34INwJWAe/JGHjn7ckj4U9mmLYj5zNNt6vaCvR1R5lCY85Wz/m0VmYOctW3rH
 r3w9qLvD0upxPbkgZ0mDvzLKO9zdbeKGGcbpEpvVZWbI/zcfMRSYIDFXzo73pTo4
 +feEpWcj9YyyRkpqSAVYFMESlzMF6Wym1wcUJjrTto/LQTErBGNXIr1EdLkSf7pg
 vk0yps3mK1SL0Lp3q8vW4t+z7ArM3+B7/YQC88si3LQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PHQNRXRYgrKg for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:11:32 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzttX52cdzBHXgl;
 Mon, 10 Jul 2023 14:11:32 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:11:32 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
In-Reply-To: <20230710055219.53210-1-xujianghui@cdjrlc.com>
References: <20230710055219.53210-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2fb128f812c7bf59d7af52193e307cdc@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c | 0
  1 file changed, 0 insertions(+), 0 deletions(-)
  mode change 100755 => 100644 
drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c
old mode 100755
new mode 100644
