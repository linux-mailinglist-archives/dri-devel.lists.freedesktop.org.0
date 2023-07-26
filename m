Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2F763C2B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 18:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7669C10E496;
	Wed, 26 Jul 2023 16:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EF610E496
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 16:17:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so3061416f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690388226; x=1690993026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CVFjwVCMrpRusQwboX6unt/3pep58QKwCgvwOcTLg/c=;
 b=QwJOWjxo5Wvxa1b6oxhBc4ZjnGDMb6ntYrQ/hWdlSdtGzRsDO/+H6hliI6lXMyqNeX
 j5VQNMIkxgfNjxiampou7vyE4C9keQ/Ki5AJHkRjivsbUgdLPNKtiyEBfMhT/1HYifOs
 HG0C7GxbZ0UC+r6vkE+eK4Tqbpx3oPOJpu5bXitz0hZjXZniACq4ouYIASCz4TBVQ7uU
 CWSE0rxv2aa103tRWU12ejmgr3cDF7khSXkrgDHgvOG8HELOdmPKwVoXMOV8wUiDEEbu
 xJTKzS9uafVgat3ksS7/iExRUi4+3IzYKJ2633FCmdaVZigKOfg+3MDbaIy23azvZL57
 cngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690388226; x=1690993026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVFjwVCMrpRusQwboX6unt/3pep58QKwCgvwOcTLg/c=;
 b=YTPwjyESkjF+jdD8dyUYPsEmc35cBLvKEvqvdxeiXeqGK0cLrGziktdKP09Xw0oqGo
 S6F5vXb6DekZO8Kd80psvo0x0IYQF0AcvCchqbXVlbMz1EQEMPgoWRdUxC0ITXZ0jRRm
 iuV8N34pe9bx+E3m/YKr/PyEPlqFv+PvDT6ZzO1dP9eAgZ8DgvVNivgIPLdV46CPBkTU
 RYououyJPEskgRzEoTsRPG6NxN8ghli+TwClUy0808R5wzoO7hqIYBhP1AjkMNxo/2aA
 Ulvl24giPkUMYsTetmQaJKmGkpVOvmdZK2dL8ehW46Oo0awErjtL6Q9qMdrAZqhc3CYE
 knXw==
X-Gm-Message-State: ABy/qLZcLNOeIQp6sr/MDyiATe4M700TYpHvUTStYPiHAMflPRFR++Tr
 W9FVTfs75htx/0ST1FBD2D0=
X-Google-Smtp-Source: APBJJlGkb+1bAbD+EKPi0ycm+jfa0odvgYjmNcPUGRQB5TYzm0TmqbByThPtQIsoNIUMIO4/eH4Zig==
X-Received: by 2002:a5d:5610:0:b0:315:99be:6fe4 with SMTP id
 l16-20020a5d5610000000b0031599be6fe4mr2169875wrv.69.1690388225566; 
 Wed, 26 Jul 2023 09:17:05 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v4-20020adff684000000b0031431fb40fasm20249247wrp.89.2023.07.26.09.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 09:17:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH][next][V2] agp/amd64: remove redundant assignment to variable i
Date: Wed, 26 Jul 2023 17:17:04 +0100
Message-Id: <20230726161704.367942-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable i is being initialized with a value that is never read,
it is being re-assigned in the for-loop statement immediately afterwards.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index ce8651436609..47bd3b8a54b4 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.39.2

