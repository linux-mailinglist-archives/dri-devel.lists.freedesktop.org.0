Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF2462C39
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 06:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A136E88A;
	Tue, 30 Nov 2021 05:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 05:37:14 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F36E88A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:37:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5B18ACE177F;
 Tue, 30 Nov 2021 05:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45E3C53FC1;
 Tue, 30 Nov 2021 05:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638250253;
 bh=AH6JqNovGdIYiLtfyeEAto+S+Fvppbt0BQGlgcV8FDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qr07doPAG7FW/LV/59KN1a8UYnlS8lYnYIxMCyUHTOljMoUSF7RstmCh6pY3UGPap
 T4r1xM7Q5qyv5I3blH1vn2Q39XOLYP1jKuO1c8iF/rS4fLCNHF7r89VuVqURQawCXl
 d3KsGymVDWN3bTk8+lA4CbtHKVeUO0giETAdlAsGHvNAf581h05re/NseXmJgEQlkZ
 A7BbedP5VSLGniDCGqX9LTQ+dFiu52CJggIcrdDvQTaKfiyOklhs0qxet+p9UXm3im
 UuAjBAEDWyyjEfRup5QopmlXeSqOgHnyu+eMaIFX2k+3jIBNT+TwvPAmRRdyVL43Eh
 n5As2JJiLmiRg==
Date: Tue, 30 Nov 2021 11:00:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
Message-ID: <YaW3Cff+AJqT8tS/@matsya>
References: <20211117020724.2647769-1-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117020724.2647769-1-pcc@google.com>
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
Cc: Anibal Limon <anibal.limon@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-11-21, 18:07, Peter Collingbourne wrote:
> It has been observed that with certain monitors such as the HP Z27n,
> the register 0x825e reads a value of 0x79 when the HDMI cable is
> connected and 0x78 when it is disconnected, i.e. bit 0 appears
> to correspond to the HDMI connection status and bit 2 is never
> set. Therefore, change the driver to check bit 0 instead of bit 2.

So we have got limited information on this but BIT-2 seems to be related
to HPD and empirical data from various monitors supports this, so this
seems the right thing to do.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
