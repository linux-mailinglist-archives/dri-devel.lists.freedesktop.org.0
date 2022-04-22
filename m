Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC650B93E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 15:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F6010E00D;
	Fri, 22 Apr 2022 13:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD9E10E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 13:55:26 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id s14so11002021plk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=wQEwtOESIF1V+T+aeC5OuSC+0X51M61506bJtFDGuveJFUMYM1ri71xvQKAT5XtBtN
 MfpHng3FshycvKJNhPfUhBHHBIMd+c5/fNK7NDkttTF/ciYM8GqVzTdwZNzeIwMcO2Tp
 PW+dwCV67FG1/j6GqKJv25GLYOK7UOcPQlG/iBRBRZzlfQEooCHFUJUR7zbq4JQCfgsD
 10OvrghvQ1FVEIwKY9relISU+/dpnhwYfoQmTrAlWsSd5CY7Ktxyr/Q1tlXR7ntflM3K
 gK/qbijjC+UurFLSFFTrFqi20ulBg2iPm9vmyO4xigwy2SefqVseJ9LPtdabEIsT8YkH
 OZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=5x0QNGlF0e2QhZr4GhFf/mdJmYoOB3X5c+zC/lr/zxS1cSrDoFFq85Ux2+5eDfsO/b
 rw7zf6c82TUVtYEKRu/ltmBTl5PvqmTnl3wLDySfCy5/D+gjKYmE15uGNt9fYLw5Qb7y
 53UEmxff8VO3q3R1nbVELS6uSB5yjJVG8VVmmFp2uBdYbbGuNkB10Wv5HOaSwj1ERCjm
 AC7XuAuaJldoa7nDWhk2b0zO4HKTEXVeuJbJsRAFPKiUCQ2BwXPXi2SGTILh+909PdZ4
 vDfDutSuviaCyu5MKjXLXJG8czLQUDqwAo1vspWO2FpuyW0JhdeOy3lzha6+2gog5kPe
 NwkA==
X-Gm-Message-State: AOAM5319irPZdndqZcdtJC9bFVnUrz3DljqWEJcJS+uC+Q1pWLEqEyir
 mzOmN/VmANl+beGkrShV+9fZ5lQlEroF1C+2XG/XAA==
X-Google-Smtp-Source: ABdhPJx4rl5aJnGHMIo11ZB1vNhuKtvivqC7qTKNYBL0zgo+rxkco0TSEXwd5AXTYQFZdMPenBr3Q00w+wFzFxEs/aY=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr5519714pjb.232.1650635725767; Fri, 22
 Apr 2022 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220421131415.1289469-1-robert.foss@linaro.org>
 <737ba7a0-400e-4fa0-82e8-f27f62d7c870@baylibre.com>
In-Reply-To: <737ba7a0-400e-4fa0-82e8-f27f62d7c870@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 15:55:14 +0200
Message-ID: <CAG3jFys67PdAPXJvu8ZR9R6iOuMhYQ1Wi5CZTOSaOabJ3W=SNg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: Fix it6505 Kconfig DRM_DP_AUX_BUS
 dependency
To: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 allen.chen@ite.com.tw, dri-devel@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, kernel test robot <lkp@intel.com>,
 hermes.wu@ite.com.tw, Laurent.pinchart@ideasonboard.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
