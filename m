Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17E7B6E98
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87210E2ED;
	Tue,  3 Oct 2023 16:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B63897D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 16:34:02 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6c4b9e09521so741333a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696350841; x=1696955641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tj7w41rLlWbL1bmav/8tesoiRg3+S5FpObDj9wp+gt0=;
 b=CZGNM7OL7rHuVZz8zzl4bgs0gExmXHQCceQ3hbyNNDHVTIpCpbOkXbzo9Zl9aDu+gE
 mD/IucgpyAPv8lFDSe3h8uX4AmoQ0eq86zaCc1x97RR+1ZAKO5UnqmYdkcRr2dnfixwi
 dMb7YrGf2s5JFChKCGuBi2/fyDF7jIvBaS6+dhx7tld3UKqnkCc1mHQBVWHRmOyfF6kT
 nYzyPsRl7t86w0BMJeG64GbySsMjW6MNhOmBNprmy3Juibyw1J4qyy/rtft1RUkpb224
 6INzEP5UCJZAtj+lgd6C166HpKqY615CINsLqIAG5irtlGmmSRfAPgJpAn66qd5KjPeT
 Pgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696350841; x=1696955641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tj7w41rLlWbL1bmav/8tesoiRg3+S5FpObDj9wp+gt0=;
 b=vfEt8GjMzn62aM5CtG65EnDyFmyk1rbqym6kWoAAh6iJnCHaaLRkI+6PkPFwAe79CN
 fkp+dfLKFJeFuzZ1EBEs3eVniNjnxd6ED06KIl7G6Xe/el8yNs9d6Hykkije55us24lt
 ev+HHEyWJBaABZWbaZQUuDK4PRQnWkXiDrSCV/kE+znRsWjBGs66x6DJKRD2tF07V6wu
 eA753lSmq00hATdbcJDdP2zosSmUesKLJpfx+z7+xNn0Brfu8Bkj0XD/a6Um46Efmrg4
 uL3LJipxnS5VmzLiPvKVkEkGZKZYDN8+TJe/A/vAQwD8L7XJJ4xq3NcwsJWPNLZ8xQNa
 dxwQ==
X-Gm-Message-State: AOJu0YwghZpwG/pf9nxS3WhP1Ldpe6Ld0OnGAGG0xWuh+4tkvYRGIAuz
 iYMuk1RvwpRNsfeVMmIjkZ88y4humAc=
X-Google-Smtp-Source: AGHT+IGp7ehnwYSxxxzmEOMYdK8NZTQFwuki8TORAjFYRAYbS2A6pnXFwZ+F3msj0e+Sv+GHMfXdcg==
X-Received: by 2002:a05:6830:3d17:b0:6c4:cdce:5de8 with SMTP id
 eu23-20020a0568303d1700b006c4cdce5de8mr14687043otb.26.1696350841276; 
 Tue, 03 Oct 2023 09:34:01 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056830150600b006b74bea76c0sm198567otp.47.2023.10.03.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:34:00 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V4 0/2] Support Anbernic RG351V Panel
Date: Tue,  3 Oct 2023 11:33:53 -0500
Message-Id: <20231003163355.143704-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG351V panel. This panel is mostly
identical to the one used in the 353 series, except it has a different
panel ID when queried (0x4000 for the 351V, 0x3052 for the 353 panel)
and will not work without the inclusion of the
MIPI_DSI_CLOCK_NON_CONTINUOUS flag.

Updates from V3:
 - Removed need for defined variable in probe function.

Updates from V2:
 - Modified the driver so that we only apply the
   MIPI_DSI_CLOCK_NON_CONTINUOUS flag when the compatible matches
   a panel (the 351v) that needs it.
 - Updated the binding documentation to be consistent with existing
   panels.

Updates from V1:
 - Revised text in devicetree documentation to remove references to
   specific hardware.


Chris Morgan (2):
  dt-bindings: display: newvision,nv3051d: Add Anbernic  351V
  drm/panel: nv3051d: Add Support for Anbernic 351V

 .../bindings/display/panel/newvision,nv3051d.yaml          | 5 ++---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c            | 7 +++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1

