Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8780801E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 06:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51410E7E0;
	Thu,  7 Dec 2023 05:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36F710E7E0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 05:26:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33348e711e0so527387f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 21:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701926779; x=1702531579; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L7z0RXkoXYkLl1p5YIwWXp82DBhxPyJ1qOpvwjveyO4=;
 b=emhN7qUbsbV7kPsqQSBblm/4wAUrNoNtpj6gXacYhg/6ObwLkxQA8/XecHH6jew4Lz
 VaKz78V0pzn3/GjJukBYWR3ywCeiNhLhrG/OnzR582M7mJUDxAQ+mM1xcyYtJrcO64Ob
 ddxSo0939tPJ/dB7P6L1zORj+2bJ7WpPwBjA/XBL2xbDGRh0a+FI6iPWhXyQBQN3mN0V
 NoOQ1FiPQc9RxyWyNbqM6kk0Om6Zl8I9flcqfriNz7NpRj+KvrC0eWEu3N4RVHeob3Wf
 WSgNIhTR/jJt6mTqSGAgHWzbQY6E2axpqcwYkgvZJgYaov73slzef6wwn3szOMVceEN0
 EznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701926779; x=1702531579;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7z0RXkoXYkLl1p5YIwWXp82DBhxPyJ1qOpvwjveyO4=;
 b=TT0xikMh4QT2Gwguq5BA6LqaWj3YcEaNWyLfQpWcnZJ2QHtEiREs/FUYzoAUfXiXO+
 Mr8yja2Wls0f3YJfAFvnRcmmL88ahEdyvX8MbvERrl44KOaXyN8wFJwrmqUVpIuH5g8I
 EK+65epbNxRoiWENDEgxwx79HQMrnlskapLX++Pu+xs4UtR4LBVMJ44BWjxsHdLEiDtv
 0yHjLYjftHes3XH9uFOlOkvRlEgF9PpYgCZma+78YftN85tCgHvysEXMjoYB5NP1n3Ps
 duGFUJrqP+MJCGsFe4aOW/Z5ouWL9dsJwBEg5XY4jsMqMiHbZGaFOdhyZIKN05qmpZ62
 GEag==
X-Gm-Message-State: AOJu0Yxq1xXWmD2QGsa+B7E5+XWD1/8lScTV7Jd+ORbTDq7pZmysGd8J
 kZr/cJVyUbQ2+1R4UHxpqdTJ9g==
X-Google-Smtp-Source: AGHT+IEtMvE6B+5pXLBT+duzDpyx4x4YiJIjKZqE8bbzfzR49FgeGTytFNRVKhTMcDDUQ3a9d0h+4Q==
X-Received: by 2002:a5d:5252:0:b0:332:ec48:a132 with SMTP id
 k18-20020a5d5252000000b00332ec48a132mr1172607wrc.53.1701926779204; 
 Wed, 06 Dec 2023 21:26:19 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b003332faefd86sm472453wrw.0.2023.12.06.21.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 21:26:18 -0800 (PST)
Date: Thu, 7 Dec 2023 08:26:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
Message-ID: <db6486a4-0a2c-435d-908b-8d61472b51c4@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205105341.4100896-7-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, michael@amarulasolutions.com,
 lkp@intel.com, Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-bridge-Fix-bridge-disable-logic/20231205-185455
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231205105341.4100896-7-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v4 06/10] drm/panel: Add Synaptics R63353 panel driver
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070214.Eyi9T4eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312070214.Eyi9T4eq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-synaptics-r63353.c:132 r63353_panel_activate() warn: missing unwind goto?

vim +132 drivers/gpu/drm/panel/panel-synaptics-r63353.c

64f91a53613aea Michael Trimarchi 2023-12-05  107  static int r63353_panel_activate(struct r63353_panel *rpanel)
64f91a53613aea Michael Trimarchi 2023-12-05  108  {
64f91a53613aea Michael Trimarchi 2023-12-05  109  	struct mipi_dsi_device *dsi = rpanel->dsi;
64f91a53613aea Michael Trimarchi 2023-12-05  110  	struct device *dev = &dsi->dev;
64f91a53613aea Michael Trimarchi 2023-12-05  111  	int i, ret;
64f91a53613aea Michael Trimarchi 2023-12-05  112  
64f91a53613aea Michael Trimarchi 2023-12-05  113  	ret = mipi_dsi_dcs_soft_reset(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  114  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  115  		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  116  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  117  	}
64f91a53613aea Michael Trimarchi 2023-12-05  118  
64f91a53613aea Michael Trimarchi 2023-12-05  119  	usleep_range(15000, 17000);
64f91a53613aea Michael Trimarchi 2023-12-05  120  
64f91a53613aea Michael Trimarchi 2023-12-05  121  	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  122  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  123  		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  124  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  125  	}
64f91a53613aea Michael Trimarchi 2023-12-05  126  
64f91a53613aea Michael Trimarchi 2023-12-05  127  	for (i = 0; i < rpanel->pdata->init_length; i++) {
64f91a53613aea Michael Trimarchi 2023-12-05  128  		const struct r63353_instr *instr = &rpanel->pdata->init[i];
64f91a53613aea Michael Trimarchi 2023-12-05  129  
64f91a53613aea Michael Trimarchi 2023-12-05  130  		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
64f91a53613aea Michael Trimarchi 2023-12-05  131  		if (ret < 0)
64f91a53613aea Michael Trimarchi 2023-12-05 @132  			return ret;

goto fail?

64f91a53613aea Michael Trimarchi 2023-12-05  133  	}
64f91a53613aea Michael Trimarchi 2023-12-05  134  
64f91a53613aea Michael Trimarchi 2023-12-05  135  	msleep(120);
64f91a53613aea Michael Trimarchi 2023-12-05  136  
64f91a53613aea Michael Trimarchi 2023-12-05  137  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  138  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  139  		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  140  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  141  	}
64f91a53613aea Michael Trimarchi 2023-12-05  142  
64f91a53613aea Michael Trimarchi 2023-12-05  143  	usleep_range(5000, 10000);
64f91a53613aea Michael Trimarchi 2023-12-05  144  
64f91a53613aea Michael Trimarchi 2023-12-05  145  	ret = mipi_dsi_dcs_set_display_on(dsi);
64f91a53613aea Michael Trimarchi 2023-12-05  146  	if (ret < 0) {
64f91a53613aea Michael Trimarchi 2023-12-05  147  		dev_err(dev, "Failed to set display ON (%d)\n", ret);
64f91a53613aea Michael Trimarchi 2023-12-05  148  		goto fail;
64f91a53613aea Michael Trimarchi 2023-12-05  149  	}
64f91a53613aea Michael Trimarchi 2023-12-05  150  
64f91a53613aea Michael Trimarchi 2023-12-05  151  	return 0;
64f91a53613aea Michael Trimarchi 2023-12-05  152  
64f91a53613aea Michael Trimarchi 2023-12-05  153  fail:
64f91a53613aea Michael Trimarchi 2023-12-05  154  	gpiod_set_value(rpanel->reset_gpio, 0);
64f91a53613aea Michael Trimarchi 2023-12-05  155  
64f91a53613aea Michael Trimarchi 2023-12-05  156  	return ret;
64f91a53613aea Michael Trimarchi 2023-12-05  157  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

