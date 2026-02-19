Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP8wIFbIlmkGmwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 09:22:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C115D095
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 09:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7FE10E315;
	Thu, 19 Feb 2026 08:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KvTqu6fD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B50810E67F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:22:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4837634de51so3038855e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771489359; x=1772094159; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
 b=KvTqu6fD3mWBuV1W5YaUOmppaQceCRQk637K/+A4ENzq1Dz5lStHq2jrLJYQaivhsw
 2CiOAc2xFJZ2FjWwKq/qFYP5vBCRIyQFvS1klz5la3W572iy1O9kvk5Lqutpb4EFk6wR
 D0O4LT1cCpwnGiFVvZlIJoRnAnITsgoO8EaRylscwCVb6eKP/EsJtJRV0XLTs2ZdMfkM
 S3SzZzNAjslueJ6COTvZaGf6KFVNcdeoeiQMgdGKHZe1t/wqjLjfHiXHNrsUzw0IwYBr
 NjHfnwLYVy54z6Lp+OgTj0pKSUnqMVItz6LXZXCGg5HQGvf5ObGVggkqmy4jGU4oy5MW
 mCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771489359; x=1772094159;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
 b=wFA8ZyKZ8+fS2hvdrA+74AYHDcRxrc0BL9Go5Lbs8XdsS0LgfCEHKnRcvrUOKEymuG
 OxRYyaBXQ3t0H5MWALWYaF6D/4b1iTXXQ4yYSOEUUnP8urubXI/wfLLVJYJTLerTK8uU
 9AcWJZgHY2GCQCLwQevu1aXA7+Gz+PoeItPup5cLz0VjYOG07Jc+tbMxS704fXFllyve
 KQIctuq/bdPQmtx3YrIM91RXuZCvxZGHTFJzfV4afiSmXvzCHpzHr/Pke49Km6vN9Zh4
 IdasOvYBslr+tqIklxslf0zg9KEvpLToLGt/cX2skdsChG1eXd68G+TzOgV1lIfcyqsv
 FSJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1DKrgODvhg92/9FPHmyIbXNrE2Mt+f/EbMYQ6CEZpJ1COIGb9jZQux9ZiownQBo7cfPjGnZAvTbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjqj6vxlIFyIU/tzTQxFGMemTd7hWeJDkGEfQYwtJEnnPXt+AB
 A0jbQNR9yLgkoSgA+eN+bT3FsBkOuIXo7qHrtIjlOPIa4sPfGT45oo7w3JCxllYhdsEjxVFuaJ0
 WFsn4XjQ=
X-Gm-Gg: AZuq6aJ6F9GxH2gXLbunG6SGAUG733dAHj5SWp2Rqx/0Dzj5KZusia6rp27mwpZClhD
 hLdACS8diM0wrF+dSNtxo8kjY86emJSdCcssirlA8mwd3qvZI6oKmMm6QUaT+Yb4O0V3/4IAuSw
 gBfZmVHvSsuZHXFl1kY8T2b9CqAAC8mm6rXOrr9dx3pJNE/DXZBG1mXgEYpY2mB1ONzBJHJMh8l
 6HrGQiJIKRrHefiXigZ9ZkAmEBwzezCIzz3+Sh+66xYWp/tiZp1gAXrYJiHfGOJyEQ4gUftRrax
 /FW0PkbkretNuDnqQ+S6ahMTydr24mVNF4VLka4aB68eqeDpF4UIK1qKCGLKMgYHCnqGhKe4mgJ
 YAqIxiLfv1z6chnMhGbNVOQBX79BRekR0LLJ2pRfRt38aPuwTB8EyueVJiWtbzhdgH9z1OltdO0
 tALoYld6n2KDp+ir9KIP66UDgkk9c0
X-Received: by 2002:a05:600c:870b:b0:483:6f37:1b56 with SMTP id
 5b1f17b1804b1-48371051b15mr358346635e9.10.1771489359323; 
 Thu, 19 Feb 2026 00:22:39 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f986118sm12865185e9.21.2026.02.19.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 00:22:38 -0800 (PST)
Date: Thu, 19 Feb 2026 11:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Larisa Grigore <larisa.grigore@oss.nxp.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com,
 cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
 aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
 jkangas@redhat.com, Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Radu Pirea <radu-nicolae.pirea@nxp.com>,
 Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602171109.6YSFXcJ3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:oe-kbuild@lists.linux.dev,m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:lkp@intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:phu.luuan@nxp.com,m:js.ha@nxp.com,m:ghennadi.procopciuc@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_TO(0.00)[lists.linux.dev,oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,linaro.org:email,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:email]
X-Rspamd-Queue-Id: E47C115D095
X-Rspamd-Action: no action

Hi Larisa,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Larisa-Grigore/serial-linflexuart-Fix-locking-in-set_termios/20260216-231403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260216150205.212318-13-larisa.grigore%40oss.nxp.com
patch subject: [PATCH 12/13] serial: linflexuart: Add DMA support
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171109.6YSFXcJ3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602171109.6YSFXcJ3-lkp@intel.com/

smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:1441 linflex_probe() warn: missing unwind goto?

vim +1441 drivers/tty/serial/fsl_linflexuart.c

09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1377  static int linflex_probe(struct platform_device *pdev)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1378  {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1379  	struct device_node *np = pdev->dev.of_node;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1380  	struct linflex_port *lfport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1381  	struct uart_port *sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1382  	struct resource *res;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1383  	int ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1384  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1385  	lfport = devm_kzalloc(&pdev->dev, sizeof(*lfport), GFP_KERNEL);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1386  	if (!lfport)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1387  		return -ENOMEM;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1388  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1389  	sport = &lfport->port;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1390  	sport->dev = &pdev->dev;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1391  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1392  	lfport->dma_tx_chan = dma_request_chan(sport->dev, "tx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1393  	if (IS_ERR(lfport->dma_tx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1394  		ret = PTR_ERR(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1395  		if (ret == -EPROBE_DEFER)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1396  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1397  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1398  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1399  			 "DMA tx channel request failed, operating without tx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1400  			 PTR_ERR(lfport->dma_tx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1401  		lfport->dma_tx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1402  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1403  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1404  	lfport->dma_rx_chan = dma_request_chan(sport->dev, "rx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1405  	if (IS_ERR(lfport->dma_rx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1406  		ret = PTR_ERR(lfport->dma_rx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1407  		if (ret == -EPROBE_DEFER) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1408  			dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1409  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1410  		}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1411  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1412  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1413  			 "DMA rx channel request failed, operating without rx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1414  			 PTR_ERR(lfport->dma_rx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1415  		lfport->dma_rx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1416  	}
1d3f5f07fafc71 Radu Pirea           2026-02-16  1417  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1418  	ret = of_alias_get_id(np, "serial");
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1419  	if (ret < 0) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1420  		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1421  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1422  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1423  	if (ret >= UART_NR) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1424  		dev_err(&pdev->dev, "driver limited to %d serial ports\n",
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1425  			UART_NR);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1426  		ret = -ENOMEM;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1427  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1428  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1429  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1430  	sport->line = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1431  
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1432  	sport->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1433  	if (IS_ERR(sport->membase)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1434  		ret = PTR_ERR(sport->membase);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1435  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1436  	}
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1437  	sport->mapbase = res->start;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1438  
4e8da86fc1f767 Zhang Shurong        2023-08-26  1439  	ret = platform_get_irq(pdev, 0);
4e8da86fc1f767 Zhang Shurong        2023-08-26  1440  	if (ret < 0)
4e8da86fc1f767 Zhang Shurong        2023-08-26 @1441  		return ret;

No clean up?

4e8da86fc1f767 Zhang Shurong        2023-08-26  1442  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1443  	sport->iotype = UPIO_MEM;
4e8da86fc1f767 Zhang Shurong        2023-08-26  1444  	sport->irq = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1445  	sport->ops = &linflex_pops;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1446  	sport->flags = UPF_BOOT_AUTOCONF;
4151bbed79f98b Dmitry Safonov       2019-12-13  1447  	sport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1448  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1449  	ret = linflex_init_clk(lfport);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1450  	if (ret)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1451  		goto linflex_probe_free_dma;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1452  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1453  	linflex_ports[sport->line] = sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1454  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1455  	platform_set_drvdata(pdev, lfport);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1456  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1457  	ret = uart_add_one_port(&linflex_reg, sport);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1458  	if (ret) {
1d3f5f07fafc71 Radu Pirea           2026-02-16  1459  		clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1460  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1461  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1462  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1463  	return 0;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1464  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1465  linflex_probe_free_dma:
0b34325c5f79f1 Larisa Grigore       2026-02-16  1466  	if (lfport->dma_tx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1467  		dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1468  	if (lfport->dma_rx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1469  		dma_release_channel(lfport->dma_rx_chan);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1470  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1471  	return ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1472  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

