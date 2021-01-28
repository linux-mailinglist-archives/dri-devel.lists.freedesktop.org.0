Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AA307EE0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B236EA04;
	Thu, 28 Jan 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49856E176
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:39:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q8so7133932lfm.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=khhCUju4o6sGLELHNBOL/gaDK1To8wap6eyjzJF+V/g=;
 b=K+8i079FrLwx5T7UFGpJVUja2zQ4wdF65QL9u+CcqAQlvTisuGIbaPlrNX5+3WeOQF
 cj7BQx74GGjRq1SMEJUXPGdAs7XW2ObDmI7kmzzFCvcRFM543Qs0SlWPwufMUZ9ljEj7
 K6JtyqUghVIVcrdfjgsHhh03NjFA+pr9zBuLPGpAsJrlRsIM0/HTbAAFP7Pp9cufyBMn
 2bLF6aXvx/sQBFJa4aqcC2zpCzelgZMuP4SU6WBsGimNa2aSTI0GDI9BKGJ8EDLYlbGM
 Y/dgsrITY+UJ50L1MZK/hFsLNKahAk3kIuNQifdhf+l+JA8B8l55Wjbr6LwlTr63Yz2V
 +Qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=khhCUju4o6sGLELHNBOL/gaDK1To8wap6eyjzJF+V/g=;
 b=EadWXBSrjBavuqWSoETgTshhEHW0Rx27kIWVOUDP9b/0+2zVmEAvjNp2r7MPss7bTZ
 BrXhBj33EG57EzD7hUYFf/qrA7dMWLcVpZRPLb1E7kf5nU9+RvVDLAtqjqFCeqZYrEvA
 uZvaBCgZdCki7wnHCIUNwuAeXfYm2iQ0UHkjnfn1Pz7/Bfc3J7BF1Fo3Xid0bN2Yc/uQ
 tQbyxVNlQTLYlHTB7VQ8SpedZ5mG1I2T2UaDM3lZshx38V73eLViQOpY1IlmyIPbrHG5
 DC7S+GBi9R9OF1X5GQBqiHgCDAEzLvePVyoDkTpKunauBYSGL7yKM4E03VT+1Gvf/sSW
 JV0w==
X-Gm-Message-State: AOAM5328/+qT1dRCuZmpGd5yQtZg49vUI/gUlJZWQOTN69nhPSJgEiuC
 tcTgyWYGTiZI9H2bYh7E6Pk=
X-Google-Smtp-Source: ABdhPJww4ISP5Q+ckx+Q5mwgtre2MwC+POyV0sFsirLMyrfDNhffQao3WGHQNWh2K7AMbujXbhxkrw==
X-Received: by 2002:ac2:5690:: with SMTP id 16mr7851305lfr.320.1611833989244; 
 Thu, 28 Jan 2021 03:39:49 -0800 (PST)
Received: from localhost.localdomain ([188.163.52.44])
 by smtp.gmail.com with ESMTPSA id t4sm1934697ljc.50.2021.01.28.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:39:48 -0800 (PST)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Implement DE2.0 and DE3.0 per-plane alpha support 
Date: Thu, 28 Jan 2021 13:39:38 +0200
Message-Id: <20210128113940.347013-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Please review/merge.

v2:
Initial patch

v3:
- Skip adding & applying alpha property if VI count > 1 (v3s case)

v4:
Resend (author's email changed)

v5:
Resend

drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 29 +++++++++++++++++++++++++++++
drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++++
drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 11 +++++++++++
4 files changed, 85 insertions(+), 8 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
