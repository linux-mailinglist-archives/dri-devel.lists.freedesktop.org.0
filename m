Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7D35C613
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A116E54C;
	Mon, 12 Apr 2021 12:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93CE6E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:21:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h10so14778429edt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MdwSjx9JO8XVCTFQLq+wxeSF8HYjox1t1MpD7Ajw5s=;
 b=q15ysuorn/YUiUUavi8edT4vS1HRmIYWPBweYU97apO02lY67apbBijf8NsAUssGMa
 jRhuSy+NQ3u/YOcWuE5EOdPNV/orFUQVggqNOru8PtUCV9JoGBH0PWcXQGmiWBeWIlIg
 A5SWFuq4RdvSVudTB4qab7sdIOSYzjnnHuY5R3XU/mQICnPTgH6YhaoDweTVdIWQcMz6
 ZULxKy0U6kAzQHG1lEzFhXuwgzYmW1JKiSYee3wmqCvzfq/cCQXjuLUF3+vHHV8rcnbU
 h122xaspDs60AXm5QZVw1+mVHbUN/GEqfdFop6q9g8xh6OkeyoQejVeDtViSWy/zV5m5
 p6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MdwSjx9JO8XVCTFQLq+wxeSF8HYjox1t1MpD7Ajw5s=;
 b=AE4G8c175GEpzhwRCz8aFCS8adcvkOn6yQi9SpLxkQS6QPYda4KAcMfT7orSoB5cEk
 xhxFxYK38q6QsxZYCdK3j7cI8fXAJJzycsOsFJVbl4hdz+mUGEUTJ5K17efGDnavLh6D
 Qf5GHvwLqMi9Yo0bbp+8U+5WQFLNVS2+VA6iNWvz8qivKgQv+IgNns+0N1buXz5CcuUU
 vZVn8mQ4UiCLP88hTdf25jpFGU2F1NlUOh3aP+5hM8yU7PbLVDtJCf4UXCNlAgeEsDDl
 BweDlE+hgsUNDv9+lZIhf/bUpMrcoM5m+QOWJRuYSCV4KTaG75WVSOll7ji3bMPs1xdH
 ASnw==
X-Gm-Message-State: AOAM533XYZzOJDNPMRPAOUxvQEsbs09I83SIaZAqpU/T4/uBbiJ6K8V/
 NfbjJfvZAbpAYc5ZxiByekdQG8IIm/yzNvYY
X-Google-Smtp-Source: ABdhPJxC5LYjQrMYxXMd6+CbbdhHyRcOoi2226GyiHS/8Brbe7sfBJevBzZ72MHWg7+0WYqF5bF1rw==
X-Received: by 2002:aa7:c549:: with SMTP id s9mr23372390edr.326.1618230061014; 
 Mon, 12 Apr 2021 05:21:01 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id ck29sm6408191edb.47.2021.04.12.05.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:21:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>,
 "Melissa Wen" <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH 0/2] gpu: drm: Change types and format comments
Date: Mon, 12 Apr 2021 14:20:54 +0200
Message-Id: <20210412122056.28351-1-fmdefrancesco@gmail.com>
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
