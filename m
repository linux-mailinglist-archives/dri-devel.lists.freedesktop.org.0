Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C456C9BB
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9D112AE8;
	Sat,  9 Jul 2022 13:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966C5112CE8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=DW9E7LotanhEdCfJgAU6YAugMIE+y2/N10PXcxYE6NE=;
 b=X96BNvwEPYU/AWi0AnnSY1C6yji6n/MVkb6zkHy4NzLKPi5OFUguq2LXwPy+Azaq4S0Ktw4hezr7D
 jMZ2lIDC7DGxIRIrM4lXOZ1FBVFZ1WlWOOUiOGhSI/Keq4db8hnydASNNX0uj3FA8AsEd6luigibBH
 s/lazen9sCJXGBeSGN3Mn44NYg4OUM4+UlB1AcVa7KW+do4282w7bauf06/nBgkfxmNWkpaSrBwQYF
 iEjorjffiH6jO1O4EwitLDNpr2YOLkEQtXKW4NyX4B7+eYG76fyWPwA61uFSwKTvb7YWVZefQawOFB
 EPAufF/qBix636CHHSOOrL7J59RPD3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=DW9E7LotanhEdCfJgAU6YAugMIE+y2/N10PXcxYE6NE=;
 b=D8hno8mT5l4KSmvyvEpmfVmAuoT1KBF3FopG8zYqg/11I0aqr5Z4HhzZwyYpnZfRJCjiPp5QLWJ0n
 7DMejwZCg==
X-HalOne-Cookie: 384c07829e1e26af4942da55cdb9b473b8d8ec02
X-HalOne-ID: 1c761a6e-ff8f-11ec-be7e-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1c761a6e-ff8f-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 13:57:46 +0000 (UTC)
Date: Sat, 9 Jul 2022 15:57:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: simple: add support for the Samsung
 LTL101AL01 panel
Message-ID: <YsmJWYP2Q10zRUC/@ravnborg.org>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
 <20220516193709.10037-2-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516193709.10037-2-martin.juecker@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin, the patch looks good.

On Mon, May 16, 2022 at 09:37:08PM +0200, Martin Jücker wrote:
> Add timings and panel description for the Samsung LTL101AL01 panel.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>

Applied to drm-misc (drm-misc-next).

	Sam
