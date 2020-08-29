Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B892E25659A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 09:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492EC6EB82;
	Sat, 29 Aug 2020 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5E6EB82
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 07:25:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6716720026;
 Sat, 29 Aug 2020 09:25:51 +0200 (CEST)
Date: Sat, 29 Aug 2020 09:25:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200829072549.GA729648@ravnborg.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=FA2L6XnpJxR8pNLPXI4A:9
 a=CjuIK1q_8ugA:10 a=xlwrDsRaDpwA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu.

> As to who is going to do the actual merge, I know we had a brief
> discussion about it some time ago and I was supposed to apply for
> drm-misc rights, however it feels a little awkward to merge my own
> code... :)

You are encouraged to commit your own code, it is anyway you who knows
the state of the code best. The golden rule is that the code must have
been seen by somone else before you merge, are translated there must be
an acked-by or reviewed-by on each of the patches.

If you look at ths page:

    https://people.freedesktop.org/~seanpaul/whomisc.html

You can see that a lot of people commit their own code in drm-misc.
Example:

    Daniel Vetter <daniel.vetter@ffwll.ch>, <daniel@ffwll.ch>
    (authored=159 committed=249 self_committed=153)

There is only a few patches written by Daniel that is committed by
someone else. And all patches committed by Daniel carries an
a-b or -rb by someone else.

> Though, I might not even qualify for drm-misc rights anyway,
> considering I haven't been very active in this area... :/
> 
> On that note, I will probably need help with the merging, provided it's
> still happenning. Will you be able to help me out with this?

If the challenge is only to push the patches to drm-misc-next there
is a lot of people that can help you. I would be happy to do so, but
would need a resend as I have deleted the patches from my inbox.

I could dig the pathces out somewhere else, but a fresh rebase would
be preferred.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
