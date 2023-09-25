Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD37AE684
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DE110E350;
	Tue, 26 Sep 2023 07:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-206.mta0.migadu.com (out-206.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ce])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2089610E225
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:49:01 +0000 (UTC)
Date: Mon, 25 Sep 2023 19:48:39 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695635339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4dRdGkWCi+7rtuoY3VfupvdbW14yuz7oH4cStDJMMaw=;
 b=q529K7DaZTmoYJ4kW1UJ7DKPrrYj/pzpJQycIPKy9rQR72b+inomsCrccRrt1nwAj63o9W
 McJDn3CuN723tMvH3iwG/bU1QgJ4jm2VQJLj6AHxpuUcpBUH8395T+oKnFgCMKjx30Dv3H
 JBoxQ1mwnAkZktaYaGfyLvLqTjz6DTxJpUwYCo2AT7f1UsYMSlmlbpKlSeBistP1vdzfS/
 88KjTSZsKK+zlJjxmQvMmDMiVRvTaEf3v2OdoODU6ieCvclUqsJYF3XRO87U1FnoVcqkeN
 zdqtB6iLBCkgqYtIR/+q2N/c5uN4FxxECJVY+33XGm9y7h8Ypc0Jt4UZn0uPmA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH v3 4/7] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
Message-ID: <ZRFXd3F7eit7x4aJ@titan>
References: <20230925021059.451019-1-contact@jookia.org>
 <20230925021059.451019-5-contact@jookia.org>
 <ebd5808fe3029e46376aea3c25d3770a6b406fdc.camel@crapouillou.net>
 <ZRFRFXCKTIb9x7GW@titan>
 <d63b2a7bf2bbabe41b8e45a6c0a4dc0b1e117bdd.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63b2a7bf2bbabe41b8e45a6c0a4dc0b1e117bdd.camel@crapouillou.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 11:43:26AM +0200, Paul Cercueil wrote:
> From what I can see, you have a panel with a NV3052C chip, so the
> existing initialization sequence should already work.

It has some differences that I don't know if are important.

> The NV3052C datasheet does not give any settings for a 640x480 panel, I
> only see suggested settings for a 720x1280 vertical panel.
> 
> Unless you have a min/max range specified, the values you see in there
> are only suggestions for a working setup, that doesn't mean they are
> the only recommended ones.

The panel datasheet has these values.

> 
> Cheers,
> -Paul

John.
