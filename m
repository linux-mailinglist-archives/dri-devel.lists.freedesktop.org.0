Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9A1CE87D
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BD46E7D2;
	Mon, 11 May 2020 22:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483936E578
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:29:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l19so11070350lje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/JAvqOjVbbFHGE/YZWUDt05qJBygooNudrKRCOYsK0=;
 b=NzesnFkYF89qKsk69ubwwXptRfU/PvTMvdtP94fAYCubA+aZ+BMS0DhxIuB/G/du1+
 Q3DtgNP+DOUhcYmCKo9c/tqFmoS/2pQNo5eLMZ5XPeO3XdY1timDhXd4pDE5aRwWJGzG
 f7lZwoComMJlEBA1hDssoIbRHLlq6m1uD0BkcFZrNDTWMyZT5j/PUQ5EzuPK4C4GB/en
 6F/AbRrot0S0/pmmxylLt/t7F4W5yDVrp2b9W0ctfd1cLYNpFZnhnlgpKrL/h+2tWjm+
 y+314IIl2oNiAcOexeGtBS/UG+n7KFk51Audz+AY1N+uBgxoaSaSbuvTwMK2hQWWQMMS
 J0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/JAvqOjVbbFHGE/YZWUDt05qJBygooNudrKRCOYsK0=;
 b=GW2RSuA6XSff/nFBxswoS7sRbdA0b9cV2rWWhM/qNo9SbVww5dMUKzoMA5uDsniXhA
 uekRXTmHLXYLPVuBqCEEJqzsLaHCOML3GYK2DYfeLX0JOVAmd1ewc5Nr/onZ8towpGOE
 MUlERBY0oKwCRMuQ9wzJ2NGI5cUyK8G7gUt+UoqgpVxbZG0ySlAWNBNwWH8cdM279g/W
 1mmywz3J/KVP01joG+SZVux2pgTDTuX8vhj4UM8toP3jtc+np+Wcc5KqrETgsyr6TAEh
 HxDyqKfB/hUQdwF/TnPf/DU6QBfR0CzNswkRb48jpo2ecGVPXGvcvHH8fzfaW5bzFzGW
 XBKw==
X-Gm-Message-State: AOAM533PLgHBXX3cMtS8/MB/WtedSOAK9IYr6ZIkixLDWTwjKG4vi2LR
 xftc55Z3mv9GyOni/f92zOZ7QdnRVss=
X-Google-Smtp-Source: ABdhPJxJKUTQIjAcn3//f5NNVwhC2CAfE9PsQFBsOpuz7BkKf3UFazuxFXLb57BGKNVJsZRb1QER4A==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr7729431ljg.5.1589228996778;
 Mon, 11 May 2020 13:29:56 -0700 (PDT)
Received: from arrvl-mmelnikov (chargesoft-1.cust.smartspb.net.
 [80.249.187.146])
 by smtp.gmail.com with ESMTPSA id f9sm11971044lfm.62.2020.05.11.13.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 13:29:56 -0700 (PDT)
From: Maksim Melnikov <approximatenumber@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add support for NEC NL10276BC13-01C panel
Date: Mon, 11 May 2020 23:29:23 +0300
Message-Id: <cover.1589226066.git.approximatenumber@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: Maksim Melnikov <approximatenumber@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for NEC NL10276BC13-01C panel.

Maksim Melnikov (2):
  drm/panel-simple: add support for NEC NL10276BC13-01C panel
  dt-bindings: display: panel: Add NEC NL10276BC13-01C panel bindings

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
