Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D56EF676
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293F010E101;
	Wed, 26 Apr 2023 14:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EE510E101
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:32:25 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6a5f7d10dd5so5338358a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682519544; x=1685111544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ewicOSm/Md6u2eDxSk7+ZrJEH2xL0s7qttCd7YUUbyQ=;
 b=kPWH7EqBzHgD4AgAXYv4J+ipkQ5fkKnsbupCBPv5XQezBcmJgUvzUFT/zYU0rsf2Mf
 INiNHmQx0yExBXkG726tLzvInhh0Ui6xo26EVhhq+yEjIiJD/5XMUh0Au+D7085n6hUQ
 bw6rGQOJZUZJgPOLp0kJq+NJ/QWGwtrXz61WfMpsJcM9lJsjFjtnEPyVSQK0qy+5OuWB
 UDhaqNY0X2lZ/eTp49OJvnacaNJi9C00dKSrMhzgND6YylfjeUFNgdZwg5XN/fxz7lAB
 lJZYxBuLjd8tQCuxrb0EKpll8hABQVgxCcaGIkZ7S/aIdnc+m+jUzglsrTw+zzY8gUUr
 vJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682519544; x=1685111544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewicOSm/Md6u2eDxSk7+ZrJEH2xL0s7qttCd7YUUbyQ=;
 b=GZ5IJDIlk4laLIpVU3zZuYtF/wIeC7V7W76U1N0tRu+bOkq+0NapJ3WHLhLtCSbMyp
 2daduqDEJkaoRCDod8BAg/aPJtvUv3CW68AWGfPiZ/FeIJgbNIi7ga7WiVdfR7ulDhQ0
 B9lfsNc9cUwy1sSN+h1kur4CDZZ2RRhZxlUB/Uk6YPvJRKHtdSGiZvFBDo35f4HKsJUS
 ASUqFc3S14wCPUr5qnGfVIIUTB8AV8fyoM+KYCCAML+Z5ojGIrxpS2Z/wHcDpfQdwDuB
 XnA0gsoBthb2BcGsS5vybEthPqyqlXugXgI3lf3MhRtFHfB8bS2i0mxq/+ixFj2QDcJO
 sUmQ==
X-Gm-Message-State: AAQBX9eD4iiHF0tHoL5A7v18+3BeI9YhTDy79C4bTAjSQDb/XZu0OwEJ
 ZIR/pOEo0X7YV5klJ/iXfG49sJef/tk=
X-Google-Smtp-Source: AKy350Z8JjuE7edVKfQpAUeUeHAnJ6DqTt7NO9EO77LTIs2EHSPh44Bv+wrapiZWsIvH7k/UVVo7mg==
X-Received: by 2002:a05:6830:3a95:b0:6a6:4226:f2f6 with SMTP id
 dj21-20020a0568303a9500b006a64226f2f6mr7660574otb.20.1682519544585; 
 Wed, 26 Apr 2023 07:32:24 -0700 (PDT)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05683010d200b006a32ba92994sm2613502oto.23.2023.04.26.07.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:32:24 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 0/3] drm/panel: Add Anbernic RG353V-V2 Panel
Date: Wed, 26 Apr 2023 09:32:10 -0500
Message-Id: <20230426143213.4178586-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org, sam@ravnborg.org,
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the second revision of the
RG353V. The underlying LCD panel itself is unknown (ST7703 is the
controller IC).

Changes from V2:
 - Rebased patch series (to address removal of dsi_dcs_write_seq custom
   macro).

Changes from V1:
 - Split redefinition of CMD_UNKNOWN_C6 into separate patch.

Chris Morgan (3):
  dt-bindings: panel: Add Anbernic RG353V-V2 panel compatible
  drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
  drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support

 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 102 +++++++++++++++++-
 2 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.34.1

