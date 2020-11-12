Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933282AFD9C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 05:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA889DA6;
	Thu, 12 Nov 2020 04:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D35589DA6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:12:17 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id i186so4044844ybc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 20:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zy8QyhhpnWkfuweY9r7Q1amBRGYkd3tcKXKNHSaWGCI=;
 b=j91XmteoQNfoiMG3cChtlKOPSd9N1oxD7KDYmmBT7tqeTVT6mSwHg7KfzwFZ37J7Mh
 B5rz/7s347fqJzRDHb1AfP7eg9XXu4nttOf2mPavkuL8PoVpq25QP9o6oXn9TJcHO4rA
 BCrRME++Kteh6M1BvpfIUYW39NO1oFDA0ws+UJ9GQypZY5n6Wo/7M7KmaG/546RmITOY
 tTj/ODQw2csvIOBRvNn4Lpg5/MYVwU83/h8J1IkU1Tq22z498f6Uv99GlZ/vzy252p4A
 W9crXIwbJQpVJbuH+efMuIGufqi0wKfSZ77dXRgiqhcBxj0Eg1zQuztOls7Bm4WwM7/Q
 sh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zy8QyhhpnWkfuweY9r7Q1amBRGYkd3tcKXKNHSaWGCI=;
 b=iagnwVuVBD4lmlbqrq4PR78k8YsnGrdRTUiMvwHWoiavA/B0wVcbJeAILGFxcixsY/
 ckXGkh3pbBc/+PA6E+U8tw8u+NmYkhfm9dMEjM/tSIFgLSN//I9HC7oVUaUzPXSs3xu4
 Y90K0t43NL6Y+Yq/tRgEioDfEOaOTffxWzMyjW9mF13R4UIdBQ/GEOXltq5IWtUARiZg
 qRuGLgbxgVZXvx1JKLNd1Xr29ZEiWVzZKqhg7krv6oGxjg+Ef6bLG93O329OHSbvW8A6
 /fSuKb7CJ7uclKfTNr0XeeWzVfSt33+xBqnYInG77CeDbWTau8Dm3XLPNASFuEIq1Cox
 ALgg==
X-Gm-Message-State: AOAM532l73jQQHmZQziLMWIgiGnqd9nkWZaK5FHWY5CAs/73Yog8yBQZ
 0ZYTkwJKawo587iSDqxdoxVs9qLrIEqiIllI4sM=
X-Google-Smtp-Source: ABdhPJzoowEbCPO5X9zNoAuCrAA+9EtTl8nmWsC0aaT96YcB0TCDsRvFXWCqCWPtqaqBKQXCoJyiU7ey3pq5N5Se4Ks=
X-Received: by 2002:a25:4943:: with SMTP id w64mr37965128yba.178.1605154336349; 
 Wed, 11 Nov 2020 20:12:16 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 12 Nov 2020 14:12:05 +1000
Message-ID: <CACAvsv5D9p78MNN0OxVeRZxN8LDqcadJEGUEFCgWJQ6+_rjPuw@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.10
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 512bce50a41c528fa15c4c014293e7bebf018658:

  Merge v5.10-rc3 into drm-next (2020-11-10 14:36:36 +0100)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.10

for you to fetch changes up to f67e5ecab785631cf7f776533432ba5aba06615a:

  drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50
(2020-11-12 14:09:45 +1000)

----------------------------------------------------------------
Alexander Kapshuk (1):
      drm/nouveau/kms: Fix NULL pointer dereference in
nouveau_connector_detect_depth

Ben Skeggs (1):
      drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50

 drivers/gpu/drm/nouveau/nouveau_bo.c        |  3 +--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 14 +++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
