Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPMIGQYnpGkiYwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:46:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5F1CF6B1
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E910E1C8;
	Sun,  1 Mar 2026 11:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a0Yawvhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516CF10E1BD;
 Sun,  1 Mar 2026 11:46:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28F2F43ACD;
 Sun,  1 Mar 2026 11:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D5DC116C6;
 Sun,  1 Mar 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772365571;
 bh=+XZKJXFT4PEKoofH3TKDD6zGgMTeWZwTquLp4VBrWbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a0YawvhhHdZRa3u3l7Yure9yI5WqDmbLax8BIorPxc/Yo9Xn1DL1+EO9BRkBxViNp
 62FsfPSum4XOdn6qLCXfXMGgqLSwEB9WQ8PcW6S+gWhTWpUMDXvBVcYBMgDVGk9rJs
 lj5Jfs/ofxvEanfhRGCBe8yRNvh7BzO3tvrFptsj9xsODhjvO1jiGUR9iTcqe69BRH
 SyzTNKFIgci4XVXsvJfRwJaJU4w3VzbbQ5MLGXMxEcKcBCugrjt7X6Sfa2XfXv5C8m
 2ei7Rg39tR5B4rwssTXOumlakYJazMNHnJYDQwQxIag+sijjXA0u+nNYvuPgifLDcZ
 R0Jj1uvWBYWAQ==
Date: Sun, 1 Mar 2026 12:46:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: msm: Document DSI
 controller and DSI PHY on SC8280XP
Message-ID: <20260301-calculating-glistening-bird-ed0ef2@quoll>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-4-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-4-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 33D5F1CF6B1
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:14PM +0800, Pengyu Luo wrote:
> Document DSI controller and DSI phy on SC8280XP platform.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

