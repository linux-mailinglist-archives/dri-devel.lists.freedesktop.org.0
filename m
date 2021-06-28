Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37093B5DCB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C446E439;
	Mon, 28 Jun 2021 12:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD356E439
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:16:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624882588; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eOk428q47G9JECgI305p0YfOtLH88pZzKPZeMrWmwQs=;
 b=cHnKzb5KT111nPf15JpmJwpGjJqVgEE+ZbOKQvhqo+mUgsipxyC0txUfOTZQA4DJ1fVwEmkk
 3mRnAvL24EivksJUamT0akuY4LH2Np0XnvbguTBj3frOUgkMD7wzqSaE+PpBTT9aBx1yayNT
 8S4/PNfPz836yxhXvv2qSlDgvg0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60d9bd9a5e3e57240b82f390 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Jun 2021 12:16:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1259BC43217; Mon, 28 Jun 2021 12:16:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ABA76C433D3;
 Mon, 28 Jun 2021 12:16:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 28 Jun 2021 17:46:24 +0530
From: rajeevny@codeaurora.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [v8 4/6] drm/panel-simple: Update validation warnings for eDP
 panel description
In-Reply-To: <YNjA+jg9Khn+a9K+@pendragon.ideasonboard.com>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
 <YNjA+jg9Khn+a9K+@pendragon.ideasonboard.com>
Message-ID: <d75afefac48229657d36e12b6bac0e9f@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 mkrishn@codeaurora.org, sam@ravnborg.org, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, a.hajda@samsung.com,
 thierry.reding@gmail.com, seanpaul@chromium.org, abhinavk@codeaurora.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 27-06-2021 23:48, Laurent Pinchart wrote:
> Hi Rajeev,
> 
> On Sat, Jun 26, 2021 at 10:21:06PM +0530, Rajeev Nandan wrote:
>> Do not give a warning for the eDP panels if the "bus_format" is
>> not specified, since most eDP panels can support more than one
>> bus formats and this can be auto-detected.
>> Also, update the check to include bpc=10 for the eDP panel.
>> 
>> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
>> ---
>> 
>> Changes in v8:
>> - New patch, to address the review comments of Sam Ravnborg [1]
>> 
>> [1] 
>> https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/
>> 
>>  drivers/gpu/drm/panel/panel-simple.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
>> b/drivers/gpu/drm/panel/panel-simple.c
>> index 86e5a45..f966b562 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev, 
>> const struct panel_desc *desc,
>>  			desc->bpc != 8);
>>  		break;
>>  	case DRM_MODE_CONNECTOR_eDP:
>> -		if (desc->bus_format == 0)
>> -			dev_warn(dev, "Specify missing bus_format\n");
>> -		if (desc->bpc != 6 && desc->bpc != 8)
>> -			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
>> +		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
>> +			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", 
>> desc->bpc);
> 
> You'll still get a warning is bpc == 0, is that intentional ?

This was not intentional, I missed considering bpc=0 case. As we are 
removing the warning for bus_format=0 then a similar thing can be done 
for the bpc=0 also. The bpc value should be a valid one if it is 
specified. Unlike the bus_format, bpc has few possible values that can 
be checked here along with 0. Please correct me if I misunderstood the 
concept.
I will fix this.

Thanks,
Rajeev
