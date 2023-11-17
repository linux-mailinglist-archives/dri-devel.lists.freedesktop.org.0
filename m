Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939857EF7F6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C937A10E08F;
	Fri, 17 Nov 2023 19:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350A810E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:11 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ce532451c7so1315301a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250250; x=1700855050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C4qt5noB2waU9XRSIdTCR/Lov9epw7YFPpnGxyLNO/Y=;
 b=UYOxZh6Cw2YTAYaPfYhT74BfMzvjhobFzSFzyij1rxh2AWyugUMnYhH7TzQehiEiIK
 5BvtbvSwKjCM+MSQ3YF1WUAezBvAMQ2r5vpEDAVYGCzdEIE5WcojvsMeFEJx8klQvhBW
 D2qvXPdNcT5w6LtKI6/2fl0ZpVNuCmjnzEHsNUyamPrzKxw/jNgjToERW4d7II3rJ8v1
 iFOKdWx2e2c1vXVh79nyGR8JRMTZOSch0ZYn07ZI1DB+V1s49XT2hMEgt6vevFhtRXQu
 Ak2lDUYPWhzYFMlflhzoxiSCXByVeiEgpUeC1ABZkOX2m6MyzR7pjBH3xU9JDjE3bY7/
 WSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250250; x=1700855050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C4qt5noB2waU9XRSIdTCR/Lov9epw7YFPpnGxyLNO/Y=;
 b=vNA3bgGCIqJRNWA9xT6C1Mneg3BG/W6hA6dY+8mxna/ef1uCDLrZWRIwsHJqPOU1u8
 PkjvDxzB+GccMHJHw6tapSq4VT3ynCZs9Ov1YVtfr3lD3sOk8Z01G2hYoAEc7qfXPjbZ
 uEiIY0aT0aUFBJepPPpYfm0G+/O+ZOiMrw1KcGhcIOL5+9KMySSYTZMp/cfmS+443vDX
 hHzyjrGrdbpyycujRntLSMKDj0t6LqVozJ15MOJzn5RMptOPUZkgjLf/X6pSyDgD4K/5
 SCcjAoElUgSN3zjtfLQqEfmMwxJS4myDLVdVyrly6IjVI4Za7hgpOLuoamYPsU/0auJm
 NIrA==
X-Gm-Message-State: AOJu0YyLBpu2T1URCwgTV8UNucRLaLQfPbdysk+3tT2H98PY7oda8LXD
 +XW2FeLWzAfKTcpxQ+0Mt2zULTQYNQ0=
X-Google-Smtp-Source: AGHT+IElDectyNgNdm7PIJQdZ13k0RdpEpNfU989X+B6kjo43TBwA0gs5jIGYHHMBm187BVajbYNKg==
X-Received: by 2002:a9d:6957:0:b0:6d3:2018:cea8 with SMTP id
 p23-20020a9d6957000000b006d32018cea8mr222154oto.10.1700250250221; 
 Fri, 17 Nov 2023 11:44:10 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:09 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/5] Elida KD35T133 Panel Improvements
Date: Fri, 17 Nov 2023 13:44:00 -0600
Message-Id: <20231117194405.1386265-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Fix a few bugs and clean up no longer needed code on the Elida KD35T133
DSI panel, as used in devices such as the Odroid Go Advance and the
Anbernic RG351M.

Changes since V1:
 - Split removal of shutdown logic into a new patch independent of
   dropping of prepared tracking.
 - Added fixes to patch holding panel in reset after unprepare.

Chris Morgan (5):
  drm/panel-elida-kd35t133: trival: update panel size from  5.5 to 3.5
  drm/panel-elida-kd35t133: hold panel in reset for unprepare
  drm/panel-elida-kd35t133: drop
    drm_connector_set_orientation_from_panel
  drm/panel-elida-kd35t133: Drop shutdown logic
  drm/panel-elida-kd35t133: Drop prepare/unprepare logic

 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 37 ++------------------
 1 file changed, 3 insertions(+), 34 deletions(-)

-- 
2.34.1

