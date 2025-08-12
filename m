Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54588B220A1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A00310E0E8;
	Tue, 12 Aug 2025 08:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lwCMIk/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF9210E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:22:56 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-76bee58e01cso6133501b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 01:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754986976; x=1755591776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/xlzRvcOIe5uZJVNBnGirdjO76cMyvVWGXGiatQ/nHs=;
 b=lwCMIk/2uvEBKW5gVNg4dleRAnawCpGllETOP2iROXZMaSA6+5l3X+ziWZnFQXa56l
 Ho00jJbLmzgBQOjsl8lMwyEXLsZaJ86ixxXM97et+r2hvsX7AlHo3mdLqIE9yAJ+s5S+
 hCCkNvHWA6xUwrl/xlTWcBkySGyZ+o8K8/kVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754986976; x=1755591776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xlzRvcOIe5uZJVNBnGirdjO76cMyvVWGXGiatQ/nHs=;
 b=aLa7LQAXurosu+spwR7BWUHn9c6Mff2G/Y8D2CZ0aqTjaN9JTqbtmY5raw+STTVqTP
 e2pNKRLYYpyrRAWsqhK5HbdCCyGW/BKu7VbVywQ5vPK7dVrCQsqSjMWOXHi7vNvqkwvS
 HLBKiD2540yuXE0xBQ3tExp0BWlG0EMIufhuO5ed6C3CslNy8wCN6GFOdhlYoERU2O7w
 u4T54WcO0vysi/XXLfSYDxxu0E/iGzvpRp34JFZXrNvXyMP+ie1UJReg1AG9ub2MOHLO
 KcQkX7hbHWlpABLSFChDPEbM480IHOsodTSQTg3BuJX6YapJN/e30XLyMsfYUiosaCWa
 AGNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMgMUTKCo5badD23+JAURIqB6oRh6Jwziui6OAyf0wzcUCSrU5kTR9AGVHl1n4AafItKO4L5dATbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVWv+Np/wtA8oGB2vJ1vxtvGvBhhpmM9sDLqMNnEe5HHMc9kdc
 Q9j3zIwFpP/wRNzHv1qLkdcpYdXdy5BJ2BF3ta4Zj3Esw2x5xKz1/OCkvE7wznpf19TFESatqsG
 mwRM=
X-Gm-Gg: ASbGncuW+BfBRZ8tnb50nuVl8Hcb/bS8I3gbYPq7AE2+aidlKcID0R8Qk4z5pWlEkky
 otnNWJQS+g+T4ZvwPQUlh4VURHJ9GhdpXM/tkFb8nU+0opTDP2v/cTG0YLXGbXE5KAONxbuW8tX
 BRQzdjzef3z2Gxi4kXDcRp9JVbGHVPWPJOXWxXL5qXzTlODlDo+EUpDU+zjc5dqr2czo9T5L+ek
 3K7LxCSul8wDsOCH7bYdR66KvloOQ87JvQ8rTSuWqh5olCyMa2HiiL7//9HGXQWXi7tly+cL3QV
 2d5DfI+Q6EsshT6SFbtoSgVCdp+gvO26IgvBKGI91z3xq3orWCOsjjSeDbOyu9v37mZ5fygpH05
 q8ceLLQke8EphFnMftE1HJEbQlo63Ukq6YuLxcD491YYXeEfvniY=
X-Google-Smtp-Source: AGHT+IFX7Zal6yVLOBzv98XnS+Txo+CZD9saoFkysJ5NCQWdHrViyTyhkikmljjnQK3y4IYljKOUDg==
X-Received: by 2002:a05:6a20:3ca5:b0:240:1de:8bdb with SMTP id
 adf61e73a8af0-240551e9484mr24248092637.30.1754986975975; 
 Tue, 12 Aug 2025 01:22:55 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:8e8:f5ef:865c:a4fa])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf77210aesm22722064b3a.113.2025.08.12.01.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 01:22:55 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>,
 Fei Shao <fshao@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] drm_bridge: Add HDCP support
Date: Tue, 12 Aug 2025 16:17:57 +0800
Message-ID: <20250812082135.3351172-1-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
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

Hi Doug,

This is a refreshed series to add HDCP support to DRM bridge.

This v8 revision is based on [v7] and rebased on top of next-20250731.
Note that v7 includes 3 patches, while v8 has only 2. The rationale for
this change is provided below.

In this series:
- Patch 1 registers the content protection property to the bridge
  connector if a bridge supports HDCP.
- Patch 2 sets the HDCP bit in the ANX7625 bridge driver.

Both Patch 1 and Patch 2 were previously reviewed and acked (sort of,
see [ref]). The Reviewed-by tags are carried over as there are no major
changes in v8, except for the rebase.

The third patch from v7, which was specific to the ite-it6505 driver,
isn't included in this series. Discussion on that patch had stalled, and
it was later reverted in the downstream ChromeOS tree, meaning no
manufactured Chromebook devices in the field currently use it.

As a result, I think we can only focus on the first two patches which
have already undergone review.

Please take a look. Thank you.

[v7]: https://lore.kernel.org/all/20221123100529.3943662-1-hsinyi@chromium.org/
[v6]: https://lore.kernel.org/all/20221117110804.1431024-1-hsinyi@chromium.org/
[v5]: https://lore.kernel.org/all/20221115062835.3785083-1-hsinyi@chromium.org/
[ref]: https://lore.kernel.org/all/CAD=FV=VoF5PyeNWX+4_3sseyRemZVsr5WtQVeg-8mhfgm40w3g@mail.gmail.com/

Regards,
Fei

Changes in v8:
- rebase on top of next-20250731

Fei Shao (2):
  drm_bridge: register content protect property
  drm/bridge: anx7625: register content protect property

 drivers/gpu/drm/bridge/analogix/anx7625.c      | 1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 9 +++++++++
 include/drm/drm_bridge.h                       | 4 ++++
 3 files changed, 14 insertions(+)

-- 
2.51.0.rc0.205.g4a044479a3-goog

