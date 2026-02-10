Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHWiCg2fimniMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:59:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE8E116955
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AE310E14E;
	Tue, 10 Feb 2026 02:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CW2oBkJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748F10E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:59:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3763860141;
 Tue, 10 Feb 2026 02:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B92C116C6;
 Tue, 10 Feb 2026 02:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770692358;
 bh=sswvim6uo0hgfdQyfqItuvNUGxUG69xSNcPrZzHtTvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CW2oBkJ87Q5j6c3n3zIazQIBEGASBkmOy/Z6Zy1q0ZMhstulJXmPfBr/oUUzJmE1e
 03n66/UrHuvRwnqeZHvNbT7Xi3NkBDZ7wdClTAGmtqybLnoBl+GeD8cz28GS9hh1/Y
 b6W7mMm26Nf0KZxJoHDk2O9MncWyuk4wHzUO/Pb9e1SONNj16wYbVPGeNrM7cutH+r
 xc/KQZ90lzmBMzUMe6c5XXBHa2yE1GVjFmdAcRVzM6NbQpdypL4LAio1tx/boPbtSZ
 GqKBr1NNEAmhoK0sU92ddneIr6fQfRLToiGXA/SDoMok0H5QFiuA4cIq1850oZ/Yi/
 5i5DtFtjvtdgw==
Date: Mon, 9 Feb 2026 20:59:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Bjorn Andersson <andersson@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: lt9611: Support single Port
 B input
Message-ID: <177069235725.2401457.4430450777112402794.robh@kernel.org>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
 <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:christopher.obbard@linaro.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:konradybcio@kernel.org,m:rfoss@kernel.org,m:mripard@kernel.org,m:jernej.skrabec@gmail.com,m:Laurent.pinchart@ideasonboard.com,m:simona@ffwll.ch,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jonas@kwiboo.se,m:andersson@kernel.org,m:maarten.lankhorst@linux.intel.com,m:neil.armstrong@linaro.org,m:krzk+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:devicetree@vger.kernel.org,m:vkoul@kernel.org,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,lists.freedesktop.org,linaro.org,suse.de,gmail.com,kernel.org,ideasonboard.com,ffwll.ch,vger.kernel.org,kwiboo.se,linux.intel.com,debian.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:email,0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9DE8E116955
X-Rspamd-Action: no action


On Sat, 07 Feb 2026 15:32:54 +0800, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports (Port A and Port B). Update the
> binding to clearly document the port mapping and allow using Port B
> alone when DSI is physically connected to Port B only.
> 
> Changes:
> - Clarify port@0 corresponds to DSI Port A input
> - Clarify port@1 corresponds to DSI Port B input
> - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
>   allowing either port to be used independently
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

