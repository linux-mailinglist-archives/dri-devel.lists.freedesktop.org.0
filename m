Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CB55BB00
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9340F10E149;
	Mon, 27 Jun 2022 16:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63010E675
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:13:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q9so13766830wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1MrvTqvIfFE1DLoz9CdoV+in2eBMF3sxgIBKiM8yW0=;
 b=X0jT9IRbNuMsEB2h6kzvXBPWXj3PZPi9jw4O/kxTUHEEbnWqpIwWAXp/uzrWWwJokF
 1a+xWXnWj9BpwJVTioz9vlBTfgCV0OaZa3A4mB3OkYIoTiA3gq1D+/3Ls1XMbx8qqxh+
 sCBPnzXK840axQpy5puDpRQwb9A76eWEFs2gx50Ij9UNxcaxF4S9/UCLB/Fg/4q5q5Fu
 wzGtafHvH3ij0sF6lVpY5pkOBNjMacJFbwSe2ciodINrT3FBQE50fJYOU++k1a6NQrMf
 C81ozLGk5IP1/Km49RYUB2+zLRdF8KYwHATagfovqaL5s3h0zMS3NJ/0y3/ESYczS8iR
 MyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1MrvTqvIfFE1DLoz9CdoV+in2eBMF3sxgIBKiM8yW0=;
 b=qK4lh9cH1TEbeclVWB5Zdggya2vLh5KN4eQU0J60qrWPbBhR8ZHOMfaPbXJ9ZYDOE9
 UqPoxncgkfVRWHFwObBXjqtBFxBp+fH/OGrZWZs3ALYp3lk4mD0Of4X+g8Dj8LxVXm/e
 YiAFaNRQTs9h9Bsg0ewkmP9SVXbY5+aJ8GrK7dQEUs/5v5MCUtRHeaRpKJvqFRPo3Dwz
 1Ju+nRW69AQHUuaRFe3J2zCpKwZWl2vXu2GwVj1eeuYKIf2oNELUnYaCW3djW2Owp3xy
 Y/kVZzrPSPVRp+zWT1LEQCxda9rm3kyFJ+jVw9Ls/QlXjZO8P3qns54zzUQK8bbiIZcE
 yq5w==
X-Gm-Message-State: AJIora/5SUa7cZWBf/RKmST5vd6HOeIJkx9wC8o8+12Ie3fhqlrO9wJ3
 1fkkttcC3XTCx+jN8dEYCJQ=
X-Google-Smtp-Source: AGRyM1tsz/6f8R32H0yygTzWN6cFTNY3UxpMEIk0ImSTAxspk5+RlVigYHyWlWlVC6VPVcTLxE1oSQ==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr13474056wrz.690.1656346384844; 
 Mon, 27 Jun 2022 09:13:04 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm10883600wrs.31.2022.06.27.09.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:13:04 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 0/4] KUnit tests for RGB565 conversion
Date: Mon, 27 Jun 2022 18:11:28 +0200
Message-Id: <20220627161132.33256-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

This series is a follow up of the XRGB8888 to RGB332 conversion KUnit tests.

The first 3 patches refactor the existing test to make them agnostic of the target format and add support for "swab".

The last patch adds the RGB565 conversion values, and shows how more formats will be easily added in the future.

Thank you very much in advance for your feedback,
José Expósito

José Expósito (4):
  drm/format-helper: Rename test cases to make them more generic
  drm/format-helper: Transform tests to be agnostic of target format
  drm/format-helper: Add support for conversion functions with swab
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()

 .../gpu/drm/tests/drm_format_helper_test.c    | 231 +++++++++++++++---
 1 file changed, 196 insertions(+), 35 deletions(-)


base-commit: 6fde8eec71796f3534f0c274066862829813b21f
prerequisite-patch-id: 8a16f4c8004d6161035eaea275c8eafaa0ac927e
prerequisite-patch-id: 53fded2a49e6212b546db76ec52563a683752e65
prerequisite-patch-id: 294b0ca27a6ee57096c8f097c0572336b8a2d583
prerequisite-patch-id: 5e05bfc5287d16c207bfc616b2776ad72eb4ab29
prerequisite-patch-id: e94560be85dffb62a5b3cf58d1f0fc3d278ad806
prerequisite-patch-id: a471df39c7b32c69dd2b138a7d0af015ea42e00a
-- 
2.25.1

