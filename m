Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B532D159DBB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670E46F413;
	Tue, 11 Feb 2020 23:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6093D6F413
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:56:46 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id n96so50487pjc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJTJ+P6Sd09wqdMxi5ghgks0lO0jRoeub+YbI1Jx93Y=;
 b=MfWDtU0wpwWRbmmfWb8Etp+y8J1Jw2mYpn1vYFjA/m/IUYtxAMssuS9mkb8Mfut70q
 m0AekoOgzQyyStgzqAbPWTGeAKD6Q62rSaEbfE2V6wE4df8xfK1awgRCQRjdf+hxc9Bv
 RXQqM+PMhnZA7781Bp2KPkuNjx+as12M7XArI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJTJ+P6Sd09wqdMxi5ghgks0lO0jRoeub+YbI1Jx93Y=;
 b=UT3Lc/F5somgt2YBN3Zm3vXw6rYdsVmbxwYpLv1N9Mk8ljGNGjhR73cZSGaTLfNT9R
 7w4xOZa9N7QV7Zmr51+TMRciWUsfFF+mHWFPxUjWUAfdB+V39pIVoIi4/voPQ099sxTj
 s1Fjp7fq5KlrYhJen0C+b07MJZlH3XpuvFdgwN65ZHKgJAwiyat4htpkT4B7zBO7zApc
 8BrWJyJjegx05pSXSTLxrCYOfDwf5y66IJnOjf7u+ZASgsTrCvu4tlanP52/6x8/ImIm
 WLmGNgoCXao+HHWoA/9laFqmOwLUeQcaI2wbRc2MsMasdRtzNFqyootliYB1E3RCH6lt
 3krQ==
X-Gm-Message-State: APjAAAUcpeN1raSjRl5q2m8ZYkf61clgNvopJgaji9qhmaClCwZ1OC9K
 fPxIo8MIwsw89RLgLTrsBj9uH3kRtFFwFQ==
X-Google-Smtp-Source: APXvYqxDYZ4vqmV0alEHzwfo+Ol+ojThJfHx7u8GGhG2JQ/PdnmmCKfk8v0Jx9Jw+QPiOYeGv+Q9Xw==
X-Received: by 2002:a17:902:820b:: with SMTP id
 x11mr5544877pln.196.1581465405536; 
 Tue, 11 Feb 2020 15:56:45 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id a13sm5816291pfg.65.2020.02.11.15.56.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Feb 2020 15:56:44 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] *** Delay enqueuing context create command ***
Date: Tue, 11 Feb 2020 15:56:31 -0800
Message-Id: <20200211235635.488-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's delay enqueuing the context creation command until the first 3D
ioctl, as we add more context types.  This is based on kraxel's
"drm/virtio: rework batching" patch and needs that to work correctly.

Gurchetan Singh (4):
  drm/virtio: use consistent names for drm_files
  drm/virtio: factor out context create cmd
  drm/virtio: track whether or not a context has been initiated
  drm/virtio: enqueue virtio_gpu_create_context after first 3D ioctl

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 46 ++++++++++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 11 +++---
 3 files changed, 44 insertions(+), 16 deletions(-)

-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
