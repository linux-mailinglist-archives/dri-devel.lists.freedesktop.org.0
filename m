Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNMsD7h5qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:40:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5A211D48
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9E10EAEB;
	Thu,  5 Mar 2026 12:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="eOdWU2Ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0686210EAEB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:40:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so5016807f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714418; x=1773319218;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
 b=eOdWU2WsYLWXgnMOCqpmloQJyc/ViPU5DYodwFU7vmqWfzsnNcUuwZvwarz6JQizYn
 NHO1m5gfLhtddT7fGe6refY3FakF6hxhCvMhGuifEyaslSOwvXQsqreO4KdxzeeNdWoa
 JzTQWQv3flM/+FQwCRpwODnHDGLDyPPGLT0rGZ+UmpZxGyG8ayXcEOLSXEjy1mI6/PVZ
 Cfn3PHqGnFjqBtO35S/X0S0pmC5zmpt03hr6jqmASQTl0bjfgvYMWHczAvzvDN3VjguC
 SfVVo42E2mEDfGn9VWZ/ShOYRlnl8cVV1VARfWSV/N1V6BBwOea8X4CQgWbT1/B+pDDd
 6kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772714418; x=1773319218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
 b=PEA930SY3t7BtF7NX0cRMXr7zsWH+ZadA0tZYPbqD0rSUyYY6SuQJhcBhKKDQFL8L1
 VRDM7TAbQYo9rPARY7+KXkKPnApRNJJuDNVVuFjcMOE2S3opvKtWEGhfepWQkkiUpxfk
 KZFOKnujfomwLYAnIS4dVi+NTVd+7NO4Bd5n1gKWlovd9dII7nhEtNw+UEGQl/+oSCF2
 lYLN4wKFVolIgIM5FlHwtvOCjaKZX9NN8ayKbqu6AOBr3zVip9fBdbcSdElsM1mncs/b
 HSiJggr/n/Wi9BdOUarFh5IpqRURpdGNwIiQ7FwmTBvpQ6+Xh1sYhC7L7sxIBIHRPYII
 JXdQ==
X-Gm-Message-State: AOJu0YzOvbPzueYeqhs+UPWUBwbPQVivFMWhBG5RYkIZmLsfcK8bcvyL
 1hUdjwMj/NXcEoU7l0dfe6wleLXVdJf240N+mi/wwEvhrETTAD5omMwOAMIYvVtdhCuf499k6vZ
 dbfew4YyMyA==
X-Gm-Gg: ATEYQzz3J7MD+aGjmORWtbRaZaCkDCmcG0MjAzDA/0x06vGAswDfbGCo3tLKc0cDfZD
 TG1Zrv7V5CPcXD0ChjL1VYbUeUKNDD6U8yfSixVyssQSiGpldZArC/DFJ2lYpPwZzom4P5yK8lw
 KQvyWpst1OrFvO1rRHu5mpSYQkta7b4lilK1ucWXPKFg++UycMo84Tk1Mz46CJ0E/p8GNC6QM8j
 3FutpxoLlKH2p0bn8qAns+K9vMaRCFqlAhQhlfcbx3VNB2t7qqTeIFBBb1bn5WrVZFpZMogw3ZO
 AKtdeu3rGDXkn+/UDktETG1Ai3h3Qm4ZOMr7ZQC4rLQ/VPXV7Wy5S2BeNsSqqx2CD/k05Wey5ao
 cdsLLXTxADLUVB9dtYHdMgu3YBodjiPa/fkWyhOatXNBBuCBVLs+dA1/atDuo4Ial1L+8UMnL2x
 a2F7xxrTq1ZIGr/MshgyglEZu9sFPiGXo=
X-Received: by 2002:a05:6000:2510:b0:439:cd10:a1f9 with SMTP id
 ffacd0b85a97d-439cd10a224mr6376565f8f.54.1772714418526; 
 Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503425asm33480811f8f.25.2026.03.05.04.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Date: Thu, 5 Mar 2026 13:40:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, 
 leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <yyb5ozsxnfcuzo5rzpg64hgj4rtxz6glpqf5fpkhp4zrwdgted@izdksr4b3vte>
References: <20260305123641.164164-1-jiri@resnulli.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>
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
X-Rspamd-Queue-Id: C3D5A211D48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

The "net-next" in [PATCH] brackets is obviously incorrect, ignore
this bad string please.
