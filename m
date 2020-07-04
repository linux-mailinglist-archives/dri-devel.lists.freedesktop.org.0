Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DA214676
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 16:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4386E0B6;
	Sat,  4 Jul 2020 14:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D9D6E0B6
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 14:35:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z24so15310621ljn.8
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rX77pyYaI7t3osrGVixdaT1lC+LXvMPuit/5ILLdKK0=;
 b=mrrCw80nucNN86OBNz9hzWdT0d5Nva04qDeRs4B9u66jpyu/TVP8po9eiRKUtgjiJl
 SBCUtSd0oyC4bQKuIczGOjn9yelj34Sm3vdTSFvbDawjF69I3LmcQPIRZO/CMbBzxGho
 kkbTfC5a7P3bpKQMLLotYYtYF84faiovcFPvhWr7NKxiZ7SW8+x+eithmNofw/vcEnaZ
 VhIf/1nxQVef5WOpklyf0zPr5q2FTdjX6oRFMtjw0oWN4/XmuCUAXLvF2Ce8hZO9bpC5
 5odMnP1g5URmcRlWMuDmBVUd7ZuRjjMC9HTyPfHbsK9JGrK6kVsu9tB8yXghZcXSJTHq
 b5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rX77pyYaI7t3osrGVixdaT1lC+LXvMPuit/5ILLdKK0=;
 b=t2y0mtnlJlBbQuWmKBH6LujSxq1RruXgGo8ZWKEcekX941cH7BLMN7/SazELtasM51
 Ymx3/c4IVL16Im2j1um1mfSdpT84SNW3E+y9LSszT4yhM7eYyGCSkl+8SbyxGrWcdv1O
 jzhXVFWH9fYxkBGgv1ryE2Sf6GAi9jYnvUfwJylbxza9WZZFtPKLAn2KvQyw++zM+EPi
 ZYuBzZCjtnBAcKWPRFQLKHkfhcjzGq8G8SW8xL8WEvsAVnqyfdqGoR5q9fZEsXliy7tu
 h3e8mr8mJeuNks4X8jCxa1W/7y0vWMpx+FScI4A/yao1GmKwKj8TN3sefiSGLz7jIdnx
 G2+g==
X-Gm-Message-State: AOAM533Hx4i2+yOOVh3RScJIHI+ZkbPTV8I8kFST1zTCDlZrkFT2YHvy
 34PhqzpE+Bj5QcbynDK5k0cizgbom2o=
X-Google-Smtp-Source: ABdhPJwKJGdn4otFvTUzOLOqyA3r/4en6H8xyAu7TIq7U0TR4mfCjZjq9t9D05dapbDK374ClSPXMw==
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr21042061ljp.365.1593873349874; 
 Sat, 04 Jul 2020 07:35:49 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id 144sm6407556lfm.87.2020.07.04.07.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:35:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v1 0/1] dt-bindings: fix simple-framebuffer warning
Date: Sat,  4 Jul 2020 16:35:43 +0200
Message-Id: <20200704143544.789345-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial fix for a long standing warning.
At least not fixed in drm-msc-next for now.
Just in case it was not fixed by someone else (Rob?) already.

	Sam

Sam Ravnborg (1):
      dt-bindings: fix simple-framebuffer example

 .../bindings/display/simple-framebuffer.yaml       | 45 +++++++++++-----------
 1 file changed, 23 insertions(+), 22 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
