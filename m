Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPO3LFShrmkLHAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:30:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204AD23719A
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378C710E11D;
	Mon,  9 Mar 2026 10:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pw6v93rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85C510E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:30:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40D99600CB;
 Mon,  9 Mar 2026 10:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B5AC4CEF7;
 Mon,  9 Mar 2026 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773052239;
 bh=CYoh8Q81ENzSeGq3xOwWDJTDSt996SoFePTjS6bvyS8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=pw6v93rwka9lygAVW1ABBf0TPK+l3HpIdE19sgbkRsa9HUz+Tyh7nb/XFyBd5oYOX
 axWTbndKFGXfVuyuDHYFYM3XRPqtKXsxfiuExhNtrGJDJ3mLZFZt0865EyWw60R8wT
 KACha09iq/wL5g9ZTUN2MEIC5NbGayPOQuBydbtxrSflGvupOOk5OKdFLnJJGimasD
 7QB/6lXlRasuCN4YVZahCeOHFei3/oH6TsqY7xX3np4aBn+9Zvk1IIjwTZu3Vv00pe
 c7rLNP/tZdd+uSHhf8oSAT+sWBDgvyYeGi+bcyxpMU6SsT8HBUv9ulGsvujBcjrk69
 xnxRzBhCd5O4Q==
Date: Mon, 09 Mar 2026 05:30:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kenneth.Hung@ite.com.tw, David Airlie <airlied@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Pet.Weng@ite.com.tw
To: Hermes Wu <Hermes.wu@ite.com.tw>
In-Reply-To: <20260309-upstream-6162-v2-1-debdb6c88030@ite.com.tw>
References: <20260309-upstream-6162-v2-0-debdb6c88030@ite.com.tw>
 <20260309-upstream-6162-v2-1-debdb6c88030@ite.com.tw>
Message-Id: <177305223794.870890.11114414845312436607.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add ITE IT6162
 MIPI DSI to HDMI bridge
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
X-Rspamd-Queue-Id: 204AD23719A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kwiboo.se,kernel.org,ffwll.ch,ite.com.tw,linaro.org,ideasonboard.com,suse.de,linux.intel.com,vger.kernel.org,gmail.com,lists.freedesktop.org,intel.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jonas@kwiboo.se,m:rfoss@kernel.org,m:simona@ffwll.ch,m:Hermes.Wu@ite.com.tw,m:neil.armstrong@linaro.org,m:krzk+dt@kernel.org,m:mripard@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Kenneth.Hung@ite.com.tw,m:airlied@gmail.com,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:andrzej.hajda@intel.com,m:Pet.Weng@ite.com.tw,m:Hermes.wu@ite.com.tw,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ite.com.tw:email]
X-Rspamd-Action: no action


On Mon, 09 Mar 2026 17:42:01 +0800, Hermes Wu wrote:
> Add device tree binding documentation for the ITE IT6162 MIPI DSI to
> HDMI 2.0 bridge chip. The IT6162 is an I2C-controlled bridge that
> supports the following configurations:
> 
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> The chip also supports up to 8-channel audio output via 4 I2S data
> channels.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6162.yaml        | 216 +++++++++++++++++++++
>  1 file changed, 216 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml:216:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260309-upstream-6162-v2-1-debdb6c88030@ite.com.tw

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

