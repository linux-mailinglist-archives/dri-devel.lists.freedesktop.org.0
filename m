Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375447CF49
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603A11125BD;
	Wed, 22 Dec 2021 09:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3D51125BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 09:32:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id e5so738901wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 01:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYB/TUdawN41hYHxVuDOCxwiAE7KHa4GhiWCeovy4PQ=;
 b=Bg782njsmhD9+8ghsOoxu0KpXg8jYHrQYAIkymo8IqhiV7EC2tWPIMvhZj0RIlIBpy
 mzhaBI9bDN763yxt8PtkXBI8UCJ+ljJx3awZESimjFa4ZUJRVy0S2z3oUTUY8qFNY10K
 52hczFyPtbkaqweMuXezMyvgr0mv5lNsfAmMr5FEmSzwR3TCGQbkhijVtyXThIXwL7kZ
 wl09S/tXHMHj99meo/21XRlPzMrDXVleakyIoQiJDBcYkHjej9/V7xE+xXZr2cZYmimU
 tOQMjfSkZrPgoPP6h3iWAlPOL/BrwFEAvqgQ4309Ogzrs7bc+Jg/Ad0OTuAgCtqqYXVj
 SC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYB/TUdawN41hYHxVuDOCxwiAE7KHa4GhiWCeovy4PQ=;
 b=a3XQq1J+MzcbJr0+VUVAmGTuqAVBL9zaMPuTwRYpMEPl7a/uPDgj+n3r1eR/6YZlSh
 Q7Y0zwCP93ExG0csfsftK2BXMmy4KucZdObrpqAtcpjndXpBsKxdX8KHcYpTr36JB2Ww
 LFLLXHl7arXo2uUi9qfa9dAAh29f+li5O+lgztliRWHKkX8v0oruKmNV5sFmCwDDwRaX
 8zxFJpDy5dhB35QXUvGeqPTjzDkftbdlJ5Akf5JL5wAHU08jLokOtfzqPDISCz0kT7SJ
 JBx/HwbfpJ1hWsPm2q6+sd8q6G5L7xgPwvdDcCHo/lEjKfI19+tLzRlhoNajpqnCH+nL
 WwOQ==
X-Gm-Message-State: AOAM53281f66dawY3TsdHcg7a46qgXtYiHXeGSlKPnj7r4uCoWWmvKEX
 hNAj6i9JizOJnwx8q9g0dwvjggYnC+vPsw==
X-Google-Smtp-Source: ABdhPJxMI1vnKBeE2v2Nm1dHkTKPyoOIvMrHVTwNqbAYkhRBrNb3plR4RJEKUrfA7Uj+UlBeESDA6w==
X-Received: by 2002:a1c:1903:: with SMTP id 3mr278439wmz.89.1640165531019;
 Wed, 22 Dec 2021 01:32:11 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id k7sm1376187wrg.105.2021.12.22.01.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:32:10 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 0/1] drm/vkms: set plane modifiers
Date: Wed, 22 Dec 2021 10:32:06 +0100
Message-Id: <20211222093207.29342-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Now that "drm_plane_funcs.format_mod_supported" has been made truly
optional [1], this third version of the patch is basically identical
to the first version as no format/modifier filtering is required.

José Expósito

[1] https://lore.kernel.org/dri-devel/20211222090552.25972-1-jose.exposito89@gmail.com/T/

José Expósito (1):
  drm/vkms: set plane modifiers

 drivers/gpu/drm/vkms/vkms_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1

