Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4902163EC3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB1F6E463;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1AC6E186
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 08:54:41 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b15so13914891lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 00:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XG/ToDNpjK7E8+3CGMxRl+g9s3/nMUlrXkuxpJ67stc=;
 b=c7sRKvLQ8+H4frQrJ1H8goYPxVlU2AddyNxLpIBIN/AqaMvzf4x6wmtCJANmwtDMEF
 7hNgxiz7QJOEHdbPyK8R79tWdL5zujKNA9+xcLswzikMaIbSejle8WOzaji5a8dMulDY
 YvdfCgafpkZjEoo0eRQq58dt3NKEOYCBBqhOypNgW2fegl41SFwtUWQNqf/+771fPIKC
 m7YPXZ55o8kRKs+VXdA8/FG/Y7WPxUu1t/tgzDqeX4b2thHL0S4NnSLdkmVUTudUTRsN
 svCjWi9i/ey3cLgtKs7vslFENfMsTmxmu3F7PpvuT1E1rkQt4RpOmqwiPF+duYUT5gOv
 WhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XG/ToDNpjK7E8+3CGMxRl+g9s3/nMUlrXkuxpJ67stc=;
 b=Hg2a1oUOsV90io/TYu2g5RCaSWg9AvCZPuRdsa1nFyd9bGygiK41JQeVzVcQ8B2LtH
 XjbI4GnNZWYVTD6BO7leKwLuwZ5O08mhCOX6BGVG7u9DcJCM6g8Mfc1Pt1cTGKxz5PrV
 wzHfZ+TFOzLHE4T8s505t068yFpq2kd+uMkzkboRzuKR7k1pv1tkvMXQTV0QI9mQuTsU
 Xs7iEZSLq/EFixupk39wJEvsfIW6ytz/xi2HyrgvRR3o7y9r8vo6vA0dC9Aif8mPPz4s
 ATMdo8vVangCReRpZmOtJffrLTvaik60YpcnQGazifEivSJUa7D838T5Dc/0V5wCjk3p
 aJ3Q==
X-Gm-Message-State: APjAAAVS9bMjXa8DfV1+QXJcR4F4bvtnrOaQrI1YI5+rTfzesi7J5Oi7
 4beTXTpUILZfg+HNT6pPR403BGjTHILiZMNepf2gwcUeKuQ=
X-Google-Smtp-Source: APXvYqyCg/ZmVyNTESFogv89ipoB2XbTpF1LFPmdEqcmNwY2/no19dGcxt27cJaHQ5PEo6SoifP4ZcnehB2lQRVEYh0=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr9516197lfn.74.1582016079887;
 Tue, 18 Feb 2020 00:54:39 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 18 Feb 2020 14:24:27 +0530
Message-ID: <CA+G9fYtmJkYdUG1wXgUHs3KoLdGQPYFcR8oTzFmDJ5oMXu5kaQ@mail.gmail.com>
Subject: stable-rc 5.5.5-rc1: [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI
 underflow!
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: xuyiping@hisilicon.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 linux- stable <stable@vger.kernel.org>, sam@ravnborg.org,
 LTP List <ltp@lists.linux.it>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The arm64 device running LTP hugetlb test suite caused test hang on
stable-rc 5.5.5-rc1 due to [drm:ade_irq_handler [kirin_drm]] *ERROR*
LDI underflow!.
Same problem noticed while running libhugetlbfs test suite.

Problematic patch not identified yet.

hugemmap05.c:223: INFO: original nr_hugepages is 0
hugemmap05.c:236: INFO: original nr_overcommit_hugepages is 0
hugemmap05.c:104: INFO: check /proc/meminfo before allocation.
hugemmap05.c:285: INFO: HugePages_Total is 192.
hugemmap05.c:285: INFO: HugePages_Free is 192.
hugemmap05.c:285: INFO: HugePages_Surp is 64.
hugemmap05.c:285: INFO: HugePages_[   51.411646] [drm:ade_irq_handler
[kirin_drm]] *ERROR* LDI underflow!
Rsvd is 192.
[   51.411735] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.419705] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.427680] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.434455] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.441179] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.447912] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.454639] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.461395] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.468175] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.475014] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.481868] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.488621] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.495367] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.502113] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.508845] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.515582] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.522316] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.529054] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.535836] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.542621] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.549399] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.556144] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.562897] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.569634] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.576378] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.583142] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.589889] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.596610] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
hugemmap05.c:260:[   51.603356] [drm:ade_irq_handler [kirin_drm]]
*ERROR* LDI underflow!
 INFO: First hex is 7070707
[   51.610101] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.621956] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
hugemmap05.c:139: INFO: check /proc/meminfo.
hugemmap05.c:285: INFO: HugePages_Total is 192.
hugemmap05.c:285: INFO: HugePages_Free is 0.
hugemmap05.c:285: INFO: HugePages_Surp is 64.
hugemmap05.c:285: INFO: HugePages_Rsvd is 0.
hugemmap05.c:163: PASS: hugepages overcommit test pass
hugemmap05.c:180: INFO: restore nr_hugepages to 0.
hugemmap05.c:189: INFO: restore nr_overcommit_hugepages to 0.
Summary:
passed   1
failed   0
skipped  0
warnings 0
tst_test.c:1217: INFO: Timeout per run is 0h 15m 00s
mem.c:817: INFO: set nr_hugepages to 255
[   54.139687] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.143384] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
[   54.278589] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.280642] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
hugemmap06.c:139: PASS: No regression found.
[   54.520165] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.522769] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
[   54.664774] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.668013] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)

<SYSTEM HANGS HERE>

Ref:
https://lkft.validation.linaro.org/scheduler/job/1227316#L4288

metadata:
  git branch: linux-5.5.y
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git commit: 7d6c8f2632c92635fcef4175921a7742f23947e4
  git describe: v5.5.4-46-g7d6c8f2632c9
  make_kernelversion: 5.5.5-rc1
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/hikey/lkft/linux-stable-rc-5.5/24/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/hikey/lkft/linux-stable-rc-5.5/24

-- 
Linaro LKFT
https://lkft.linaro.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
