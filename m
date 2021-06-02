Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C097399425
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90806EE57;
	Wed,  2 Jun 2021 20:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B2A6EE56
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:02:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622664135; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uiSY2nPfub1TorMuwMxTsRCZaabvu7VFakvdKWWqHMg=;
 b=CTO//arRRSiOBbjDs4bk7RLV109jiuCDfooyUyfJ3gbqFAP6UGEpqG1MBvu3YdQ2Oznwo8zQ
 SaLZHj5BJDcFYmjS1Sgqhz6J3xKygxkd8LoPptxUQ/o9lFXsOf2zyaR2VKv2SQDhQUasIUIu
 kFPizh5bZ//EFpWsLld5xYPOFRQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b7e3c4e27c0cc77f26b5e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 20:02:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F8F3C43217; Wed,  2 Jun 2021 20:02:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 811C1C433D3;
 Wed,  2 Jun 2021 20:02:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Jun 2021 01:32:09 +0530
From: rajeevny@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
In-Reply-To: <20210601205848.GA1025498@robh.at.kernel.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
Message-ID: <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, mkrishn@codeaurora.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-06-2021 02:28, Rob Herring wrote:
> On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:

>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-7nm
> 
> When would one use this?
This is for SM8250.

> 
>> +      - const: qcom,dsi-phy-7nm-7280
>> +      - const: qcom,dsi-phy-7nm-8150
> 
> These don't look like full SoC names (sm8150?) and it's
> <vendor>,<soc>-<block>.

Thanks, Rob, for the review.

I just took the `compatible` property currently used in the DSI PHY 
driver
(drivers/gpu/drm/msm/dsi/phy/dsi_phy.c), and added a new entry for 
sc7280.
A similar pattern of `compatible` names are used in other variants of 
the
DSI PHY driver e.g. qcom,qcom,dsi-phy-10nm-8998, qcom,dsi-phy-14nm-660 
etc.

The existing compatible names "qcom,dsi-phy-7nm-8150" (SoC at the end) 
make
some sense, if we look at the organization of the dsi phy driver code.
I am new to this and don't know the reason behind the current code
organization and this naming.

Yes, I agree with you, we should use full SoC names. Adding
the SoC name at the end does not feel very convincing, so I will change 
this
to the suggested format e.g. "qcom,sm8250-dsi-phy-7nm", and will rename 
the
occurrences in the driver and device tree accordingly.
Do I need to make changes for 10nm, 14nm, 20nm, and 28nm DSI PHY too?
Bindings doc for these PHYs recently got merged to msm-next [1]


[1] 
https://gitlab.freedesktop.org/drm/msm/-/commit/8fc939e72ff80116c090aaf03952253a124d2a8e


Thanks,
Rajeev
