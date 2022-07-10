Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB956CE7E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 12:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79412A7B6;
	Sun, 10 Jul 2022 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C72812AA3E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=rEJybCJet2Hivh6qA8E5QBR15vMK+Pp+penGzDCE/gA=;
 b=b0/nmvN7DqiX0kkiYxY04bD70tMgShZfdVC9ZJajky7kFm6oMYGrw9ktIezVyQs2+8E4/UZfrKTZY
 EgAn0iCUHct+pl3z5C8FcUpzhgINhlhnEb0lf20zi9BLshv9OYSLNtm3XVvBe7zNHQ4G1KmOAIi1LS
 NwnSWdozaKCagsnN85fpy4NWwNyJWxz01jdMaHPDzUm6pvUQ2+58/pmRZVqZ/1Uy3JHjUBZQ43LNMm
 rxOxzHa6Q1U5odiIYxfS8LvBnVyo+NDQvj8q1PpF6/sXWvy1+e2/9ftqQzVTsUxzDx6rWccZ0wiOlH
 JCHtPfotFyQzC7EL/6WtRy1uhTRFulg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=rEJybCJet2Hivh6qA8E5QBR15vMK+Pp+penGzDCE/gA=;
 b=zhj7p1kncuTVyhNq25SboIi49TZRRb2yMqScN0famvosUjKTzDGPhMgzllTAHyuGU0B6+UIUM/zKT
 Z/HbU6wBA==
X-HalOne-Cookie: c2ff1fd2e92b6addf632218b96cffdd31ae2ce00
X-HalOne-ID: f17ef01f-0038-11ed-823d-d0431ea8bb10
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id f17ef01f-0038-11ed-823d-d0431ea8bb10;
 Sun, 10 Jul 2022 10:13:29 +0000 (UTC)
Date: Sun, 10 Jul 2022 12:13:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Molly Sophia <mollysophia379@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Message-ID: <YsqmRzxlvdoK8iK8@ravnborg.org>
References: <20220709141136.58298-1-mollysophia379@gmail.com>
 <YsnpXU2w1wsXiGrs@ravnborg.org>
 <CAK0UmJBL9tj+XLa3GQHqk_gMHz9tZRoWEj=3G9zjNaPkZw9+5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK0UmJBL9tj+XLa3GQHqk_gMHz9tZRoWEj=3G9zjNaPkZw9+5A@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Molly,

On Sun, Jul 10, 2022 at 02:19:41PM +0800, Molly Sophia wrote:
> Hi Sam,
> 
> Thanks for your suggestions.
> 
> Sam Ravnborg <sam@ravnborg.org> 于 2022年7月10日周日 上午4:47写道：
> 
> > Hi Molly,
> >
> > thanks for the quick response to the review comments.
> >
> > On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:
> > > Add documentation for "novatek,nt35596s" panel.
> > >
> > > Signed-off-by: MollySophia <mollysophia379@gmail.com>
> > The s-o-b needs your real name - guess the above is a concatenation of
> > first name and surname.
> >
> > The binding included in this patch fails the check:
> > $ make DT_CHECKER_FLAGS=-m dt_binding_check
> >
> > You may need to run:
> > $ pip3 install dtschema --upgrade
> >
> > Or you may have to install some dependencies first.
> > The problem is that the patch is missing a "reset-gpios: true"
> >
> > On top of this I looked at the binding - and the description
> > this is copied from is almost identical.
> > So another approach would be to extend the existing binding like
> > in the following.
> >
> > And this also gives a good hint that maybe this can be embedded in
> > the existing driver - and there is no need for a new driver.
> > Could you try to give this a spin and get back on this.
> >
> 
> That's reasonable. Actually, this driver was modified from
> novatek,nt35596s, with different panel initialization commands, and it
> seems easy to be embedded in
> the existing driver. However, I wonder what the driver file name would
> be...? "panel-novatek-nt35596s-nt36672a.c" or something else?

Just keep the current driver name - we cannot embed all the supported HW
in one driver name anyway. And then you do not break currents users in
case they have hardwired the current driver name.

	Sam
