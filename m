Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADAA5AC45C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 14:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F86410E066;
	Sun,  4 Sep 2022 12:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5FA10E066
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 12:59:28 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bx38so6718576ljb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MaCiino+kPjk0mzeLjaGzc7ngCKP9nbk7eUckZ209Uc=;
 b=nGmzIqyW8Gkt2mTsg3NQcRYeGgZXxAFa0SKkwwbtnDhOav/cvEu3IEgIS5XEWAujOc
 ckBTBJ+9zEbtTbV0nmLx99sKsvVsIbVQuOxq9SgTHxVuvgcfm9i9UwZQm7hIQFx6otRJ
 eVvoLDVBHXxQSmVg2U3fSE+lQYqe35iSj5dsJqgbrFqod/6dyxRb36Aav+p1G7BfZjS1
 ipvEWGJDjk3RtOsB29GEL5phjWhVZxU7G2yvnb5K0pme2LJpPlud4Slnk+iAYG+XXJok
 7NDF42stOftqkhA7YNClQZCjL60ASc+gWIXZi2ikDYdmdO6t2uiRUL+QU++1cWVOUtJd
 TbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MaCiino+kPjk0mzeLjaGzc7ngCKP9nbk7eUckZ209Uc=;
 b=YQUptqtUTkQ+LyVEguJ6EEE9xbMwFLAkSLlup9rNJ4Y332SCgBpEX7dYwDmhq+VX0W
 xRdNUtTg5nCE6I5Gb0zTqvmmfEyyW4SBGrZpYy19VYSCFpiDpbInbAp3BQ6pz9VNXvvX
 X9PIHYZ+VSUyuF7HsyCmyy7eUXXR32b/3XZkk2VSId8TlUZgJ66WztgnY1d2kyIhHH7X
 TSLIci/9wb8gDj9FVoTweVelvKhcwhRxvziHI2XJL165DihGoaZKxK4i53XgxlYFOajF
 a3qs82MOwfvIJWNGIwSS5DRZYXCkN0GbZihxuO4/RnD95Myp7Rg5tPJ2NqmaIMDMumIG
 ITfw==
X-Gm-Message-State: ACgBeo1Hede2BdDI1SjgW5RXANR7BPsxyGHZ64mC9Plj077uE856gNpz
 LNHOgYhGDMymuvsg7NdEmVo=
X-Google-Smtp-Source: AA6agR7oDNcqN4n23e8Kl3aqZxtaX3bou67PPbdyBcJiiFNQKq37CjJs3UzaOWRhwQ3dpvALHXbedQ==
X-Received: by 2002:a2e:b892:0:b0:25f:db66:3b86 with SMTP id
 r18-20020a2eb892000000b0025fdb663b86mr14179513ljp.79.1662296367003; 
 Sun, 04 Sep 2022 05:59:27 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
 by smtp.googlemail.com with ESMTPSA id
 x17-20020ac259d1000000b004947e89ae4bsm888951lfn.294.2022.09.04.05.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 05:59:26 -0700 (PDT)
Message-ID: <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
Date: Sun, 4 Sep 2022 15:59:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

01.09.2022 07:41, Bo-Chen Chen пишет:
> This patch is separated from v10 which is including dp driver, phy driver
> and dpintf driver. This series is only contained the DisplayPort driver.
> 
> This series can be tested using 5.19-rc2 kernel and I test it in MT8195
> Tomato Chromebook. Modetest these modes:

Applied to drm-misc-next, thanks!
