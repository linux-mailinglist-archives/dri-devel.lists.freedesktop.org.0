Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E71812FD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C94F6E92B;
	Wed, 11 Mar 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1176E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:03:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583910207; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GAuTLvEuWXt9KrX72GtkLXsGN2+/h8QdvpOamlfyA/A=;
 b=CbNxnGrdEZnMHHdRyaIimRwZ6H0uokv3kqj8B2Ff3/EbQINbiOB4k4eBxHVTlDaQQazaoDVC
 LBQ/pv3SCM+blrEE0N20MFYpNkLIzkKXIw3yny+XzcDPxQjY6WVbZdpmXu55OZx9x0jUWkpi
 ZqLUYtN1CPVSD6UH4h23DCaHfx0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e688d3d.7effa5c03030-smtp-out-n02;
 Wed, 11 Mar 2020 07:03:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8A7BC433CB; Wed, 11 Mar 2020 07:03:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D1AF0C433CB;
 Wed, 11 Mar 2020 07:03:23 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 11 Mar 2020 12:33:23 +0530
From: kgunda@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/4] backlight: qcom-wled: convert the wled bindings to
 .yaml format
In-Reply-To: <20200310183118.GA13818@bogus>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-2-git-send-email-kgunda@codeaurora.org>
 <20200310183118.GA13818@bogus>
Message-ID: <95536b5ff4f8209affc056d1900a8873@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-11 00:01, Rob Herring wrote:
> On Mon,  9 Mar 2020 18:55:59 +0530, Kiran Gunda wrote:
>> Convert the qcom-wled bindings from .txt to .yaml format.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.txt          | 154 
>> -----------------
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 184 
>> +++++++++++++++++++++
>>  2 files changed, 184 insertions(+), 154 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml: $id:
> relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/leds/backlight/qcom-wled.yaml#
> 
> See https://patchwork.ozlabs.org/patch/1251567
> Please check and re-submit.
I will fix it in next post.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
