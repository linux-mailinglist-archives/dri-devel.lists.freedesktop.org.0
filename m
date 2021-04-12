Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D140635C67D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91106E56D;
	Mon, 12 Apr 2021 12:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E786E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:43:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w3so20041749ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dl2dcv2j0SH5o5oYkFtGVe/TTES0EMAAwfTwKxscV88=;
 b=CUlAmIDYxwHPS+G/GXJBiuKltOaw2X7J3Nt8qz96HVkGuM8NIYNAmkZYMo4vbbGIgJ
 wPvEY0XSjrL7J1+pNpN217IFUOzmrXS0U23eFM6YjELcl4X2V23heYJzHeLphHpKMKIe
 0kuZpoc5qYeUGejFqGsv51H0P8f9pQ2IgyIxf7QMQy3dH6eeXYSF/hS8TVHl8bjFveAG
 yOf9yHUFoO8uN2aOF0hndLiPZziJl33g8JazwvWUZcGrcEFDqOYDaGhet67n83uQ2hD3
 yXbZuApD7wg9uOsuIfWPAQuUrLExbNURUpTp8GXcwXZQ4H6tVhTjCoviDOjdcQ5bi0Jg
 6iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dl2dcv2j0SH5o5oYkFtGVe/TTES0EMAAwfTwKxscV88=;
 b=Q/aMd07XOHexgYuAgqfrW7B43QT3czWZwVff3YRRv1LjFAbUNywuxYKfusBorC+C5z
 ygS2RCVfivvnoB31teUknsfwA5DjlmUCJC2hZcKAkjMKpU8ycigoPBSJ1o8uVDWigPNC
 d8VPzRl6S46lDlrG4xFvJ9f6Ex84oGQYmCq1+u9Czbf6Vjv45tVN56xb0PRqJymIvQ0w
 DJDOyAOHY32HgsxDuwGozZv6WzjxzkRYu5xTNai3YkJZmV0I9u4S/YrHHKPLmMAHsDAX
 +hNXzpp27UAujnwTzpWvQcZ4+XNmXzYgsvkzYNoH3jTPkHzVmlmo5eeqlIqdN4t1+zvy
 rZtA==
X-Gm-Message-State: AOAM5309jeeKzKOzH8/6tuB1Ps4rMM6W/WlwGyrrduItXgcd4dA6neCc
 5+jH9rNvHqqf54EqL7FvY/3uSBqiATAae3yQ
X-Google-Smtp-Source: ABdhPJyMfGqKOKexscCxRN5soA+XmNALMPTzQqi5Vzr7u2C396h3wjEusGrVYgL2hrmzvn5+uqH4GQ==
X-Received: by 2002:a17:906:f949:: with SMTP id
 ld9mr6001231ejb.236.1618231405624; 
 Mon, 12 Apr 2021 05:43:25 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id m6sm5939452eds.49.2021.04.12.05.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:43:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 0/2] drm: drm_atomic_helper.c: Change types and format
 comments
Date: Mon, 12 Apr 2021 14:42:12 +0200
Message-Id: <20210412124213.4628-1-fmdefrancesco@gmail.com>
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

Replaced "unsigned" with "unsigned int" and formatted comments according
to the Linux style guidelines. Issues detected by checkpatch.pl.

Changes from v1: Rewrote the "Subject" of the patches in the series.

Fabio M. De Francesco (2):
  gpu: drm: Replace "unsigned" with "unsigned int"
  gpu: drm: Correct comments format

 drivers/gpu/drm/drm_atomic_helper.c | 40 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
