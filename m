Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B855E76E3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A6710E7F4;
	Fri, 23 Sep 2022 09:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1647A10E7E0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:25:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g3so19407199wrq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MRMPaYOZfRCFMzm//UQtHGBmnKZ92vWhPYsR/JQQCX8=;
 b=xPAwfG4lwIZe1N2CQA2b5d58frzx6XaqGIgTIPpkeutE3qwSyOnJA4iwB1gE6wejAm
 ECZVSlIB+AJ0IrTt8Db5oZOkm/Sl/htleP4s8l5fkAkG/4FgD3TMRO1H4RAH3pXFCVTp
 0CFtcooCmg8YZ0YAwwlUhfI4i3gTDQfqsc9S6bEjDR21ZljvfV8MihhdUbP81Y+EVzIq
 kwH+sPTJitlezkxCc60MV8Wo8WBYbvCfX6qJrAfod2VcBm2QwnlauNKJCTIlMNlLA3ix
 awG7sYa0cV8DWPhGVivGj+3bRgTIFSTltsZ7TRQBZPSkfu1g0/f4c/a9ZOUmeU6Ejr06
 83bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MRMPaYOZfRCFMzm//UQtHGBmnKZ92vWhPYsR/JQQCX8=;
 b=Ymgemca1oXaTkkXI6JIIUYZgO9TPBnV5VJovabvGty2qCZH77bwm+8wfcYRRA5XRsj
 qjrZuZ5ZYt5waAangHqT5H/SFUt8OPofPCH5jopZSjf9IlQjiCWYpd+yPhlu3Z9/BIEk
 pPydIN2Pk9H1zUFdbue9oyLi9rAQHctL3ap51pqcDdAss0OmspxSQ5MyE7MwFK0cUmpU
 7qsI0rxVti1SuZONrDapC9dlns4b2eHZNCh8g/2H+18E9iXQSO98RYL73bway1TinGZx
 Y6Q6dL0TkTWd9xB6CpNbwIw2BsiGERbFcOI0Xu4twnEOIuYQwl5l4owRZH9oXZtfuTg4
 80jg==
X-Gm-Message-State: ACrzQf0kGO3uMTlSY3WF9hl9+DOIVfS5aclL7kibY/knnuPnKCnc+1CH
 2Icz4cHsBTzZkx7lsj/iovkwDzcmsgNzETbR
X-Google-Smtp-Source: AMsMyM4l58g79jGtvMO+UdAXgSJqnb8aVzNb7Eb1oWURmqua3q3sfZwcBOixGa/oM2iNe+lXwCYqUQ==
X-Received: by 2002:adf:f385:0:b0:228:dbf1:d731 with SMTP id
 m5-20020adff385000000b00228dbf1d731mr4374900wro.364.1663925118554; 
 Fri, 23 Sep 2022 02:25:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056000038700b002258235bda3sm7493347wrf.61.2022.09.23.02.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 02:25:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Philippe Schenker <dev@pschenker.ch>
Subject: Re: (subset) [PATCH 0/4] drm/bridge: lt8912b: Fix corrupt display
 output due to wrong bridge config
Date: Fri, 23 Sep 2022 09:25:15 +0000
Message-Id: <166392509385.2599200.1091239047831409182.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922124306.34729-1-dev@pschenker.ch>
References: <20220922124306.34729-1-dev@pschenker.ch>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 22 Sep 2022 14:43:02 +0200, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> This patch-set fixes the lt8912b driver that currently does not take
> care whether or not the attached display has postiive or negative syncs
> and or reports on EDID if it needs HDMI mode or DVI.
> 
> This series addresses also an issue where the LVDS startup sequence was
> written to the wrong I2C address (the lt8912 has three). This caused
> writing into reserved registers and causing an unstable HDMI picture
> that manifests itself only sometimes and depending on the monitor with a
> flickering and a repeating of going black and coming up again. While at
> it move also some sensible comments to the sequence.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[4/4] drm/bridge: lt8912b: clarify lvds output status
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fc44f3636a4db6544fd1532280e8adcd1ef13ba2

-- 
Neil
