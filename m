Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AB7A41F8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B9210E1CA;
	Mon, 18 Sep 2023 07:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-220.mta1.migadu.com (out-220.mta1.migadu.com
 [IPv6:2001:41d0:203:375::dc])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D2910E4EE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 04:10:48 +0000 (UTC)
Date: Thu, 14 Sep 2023 14:09:20 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694664646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yrM9qkZn8IvCEMY+qCo428/XGoBHkCAW20Ms/r1EMvQ=;
 b=SvCBqS9+YdFjSk3JlB6a+4z2XZyW9YC14vqOWANyDdJ0K9q2KC3xQEvn2ZAP5IfVsW1Nkm
 Yx5gqo56tqHoeLQYgFwHGrfE1xqwg+wabeWzwhFe86ehYcOlvS5ykmYi3XCvfXKtpPU2f/
 pTUdVrjOavf7W2m8vYUhCAmQZXQYs8EmFom/79y0TsckuoMCrP0Dwoiy7ozJHC7RW6qp8I
 wqKP9i+PeYdDnPkpAeTHni0MuigpIayV2N333014PhE9yhKn02w3XoYUvLsHAK8exME6DL
 FkY80CJyWoF3zILIfe9K/lRwcan+fQFPYF84KaKUt3CGcnw6mXRPp3vk4WsFcg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 5/8] drm/panel: nv3052c: Allow specifying registers
 per panel
Message-ID: <ZQKHcDZ-mxNaSe0j@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-6-contact@jookia.org>
 <d46ee183-a010-e585-c47c-fa3229eafb33@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d46ee183-a010-e585-c47c-fa3229eafb33@quicinc.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 13, 2023 at 02:34:38PM -0700, Jessica Zhang wrote:
> Hi John,
> 
> Having a separate panel_regs_len field seems a bit unnecessary to me.
> 
> Looks like it's only being called in the panel prepare() and I don't seen
> any reason why we shouldn't just call the ARRAY_SIZE() macro there.

Can you call ARRAY_SIZE on an an array pointer?

> 
> Thanks,
> 
> Jessica Zhang

John.
