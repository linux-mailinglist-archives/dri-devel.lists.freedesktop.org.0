Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED064DC58
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 14:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCBA10E03F;
	Thu, 15 Dec 2022 13:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987A010E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 13:36:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o5so3084487wrm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 05:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbfBcU9A1qcZjZLYbdzPQwKvFqbEDNx+6TcqfmObulM=;
 b=xSxqvWtrRrWeU7bLIs1demiCzLhGsuTmM+xAgDZ3pQmMHq41LUzKmB9oEpTpMKvyNF
 J136QvZcaTBf4tEYPqK0/cvCMXPWKFbaN3V6saIHTNCFYgh15L3dK4Obm2YpbYxFGX1D
 +7e4U9lZrW5fD8idyHCRMwAEPAyE9Uy+J4vVgcNv4RMopsGzcco/3SgWxICwpG30PktZ
 jvQQny3aFcDyPqAgevQO39AqBaq8C8OUtHAwVjDSrLAuL1IO5mCJBBenQDt0P+TN4G+C
 Ag7tMtgpKBH0eCyBiTgbTbVxWRi3lXgBMI48DzbiUblrKwGDvxfWSkvrA0IjrX8VXke3
 TwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbfBcU9A1qcZjZLYbdzPQwKvFqbEDNx+6TcqfmObulM=;
 b=di93dHc5QbSR43SH87HrRQUU3hhL+K1k10nux9RWRNQ0vkyrabt2PBQCZMGlfbXlNw
 J1ylUNOyVWU5HcEZUuSy2hT4byeIrYspAF5znM8NnBPh65azYpbbCnvPatVnPOKUUPP0
 aGnMPmO6TFx5HbmXmgq3DqVV+my5gEPDDTsuhkG/PKftu83plrcaWOgtuSQp4QrTroOE
 t+kKSBxWoWnASEHTbs+kzlAgLSgCxjFQzWUBl5634g2vNuFud06IeTAOmz/UcHYkxe1J
 HH6YxYXN/Lu0GLht3Z2LNBLZeZWxH+LXu/2/uTtpa8ddv3yKLPNVJi6puyba8GBCRz8S
 VtVQ==
X-Gm-Message-State: ANoB5pnjEFBSc0rxGVwyRn2jS21a1fMwlPpaNGZlbt80q7Bs5xNhWxg3
 CUuOnRDVn4wUbn9KPraCVA8A2g==
X-Google-Smtp-Source: AA0mqf5ZXBLizzx5vPqrVCYrI3ddotv22opYYEybkbq5yxVjFk5rwP1q5r7+TCgCn6Qx0cj8/izb1Q==
X-Received: by 2002:a5d:470c:0:b0:24d:867f:10e3 with SMTP id
 y12-20020a5d470c000000b0024d867f10e3mr12593771wrq.0.1671111399103; 
 Thu, 15 Dec 2022 05:36:39 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:7e6a:e951:1d52:a2ae])
 by smtp.gmail.com with ESMTPSA id
 e36-20020a5d5964000000b002425be3c9e2sm6019829wri.60.2022.12.15.05.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:36:38 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v7 0/2] *** IT6505 driver read dt properties ***
Date: Thu, 15 Dec 2022 14:36:31 +0100
Message-Id: <167111122676.1425386.1293802929297712782.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103091243.96036-1-allen.chen@ite.com.tw>
References: <20221103091243.96036-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Nov 2022 17:12:41 +0800, allen wrote:
> This series let driver can read properties from dt to restrict dp output
> bandwidth.
> 
> Changes in v3:
> -Rename property name.
> 
> Changes in v4:
> -Use data-lanes and link-frequencies instead of "ite,dp-output-data-lane-count" and "ite,dp-output-max-pixel-clock-mhz".
> 
> [...]

Allen: The email name you use must exactly match Signed-off-by string,
or there will be issues like the below when applying the patch.

-:139: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: allen chen <allen.chen@ite.com.tw>' != 'Signed-off-by: Allen chen <allen.chen@ite.com.tw>'


With that fixed, applied!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/2] dt-bindings: it6505: add properties to restrict output bandwidth
      commit: 380d920b582d0f83852ac6885af868d93c38095b
[2/2] drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt
      commit: 380d920b582d0f83852ac6885af868d93c38095b



Rob

