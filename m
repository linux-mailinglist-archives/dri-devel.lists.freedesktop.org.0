Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B435C677FD6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4CA10E4D5;
	Mon, 23 Jan 2023 15:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D4310E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:33:27 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso14278240fac.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oOMdJJ7tO8g5HvvXc6ajeDiZ3m3enYXQGn3XKeh4WI0=;
 b=H3zDW+X7s4GrSEkOXPHxnWYms/gQgjvuK02PB10V8mML6AdIY4lxxBqpNnkgZKvk1j
 5/Do9SDQuElV+O/e5BMoFZUr8to+7/gei49HuFjvqVIgmOmZOwt5CUP+USWEUFgf2N5l
 MxYzr9tL76IzjkOOtGQ9C0Wkh+2vhP4JN71L6eW2Qbgc76QRy3QtQYW5QNX2r0f/vBGe
 LkyX2Gd96ErsiqWRAUROrn0GDMzTJK1gIOEikdiZ4nDvwuuIiTDrmMEF5ceKlg+gaKpy
 a4Iaqv/CHmrVmXQ+loyW4HMgMgwb+JLrhhkpQjq9OL8m6lKQ85awxXOkUYhlj9w2rCup
 6mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOMdJJ7tO8g5HvvXc6ajeDiZ3m3enYXQGn3XKeh4WI0=;
 b=vcjEv92HTzB1OiHhdLCgwJXPD7mj/aNFOdfh4okL0gchogziSpUI9THvOCv+yG3wn3
 pOHzkfi0ik6I4/T13ZVaw7wVnGNQwDTi+zcUIrRAQU6/ALaVrWN0wG9YUFjLaOmu/HII
 jFn88FIX+NC3+0pYie0CSDaEkuJ/BL8EaqXEki6wypYObYay9bwMtPq6VrPYjHW9MGjO
 VbUypO7aeYHa2PIBdRotmrFsaGf9g3uss5UxrE5eNz75Rjr+GDloR4qvXmFah6KcQr3N
 Xe8EYvoZmWFj4O2xsfYQ5tjmehg5vKG3JhIed8nACYasutSFMGJfk+p/1Gv13/3PSlwt
 mt4Q==
X-Gm-Message-State: AFqh2koU+5CGz+1jnhZgSVaJqAi+RZUGi2JouxQQBC+1bZqkNThPmXhn
 Tk8T4y+kP+anS9Vv0lCSYd0iv7/8hsg=
X-Google-Smtp-Source: AMrXdXsSx/1HctSWiZWDWFHYaTiZF40ekgjRm6MkVVZWtWC188AQ/W7ESw6clYKZkXLD/01UU3uucA==
X-Received: by 2002:a05:6870:9a07:b0:15f:bcf0:86c5 with SMTP id
 fo7-20020a0568709a0700b0015fbcf086c5mr5814078oab.56.1674488006238; 
 Mon, 23 Jan 2023 07:33:26 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a056870708100b0013b9ee734dcsm25459182oae.35.2023.01.23.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:33:25 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/3] drm/panel: Add Anbernic RG353V-V2 Panel
Date: Mon, 23 Jan 2023 09:33:18 -0600
Message-Id: <20230123153321.1314350-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the second revision of the
RG353V. The underlying LCD panel itself is unknown (ST7703 is the
controller IC).

Changes from V1:
 - Split redefinition of CMD_UNKNOWN_C6 into separate patch.

Chris Morgan (3):
  dt-bindings: panel: Add compatible for Anbernic RG353V-V2 panel
  drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
  drm/panel: st7703: Add support for Anbernic RG353V-V2  panel

 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 102 +++++++++++++++++-
 2 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.34.1

