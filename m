Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A877C3630E3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 17:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6576E48E;
	Sat, 17 Apr 2021 15:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2A6E48E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 15:35:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w18so35764862edc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95k7us3S0EVfXXTef/Cp2MnyUY4IkdXtTZcLiNqfFkw=;
 b=P90KopaV22vpZbHNYLrl8cx61pnUeDJXZaqv2xJVGGI9X9sOqH2GwpNVc48J1gbQUo
 ngTvIDx9hTuGxl06vNYjLTaKVdQojITh1dwEuo+LhVaYFNUciRqAY0N/dkg3jpUTAcBu
 vrl1jKb1vISr+KVpIOde3BTVDvzZ86iV4ouNew/lpv+dP36PRWrBM1A3S4WA83w+YPA+
 hJyCd2uvcFwQt6b+Mu3ZctmPNBXuIuIybJMkHwr+zSKUfj5gKbitDM6xt9aX7BBpjLLb
 7NXf0OM77TGsq8Jzn6dqMBPK1B7w6PTJlQuighiCLSNh+fAkbYi8aa2pMjBeEGULNoyC
 xR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95k7us3S0EVfXXTef/Cp2MnyUY4IkdXtTZcLiNqfFkw=;
 b=kBK5HS/uy3vu3nychMZfoEsHJA46mpv+49EhlYDbBtSh8SUn7iIY5VM1KtWF2wYAbq
 0gGSmvNB940VJhvefTElSDhqv84KczeoSIpN3SO8vH5FcNh3xbhTAV3Fw13n/USO934m
 +iZsL2WHr/3cJQr5jFXDspDmTUrq8GtjLhP3eQ4Z6HrsHtL+/4lNw0ffr83+MLV78mmM
 EjvWA5Kk4qk8nKJ4DgioydpT16bzZ0CxzBGKGsCIfoBMkSH88ACgP1Xv8DUM5MWlI2aP
 66Wkmmts6D1dqpp9umoEaftWFNeTMmrZXzjCOwBcpLxqb6kYb3wk1KtpSe8+y0Q+LIWd
 pMDg==
X-Gm-Message-State: AOAM533fZzT+hE2tv0N7Cgy0txq/upjARJTlDe2CatYpz09HkWDtbGar
 POxDP2A2GubLuSTZkVWDz4E=
X-Google-Smtp-Source: ABdhPJwSlIULN6LhfZSdlUZrTPNuLEybmOOyT7rOuRzq320C2ObyzEYF5a6VJ4a0IoCK9hEH5EZE9w==
X-Received: by 2002:a50:ee88:: with SMTP id f8mr16346181edr.69.1618673744809; 
 Sat, 17 Apr 2021 08:35:44 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id x9sm8396491edv.22.2021.04.17.08.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 08:35:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH Resend] drm/drm_bufs.c: In switch, add break in default case
Date: Sat, 17 Apr 2021 17:35:40 +0200
Message-Id: <20210417153540.22017-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added a 'break' in the default case of a switch selection statement.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index e3d77dfefb0a..fc40aa0adf73 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -79,7 +79,7 @@ static struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
 				return entry;
 			break;
 		default: /* Make gcc happy */
-			;
+			break;
 		}
 		if (entry->map->offset == map->offset)
 			return entry;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
