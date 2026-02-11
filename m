Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKxcDDfwjGmSvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:10:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CF127A31
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8139010E64E;
	Wed, 11 Feb 2026 21:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vcak2mZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9F10E64E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:10:12 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8c6a822068eso721211885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 13:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770844211; x=1771449011; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PU9zPPZ6q/jlj/hCesIMdYrjem+AOCzJA8bXmrZmXNY=;
 b=Vcak2mZ9S5PMWIj0Qp87IPvEj4Z5LwrHbr1TKEh6b+pEAFzcTNuPK/l3spIDIFJ6Bq
 8inI/wkmmNyUlQEhPfS7yClMNvRgb4ncHkKqjFCOmhpkXBkU0hiMjsDV8OCcruQA81/4
 VWO/Ctg1p8s8lIR6mOGdQ2Ndx+5DII4FdsvjWDfwR3atTA+gZo9SzkEI4gxQNMQo1/3r
 fNHfnkApLeYDmgrtS+kLQtM2zv15owLlhHVuqwK2emN4fUNGgS2FI7RZG34tozoTYTza
 FUSuOi7ztc9phPEP86z7FnZVP9rYDc1EVi8fnxtqx8dp/Cz4VFEUx3oI91YmWDFEx2ot
 0RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770844211; x=1771449011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PU9zPPZ6q/jlj/hCesIMdYrjem+AOCzJA8bXmrZmXNY=;
 b=k7tMaM++2tR+AjGtlUaLsXPYgojYnhaL6x4QAparnrucg9To37e/GiiD3jPmbPRH9+
 LNfLnVwFgPUfwexSJAHVHRTfzvfUm6oeexUXfZ9YUNMxmkYZhp+x0IpBgVZr19eVLIK1
 lNVzCF5aSV+OibrYu77LczYLWSRno6gM2Z3+ktmMMj3Fu1x7MGLB4UdWw53ag7gA4Q4e
 +A8vd2/ji5k8+GG+P8NqxpXdS6sgxtwLSFM92+1b+CTpTLavzlqIDY1O5Bnl06jCYXkk
 aTFH1jdqwYf5U27RVmBiVDBtH6cLBpEyAf5CnUwOHIAvT+R2TE7yrTnQYzwnUxsdGPp/
 Hndw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp/PuekpKbU7CSzY3ZhvytTcllk/chpkZPDifMPIcginbR09eYK+WYn6VlL0nMS/+IAzoQtE+Oous=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypMohA/A+pw24haY8zq7mJuIOkYG3Z/ORa6YtCpBItdn01A1hU
 NuLHYLIp0lamPwgwPHoFy7gx6PwMnhnmPsKSFfnbgdXLVb2DVX+obKoXuTOw2g==
X-Gm-Gg: AZuq6aIxUH8+OTD3WfuGslTdT1iD75yInkTQGYEqtjH5xZBgtmuzJHxOEAtRbY5Jlho
 Vx4d+M46UetdbomSfg9x6U5EcFLK5GfREZ0iRB0dUanfEUO5A9SjQxg01zMBLLuUQ9XDn/BcEu3
 9YSFvNb38BV0KuLZtkqux6vMYJ2rMYxRVFU4Twi7i+OMKpw8dtNowZAR7O50MZXCBOicX00RXOj
 7wbEeoukP1Q7A0DkUrCle0GdSvNvLN93XbB7GHbajwho1nC9H2wemxhDlQIxexCuVx3LyVVSwU2
 EmfvxzKecQuwC+Q7zEbtdXGLPJacMpXzuMNg23UMlDyBa1dwVOWM03DFG8Y/zymZ3VtQMvkS7zo
 5XTEoizIYmuZOaBwLq6GWGFBMXkz1FEQ15jo4UgHs+35Y1MH9M5UjmC4NMCl4u5G1ADVxin/q2C
 1y7+l4/7cD1M/7CoKXFpcOyPHK4/patMg5kOqR
X-Received: by 2002:a05:6214:212a:b0:894:68f7:40f2 with SMTP id
 6a1803df08f44-89727868cfbmr10595546d6.2.1770838373169; 
 Wed, 11 Feb 2026 11:32:53 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cc91eccsm20103146d6.13.2026.02.11.11.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 11:32:52 -0800 (PST)
Date: Wed, 11 Feb 2026 14:33:19 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yifei@zhan.science
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
Message-ID: <aYzZf-9rqqBikpNA@rdacayan>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
 <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 926CF127A31
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:10:46AM +0100, Konrad Dybcio wrote:
> On 2/10/26 3:33 AM, Richard Acayan wrote:
> > Some Pixel 3a XL devices have a Tianma panel. Add the separate device
> > tree for this to support these other devices.
> 
> There's not a device upstream for any kind of Pixel 3a XL - should
> we anticipate a non-Tianma-panel one too (i.e. are you sure those
> are out in the wild)?

Yes, some postmarketOS community members self-declared as owning the
variant with the SDC (Samsung) panel[1].

[1] https://wiki.postmarketos.org/index.php?title=Google_Pixel_3a_XL_(google-bonito)&oldid=89946#Users_owning_this_device
