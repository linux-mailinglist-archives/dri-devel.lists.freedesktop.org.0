Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1587E033
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 22:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944D10ECEB;
	Sun, 17 Mar 2024 21:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F7tBEoEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0910ECEB
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 21:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B539760B91;
 Sun, 17 Mar 2024 21:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42890C433C7;
 Sun, 17 Mar 2024 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710710098;
 bh=nwlvfWIiZZrwsODtnjPTrwvwT3eKt6Da7MTY2x+lvVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7tBEoEdWQvvtEHdUHM8jNS7xcYThmcCGJkO5GzbZKQADDLdICjzW1C8bw4Hr7vjP
 RYz6nHcdS4mD03HxX9VyFl++38tXX3hyU0diAmbrRDgwIdvjI/rDFheX6nWPud8Dd6
 A8bCRtWHOGM3vUl+ylI+m1TomnxrF5u4JXqB4lftvwTs2I4xWxmEofysvVivapmnK0
 f7bP6YNdX0zrkixeCcS60vrCMLK9USGH+0r1UvzCD8Nb1PJXgFRudlfjb+lt+jmakI
 vwU1cNVPuoOm8bNLewV4XYuVGdbz/2b1CMU/60KdMdDo1ocjergIqHzn685mSrgeH2
 XQ0WnU0/t6uxA==
Date: Sun, 17 Mar 2024 16:14:55 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ili9881c: Add Startek
 KD050HDFIA020-C020A support
Message-ID: <171071009452.2391266.6225826463039032160.robh@kernel.org>
References: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
 <20240317155746.23034-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240317155746.23034-2-laurent.pinchart@ideasonboard.com>
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


On Sun, 17 Mar 2024 17:57:45 +0200, Laurent Pinchart wrote:
> Document the compatible value for Startek KD050HDFIA020-C020A panels.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

