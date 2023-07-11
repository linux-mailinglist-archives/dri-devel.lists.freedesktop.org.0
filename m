Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA574E6B1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBEF10E2FF;
	Tue, 11 Jul 2023 06:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF53B10E300
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:02:24 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0VdT4WwhzBHXhj
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:02:21 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1689055341; x=
 1691647342; bh=b8hHmnhwvioMharC+I07LYQUBP9wCvt66s8t620cj4Q=; b=w
 dbJGMo0nVLe2DWkBtDsi8YtwM3YH6gPv6HcGhtYzzW/EWyMnpWHVpalIFqIgv29z
 SXrKueWZZ5BR2XU5ttgkXHxofMbj7ZKwo3vPDqOUYmyeIlWIPBeVdyFF5vjyuqIG
 Xy3NTTwBAwDjlVolprl3yN91NL7qPxeGIaZ7chE7ebIbc3jmeiz91Kqfqi6WqSGB
 r4aHpUKd2mDrzm1vZQ/QriOOO3/Z7yOohbF7bIYuJwni/T+bYFIHKguefIqS0z0B
 Si0GkWML2+wIr6p3ppWiLxFx/KpQTIqXGY1If779s2N+59BrFC/1n+dMlnMrnhrH
 99Res6epkSnE3Nv630+pQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KyXL1JV7nA_W for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 14:02:21 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0VdT21Z1zBHXgj;
 Tue, 11 Jul 2023 14:02:21 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 14:02:21 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/flcn/qmgr: add missing spaces after ','
In-Reply-To: <20230711060037.79553-1-xujianghui@cdjrlc.com>
References: <20230711060037.79553-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <508482277025753b619a7595d7ff7e2e@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_03b51b7bf49e88ad5069713b3d20b154"
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

--=_03b51b7bf49e88ad5069713b3d20b154
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Add missing spaces to clear checkpatch errors.

ERROR: space required before the open brace ','

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h 
b/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h
index 79f0da9e749f..0503183d7ca8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h
@@ -82,7 +82,7 @@ struct nvkm_falcon_msgq {
      u32 position;
  };

-#define FLCNQ_PRINTK(q,l,p,f,a...) FLCN_PRINTK((q)->qmgr->falcon, l, p, 
"%s: "f, (q)->name, ##a)
-#define FLCNQ_DBG(q,f,a...) FLCNQ_PRINTK((q), DEBUG, info, f, ##a)
-#define FLCNQ_ERR(q,f,a...) FLCNQ_PRINTK((q), ERROR, err, f, ##a)
+#define FLCNQ_PRINTK(q, l, p, f, a...) FLCN_PRINTK((q)->qmgr->falcon, 
l, p, "%s: "f, (q)->name, ##a)
+#define FLCNQ_DBG(q, f, a...) FLCNQ_PRINTK((q), DEBUG, info, f, ##a)
+#define FLCNQ_ERR(q, f, a...) FLCNQ_PRINTK((q), ERROR, err, f, ##a)
  #endif
--=_03b51b7bf49e88ad5069713b3d20b154
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Add missing spaces to clear checkpatch errors.<br /><br />ERROR: space requ=
ired before the open brace ','<br /><br />Signed-off-by: Ran Sun &lt;sunran=
001@208suo.com&gt;<br />---<br />&nbsp;drivers/gpu/drm/nouveau/nvkm/falcon/=
qmgr.h | 6 +++---<br />&nbsp;1 file changed, 3 insertions(+), 3 deletions(-=
)<br /><br />diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h b/driv=
ers/gpu/drm/nouveau/nvkm/falcon/qmgr.h<br />index 79f0da9e749f..0503183d7ca=
8 100644<br />--- a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h<br />+++ b/d=
rivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h<br />@@ -82,7 +82,7 @@ struct nvk=
m_falcon_msgq {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32 position;<br />&nbsp=
;};<br />&nbsp;<br />-#define FLCNQ_PRINTK(q,l,p,f,a...) FLCN_PRINTK((q)-&g=
t;qmgr-&gt;falcon, l, p, "%s: "f, (q)-&gt;name, ##a)<br />-#define FLCNQ_DB=
G(q,f,a...) FLCNQ_PRINTK((q), DEBUG, info, f, ##a)<br />-#define FLCNQ_ERR(=
q,f,a...) FLCNQ_PRINTK((q), ERROR, err, f, ##a)<br />+#define FLCNQ_PRINTK(=
q, l, p, f, a...) FLCN_PRINTK((q)-&gt;qmgr-&gt;falcon, l, p, "%s: "f, (q)-&=
gt;name, ##a)<br />+#define FLCNQ_DBG(q, f, a...) FLCNQ_PRINTK((q), DEBUG, =
info, f, ##a)<br />+#define FLCNQ_ERR(q, f, a...) FLCNQ_PRINTK((q), ERROR, =
err, f, ##a)<br />&nbsp;#endif</div>

</body></html>

--=_03b51b7bf49e88ad5069713b3d20b154--
