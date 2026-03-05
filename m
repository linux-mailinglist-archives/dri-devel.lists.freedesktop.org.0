Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMyIKUp3qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:30:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9C211AA6
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880710E296;
	Thu,  5 Mar 2026 12:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B9210E295
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ad4d639db3so36276065ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772713799; x=1773318599;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
 b=H/uNrbzcBQGoLiQ0zaX9Jb3+yTZ/xElwiF/XcjJhgFByXK8eal9XCEFM8VwkAGRRXS
 TxFTleA4NOZ6+OUUzMzw4s9+9F07CFBV1IvA+ybcgsKAILlubPzfrU3x5ihfVVJe7PRS
 HoVmOUBGryMbAADYe98uD0hugQ1jtCcAO5QfQOybLflaUKYXTpF2cEwKFtYXRkmFvfmc
 HRliIAhNjP5IKGtHyHQxDWECxfRauStkdobjSOqUOhldigwRjX5KA9urI0d4l4Rs3Diu
 eL5lphj9gQkLwELdmb3V+kKaCVXSWIzZiUFLpYu9AhnhKETH9oSmGH7K9rTWtzqaRTaR
 DErA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjnWG9tdyOJb3RxxpXxR3q+af+pdhowRCJGa0PXEIq2BIjFJVeM7qI1it8PXCVD43UxWhiexRnLJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4aDZTXXjPkKy/uoS1l3MOVFTCDFOvQkRX4rXDw05PK2JNijaq
 Xr1lDQ6f/yvzgBk8eH7+60+zsgHw72T4jjbt9yC67ZCS7RdPDcf1dh4B
X-Gm-Gg: ATEYQzxFJyIw/vrGknB9Hqzml7S+25SOMiEA6qexzzJ+L0sIh56TR8twIMwfWPlI9hT
 +acVqxc33u0sqvuG40LLaJEPkESaAnOdPL92EiuLCAz+k+XrnCUVhHBHZ/AiawlS/JZ9bDhpSQn
 8DIrulmdxQAXGy4sKCY+CzVmRZbQ20pner95kTj/XQkphuAQ446fgvGmc/9B9Iith8g0fwAhxKv
 19E+HSt3eWZnwLzGGSgnnX6EN70XsdcRDg4D4+bIWfCTn5dlaYcRsvsg8rMQCkMVJXuvBoSG7E4
 L82q5bzesk41B57zcGZbtWsofopgp/XJgpVo2hoEhvFxmGdgV3haCQ5cKAoW0e26yTnpUFt5xD8
 hnCbgxBQ6K/pDxfjRl41rgJKZK+O8WX5psUqu5kTGtyzT0zsE5wnZ1ZaaY65Pm/wWmkSRSfC/lY
 TYufJLSNtFQ4PK5LQxupCb2Wh7QMEvxGRgpaRHrZKYt5g3lfx1t84eEHL5T9ysY957PT/GfhrHQ
 LouIJUCMjSi18hiMkGO7jMz4g/xQU/WURsue4U5WjX+yFmLxK4=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id
 d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017; 
 Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>
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
X-Rspamd-Queue-Id: 59F9C211AA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:joe@perches.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kw@linux.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof
