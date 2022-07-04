Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E4565BF5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0110FA85;
	Mon,  4 Jul 2022 16:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4481710E068
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 14:24:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d16so7407600wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bp1wg82gdWxinNfZCuCgL7x1XYi28SYXqHd8Ha4MekE=;
 b=RxfIDxavIAmAgvyiLqADwT4xQOj9LQkO8txG1jgIaWP1ixgOtm4BB392KYBH6xvnKM
 Ye3kqyLyuXZIBFRibXyctZN51wel3re6qMEgd2KHGQmoQxNgZLfKVjyuXCjdGpndnVCT
 IG9I7CIy9WI41EeD1OIezbFdShc0RS4nz4ckTSZcQ8YIcqfqvtHz5vspU96EQWf5ct/R
 rM9xyJad5LMKuws5cRbMICdr+CKHH+W78NFQGibKeZb9WKm3yQz/952QxKc88LTW8WOT
 53Ox7wGU2fN3NxxWRr+eKwQg7GtyNlJl0sV5zn+Zjq+z529Urs6hLtA6ThSOQv6VY1t4
 HvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bp1wg82gdWxinNfZCuCgL7x1XYi28SYXqHd8Ha4MekE=;
 b=oSErIINUYao6tNoa7VGqolyQ35/LK6dMXMc/MHSCD1F9hQSKT5Z4EDmoKFHgTGRQMt
 Q5frO5+SVEo54+amScAVUXTXt63D2ccmaZwa9h81jG8+nWbmhn1E2Geu45+620YqmAre
 hIvsD6KEeE2RXzAnu+iUB47FY4G1rPduYOU6U6RthGS6rpxGLPkvSBuM/psVVgCBY1kq
 ViIbccumMLYMU9aa+lyeHhFstpmNFUuaRsccdnswlVTLJ63YUDS50cfXOZW38muxRoWb
 /gnBVFYUhyZIENfqdN7FpS8wyjjk9UCWqdUSfllmjBx/dgGHE6K/QK1PBDU0cNt/Fral
 D9Rw==
X-Gm-Message-State: AJIora+Un1edGnxZZ7pEyAeVFE6bXRY1NEzud6ghn9gmMn5KlkYVHcky
 ZoFxy6qlxxMyMCHGQUVwuXqmyQ==
X-Google-Smtp-Source: AGRyM1uTsz1TDgg8/38iwpaQktF3rRo5ZcTWH5lFqvW5z5aQj9xHF1C28BNOXA4uhVj8myD5t4oC4g==
X-Received: by 2002:adf:e68d:0:b0:21d:6d20:5175 with SMTP id
 r13-20020adfe68d000000b0021d6d205175mr3193032wrm.494.1656944674408; 
 Mon, 04 Jul 2022 07:24:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:df6d:5783:b4dd:8e2])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a1925aa19asm10100650wmq.21.2022.07.04.07.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 07:24:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/bridge: fsl-ldb: A few fixes
Date: Mon,  4 Jul 2022 16:24:32 +0200
Message-Id: <165694465386.3087613.3999900906526053435.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701065634.4027537-1-victor.liu@nxp.com>
References: <20220701065634.4027537-1-victor.liu@nxp.com>
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
Cc: marex@denx.de, jernej.skrabec@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie, jonas@kwiboo.se,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, sam@ravnborg.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 1 Jul 2022 14:56:31 +0800, Liu Ying wrote:
> This series contains three fixes for the fsl-ldb bridge driver.
> 
> Patch 1/3 fixes mode clock rate validation.
> Patch 2/3 fixes LVDS dual link mode.
> Patch 3/3 fixes input data enable signal polarity.
> 
> Liu Ying (3):
>   drm/bridge: fsl-ldb: Fix mode clock rate validation
>   drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
>   drm/bridge: fsl-ldb: Drop DE signal polarity inversion
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/3] drm/bridge: fsl-ldb: Fix mode clock rate validation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=591129d3db266648823bb953ebbc28c92e059bf3
[2/3] drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=57ef278ef125e9188474a164f35dcffc69836d01
[3/3] drm/bridge: fsl-ldb: Drop DE signal polarity inversion
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1dbc790b4d416dacb124a6acd05f88a0bcf3be39

-- 
Neil
