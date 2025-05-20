Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C013EABED5B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6B10E129;
	Wed, 21 May 2025 07:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCUPWG67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFD110E485
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 12:43:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a35b7e60cbso3591226f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747745029; x=1748349829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2oupSw0jmhW845RsR27QnK12DgltGY1gE9K5C6v+m3E=;
 b=WCUPWG67HMh15TnHWIG6qBgSVcTUj/KoWr5IVBa6N0MnHJdOuNR0/PvpIlFannoVER
 GRPFD2NzyeUfNfmNT3MgUciezRoEy9Y/y2cAh1EgqRB9ZtIO9AAr/1Ov8HEDTAl7St62
 yhN5CR6XAUlFzHG40/UjUvATWLHLJUwyyGJ6YHoHxz4NqSPkbxxq/7o+NWpIcCl9SMA2
 QZVbxumas3pVArUX1yIfQsfPaPgJHTyPeD8/yJiP6gsxgiRFj2h6p+jW0VvmXxjz5psJ
 WpcHlU7RLQLAxiCXhINDhJk1XG7kW0braZs1/vcrKV7bMXQbkWZ/0hM8Dsb510OEvM0B
 XIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747745029; x=1748349829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oupSw0jmhW845RsR27QnK12DgltGY1gE9K5C6v+m3E=;
 b=l/+WJ/fnJIEScB3xpz2tNrgbMKxYQEoSIlDjhqocGKMI2wYfqSm4hgDHKYdY4xVY7U
 lfRP8LUDnpOdPoZ0cHXNPt08FbYM8B5lMKWFjUPlGbblMaFVwuf0NyhBbFy0p4fgFB5R
 hXbhrmEHHQqHUGK43ZL2MTIX4rQF+eMN6YH+oWXkcdJPPhUdE65wZV86yHZJgVMIEjGs
 uwIeC50PaeFVYdVBrlrtbtmmm2a6weA1Du1guZR9sHfClb7+J1y2cgEHE2eTG9QcIbhj
 eWvwmOHFg1/1BHxZ52To9RUl+90xIZFZl3TJmBGRfh4twLYRNbHv1SDyis4r4TBvvRzn
 /E2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvJP3sa4zhhNUJwtyMxtSSPzujc968vZJObu2EMeovfmKtKglrgYLG7T1VU/JwAkTYR6bpyBfsPdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxr/woEO7Fjj26p2nH9UQxP6BN2ay6cHiiKbcGwERqKCd0vcL0
 SNaC2cgN7cQrXQFBrZrF5cehnr7CAIa5pLe8mbUSjlCxzKiu51TMLl3H
X-Gm-Gg: ASbGncslzncaMOFFlRFQEmSA+/uzlS9pAjeoACq8mqkHqrVzCOiweXHX3pP/zlW63tO
 iGwTuEjyO2Ny8ZBlAP2e7b3/3bZzr1/LMqVVbw+Ef2wEYjjh/X+EnhSGwfxb66pX4Y9OQqpMhee
 rKQH18esRZPyvEkXzyS+0hv0Fl3q1XuurtNp/oUxfmIedZBKdGUgAcIXPITohGlOO3uDhcjXOy+
 GT+952QdFSlyGn42Ws/oY0oLczwDekpt/gc0xaeOnH1mwhwm/vPJfTR44SHFqlYsZN4E9Iiv87i
 fQAInpLaa9HUt7u6kyyVoQyR7qkegqmYjnHvNkEpxKAyOC3+IK0sShFZ53Hah4CwDiblHt40vwM
 wQTPfQgybhg/vt4DqAxiRWz5/dNml1UciYwTH1VML3sgUu2NIcRvOtA2dYsgDrwZUoyZDzTMQEi
 A=
X-Google-Smtp-Source: AGHT+IHVv4M5EAujyQEVcJsKFqGc6F8fpLpKxczpm8CuZ8FVgi9qM4XICzD4bScwGZgCB+wKuOM8KQ==
X-Received: by 2002:adf:ff8f:0:b0:3a3:598f:5a97 with SMTP id
 ffacd0b85a97d-3a3598f5d50mr12866479f8f.9.1747745029376; 
 Tue, 20 May 2025 05:43:49 -0700 (PDT)
Received: from ernest.corp.toradex.com
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88735sm16667546f8f.69.2025.05.20.05.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 05:43:49 -0700 (PDT)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
Date: Tue, 20 May 2025 14:43:28 +0200
Message-ID: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 May 2025 07:57:38 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

AUO G156HAN03.0 EDID:

00 ff ff ff ff ff ff 00 06 af ed 30 00 00 00 00
1a 1c 01 04 a5 22 13 78 02 05 b5 94 59 59 92 28
1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 78 37 80 b4 70 38 2e 40 6c 30
aa 00 58 c1 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 47 31 35 36 48 41 4e 30 33 2e 30 20 0a 00 bb

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 00dae545832e..9adbe0f11421 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1869,6 +1869,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x30ed, &delay_200_500_e50, "G156HAN03.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAN04.0"),
 	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
-- 
2.43.0

