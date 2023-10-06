Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04517BC08C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 22:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334D810E56B;
	Fri,  6 Oct 2023 20:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAAA10E563
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 20:42:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c3d8fb23d9so19870585ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696624928; x=1697229728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkHUGyeeQEUIOHI53+FOR6+UrclISQhPbCFOjW4q478=;
 b=k1tQyB79zAOMM9oXfdFcms27h+wr9hXbq0pgLyVshnUKqsJOxGG0Tjbsu45Pj55jy6
 jmufk1FusrSKj+1HbmJa5ehTKptOT+Sj+gUadxO6+WwvLavCPe2F4NdpW2MII6BIq1bk
 CWA38W2haZCv+/vBTAlH595EcgLE4inQVlqBvHo879/VuU/9eaYOkUYHQOcwxTokbpFp
 fsdB0qo2Dt3RDP1A+U/9l7InbCVZoKRvuSgOondeUSfVW8EcwJvgmubf7DW6LGjwBmWC
 O4jBdBPFMl3NSpNFi3MKq3ku8d/8a1cLL3QKWefe7HvZjqAmn6QU4yNuEl3H91yCEGYI
 PHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696624928; x=1697229728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkHUGyeeQEUIOHI53+FOR6+UrclISQhPbCFOjW4q478=;
 b=c7cHCm6gdvJrwS99VklbFy1XBlx3hLQKBlrh7G9aX3COfZ9vPAsXr2dUtdDP8BPn9I
 T0hc5Q0pNFppUf5jdM3mIjaW9NOP+P/MYrR57xdkd0Qr7sxMZmyN3LP9Suqj3sxLiPE2
 VcMZtiK65YslejNCyCvEzACJs9oI9ET9AjbqrSQrpsS6IDvCN+1Ho2Y9lWxD+1n7JUwr
 eUZv1FG60b89gZOD40TacoJPcpV2ndf0sCStXWQ2AEyrF+C7zG9VyddmVB6oYMfmJbTD
 in36gYGkblBFmyS2vtTYuGc3fUkrXg9r2OrG1cUGTuZEb/m/u+uqrdljW4UcetkrKxjs
 Ixjw==
X-Gm-Message-State: AOJu0YxdL2w8ImuIATB1R3b5hKDrxe2KoSVb2ACNBc/TJEdaDzidpJdG
 gssePAFf+/XqyA7lPaUYttU=
X-Google-Smtp-Source: AGHT+IFfUzWXcx4HOcloTttGcPyfnC7vf2Gwxm544SnsMKXrXiCHSuB4oHgc+C+zXJDGFPPHZUnsvg==
X-Received: by 2002:a17:902:d2ce:b0:1c6:291e:24b6 with SMTP id
 n14-20020a170902d2ce00b001c6291e24b6mr11062023plc.37.1696624927793; 
 Fri, 06 Oct 2023 13:42:07 -0700 (PDT)
Received: from local.lan ([181.197.224.5]) by smtp.gmail.com with ESMTPSA id
 10-20020a170902c20a00b001ae0152d280sm4355712pll.193.2023.10.06.13.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 13:42:07 -0700 (PDT)
From: Jorge Maidana <jorgem.linux@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] fbdev/uvesafb: Remove uvesafb_exec() prototype from
 include/video/uvesafb.h
Date: Fri,  6 Oct 2023 17:43:46 -0300
Message-Id: <20231006204347.2594-1-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

uvesafb_exec() is a static function defined and called only in
drivers/video/fbdev/uvesafb.c, remove the prototype from
include/video/uvesafb.h.

Fixes the warning:
./include/video/uvesafb.h:112:12: warning: 'uvesafb_exec' declared 'static' but never defined [-Wunused-function]
when including '<video/uvesafb.h>' in an external program.

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 include/video/uvesafb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/video/uvesafb.h b/include/video/uvesafb.h
index 8d2a3bfc8..47d96e75e 100644
--- a/include/video/uvesafb.h
+++ b/include/video/uvesafb.h
@@ -109,8 +109,6 @@ struct uvesafb_ktask {
 	u32 ack;
 };
 
-static int uvesafb_exec(struct uvesafb_ktask *tsk);
-
 #define UVESAFB_EXACT_RES	1
 #define UVESAFB_EXACT_DEPTH	2
 
-- 
2.30.2

