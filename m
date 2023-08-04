Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CB770637
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9410E0CE;
	Fri,  4 Aug 2023 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42210E739
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:45:13 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-583f65806f8so25441357b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691167512; x=1691772312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gce3GksSyfK6ArVao849Q4zbn4ZS8EDW8/xWLe2xoow=;
 b=dJ+pWZlXWiqD83EvTF5Wldumlru/zTKTEJGN9K0GeVOyF0p+g3V0HmCm6JVBhR0tDk
 nF9JrwRXj8ObyiEA5YbzB4mpRPt9rdfbTCJJ2KMs7H7I/k5/yUmyor/g/SGOvbR3H3C9
 JkUFCd6aiFv3N+fXo8CP5PaKmTCEa9YLWZGgv6B74m6kJrz+dnicBdHaNYHW6bIRThcz
 Z08In0ItVQfA9eWx4Qw16n0HPG4l2+knznjpsMN/qmZotAaUWSJb61nlkIkMIhNmIaDr
 M72UpCBUQ71NFdXqSP0ejtZ//yZ1rPurGZhxt06jnSVhikfpInzir7O0lWk76117gTZ/
 sInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691167512; x=1691772312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gce3GksSyfK6ArVao849Q4zbn4ZS8EDW8/xWLe2xoow=;
 b=H1ghIeem5qWbc9C153hGU4YoxY0842T7ZW90EZH0y9N7YDWjBY1O/6l23q9aPF5Xva
 gOMz28CY/Vnt88emO/6AL98LljmhRa0NsMJlgOVf1J16u+qV3nDQ38eahw6xfBeRzkXM
 M4dcnxU7VpOCfQdgR+pEdTM8K+a0vyGJE3xrctEd9q09RGlDqEc66xtejgsgWm+0z23c
 yM9XGMTNuoGhDXJea2iLTzeAfr55RXOMC/OgYh+YS+pGlJxqwZO11Ii1ShgOKnjNcyW+
 n1bCqXg/iQUnzC/vyjmY9OHLHFZ4EPn/jz+eH4Wq293kVDczCwX4lg1T8ViC4AlVHCNr
 4iWg==
X-Gm-Message-State: AOJu0YwRzuozyhvswjJSgNDb6AoUDDiSEccFW4SECaerpi+zYwlWS5M7
 Wf1jpEvlh+oiQGGgtBQ/Qy9sCbHutEM=
X-Google-Smtp-Source: AGHT+IHELRicqMAiJC/xalDHV8MXFzkF2eGisVKk74KdSF4VX7ITLZiOTRPyH85xOmo1e+LXH34pqg==
X-Received: by 2002:a81:a186:0:b0:583:e92c:d9cf with SMTP id
 y128-20020a81a186000000b00583e92cd9cfmr2493659ywg.23.1691167512185; 
 Fri, 04 Aug 2023 09:45:12 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a816e42000000b00582fae92aa7sm825248ywc.93.2023.08.04.09.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 09:45:11 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Support Anbernic RG351V Panel
Date: Fri,  4 Aug 2023 11:45:01 -0500
Message-Id: <20230804164503.135169-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG351V panel. This panel is mostly
identical to the one used in the 353 series, except it has a different
panel ID when queried (0x4000 for the 351V, 0x3052 for the 353 panel)
and will not work without the inclusion of the
MIPI_DSI_CLOCK_NON_CONTINUOUS flag.

Chris Morgan (2):
  dt-bindings: display: newvision,nv3051d: Add Anbernic 351V Support
  drm/panel: nv3051d: Add Support for Anbernic 351V

 .../display/panel/newvision,nv3051d.yaml       | 18 +++++++++++-------
 .../gpu/drm/panel/panel-newvision-nv3051d.c    | 18 ++++++++++++++++--
 2 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.34.1

