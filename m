Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800E21C9F4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jul 2020 17:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7446E461;
	Sun, 12 Jul 2020 15:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1226E461
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594567506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=n8o3ePgic4naJPCVQ1wtcacm70aGxOgRT3KJzb6/xpk=;
 b=Mg4gpOJjeEoaWdQBab5L0RUVWlFXvCQVPTdiOAhGB+Aswew3WjDfpiJrmbiJeg5bFr7XSo
 n+t/8gfCrjKyI1ape+oHp8EyXl04MEeQrk9LzZttRb6f00Gh4RXsQSUZudvFrh4K5pk4ad
 T0dU3SXfeDS/6usxmaUDMR2nP/35y34=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-U-U5Q_G0O-y-HcHCYxKKWw-1; Sun, 12 Jul 2020 11:25:02 -0400
X-MC-Unique: U-U5Q_G0O-y-HcHCYxKKWw-1
Received: by mail-qk1-f197.google.com with SMTP id q192so8849689qka.13
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 08:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n8o3ePgic4naJPCVQ1wtcacm70aGxOgRT3KJzb6/xpk=;
 b=Uf1vIHCFEG4+6ev/CPAyPijxpoblKaYAJ3d+y/DeFC8mDj5xRDIOv157rpIj5BKRSw
 B3uN1dKQr2IEfczqSYlwDb37h8naTu8mS5xmaxhEFhA9KgHZySYP+S65vQd5xwU9raiM
 pLUwzNhsNVCA5zTN0siLWEbKH+QlGinzSAq5Mw/VFMVqqwGh1FSKflBUfIQX/EvRdrGm
 j1PRXPb+4BPSMWAVgkRbQ9Xk5FrWtJ+bNE8l2ieM2aE2c7efhMo0MPTJYQiXGz9Jyx42
 cc+uY6qu33tMRJYtsYomRZ/eC0QcRGPlF5JhEh1HBvfM9wivgK83B9Rl/4h62p8asxeq
 EltQ==
X-Gm-Message-State: AOAM532ZRQha+HGhmmYFs4akf7cQQLnTAC9wCzs8jDeSQzc2QmwYO07O
 0tU+GwQoyoDrrM4cL86x1TuZRZnY63bO/cCJPqlN/x1E60XIHCAoV5yA18xq0pIZ3mdw60CopKg
 wR2UhsFNF9JZjvwYp7yyuaH6ES3GA
X-Received: by 2002:ac8:19ad:: with SMTP id u42mr81124466qtj.168.1594567501940; 
 Sun, 12 Jul 2020 08:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl77Yeo2vRgSclJ0lpU+vhDmXAKPXH0ay/FXIRBXDB1L7WTw8VZGr76FSRgh/J2hBHT9EZkA==
X-Received: by 2002:ac8:19ad:: with SMTP id u42mr81124448qtj.168.1594567501723; 
 Sun, 12 Jul 2020 08:25:01 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id o20sm16321336qtk.56.2020.07.12.08.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 08:25:00 -0700 (PDT)
From: trix@redhat.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 architt@codeaurora.org
Subject: [PATCH] drm/bridge: sil_sii8620: initialize return of sii8620_readb
Date: Sun, 12 Jul 2020 08:24:53 -0700
Message-Id: <20200712152453.27510-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

sil-sii8620.c:184:2: warning: Undefined or garbage value
  returned to caller [core.uninitialized.UndefReturn]
        return ret;
        ^~~~~~~~~~

sii8620_readb calls sii8620_read_buf.
sii8620_read_buf can return without setting its output
pararmeter 'ret'.

So initialize ret.

Fixes: ce6e153f414a ("drm/bridge: add Silicon Image SiI8620 driver")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 3540e4931383..da933d477e5f 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -178,7 +178,7 @@ static void sii8620_read_buf(struct sii8620 *ctx, u16 addr, u8 *buf, int len)
 
 static u8 sii8620_readb(struct sii8620 *ctx, u16 addr)
 {
-	u8 ret;
+	u8 ret = 0;
 
 	sii8620_read_buf(ctx, addr, &ret, 1);
 	return ret;
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
