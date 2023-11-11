Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849387E89D6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EEF10E256;
	Sat, 11 Nov 2023 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D4310E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:30:05 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6ce37683cf6so1456902a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699677004; x=1700281804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qbEMuqKiRO1Bmqqs4mp6AF0/3oi8wc7b0yDR5qPsAek=;
 b=Wrf/dgKjbl8bFGIeQoUHnTdLj7+XpHtWC0wMmcx/u+vfePY9PNuFxOleR05E+LA9/a
 yn4e5P7FwyvtBc24Ai6k3yBZRrQf6715D3iUrNk0VFw9TC9wDKtJ4BmpYoEEXJJuPNqK
 dRAXfzqMnvwLa49ha+MAifGDgYnukup0vyPMSVs73RD/4bJj8RuuEfXM9UtaQWAnepIJ
 o7UcVJxOxgotObz5E8ULpRY+kpFkHk/iORmCAZgysRFO+0sNwjdn5phmUzDPEd+cWzHQ
 85uhy7SMlP4vE5moTUyACXlnLNNTzBjua8MpeXPiOYxysB0iNzYZoKFdwl0wat6Otg7V
 fcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699677004; x=1700281804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qbEMuqKiRO1Bmqqs4mp6AF0/3oi8wc7b0yDR5qPsAek=;
 b=uEthaXVreQWc7XbWCRAfUTHFRwiyJ4WzMulR11mo4jhb02l9sylMdhcFvF5kci+8cg
 F7cfM9HbJy7iAeUwPSwASS56jxrme5ScMy0qVGhTNuSKMaHYfUfQNumycbU1pH2E6s5j
 qILbMP/8DGfu3DW5R7Z3yTdyNt6Wco+tm+7cgpev6QnhByc9cW5JfhdKFdPV53FjLsdR
 mTSkOU3Ynmukr46EX5ZRV9aT/cUNZmnNSkH2p446ioeDQ+TLcRgWZCwuujTDWhbFTaiQ
 OaHmzwXjZkZ9VilImW0VRbSxcE+JRY98nmdTFYQm2QR4JqU6IL9S0tvGHx0vwGu344fG
 O+mQ==
X-Gm-Message-State: AOJu0YwhPoCUfVeu3FQbYWQKhzmAqoOA8YOSLcGhfj1pQ6ZxG9hQi+cV
 6O8UnP51P00X1E2ZBDv3DkE=
X-Google-Smtp-Source: AGHT+IHOe1HBDh7zJVpvbDhWnWNvgk48cuwtImFRumXvct8eYDMrWuFc6b5vdq+M/ULV1w2+F2dMzA==
X-Received: by 2002:a9d:6847:0:b0:6cd:a989:c7ea with SMTP id
 c7-20020a9d6847000000b006cda989c7eamr392942oto.16.1699677004262; 
 Fri, 10 Nov 2023 20:30:04 -0800 (PST)
Received: from macbook.lan (119-18-27-45.77121b.mel.nbn.aussiebb.net.
 [119.18.27.45]) by smtp.gmail.com with ESMTPSA id
 a8-20020a1709027d8800b001c74df14e6esm469672plm.51.2023.11.10.20.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 20:30:03 -0800 (PST)
From: Andrew Worsley <amworsley@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR FIRMWARE
 FRAMEBUFFERS), linux-kernel@vger.kernel.org (open list)
Subject: 
Date: Sat, 11 Nov 2023 15:21:21 +1100
Message-ID: <20231111042926.52990-1-amworsley@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 11 Nov 2023 08:24:49 +0000
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

   This patch fix's the failure of the frame buffer driver on my Asahi kernel
which prevented X11 from starting on my Apple M1 laptop. It seems like a straight
forward failure to follow the procedure described in drivers/video/aperture.c
to remove the ealier driver. This patch is very simple and minimal. Very likely
there may be better ways to fix this and very like there may be other drivers
which have the same problem but I submit this so at least there is
an interim fix for my problem.

    Thanks

    Andrew Worsley

