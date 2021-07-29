Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43523DA8B6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 18:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953F16EDE4;
	Thu, 29 Jul 2021 16:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A308B6EDEA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 16:17:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627575484; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=e1dPKh3zKj9PpqF9ZxCzzdvomuVG/QrY82xKdOIhZYE=;
 b=iyBHRJERtpvuomRXoNA81fwDcWUxADECMnNWsoEb7sb1bvpmqRt/pJsdhTn056AlqHCD5fjO
 swmK63IUyQ6UfpaBw3YZAaiftR0XPVQRrrClD9I/RjWeAjG7Mi/kSFht1gNqVYn25aGenyN6
 cMK9h/TQnMDcRMOaZaNP5GBmooA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6102d4aae81205dd0ad6ae88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 16:17:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 52857C43217; Thu, 29 Jul 2021 16:17:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B5037C433D3;
 Thu, 29 Jul 2021 16:17:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 29 Jul 2021 09:17:45 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
In-Reply-To: <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
 <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
Message-ID: <ef1a1d24e0afe5455d841054660f1e3c@codeaurora.org>
X-Sender: khsieh@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-22 12:23, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-13 08:54:05)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 88196f7..0fdb551 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel 
>> *dp_panel)
>>         panel = container_of(dp_panel, struct dp_panel_private, 
>> dp_panel);
>> 
>>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>> -               u8 checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               u8 checksum;
>> +
>> +               if (dp_panel->edid)
>> +                       checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               else
>> +                       checksum = 
>> dp_panel->connector->real_edid_checksum;
> 
> Is there any reason why we can't use connector->real_edid_checksum all
> the time?
> 
real_edid_checksum only calculated by drm when edid checksum 
vitrification failed after edid read.
In the good edid checksum case (edid verification succeed), 
real_edid_checksum is not calculated by drm.
>> 
>>                 dp_link_send_edid_checksum(panel->link, checksum);
>>                 dp_link_send_test_response(panel->link);
