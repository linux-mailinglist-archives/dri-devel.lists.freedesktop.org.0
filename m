Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIV3BWkilGmqAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:10:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92227149B70
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595A610E465;
	Tue, 17 Feb 2026 08:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5VdzwvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4F10E465
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF7B743DD2;
 Tue, 17 Feb 2026 08:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FC4C19424;
 Tue, 17 Feb 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771315811;
 bh=JES+IBXkN/OopuNkWeM8rDx8cY1hL5qNmn2SSvSLDww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5VdzwvWLXGyzf38GdKR0DP1zmbtvU7hfd3hlDwwRkW80X4l1SWwX85/mwayZB4/i
 SNrxQLgJxPOUitED/rP9uOf0WeWZdIRg7+iV/SVR3Vaujf3JtmftZDR0u4ab1nywlH
 ElR11J92kF75uTgTLkjvF1p5qCJu+TSTTDpKcp5z3WMKkTCYKnViNy96BWo6fuWxX1
 KScScxH49TMGFhxMjUldGPC/sdm2/Mg5ywYdAAmJ7nC+vLcfzIZHfEP+MhH6bP86jL
 VR7Xml8I39h3w+kxZt/yxdzWvOXuSPJn5BEs/4AyFYkPXjExqMUg+U7GeCux68/TX6
 nGfyp/ia8y6gg==
Date: Tue, 17 Feb 2026 09:10:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com, 
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
 linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, s32@nxp.com,
 imx@lists.linux.dev, 
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, 
 jkangas@redhat.com, Radu Pirea <radu-nicolae.pirea@nxp.com>
Subject: Re: [PATCH 09/13] dt-bindings: serial: fsl-linflexuart: add dma
 properties
Message-ID: <20260217-stirring-warping-partridge-dd9531@quoll>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
 <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:daniel.baluta@oss.nxp.com,m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,aka.ms:url]
X-Rspamd-Queue-Id: 92227149B70
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 05:29:57PM +0200, Daniel Baluta wrote:
> 
> On 2/16/26 17:02, Larisa Grigore wrote:
> > [You don't often get email from larisa.grigore@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Radu Pirea <radu-nicolae.pirea@nxp.com>
> >
> > Add 'dmas' and 'dma-names' properties to describe optional DMA support
> > for RX and TX channels in the LINFlexD UART controller.
> >
> > This allows the device tree to specify DMA channels used for UART data
> > transfers. If not specified, the driver will fall to interrupt-based
> > operations.
> >
> > Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> 
> If both of you worked on this patch then the last lines must read:
> 
> Co-developed-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> 
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

No, the DCO with this authorship is correct if they both worked. Nothing
has to be changed here.

Best regards,
Krzysztof

