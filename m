Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6540A452
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 05:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA4F6E328;
	Tue, 14 Sep 2021 03:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7BA6E328
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 03:22:59 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 mi6-20020a17090b4b4600b00199280a31cbso1226315pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C0Pyszb77kVFDjaQaXOEMOCa900lerPKMQKPppnAJQE=;
 b=0INH2Bplst7+ZbmgVuhok9MU/n0Qi1bLUfBwcxdaa9J3m4tHivoOILLqQCQKIaWrKC
 P7+kG8mL2xGcn6NKojhGLytFJTIO5ojEtoc6ZYxamPjPH1SdjMyQebPt5zgCB5ZO0O53
 zTEpOGQ+i1mk/K9FCy5CHYyfp2xkLEiub/p1X+B5Xc56tO6KBCJ1WbxMOmA2ry8+XDMh
 5TYmk0bI8C+dItSoA3cfCVjR3Rd8+FvTvzH5771ehZHdHgD26sN555tVlHQ55iL3/jnq
 86MC0p5F7FbyHQua9t+WOfM+CB0LodetPYAoeeDU8OwRSGQQ1iOCZNybRyuMyUwjviau
 gKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C0Pyszb77kVFDjaQaXOEMOCa900lerPKMQKPppnAJQE=;
 b=z1fynBNZ0l/zF2WeLNiYGb1hJ4VAU0RCi8zZrWUDxlgsm36NHTee5oE9STatT4nAPQ
 fKQjwvUIJOYLr0T2yUmSJjKtN9J9jyTNmuOU2IUrqqPxZfv+5Cr/ghona8bnr24tLhCL
 oUmO9Xp9yZlWxguXaojJpbDFuQnIexHkY+NKeDcsEBQvPULHf1Ko5PVlVl3JYeRmt/J7
 wnfHfpQVIKKwqhtL1SmgLWeqiFhDkjRjLUo5KVUALEU2F3Hx4yk2NJnG70GdaExLc85W
 fL3H3SY98G61e0QqwhN1aI/n3WNas1RqUFK8ach+sxS7I4tAWdS+3o1142Gx/q4MoSin
 Bagg==
X-Gm-Message-State: AOAM530IhsZ61MiPlqUyDDfG4drhwT9OXnIVuU/bWyFEBJyIqRpGCpBZ
 gy9Qu6Mgz9Vr+MdCXB5M9rjO5w==
X-Google-Smtp-Source: ABdhPJz1DdZK49E07+QyJY5WTECud5A1UoAqX7gpd3q2PdmbPMkP+OUkd6dZhi70kekwXNO1cnbs3g==
X-Received: by 2002:a17:902:8ec5:b0:13a:2789:cbb0 with SMTP id
 x5-20020a1709028ec500b0013a2789cbb0mr13323405plo.60.1631589779166; 
 Mon, 13 Sep 2021 20:22:59 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id x15sm9354101pgt.34.2021.09.13.20.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 20:22:58 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v6 0/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Tue, 14 Sep 2021 11:22:48 +0800
Message-Id: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to v5, squash this with patch #3 in the series in 
drm/panel: boe-tv101wum-nl6

yangcong (4):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  drm/panel: support for BOE and INX video mode panel
  dt-bindings: boe, tv101wum-n16: Add compatible for boe tv110c9m-ll3
    and inx hj110iz-01a

 .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 745 +++++++++++++++++-
 2 files changed, 750 insertions(+), 2 deletions(-)

-- 
2.25.1

