Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A40E3FD929
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 14:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74E6E1B4;
	Wed,  1 Sep 2021 12:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDD06E1B3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 12:02:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so4230643wrc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uNWyDCJRg5z+YdrGcz6ue9XUC2vcsZfH2SlJlbhPC2Y=;
 b=AwP8q6IrhVvt2OCuxNZ/CQ4Mh1qUju3OY1uhxDDlpjAUg60KvC5+b7vLsLmr99gHAk
 MBTR4BANx4JWZEv1QTzkOClDEc0JuQJmM197nifSno8nN2fCH7ttK2FdPByOADQu+MFN
 VAbXFQFhuy7Z4D6AD2vg53f/l9edv7gFVjFQ9k/Eg73EFwDsv8GGZAI6t2sty6wo3uE8
 xMwbYQIMWT6gAKNASr08ZvriQwt9PUfmMuwB17kqOEkS89reM28JOoRDQROztjY4s90Q
 vQV7f4yMl94jJY9kgRDxpb+PCslEMi6l3555vaalpX+iS81+VA9t+XzU1O5Ukyb0LeRe
 Wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uNWyDCJRg5z+YdrGcz6ue9XUC2vcsZfH2SlJlbhPC2Y=;
 b=dhqcUYOyDHXjeZ32bQUC4J59U5yLz8o0sAKhtS5EG7cky6ySG2w4nolQa2Zh0h437E
 GltWxZ6JomMgpP9I+UWZ5ODt4pSGgMDdKmw9YOsvKTo0i7el4PygXHuYRwy2/ARpkk5i
 SKBZMM7EdtBUYvQqk82SeiUhlp3Vp8i+bTSM4rQd70mVKLo4BGv3HbFCeCbCsEuiY7IA
 xXBv7E2q3tEd4cHa6S7c57JCS37Re9S1Y1J1SX1h/FM1RrifxftfRcaJhVFk2vJF0luQ
 IRL2PwW12txAS9ZdbLf/7FuAmNl1Rn9nmKSlGHKM69LRRGB5kYrdYor+fNPv/jgHStAx
 n6OQ==
X-Gm-Message-State: AOAM531WK1bnAKw7YcYa95gblji7e0HR1bmFyrRcYgkLB8c4SeXRJW5X
 P88BFjrR66khBLhyQy3yePZjzK5c2rX8SViM
X-Google-Smtp-Source: ABdhPJwW/P17cLcvURrVKCOBQEktzDGC95e0OV9bMzMpRbkF9G1qN1z/I0VT8R05Fg8+WL7oGKrbKQ==
X-Received: by 2002:adf:b745:: with SMTP id n5mr38295873wre.338.1630497766169; 
 Wed, 01 Sep 2021 05:02:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm5641336wmj.9.2021.09.01.05.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:02:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Harden the dma-fence documentation a bit more
Date: Wed,  1 Sep 2021 14:02:38 +0200
Message-Id: <20210901120240.7339-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

while it is in most cases technically possible to not have a reference to the dma_fence when adding a callback it is usually a good idea to make sure to always have a reference anyway.

Otherwise we can indeed see cases where this doesn't really work as intended like for example in the now fixed EPOLL code.

Regards,
Christian.


