Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E33584060
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11412B126;
	Thu, 28 Jul 2022 13:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF9714B9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=81CE8cWzUiT+pbHFTXIMXYIlWow9EQ8Wvsa5Y6TihSE=;
 b=mpQSV1lcqdnZfUqHQdsZjIZjllkBefKHfE47qVKcR0LcVGrrMg0gzsfGuXbi/Q4Pw/Gh917YDPusw
 yEUty+79TONgN7i6IbHrVlNs1xIi1YHtp7Z8TYGLm8LItpEj3fVBG7crQtM0omFesJ9/D2E5Zd8tAk
 uWyUGMK5/305ZYKmKc+5wbCa41ETO+e7FoKglMukQhbu55RtbFvcV/3HzTF0PtBcK/pQyEaxaiR7fX
 x0TAwr7kc2YLAdIZy3tgDe0LF82IdgiF0NBSzFnS44XUK928uMSsH9c1nv+SMZFJFXiLXGYXt6GCFi
 j/SnFGw7dr8j84w1sWq7vLrkPgeXR+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=81CE8cWzUiT+pbHFTXIMXYIlWow9EQ8Wvsa5Y6TihSE=;
 b=vkqXrzrQS4Ozm2e1ARR8cR3abhTvNzuqERua9aY+ZZXN9K58QRPSMD5QoDmq+Nt2PnK04ujTj6o69
 Hhll8OIDA==
X-HalOne-Cookie: 0d8ef64462d11d9be67ccc33377236296e9cc1f0
X-HalOne-ID: 4828a37a-0e7c-11ed-be80-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 4828a37a-0e7c-11ed-be80-d0431ea8bb03;
 Thu, 28 Jul 2022 13:50:47 +0000 (UTC)
Date: Thu, 28 Jul 2022 15:50:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 2/2] drm: panel: Add novatek nt35596s panel driver
Message-ID: <YuKUNeazoho6LPTJ@ravnborg.org>
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-3-mollysophia379@gmail.com>
 <1685ecd6-cfe7-c2f1-add5-6bfff055fa06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685ecd6-cfe7-c2f1-add5-6bfff055fa06@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Molly Sophia <mollysophia379@gmail.com>,
 phone-devel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof
On Thu, Jul 28, 2022 at 02:17:29PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2022 04:35, Molly Sophia wrote:
> > Novatek NT35596s is a generic DSI IC that drives command and video mode
> > panels. Add the driver for it. Currently add support for the LCD panel
> > from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.
> > 
> > Changes in v4:
> > - No change.
> > 
> > Changes in v3:
> > - Embed the support into existing driver (panel-novatek-nt36672a), as
> >   these two IC are similar with different initialization commands.
> > 
> 
> This does not go to commit msg (---).
It depends...

In the drm sub-system the general rule is if someone cares to write it,
then it deserves to be added to the commit message.
So for drm patches it is perfectly fine to have the history part
included in the commit message.

These sub-system differences does not makes it easier - I know.

	Sam
