Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A290C00A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 02:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EB810E51A;
	Tue, 18 Jun 2024 00:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="t1j5myHz";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="NZvdf/oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E810E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1718669101;
 bh=TKA2C043TkCUGXnV0SbvDBVxmP0XE7myxN4MUMYbCJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1j5myHz4D7mHQP2y2Q6D7iu+SwG/Rt/tf4XRlgI3+15wt4OAiwEXlhs9U5dCJ/WQ
 HmsUwr14sFlCkIItRD8F8IEwhrsMAvzpVHOleyQ/vRWG1gf6S/hS0gkSzTQ4qjleh8
 UNqpK/pZlYImN7yMAe+GYhGTozmaQQr8j9cGEtB4eY6RyHjv/5LT+NnvEo/m9PcSLz
 vorQxli1+Giig8SwqM4GjLoV/CNv6V0lqmj992RYjaostIegs4Bhk4amyUom6cCv6I
 OUWly823JWLqwgoWOjSO0P+H7s6yHfdkcm1RFtL5/+v27CIeToXzY6O7DVink8TkEF
 ST6Y1kE0TsWJg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 49C4DA90
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:05:01 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=NZvdf/oo; 
 dkim-atps=neutral
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 32272A6B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:04:58 +0900 (JST)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-6c9b5e3dd67so4687773a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1718669097; x=1719273897;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0Xe63nUyIwv36+7xnvrOAI6BQO79Yhtze7l/OyxIXbI=;
 b=NZvdf/ooSNZOKCRGzjZiVEioFclDnYUkcBCHG8jcjzbcOpN9Zfy2FeGJ5+FNIIUUAb
 kx8P+e8dxnVPuU+bCzEGUU+O8vHxyxl4nfTV6iSpZNmMKTwu4RsVL4Ez3Fru23IFLV6q
 gRaqJhSYA6XuU6bnYcXfh6ZkFr/v7+K+hJIpl6ppyexH3KUqdX4g/zQqEVtsiDsFXZfO
 cbNPiqEldD7vrlTWzFWJK9fn9l4fpVItkVnkA/eaBQzaVHHwLqSYT25ARmLCDY8mNVmC
 nxWlmIbjOIH7iQuLqPy391u2VpJCjdw0t+CkH/fsoAONLP9RXBigAvTEePbsWjPTreIm
 8C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718669097; x=1719273897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Xe63nUyIwv36+7xnvrOAI6BQO79Yhtze7l/OyxIXbI=;
 b=gwYvvObTGoTmH/OIyj/KhIJe0qFlSzZ8gpkT4ll3TEv7wrbLTfhUHXrVx4Z2MdmsYq
 OHq1aIbormz6jovxDkmozMquRRefwLDm6iVVKFL/bTxCQEr+m5d3Gwptc6beQ5vIZ442
 Oeg5mJLu6OmVusVQeg1ochhu9g7QGn9UI5KGwYQITvDMe8yc7tXo4mTuXd/9+BF3IEX9
 QWhSKLkVI5rzg5cL0SHXE12dyRYbSpS2b/RaEtIGgB+8ODx5wf5c+b9ehoflqarAtIXC
 l1ISBhDT06/QI1VNERIYxD2B9Z/tpBrVn0gCqpbEMTofESGzLMkUc3uhJjXjyfK/0kPP
 uEgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWXlfsJLc8SwePYYP46gM0vDQj6LwkbMLNfzy8rrr7VgNQ7UdpPx+C22bcWHufU0yFjUTRBPi9l1PuCQhTSJbDmE/iGZrVqSQgH+Z1JZG/
X-Gm-Message-State: AOJu0YwzRUJ4XZlgCb9/aYucg4T5MeRUqxuWCJ1pzr8zo12dAuu+E8kf
 N0r2vwcSvNGWk+ngcBJixnx2c/NfMKc6jGZF6vKGzLFeRgImJCyVQr3lZL6ETGiAMYWBuOLvEJp
 3neSUhL2WXEFQ5V9rV7yWHi1r+40EoeOeXjC57yb8lTtSpIAhsh9U/D/K+gZoJd0zBEY=
X-Received: by 2002:a05:6a20:7344:b0:1b0:1a02:4136 with SMTP id
 adf61e73a8af0-1bae7e28efcmr12053014637.8.1718669097081; 
 Mon, 17 Jun 2024 17:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaJwsOB5qRcAEyY5B6LLeGzmT4mUY+ApOshTQERXeBYQ+t83Lc16Ao0Q3gXge9N9DbP6gkbw==
X-Received: by 2002:a05:6a20:7344:b0:1b0:1a02:4136 with SMTP id
 adf61e73a8af0-1bae7e28efcmr12052978637.8.1718669096600; 
 Mon, 17 Jun 2024 17:04:56 -0700 (PDT)
Received: from pc-0182.atmarktech (178.101.200.35.bc.googleusercontent.com.
 [35.200.101.178]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4a7602690sm11894540a91.28.2024.06.17.17.04.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2024 17:04:56 -0700 (PDT)
Received: from martinet by pc-0182.atmarktech with local (Exim 4.96)
 (envelope-from <martinet@pc-zest>) id 1sJMLG-00ACZX-1h;
 Tue, 18 Jun 2024 09:04:54 +0900
Date: Tue, 18 Jun 2024 09:04:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
Message-ID: <ZnDPHN_sSaWR7KKp@atmark-techno.com>
References: <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <CAHCN7xJt+1WGFYeBii1jUDEg9OU176f0AA+rMkXCqNQrfq=XWg@mail.gmail.com>
 <ZnDKovBokBu5D_eb@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnDKovBokBu5D_eb@atmark-techno.com>
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

Dominique MARTINET wrote on Tue, Jun 18, 2024 at 08:45:38AM +0900:
> I'm thinking the last few values just affect a very small % of the
> values, but would need to check with a proper scope if I can get a hold
> of the clock line...
> Does any of you happen to have any datasheet for these registers,
> or should we consider them to be magic values?

Answering to myself on this point, the registers are properly described
in the iMX8MP reference manual...
I don't make much sense of it at this point (what's SDC..?), but I guess
it does sound likely we could generate the values with some work.

I'll wait for replies a bit first in case one of you understands this
better than I (which is quite likely!), but can give this a few more
hours to help.

-- 
Dominique


