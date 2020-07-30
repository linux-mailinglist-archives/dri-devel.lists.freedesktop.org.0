Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02897234024
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84B6EA00;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2076E910
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1596120515; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=PQkagFlHg2d5KzpMhd8eaAxlglNrzK6R7YdWS3ZyGw4=;
 b=sbJRwlRK3mtagHtlYLsdJFIW4k1HPOaVFrpjnzDiEG3pXKa7gEgPCqU7BblfEKlP82y1dC
 KXbB8FeCnXzylEiIGcay6gw6ErwCczxxP7VDPZ4Z6aMsxiK+ZGbyoEk4txRNoSYdExm8k+
 wx/gDYHCncKFNc1iSlFn/ZKtqhy+rNg=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] More IPU cleanups v2
Date: Thu, 30 Jul 2020 16:48:27 +0200
Message-Id: <20200730144830.10479-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch [1/3] unchanged. Patches [2/3] and [3/3] have had their commit
message slightly modified, but the patches themselves are the same as
before.

Cheers,
-Paul

Paul Cercueil (3):
  drm/ingenic: ipu: Only restart manually on older SoCs
  drm/ingenic: ipu: Remove YUV422 from supported formats on JZ4725B
  drm/ingenic: ipu: Only enable clock when needed

 drivers/gpu/drm/ingenic/ingenic-ipu.c | 38 +++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
