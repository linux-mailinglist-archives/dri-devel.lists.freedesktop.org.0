Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DF84A292
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 19:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9881125C8;
	Mon,  5 Feb 2024 18:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="URq61BOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2721125C8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 18:42:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9589A611A0;
 Mon,  5 Feb 2024 18:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15D3C433C7;
 Mon,  5 Feb 2024 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707158547;
 bh=pkwZXFSQYKYcHP79/ddz2BocuYhgK3Flx0MS53nuNjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URq61BOb4/CM45btppqwqL+yzXBalFPoyLss1QE/9sloBLQKnRUBgXh44QTVJfVz0
 IdHlAaMLwITaLMkt49hh+dGMM8pU7v18UIbfywV/HxQ3PpgNUmyMxRF8YIBtm7nAsH
 EYXn+icd+3WhRSc917GjWsJBJm7ZErscIbxnKPZBJKZY/lx1Ao4v6N+wPGxpf+IS9L
 mX72okws9IB8w2xj5Qhjss7i9llbBbS6inT+vvVRGk7FNJ5OANR3Ez/br3HMFSLc85
 aHujcahxj97exdQUROY3e+Jnf+drukrQfpu28nAsdTFckFejd+K0w5mAsaniraL+hD
 YWHK1nM+oLQhQ==
Date: Mon, 5 Feb 2024 18:42:23 +0000
From: Rob Herring <robh@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: neil.armstrong@linaro.org, airlied@gmail.com, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_bjorande@quicinc.com,
 jernej.skrabec@gmail.com, dianders@chromium.org,
 tzimmermann@suse.de, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, andrzej.hajda@intel.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
 @codeaurora address
Message-ID: <170715854321.3992852.17300060603696641162.robh@kernel.org>
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
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


On Fri, 02 Feb 2024 13:23:29 -0700, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain are long retired and any messages
> sent there bounce.  Sandeep Panda's email address is no longer valid and
> should be repleaced.  However Sandeep has left the company and has not
> been active sice, therefore it looks like this binding is orphaned.
> 
> Doug is listed as the reviewer for this file in MAINTAINERS and has
> volunteered to be listed within the file as the binding maintainer.
> Therefore replace Sandeep with Doug to make the documentation current.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

