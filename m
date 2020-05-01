Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA231C240C
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AB96ED9D;
	Sat,  2 May 2020 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D086ED46
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 20:48:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so2640441wrt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpHLQcuIlLeV8LyFszC01tPlOciL9hnzGZlXYQVZDTg=;
 b=e/vvZRYjwEbzJsXb6aoRr6yO09dJxZk42gY+zJtDCzV/G4k1pZPoCTpwPXPei3k0pX
 3/9rqkRp5I8HqSMF8AlJjwdWS8KzFiMddY2UX8sU23FNVkk1EZ2Ge1ePR5X5DqDEdgfu
 TDiOtQ3l+bBFUYpdmS1ryD+nOHcnYPkglDVoyQYTM3/djpY3W2F46zt6KsjlQkXGN7x5
 FDFXUxNQ8K/yWBAbIvIi/rnL4CuxIApSZCNCRZW/Avn8EuCJQILD4J97/CL1pYGasInF
 WFMT4L7P1MTRPO6H/+UO2nFufQlIPbMG6ToKpQW5OzgpnVmMEG8k95F5PIY44v8pEfZE
 KapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpHLQcuIlLeV8LyFszC01tPlOciL9hnzGZlXYQVZDTg=;
 b=fvpJvbvE/eRf9xO8kSzZVl4Q29RmUKUUtMNYE6Mw19yORdjRlylr+ImCPXQGAl9/eB
 m1uWyFyhkayd5hhjxYPlGlZVFRVaXcA4eHFgLj4DjPvrK2w6qKal2uNSeik3SwoSt23Z
 UqrWqS0m6GV5RcLSC64THmBG8QKBqMd2FDKoE32p64xbG3Di+JmLoTGhiv0jLnQTuWca
 sX+PPSdoZcd94/ObyDDSxqievwe+Mr++a1sKFyBHWSqRTHSglJ0LWZnO6dt6RSSykMeU
 Tb2xpZpNrY6B0c94v9NPyfApT/TaGLWL6NooFsThOU0HnAsK+mPqTkxQVNjdp5XdBxzF
 +oAg==
X-Gm-Message-State: AGi0Pub5b+aHigz9rn1u0qlyb2hF3Suqx+M5oz4D/EvMxxy9csu//ICV
 sQntNY4z8/ZsdJbf7CDYwts=
X-Google-Smtp-Source: APiQypLHZtEj6BaFIkoc4SmhqGuUMEnC4f1iMxoFKBtwNQYsPOBHwMGzDscmfp47F7SHJmJbZMHQPw==
X-Received: by 2002:adf:8563:: with SMTP id 90mr5741738wrh.74.1588366119618;
 Fri, 01 May 2020 13:48:39 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id w12sm5938623wrk.56.2020.05.01.13.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 13:48:39 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: skrzynka@konradybcio.pl
Subject: [PATCH 0/2] Add support for TM5P5 NT35596 video mode panel
Date: Fri,  1 May 2020 22:48:21 +0200
Message-Id: <20200501204825.146424-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am aware of the fact that this is probably not the correct
naming of this panel, yet I am unable to retrieve any additional
information about it, as it is used in a smartphone to which no
schematics are released.

The driver has been generated with the help of 
linux-mdss-dsi-panel-driver-generator [1] and works perfectly
on a Asus Zenfone 2 Laser Z00T smartphone, including brighness
control and switching on/off.

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Konrad Dybcio (2):
  drivers: drm: panel: Add TM5P5 NT35596 panel driver
  dt-bindings: display: Document TM5P5 NT35596 panel compatible

 .../bindings/display/panel/tm5p5,nt35596.txt  |   7 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c   | 366 ++++++++++++++++++
 4 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tm5p5,nt35596.txt
 create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
