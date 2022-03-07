Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3374CFB22
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 11:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BA710F387;
	Mon,  7 Mar 2022 10:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCACC10F387
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 10:32:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i8so22427015wrr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 02:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Gy2GGJRNoE8yXst/AS7H0JV0qPwD/Ie1gxojbs4D5c=;
 b=Fo26egBRntaoWEL3/DfwEyAAq742j6+C9p7nDoRR3xfgwKcH+E0TDoMeGdqSawnRY0
 zK2N5vNx5GMF6qcKk9V2KQnbaO6UyAUZCaFdE/FXr9jbVZfTgPCvGzsNhJ97oyKdTfTT
 9E7Vnhv8Rurn78Ms2XDJxajn01Dbp0imBBo9Q3pRVgfySlysnVpEFWUvCcmDxiOegZIl
 WWg1dZA3DQ/fsbnGYraHhMuoUVT/avjAHhbckx1TMJO0ndoAh5wSR7jCu7rJm18ex+HD
 6/yN5sjeCaH7th5JEU44U3ejPjC2rJ/XGT+w0F7t3lGOEwoOp7GFPRO/arGAf2ZkvV7U
 7hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Gy2GGJRNoE8yXst/AS7H0JV0qPwD/Ie1gxojbs4D5c=;
 b=2shZHVLMy+Teng262YII/jQWlPEZFP4X8VmmMuj7S0wFzhl6AK79CU7F9FHpTdAGSL
 EZwAGkEgsxDzWJyoafnD0rRFXw1cyCdLzbxsYV+h+dfMEAx2I1RQAyHlRkcPuCq50pXk
 PHvLTR02stcjN8ZRbI5bbZmIm796nag2PzTGq6Z+CfQdquvYUGEet3UP60F/CC9U9re1
 uxDuhIhiKnwt5lG81GFSjMcSv5GKUHznWz2PzhugoVR5KPkQTaKBVAGZnbRa1e4+OynS
 UQ+CJnejYf9ss7jvuibO2fAY+ESEMrOUGOTbV6oAasXKleSCgg0t6QQi4SEepK4KgVvl
 8Iaw==
X-Gm-Message-State: AOAM5302G7wWYNfQ3gZDiKUGogrmtLEs3rPvp1UsczB1jnOioJ4BSatW
 UDVqWP/Do+N4BNVa1ElfPqK/+g==
X-Google-Smtp-Source: ABdhPJwHiGercBUiYw+DtjYkKgYMr9GAQJXwN7tAmH0OoSry2XwjfzU/p74ni4PpTyE4NNe4RLvE1w==
X-Received: by 2002:adf:e98c:0:b0:1f0:2f5c:2e9 with SMTP id
 h12-20020adfe98c000000b001f02f5c02e9mr7534324wrm.356.1646649146147; 
 Mon, 07 Mar 2022 02:32:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c214a00b00389bcc75559sm385091wml.27.2022.03.07.02.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:32:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kevin Hilman <khilman@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
Date: Mon,  7 Mar 2022 11:32:23 +0100
Message-Id: <164664911819.1311314.8887306245856110435.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 3 Mar 2022 13:44:56 +0100, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: Drop commas after SoC match table sentinels
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f6e68388443ff50088e224b3a75090bdc0403be6

-- 
Neil
