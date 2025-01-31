Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62481A23948
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 06:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B7810EA14;
	Fri, 31 Jan 2025 05:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="SPLG5buR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A1710EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 05:21:49 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-215770613dbso20445845ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 21:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1738300909;
 x=1738905709; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TECEfBx/YlJzKHUiIw7NNpbsIMGVbyaE2w7qpMl8TVA=;
 b=SPLG5buRsQ2Jnc+fWEkbz0mXF/H68ELkrBRvNJBJo1GKJ3SRTPmeen4GA8Uof0EEm2
 5g9KitV07/TmHyliHnWWzZdiXalQGLRyS6Q3wjXdDpv4T3RhXKPcseCW4zEBRm8qgbSv
 LWKomeSM6ronXwP9MXIPDQu51OjAju8s4tRgT+1uceiJFPEm2zDCFUrPaSdcHvDd+wXA
 WdfdvJHI2lIboOEwgtHZ8ZZXFJhbFAOXAr4VWy9wruwI+4iAsuHkBREDcZsAvIHizQoR
 JGVVvqRCe1bA6GmsRp96n48yowcNiWk8LWcsUBRxlj3CljFu69pNKVRXbk1X1iofzrVI
 u78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738300909; x=1738905709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TECEfBx/YlJzKHUiIw7NNpbsIMGVbyaE2w7qpMl8TVA=;
 b=iJkHcWJHgvRS42jNKvcmsH0bdfc5xrV2o522FDUQC6dJO9On7NbPxYsGYMdioZrIf+
 I7798WpN/hMbl7uHxV6hSY8WskdQSsIDZw1lRx5BMQiZcstYPQi3XgCp8HNOgaXMDAf0
 D+31eTHYmXO3VQ6fwu6hNbpF/8tItQe7OvSH/qxXFgpp/NbQ8SOI2jcT/5zur3gm6XlB
 rxdM5QIGrEz8KkJKFwlqAP0drRqyRhvaxSIBqudNJxh0tdXl4+sYS5eOBg4ctkzxBfMv
 Um5g6z/iJHThpYwNxgGOIp6b6Rrkh1TeUdYgsplzmfXL0IavMoVy7UG+fgQZgzBwIn7t
 akZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlcReFTrUKJqt0pkyRzXrBIgBAIlB1h0Zbr5hkgAIcdVlQfqOsrSUd4BMjKsn3VmYqTUK9e7zmnU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfqLK/tTRbfxl0pW/cJtSes02vv+wHYIE0kR+ns4IRLDEgGOpM
 FSa+NtxIWsF73LRIRO7PPhYcjUSIowQsGqt+VbXfx6yfaoNwp0XBjjHg6mqUVlw=
X-Gm-Gg: ASbGncsPeK6bxkS2H+fsrtpVUKwkrHTkMwJGP4huFEZj8a9LJcJ7NVb72asrNM4DxxM
 jixp9ns8kDSDYb7hxZ6/xuzJZmXWlizg0cidWjuIwq359GU3x0hRftlqhLrrtXdgNy+sc+huX5F
 ckwYSuHx/cdVWD/WZqgp8Dd042T/X+Ztk5i1QEtFGG3R7uTXejgwvgY7jGrC0cR+b4+t7DPL3TO
 acAMtZnUPqrTXXoJAGPPJmECm59mSWwZAYvMitPwUxMvFIBwfySU/kAMLq8u3+mdydfE8z+UdBp
 YgaBP9uC3j2dB1ZlO87FoX/6kFXaBYZti9mrJ7+58Pf2p8E72hiTA2p467vpCAUr35pM
X-Google-Smtp-Source: AGHT+IEzIef9ccRDBG1mg6yk0Xd5oFvkh4KVzK2H3lccnDMhesKjXBhEF8WrqTCAXYBkKEolMuwkmw==
X-Received: by 2002:a17:903:2990:b0:215:a04a:89d5 with SMTP id
 d9443c01a7336-21dd7c4c2b5mr155916475ad.2.1738300909228; 
 Thu, 30 Jan 2025 21:21:49 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp.
 [133.32.227.190]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de3323e5bsm22438815ad.223.2025.01.30.21.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 21:21:48 -0800 (PST)
Message-ID: <61884b77-a3fb-4d2d-8236-bdcfe47d26e7@pf.is.s.u-tokyo.ac.jp>
Date: Fri, 31 Jan 2025 14:21:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: display-connector: implement the error
 path of .probe()
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <7606924f-b3b2-41d2-8617-700bc287d2b5@stanley.mountain>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <7606924f-b3b2-41d2-8617-700bc287d2b5@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Dan,

Sorry for the late reply.

On 1/6/25 18:02, Dan Carpenter wrote:
> Hi Joe,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Hattori/drm-bridge-display-connector-implement-the-error-path-of-probe/20241214-230605
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20241214012652.2104807-1-joe%40pf.is.s.u-tokyo.ac.jp
> patch subject: [PATCH v2] drm/bridge: display-connector: implement the error path of .probe()
> config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/archive/20241221/202412212129.OT9Bt8p0-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202412212129.OT9Bt8p0-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/bridge/display-connector.c:397 display_connector_probe() error: uninitialized symbol 'ret'.
> 
> vim +/ret +397 drivers/gpu/drm/bridge/display-connector.c
> 
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  205  static int display_connector_probe(struct platform_device *pdev)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  206  {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  207  	struct display_connector *conn;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  208  	unsigned int type;
> 189723fbe9aca18 Dan Carpenter        2021-10-13  209  	const char *label = NULL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  210  	int ret;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  211
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  212  	conn = devm_kzalloc(&pdev->dev, sizeof(*conn), GFP_KERNEL);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  213  	if (!conn)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  214  		return -ENOMEM;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  215
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  216  	platform_set_drvdata(pdev, conn);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  217
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  218  	type = (uintptr_t)of_device_get_match_data(&pdev->dev);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  219
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  220  	/* Get the exact connector type. */
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  221  	switch (type) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  222  	case DRM_MODE_CONNECTOR_DVII: {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  223  		bool analog, digital;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  224
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  225  		analog = of_property_read_bool(pdev->dev.of_node, "analog");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  226  		digital = of_property_read_bool(pdev->dev.of_node, "digital");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  227  		if (analog && !digital) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  228  			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  229  		} else if (!analog && digital) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  230  			conn->bridge.type = DRM_MODE_CONNECTOR_DVID;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  231  		} else if (analog && digital) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  232  			conn->bridge.type = DRM_MODE_CONNECTOR_DVII;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  233  		} else {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  234  			dev_err(&pdev->dev, "DVI connector with no type\n");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  235  			return -EINVAL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  236  		}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  237  		break;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  238  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  239
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  240  	case DRM_MODE_CONNECTOR_HDMIA: {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  241  		const char *hdmi_type;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  242
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  243  		ret = of_property_read_string(pdev->dev.of_node, "type",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  244  					      &hdmi_type);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  245  		if (ret < 0) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  246  			dev_err(&pdev->dev, "HDMI connector with no type\n");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  247  			return -EINVAL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  248  		}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  249
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  250  		if (!strcmp(hdmi_type, "a") || !strcmp(hdmi_type, "c") ||
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  251  		    !strcmp(hdmi_type, "d") || !strcmp(hdmi_type, "e")) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  252  			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  253  		} else if (!strcmp(hdmi_type, "b")) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  254  			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIB;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  255  		} else {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  256  			dev_err(&pdev->dev,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  257  				"Unsupported HDMI connector type '%s'\n",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  258  				hdmi_type);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  259  			return -EINVAL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  260  		}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  261
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  262  		break;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  263  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  264
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  265  	default:
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  266  		conn->bridge.type = type;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  267  		break;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  268  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  269
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  270  	/* All the supported connector types support interlaced modes. */
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  271  	conn->bridge.interlace_allowed = true;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  272
> d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  273  	if (type == DRM_MODE_CONNECTOR_HDMIA ||
> d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  274  	    type == DRM_MODE_CONNECTOR_DisplayPort)
> d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  275  		conn->bridge.ycbcr_420_allowed = true;
> d5cd8280c52bad4 Dmitry Baryshkov     2024-10-19  276
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  277  	/* Get the optional connector label. */
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  278  	of_property_read_string(pdev->dev.of_node, "label", &label);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  279
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  280  	/*
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  281  	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  282  	 * edge interrupts, register an interrupt handler.
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  283  	 */
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  284  	if (type == DRM_MODE_CONNECTOR_DVII ||
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  285  	    type == DRM_MODE_CONNECTOR_HDMIA ||
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  286  	    type == DRM_MODE_CONNECTOR_DisplayPort) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  287  		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  288  							 GPIOD_IN);
> ed8f4e1002781c4 Ye Xingchen          2023-03-22  289  		if (IS_ERR(conn->hpd_gpio))
> ed8f4e1002781c4 Ye Xingchen          2023-03-22  290  			return dev_err_probe(&pdev->dev, PTR_ERR(conn->hpd_gpio),
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  291  					     "Unable to retrieve HPD GPIO\n");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  292
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  293  		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  294  	} else {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  295  		conn->hpd_irq = -EINVAL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  296  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  297
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  298  	if (conn->hpd_irq >= 0) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  299  		ret = devm_request_threaded_irq(&pdev->dev, conn->hpd_irq,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  300  						NULL, display_connector_hpd_irq,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  301  						IRQF_TRIGGER_RISING |
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  302  						IRQF_TRIGGER_FALLING |
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  303  						IRQF_ONESHOT,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  304  						"HPD", conn);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  305  		if (ret) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  306  			dev_info(&pdev->dev,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  307  				 "Failed to request HPD edge interrupt, falling back to polling\n");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  308  			conn->hpd_irq = -EINVAL;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  309  		}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  310  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  311
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  312  	/* Retrieve the DDC I2C adapter for DVI, HDMI and VGA connectors. */
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  313  	if (type == DRM_MODE_CONNECTOR_DVII ||
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  314  	    type == DRM_MODE_CONNECTOR_HDMIA ||
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  315  	    type == DRM_MODE_CONNECTOR_VGA) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  316  		struct device_node *phandle;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  317
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  318  		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  319  		if (phandle) {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  320  			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  321  			of_node_put(phandle);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  322  			if (!conn->bridge.ddc)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  323  				return -EPROBE_DEFER;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  324  		} else {
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  325  			dev_dbg(&pdev->dev,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  326  				"No I2C bus specified, disabling EDID readout\n");
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  327  		}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  328  	}
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  329
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  330  	/* Get the DP PWR for DP connector. */
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  331  	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  332  		int ret;
> 
> Shadow variable.
> 
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  333
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  334  		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
> a7afd1756ad7c06 Joe Hattori          2024-12-14  335  		if (ret < 0) {
> a7afd1756ad7c06 Joe Hattori          2024-12-14  336  			ret = dev_err_probe(&pdev->dev, ret,
> a7afd1756ad7c06 Joe Hattori          2024-12-14  337  					    "failed to get DP PWR regulator\n");
> a7afd1756ad7c06 Joe Hattori          2024-12-14  338  			goto err_put;
> a7afd1756ad7c06 Joe Hattori          2024-12-14  339  		}
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  340  	}
> 2e2bf3a5584de24 Tomi Valkeinen       2020-11-30  341
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  342  	/* enable DDC */
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  343  	if (type == DRM_MODE_CONNECTOR_HDMIA) {
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  344  		int ret;
> 
> This "ret" shadows an earlier declaration and leads to an error code bug.
> 
> I feel like say that ret is one of those variables which should *always*
> be declared with function scope even if we don't return the error code.
> These sorts of bugs aren't super common.  We probably only get a couple
> per year.

Thank you for the report. Should be fixed in the V3 patch [1].

[1]: 
https://lore.kernel.org/all/20250131051918.549781-1-joe@pf.is.s.u-tokyo.ac.jp/

> 
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  345
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  346  		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  347  						       GPIOD_OUT_HIGH);
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  348
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  349  		if (IS_ERR(conn->ddc_en)) {
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  350  			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
> a7afd1756ad7c06 Joe Hattori          2024-12-14  351  			ret = PTR_ERR(conn->ddc_en);
> a7afd1756ad7c06 Joe Hattori          2024-12-14  352  			goto err_put;
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  353  		}
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  354
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  355  		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
> a7afd1756ad7c06 Joe Hattori          2024-12-14  356  		if (ret < 0) {
> a7afd1756ad7c06 Joe Hattori          2024-12-14  357  			ret = dev_err_probe(
> a7afd1756ad7c06 Joe Hattori          2024-12-14  358  				&pdev->dev, ret,
> a7afd1756ad7c06 Joe Hattori          2024-12-14  359  				"failed to get HDMI +5V Power regulator\n");
> a7afd1756ad7c06 Joe Hattori          2024-12-14  360  			goto err_put;
> a7afd1756ad7c06 Joe Hattori          2024-12-14  361  		}
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  362  	}
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  363
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  364  	if (conn->supply) {
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  365  		ret = regulator_enable(conn->supply);
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  366  		if (ret) {
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  367  			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
> a7afd1756ad7c06 Joe Hattori          2024-12-14  368  			goto err_put;
> 6eb6b6f0a012993 Dmitry Baryshkov     2023-05-31  369  		}
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  370  	}
> 6de79dd3a920a13 H. Nikolaus Schaller 2022-04-07  371
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  372  	conn->bridge.funcs = &display_connector_bridge_funcs;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  373  	conn->bridge.of_node = pdev->dev.of_node;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  374
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  375  	if (conn->bridge.ddc)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  376  		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  377  				 |  DRM_BRIDGE_OP_DETECT;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  378  	if (conn->hpd_gpio)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  379  		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  380  	if (conn->hpd_irq >= 0)
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  381  		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  382
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  383  	dev_dbg(&pdev->dev,
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  384  		"Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  385  		drm_get_connector_type_name(conn->bridge.type),
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  386  		label ? label : "<unlabelled>",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  387  		conn->bridge.ddc ? "with" : "without",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  388  		conn->hpd_gpio ? "with" : "without",
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  389  		conn->bridge.ops);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  390
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  391  	drm_bridge_add(&conn->bridge);
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  392
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  393  	return 0;
> a7afd1756ad7c06 Joe Hattori          2024-12-14  394
> a7afd1756ad7c06 Joe Hattori          2024-12-14  395  err_put:
> a7afd1756ad7c06 Joe Hattori          2024-12-14  396  	i2c_put_adapter(conn->bridge.ddc);
> a7afd1756ad7c06 Joe Hattori          2024-12-14 @397  	return ret;
> 0c275c30176b2e7 Laurent Pinchart     2020-02-26  398  }
> 

Best,
Joe
