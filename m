Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109250B326
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125E310E63A;
	Fri, 22 Apr 2022 08:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9426410E63A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:44:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t6so6582854wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGLQHAkzK7JjSt9QZown/UN57Ky55LtxpxP5Kh3Vpq0=;
 b=8QhOHjlGtjJTa3UwEv/qYeHhjLS2ZbNEKUIgtt+cYyoRq698fFcXkKf5K3OJLZYH0Q
 +UqEQjqVRGA4L+YHjrSTiPanpyUXQwlcpWYYUMktO+CrbxTIHVq0zKbOKX8r5BpGTf0a
 oE719ymaB3W/4FY7lFsJXxW7bDov/v9tbV3r3nWgYtUaVurcyi7DoCB1fk0z1zA85rWi
 Wop3+HT5l6JEtry/11rJE7u8JNk81OW9GZGJ74Gn62FfKCeps3Y3+Mx8ojpj0NAYaqz2
 2IVIQX/Zd2sJPNTR5zWkOG2lVxUhzcKphENIS2i9Near5AEWwG+WvweX1sWcASu2pu1G
 nElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGLQHAkzK7JjSt9QZown/UN57Ky55LtxpxP5Kh3Vpq0=;
 b=CUkxxRFm35DQsg06ttVDNC3onGTLyh6zDOP4A34r3zrr1e7be2fPD/ruu1EJXeGbTg
 ul68uuCAFfuyAC7ulVaH6f/ZEWOtHqLJM4jHnJ6lr5Uq9wXkYnQDv9VICgklD+WqFIkL
 6gUXLFQJH1SAS4jJay+SiBA18wjT70oO8NgYuz9dPEETva0B9Lx08lQzt9F2LEQenbwZ
 bCdnb9cgWHCnXm+HXg0WNMcFZb0+czpDDZ3iY2dxebnlrsj1nsEqdoKVL/l9iHJYjuYY
 KGefex7LMJ+5yT51mic/QCsPwosEHAg1/xvCS/9NPSMnrHxUN0DZFQzR5CryRfSqimAX
 C3Pw==
X-Gm-Message-State: AOAM530UQHBMk8MaAIVE3pUMaEnirb5vci+CLYztnzudISTvoTGFRfoA
 f8nxRScNWF5vY/MBG4fyf4WXtw==
X-Google-Smtp-Source: ABdhPJywtATRsTspDnN95ZBg4mCkpTryvtiMy/4QW/bWGxrVBIii+hWzYZZALv4a0By/OmNxBc9bLg==
X-Received: by 2002:a05:6000:1c8:b0:207:af9e:a4ec with SMTP id
 t8-20020a05600001c800b00207af9ea4ecmr2762065wrx.9.1650617076027; 
 Fri, 22 Apr 2022 01:44:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm1144921wmq.46.2022.04.22.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 01:44:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kernel test robot <lkp@intel.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Audio: fix returnvar.cocci warnings
Date: Fri, 22 Apr 2022 10:44:33 +0200
Message-Id: <165061705553.2647880.6752040608547766409.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YmFzutFV/iDyEQF2@dd18de969aa6>
References: <202204212311.TnfpcTGm-lkp@intel.com>
 <YmFzutFV/iDyEQF2@dd18de969aa6>
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 21 Apr 2022 23:09:46 +0800, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c:80:5-8: Unneeded variable: "ret". Return "0" on line 94
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c:105:5-8: Unneeded variable: "ret". Return "0" on line 112
> 
> 
>  Remove unneeded variable used to store return value.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: dw_hdmi: Audio: fix returnvar.cocci warnings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0e48711f602064705bf81eebe6f627ee1bc11d3b

-- 
Neil
