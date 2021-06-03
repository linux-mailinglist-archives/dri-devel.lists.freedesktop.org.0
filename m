Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D7399A9C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1216EAE3;
	Thu,  3 Jun 2021 06:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF586EAE3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:26:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622701590; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JQ5eM5aH4kIpWWTZt6DlDA3K6TzSLosXUzhL8Jtxdjs=;
 b=qkqDBEQkN8EATv3eZ3XP14IdvlBHOxy02Tg/fYD2HjWBvwHvyUaHM55lNGzR1+wJKdDvbjW7
 F6V0wPhJODH3w0oWImYUyuFDw0f4XbECRNlU0Dc42RdHvKu2/uEjYI+pRfmZu9ypxgV5TFvN
 aIqhFf6SWp+yQxrrjeOTxTMeNRI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b876112eaeb98b5eeb1f8d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 06:26:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 301C4C43217; Thu,  3 Jun 2021 06:26:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B7A8C433D3;
 Thu,  3 Jun 2021 06:26:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Jun 2021 11:56:24 +0530
From: rajeevny@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v5 1/5] drm/panel: add basic DP AUX backlight support
In-Reply-To: <CAD=FV=XMVKP=nK+-eTpxNK-AQ66rqvfMj_Q0TZrsG-CEWtbw8Q@mail.gmail.com>
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-2-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=XMVKP=nK+-eTpxNK-AQ66rqvfMj_Q0TZrsG-CEWtbw8Q@mail.gmail.com>
Message-ID: <3f088fcc07800323b4cb24af4b972514@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03-06-2021 05:35, Doug Anderson wrote:
> Hi,
> 
> On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> 
> wrote:
>> 

> 
> Other than the two nits (ordering of memory allocation and word
> wrapping in a comment), this looks good to me. Feel free to add my
> Reviewed-by tag when you fix the nits.
> 
> NOTE: Even though I have commit access to drm-misc now, I wouldn't
> feel comfortable merging this to drm-misc myself without review
> feedback from someone more senior. Obviously we're still blocked on my
> and Lyude's series landing first, but even assuming those just land
> as-is we'll need some more adult supervision before this can land. ;-)
> That being said, I personally think this looks pretty nice now.
> 
> 
> -Doug

Thank you, Doug.

I'll address the review comments of this patch and another patch (v5 
3/5)
in the next spin. I'll wait for Lyude to check this series, as she 
wanted
to review it in a few days.


Thanks,
Rajeev

