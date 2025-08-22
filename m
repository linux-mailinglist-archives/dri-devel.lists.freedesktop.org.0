Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C13B30E68
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 08:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC110E317;
	Fri, 22 Aug 2025 06:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="JlBq4Bc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.iitb.ac.in (smtpd10.iitb.ac.in [103.21.126.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9710E317
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:01:01 +0000 (UTC)
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
 by smtp1.iitb.ac.in (Postfix) with SMTP id ABD40101C0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:30:57 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in ABD40101C0EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
 t=1755842457; bh=ad//YqRuqcgA9+9HNp21ouEBFeL3tbh2npiiulR9Ais=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlBq4Bc1VX5qi4rxA210yBYM40hFnPGYn2STswNeBUCIpz0eLNQbUv+yEeWwr70Nr
 0WRZKIbJX7HwTyzTa74i7p0AF1DtRmzLA4HXqH5EYmAYh8SBAinL3txwRIVkFih8DW
 sBMDVfLI1MHfuPmh9+hVStDK2U1oOXAb48lthIDY=
Received: (qmail 31112 invoked by uid 510); 22 Aug 2025 11:30:57 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from
 <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.492516 secs;
 22 Aug 2025 11:30:57 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns2.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID,
 URIBL_BLOCKED autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
 by ldns2.iitb.ac.in with SMTP; 22 Aug 2025 11:30:54 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 by ldns2.iitb.ac.in (Postfix) with ESMTP id A5FC034155C;
 Fri, 22 Aug 2025 11:30:53 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 (Authenticated sender: akhilesh)
 by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 6EF8B1E81562;
 Fri, 22 Aug 2025 11:30:53 +0530 (IST)
Date: Fri, 22 Aug 2025 11:30:48 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] gpu: host1x: use dev_err_probe() in probe path
Message-ID: <aKgHkAWW0puXbZkv@bhairav-test.ee.iitb.ac.in>
References: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>
 <6346652.lOV4Wx5bFT@senjougahara>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6346652.lOV4Wx5bFT@senjougahara>
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

On Fri, Aug 22, 2025 at 12:18:38PM +0900, Mikko Perttunen wrote:
> On Monday, July 28, 2025 9:15 AM Akhilesh Patil wrote:
> > Use dev_err_probe() helper as recommended by core driver model in
> > drivers/base/core.c to handle deferred probe error. Improve code
> > consistency and debuggability using standard helper.
> > 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> >  drivers/gpu/host1x/dev.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index 1f93e5e276c0..e6f3cbeb9ae5 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -587,11 +587,7 @@ static int host1x_probe(struct platform_device *pdev)
> >  	host->clk = devm_clk_get(&pdev->dev, NULL);
> >  	if (IS_ERR(host->clk)) {
> >  		err = PTR_ERR(host->clk);
> > -
> > -		if (err != -EPROBE_DEFER)
> > -			dev_err(&pdev->dev, "failed to get clock: %d\n", 
> err);
> > -
> > -		return err;
> > +		return dev_err_probe(&pdev->dev, err, "failed to get clock: 
> %d\n", err);
> 
> AIUI, dev_err_probe already prints err, so we don't need to repeat it in the 
> message. With that, PTR_ERR(host->clk) can also be inlined into the 
> dev_err_probe call.
ACK. Thanks for the review.
Posted v2 addressing this with 6.17-rc2 rebased build tested.

Regards,
Akhilesh
> 
> Cheers,
> Mikko
> 
> >  	}
> > 
> >  	err = host1x_get_resets(host);
> 
> 
> 
> 
