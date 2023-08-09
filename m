Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94A77641E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 17:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D15710E461;
	Wed,  9 Aug 2023 15:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16E510E450
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 15:39:47 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-58451ecf223so114837b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691595587; x=1692200387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gnxrC9+PjEoCZBhf/tERYc/k39q+k50W9kHBAz7pScw=;
 b=igsdZD86oYVq4D9544bLx2s8AIJcUqim/Bds9c63d1dcILXkKY8CMIutZo2vbuQvTe
 NTu51d6llwTQ0R4emSVLZ3Ah3RZ50sOYTpXlX/iJtiGycY545n0P+IbsBw5NKRBtj42b
 Z0urSvaU64UWrAjRUi79W1pGcryWorysm1b0pYfSRfyMSe8CwDmggcf8nU6ldwbgRqyW
 S72/6X2YdA6Ub4tAr0XjlJHvhP5rlp4iGHK5XNrJyehmusm8S8P7bQDcGjnbLSJM0xAB
 /85w3BMZOSVKrmXUubUDv8e2JDXfytjCaNMaPVoNd80u8+Omm+ldTvhaJxaqvpD0+NAH
 87oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691595587; x=1692200387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gnxrC9+PjEoCZBhf/tERYc/k39q+k50W9kHBAz7pScw=;
 b=ABiVFiePk5eJ7AtaWwwt284+U7EKGNxgVUUgKItzMH013dw/K6L1rH1hvybnw+Jh11
 2oCvC114JnSWz+rKBgl4kmILpz7lhvZJVvKs/loWYfL8ZGf7S8vWOZKshFHfjxG6nBUY
 aadQex/dgnELgWshmqIGwJrOZgex49whccCo4XG3Nl7HXoSC50rsJ12CDCK+iBRUzQC8
 Sx3LJ7gTk5Vi8+q28MPlEG0aLcfa4dKqOEHLQzYmepV83uZox/4ChYHQeOBnW/iYRn9H
 MFxNhtfrN9F9/9dHoM/+YETjh6cH6hArARcP7FdRLBzZrvII6Gu6FUtlQzqMq32ohRZg
 WYGQ==
X-Gm-Message-State: AOJu0Yy5b1kxMFtitAqTbWO3DDAHORHzKJbVmjGMbfMmUmrp2KWDY8FL
 R9Ltv6jLq5enXTh6hAhGvHyA3D6obEI=
X-Google-Smtp-Source: AGHT+IF1KZ+ZjwCnbhEUYc9LWs7sjj0Qv5ILjvS1v62hTEBZeYF5GxvOQbgaeeNbEe7FEnVl48CJzg==
X-Received: by 2002:a0d:e946:0:b0:576:8a5a:87e5 with SMTP id
 s67-20020a0de946000000b005768a5a87e5mr3013889ywe.26.1691595586892; 
 Wed, 09 Aug 2023 08:39:46 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a81a50f000000b005707fb5110bsm4043969ywg.58.2023.08.09.08.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 08:39:46 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V2 0/2] Support Anbernic RG351V Panel
Date: Wed,  9 Aug 2023 10:39:39 -0500
Message-Id: <20230809153941.1172-1-macroalpha82@gmail.com>
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

Updates from V1:
 - Revised text in devicetree documentation to remove references to
   specific hardware.

Chris Morgan (2):
  dt-bindings: display: newvision,nv3051d: Add Anbernic 351V Support
  drm/panel: nv3051d: Add Support for Anbernic 351V

 .../display/panel/newvision,nv3051d.yaml       | 18 ++++++++++--------
 .../gpu/drm/panel/panel-newvision-nv3051d.c    | 18 ++++++++++++++++--
 2 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.34.1

