Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F8734CA0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DB410E10B;
	Mon, 19 Jun 2023 07:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Sun, 18 Jun 2023 14:57:41 UTC
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C8710E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:57:41 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QkbRm09y5zBJJDR
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 22:50:44 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1687099843; x=
 1689691844; bh=9I6glscpjBj02GuOQtI7Ot6zx0jL+fQjdixoxTgpGgk=; b=b
 d9zHv5SGMAsXGKPCcwxsZ+av4lfmVxHJb26MlxxUGG/p6rEXpBk2DJuUGuiodP8u
 6wSe5I46dFDLWV2E+srktuhvo5LiEONfrDVZILSFnfy6kbIViG3z42eX2YlonGr4
 ngX1JzDMGN4JFNPkADP0LZnqj/ANNBakm1WtFcBhEm+4J5YhSEyMcj/Q7BhrnUw4
 9tPkT05snvg3LvPOs4LGXOWnh2+MSwQ9OWlhvnqXoTTdoyhc9y9tRYankOzhjKWo
 fGJjKHxQvNCu4+wQVxQgt+kqGWxEHq5Ac1GPTIs0C2OaAGDuHFmuJ/6U6l76I68N
 ZA9vmj7LTcvraXnoEg6UQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rRWGQH1bYMz3 for <dri-devel@lists.freedesktop.org>;
 Sun, 18 Jun 2023 22:50:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QkbRl3N9nzBJJDJ;
 Sun, 18 Jun 2023 22:50:43 +0800 (CST)
MIME-Version: 1.0
Date: Sun, 18 Jun 2023 22:50:43 +0800
From: zhumao001@208suo.com
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 jstultz@google.com, christian.koenig@amd.com
Subject: [PATCH] dma-buf: heaps: Delete repeated word
In-Reply-To: <20230618143813.15142-3-dengshaomin@cdjrlc.com>
References: <20230618143813.15142-1-dengshaomin@cdjrlc.com>
 <20230618143813.15142-3-dengshaomin@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <0c1649d3a7eca54b639b3990c186f482@208suo.com>
X-Sender: zhumao001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_01043f953cab5d91a525f07322fa9c8f"
X-Mailman-Approved-At: Mon, 19 Jun 2023 07:45:35 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_01043f953cab5d91a525f07322fa9c8f
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Delete one of the rebundant word in comment.

Signed-off-by: Zhu Mao <zhumao001@208suo.com>
---
  drivers/dma-buf/heaps/cma_heap.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c 
b/drivers/dma-buf/heaps/cma_heap.c
index a7f048048864..80bc95955188 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -319,7 +319,7 @@ static struct dma_buf *cma_heap_allocate(struct 
dma_heap *heap,
              kunmap_atomic(vaddr);
              /*
               * Avoid wasting time zeroing memory if the process
-             * has been killed by by SIGKILL
+             * has been killed by SIGKILL
               */
              if (fatal_signal_pending(current))
                  goto free_cma;
--=_01043f953cab5d91a525f07322fa9c8f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Delete one of the rebundant word in comment.<br /><br />Signed-off-by: Zhu =
Mao &lt;zhumao001@208suo.com&gt;<br />---<br />&nbsp;drivers/dma-buf/heaps/=
cma_heap.c | 2 +-<br />&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<=
br /><br />diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/=
heaps/cma_heap.c<br />index a7f048048864..80bc95955188 100644<br />--- a/dr=
ivers/dma-buf/heaps/cma_heap.c<br />+++ b/drivers/dma-buf/heaps/cma_heap.c<=
br />@@ -319,7 +319,7 @@ static struct dma_buf *cma_heap_allocate(struct dm=
a_heap *heap,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;kunmap_atomic(vaddr);<br />&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br />&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Avoi=
d wasting time zeroing memory if the process<br />- &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* has been killed by by SI=
GKILL<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;* has been killed by SIGKILL<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fatal_s=
ignal_pending(current))<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto free_cma;</div>

</body></html>

--=_01043f953cab5d91a525f07322fa9c8f--
