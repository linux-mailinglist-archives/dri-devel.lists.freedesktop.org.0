Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D252BBA2
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839F10E502;
	Wed, 18 May 2022 13:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347F10E502;
 Wed, 18 May 2022 13:58:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i27so3991026ejd.9;
 Wed, 18 May 2022 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CW057RRt4j2HSIMvL/+2mpliQ/LufOO05AnuxlNfSgI=;
 b=djGTkOKyP3ZKd/benhwYtZ2MRLW9jHoTLsfq+RPJZIUjfSYpj2otM27IhvE6c0+U/Y
 A6pcJQDtsbiUVpu7S99aSIGPFEmRL9FHOlXjozqVIr8QC1Q6wKJ8Zs2kBZwWFdOz0fII
 SN/L6YX4CF9fjAF8Eiclz08aEUviFUCgfVjLgZq6MHOod2PwmaYK865XS4NLWs3viMlL
 RKpyjrmfAkhKtuDRNfrfkTuD9gCgKyH+sqWh3Mhg0SbgW9NUl6+zpTonPursydWFwebV
 x4dgQjBK+SV1qxNegfNE096V+5iOgG2403DtUt3sZiyEDoMpAij6FACOumae8RmWNxVY
 im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CW057RRt4j2HSIMvL/+2mpliQ/LufOO05AnuxlNfSgI=;
 b=de3mFhqcrwkenlFxhP6Tew3slYOmqWqZHtHwYbxXYh0MNs3+sHsdGEylRnxx2jE0Qe
 XfhcZBfiT4/zHnBXbQQG94GDMLCnbTKwdaIPGdKmzaYOYR1/HpN5SJZnKLSjO7ZOxYk1
 2LuvZdWnJbarlx5GFQXD1lQziV0WecpbP5DoAf0p7ksdWY9ZCApKhOw/8zya5hKiVV0u
 TgyxnDywdWJX2J1SmNHDjdZ0T2a/ashX6l70KXs9zddN/3kTGeoSqwsGVEp6AHxqhD0b
 9ooglVt5uU3Oh+g25WpJIfV78Lz5gW1tg+ZEgigtusUHBdsPvqvlwIq+0jpRbl3xV/2G
 NFpg==
X-Gm-Message-State: AOAM531S7VohVKnGTkODPJ0HiGghHlhjkHzFk3JqRq7vzBZ5SPZ60I7G
 U38qphboT4iAGDiVDH8giRIyjCRYUr0=
X-Google-Smtp-Source: ABdhPJzOZjZ2v2cA8RpIS0oNNQw77DLOBBK8NrLiEvpR9PlvT7GSbtsd9Yuat6ZBcecivMNZPC0T8A==
X-Received: by 2002:a17:907:1b05:b0:6f0:18d8:7be0 with SMTP id
 mp5-20020a1709071b0500b006f018d87be0mr24167380ejc.561.1652882327436; 
 Wed, 18 May 2022 06:58:47 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm1388917edt.26.2022.05.18.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:58:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: 
Date: Wed, 18 May 2022 15:58:39 +0200
Message-Id: <20220518135844.3338-1-christian.koenig@amd.com>
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

Just sending that to intel-gfx to let the CI systems take a look at it.

Regards,
Christian.


