Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8681D1076
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CB86EA0D;
	Wed, 13 May 2020 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30736EA0C;
 Wed, 13 May 2020 11:03:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e16so20340435wra.7;
 Wed, 13 May 2020 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OO1koBYX+n/B/Ej7zdRpFo0yg3jxttaTQ6C6dpAvNYs=;
 b=chAXkOQ0ZOgyXpbldUnw5wNmSewba9IzJ0+Z+dyqcpx26elQLBfZwv8OtNHFRJ87W3
 wrBrtkS7Kyh1VSR052RHjUOJev1XVUiYPHUCmmODo580Yn/RgxN7CbzIMbPptK0g5DVQ
 fFi3EiwCjL9t3FDRlYzdxQEcS37ZiEoLdhSSL+5zhSZEq6opKAeRm2J2P4dlUVtQzchU
 W10lase7UiU6xjChZaY3OOBrTistZbwhTxg7Y6iSGh9xWMa5WqC779VLowDKfEexIyMn
 PlU157eLz6qjbK+vaHOjpXBQYyLNAxBjHe4pZd6+ZhvTOMg8vVy66NFe69qJ0gLamaMd
 3JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OO1koBYX+n/B/Ej7zdRpFo0yg3jxttaTQ6C6dpAvNYs=;
 b=TgOBq4+rwWgxzC692L784J9Kg+Umm9f237tVDZ7piMl+u29AsXoWyU35oFfBfqc14p
 1UV8s+DuPnahfaF0GpcHNQjEZKliYcE0xmQ0HTZr9x6vytO3o8VHyukYaKtuocBdv04P
 8W8lV/KxD//DuxzMo1XPe/u1jS8nT++rlR2Es717hpO38jj4eF3EHPweWBrtMuSjM2Bw
 sG7Dt61G4t/ke7PuBZsyPVY3VfDvnssH5os7vPXmf2uudNu2NCqLqde3zePkWNGDUCMG
 VC3Le5etDAuWUTZ7W9j99Mvu6HRTmPpTlzxxSj2DyXQ+M+znvLRJxIPd7CqERXO6fYHU
 pKRg==
X-Gm-Message-State: AGi0PuZ9VKAWuxa2nmDKknCCfWIKNptc1Wdm1vXEJxt8NygjDh+OcFgQ
 YKcsD0R+Ean28VlwD8HGQVzL6LhK
X-Google-Smtp-Source: APiQypLnQL8jDYqSO693o+Wwh8MSLOKNJf/9ArplgKAA0hY5p5Zqfd8v3czQ8ru9cBDGn9PTRdKysg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr32384314wro.201.1589367795990; 
 Wed, 13 May 2020 04:03:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78fa:bd2b:6c37:2c35])
 by smtp.gmail.com with ESMTPSA id z3sm27806975wrm.81.2020.05.13.04.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:03:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, debian-powerpc@lists.debian.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [RFC] Deprecate AGP GART support for Radeon/Nouveau/TTM
Date: Wed, 13 May 2020 13:03:11 +0200
Message-Id: <20200513110313.12979-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately AGP is still to widely used as we could just drop support for using its GART.

Not using the AGP GART also doesn't mean a loss in functionality since drivers will just fallback to the driver specific PCI GART.

For now just deprecate the code and don't enable the AGP GART in TTM even when general AGP support is available.

Please comment,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
