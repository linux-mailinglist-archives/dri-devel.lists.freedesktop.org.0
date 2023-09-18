Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FB7A5A65
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ADD10E384;
	Tue, 19 Sep 2023 07:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-228.mta1.migadu.com (out-228.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25F10E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:09:17 +0000 (UTC)
Date: Tue, 19 Sep 2023 07:08:55 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695071355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZomkiVeqQePLkvnRcH7LRW8XoaXDjBYaYpZxuuvnrE=;
 b=TM+L0mLmXFJbKLdV3EPOLnnZrMC3GK1swbB1Ci+li00xC67T8F/qnPQsiuTZXStwpNNF2p
 cAGmR05E8PA73llDJajAoXAAjbiHM2xM89Xt6zL0ZxM3gc2yypDt0CN9YH5sGScdc1DQ+6
 VccUkI44OSvCFzn2yneTLKC2mbzTtvempUcD9nbIzqR+A7iGXeTQM8OglEynhZtYqEZXWQ
 qFZTBp9/a9jOGYmMGaNk0qCQnAk/A2BP5RR9tFAGfiAt1hISDdWgZ01H47eD4gqV7rpgBD
 vLgJ1OYNj/SETgEB7CmuwPwG+TmPHCwMBuaMxHNUnBsSJc5QUy8sOQ/+PiUEig==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
Message-ID: <ZQi8Z45VCqr-GqN6@titan>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
 <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com>
 <ZQi4fFZ0VnsUIiXO@titan>
 <4d2079d66249a7052acded0abf30169a4e95d151.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d2079d66249a7052acded0abf30169a4e95d151.camel@crapouillou.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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

On Mon, Sep 18, 2023 at 11:01:15PM +0200, Paul Cercueil wrote:
> The datasheet does say a 5ms sleep time is necesary after a reset. I
> assume the 120ms delay you quote is when a *software* reset is
> performed in Sleep-out mode. The code here does a hard-reset.
> 
> Cheers,
> -Paul

Hello Paul,

Section 7.3 of the data sheet (AC characteristic) says that the reset can take
up to 120ms to complete if the reset is applied during sleep out mode.

John.
