Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E27F1A7435
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85B36E45F;
	Tue, 14 Apr 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27B689CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 14:50:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586789457; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uvf3bpTwOKniLL1tkFEZ8lUYaBxnlGE9DNXjmA347Xc=;
 b=AVbQpecXE/vjIhtDWsL7yjXUwrFT3ux4//gHSa3gmOv5AE2j7B7tMGOWv/ZRR9jF5Uv6Oxug
 WO34YbwIC0PcP5PxAkazESpNIv59gyqRXhDz7vZR5MUkOah70MVOizyP3ky+BXSz5JPEiwlN
 nkqjNqqFCJqrFsTemxQwlgbt8c4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e947c49.7fdce22d7f80-smtp-out-n03;
 Mon, 13 Apr 2020 14:50:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 77C07C43636; Mon, 13 Apr 2020 14:50:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A50E3C433F2;
 Mon, 13 Apr 2020 14:50:47 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 13 Apr 2020 20:20:47 +0530
From: kgunda@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V4 1/4] backlight: qcom-wled: convert the wled bindings to
 .yaml format
In-Reply-To: <20200406085024.GF30614@dell>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-2-git-send-email-kgunda@codeaurora.org>
 <20200331175401.GA9791@bogus>
 <ac8f25113a3bb233c11fd7cd9e62c2cf@codeaurora.org>
 <20200403114651.m6rholzufzqinanc@holly.lan> <20200406085024.GF30614@dell>
Message-ID: <4fb0643342e512a248f57198cbafe50c@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: mark.rutland@arm.com, Daniel Thompson <daniel.thompson@linaro.org>,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-06 14:20, Lee Jones wrote:
> On Fri, 03 Apr 2020, Daniel Thompson wrote:
> 
>> On Fri, Apr 03, 2020 at 04:45:49PM +0530, kgunda@codeaurora.org wrote:
>> > On 2020-03-31 23:24, Rob Herring wrote:
>> > > On Mon, Mar 23, 2020 at 11:16:55PM +0530, Kiran Gunda wrote:
>> > > > diff --git
>> > > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > new file mode 100644
>> > > > index 0000000..8a388bf
>> > > > --- /dev/null
>> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> > > > @@ -0,0 +1,184 @@
>> > > > +# SPDX-License-Identifier: GPL-2.0-only
>> > > > +%YAML 1.2
>> > > > +---
>> > > > +$id: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
>> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > > > +
>> > > > +title: Binding for Qualcomm Technologies, Inc. WLED driver
>> > > > +
>> > > > +maintainers:
>> > > > +  - Lee Jones <lee.jones@linaro.org>
>> > >
>> > > Should be the h/w owner (you), not who applies patches.
>> > >
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> > <snip>
>> > will address in next post.
>> 
>> If you agree on all points raised I doubt there is any need for a 
>> point
>> by point reply since everyone who reads it will have to scroll down
>> simply to find out that you agree on all points.
>> 
>> Better just to acknowledge the feedback and reply to the first one
>> saying you'll agree on all points and will address all feedback in the
>> next revision (and then trim the reply to keep it short).
> 
> Or better still, just submit the next revision with all the fixes. :)
Noted.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
