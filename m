Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DED24959E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B596E1ED;
	Wed, 19 Aug 2020 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E93389B68
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:18:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597763921; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=llOXz6hHf939lRgjzq6PQgYsFaUkZxMefMQodFWY1Y4=;
 b=MIiokSe9Ypc9Zm2BTxgRmPOzeuAH3UmrhJIitXMxRZaC286xhRYIFtm3j+7++rs8pk1sT5ZW
 ibp1uWEgcB/TdWmqe+JToZvmdlrnZG8jd/gBeRLAJATNeB7m2NiXf6vXr24MS1Xr20le5EMZ
 fV+A9EcySvz4znF/o9bmbEZPoi8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f3bf14f4c787f237b1cf4e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 15:18:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BBC2DC433AF; Tue, 18 Aug 2020 15:18:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 49A95C433CA;
 Tue, 18 Aug 2020 15:18:37 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 Aug 2020 20:48:37 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
 <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
Message-ID: <0c3a5b78537c659f49037e3f9d0d8888@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, "Kristian
 H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-18 20:42, Rob Clark wrote:
> On Tue, Aug 18, 2020 at 3:03 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi,
>> 
>> On 2020-06-01 16:33, Krishna Manikandan wrote:
>> > Define shutdown callback for display drm driver,
>> > so as to disable all the CRTCS when shutdown
>> > notification is received by the driver.
>> >
>> > This change will turn off the timing engine so
>> > that no display transactions are requested
>> > while mmu translations are getting disabled
>> > during reboot sequence.
>> >
>> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> >
>> > Changes in v2:
>> >       - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
>> >       - Change commit text to reflect when this issue
>> >         was uncovered (Sai Prakash Ranjan)
>> > ---
>> >  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
>> > b/drivers/gpu/drm/msm/msm_drv.c
>> > index e4b750b..94e3963 100644
>> > --- a/drivers/gpu/drm/msm/msm_drv.c
>> > +++ b/drivers/gpu/drm/msm/msm_drv.c
>> > @@ -1322,6 +1322,13 @@ static int msm_pdev_remove(struct
>> > platform_device *pdev)
>> >       return 0;
>> >  }
>> >
>> > +static void msm_pdev_shutdown(struct platform_device *pdev)
>> > +{
>> > +     struct drm_device *drm = platform_get_drvdata(pdev);
>> > +
>> > +     drm_atomic_helper_shutdown(drm);
>> > +}
>> > +
>> >  static const struct of_device_id dt_match[] = {
>> >       { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>> > @@ -1334,6 +1341,7 @@ static int msm_pdev_remove(struct platform_device
>> > *pdev)
>> >  static struct platform_driver msm_platform_driver = {
>> >       .probe      = msm_pdev_probe,
>> >       .remove     = msm_pdev_remove,
>> > +     .shutdown   = msm_pdev_shutdown,
>> >       .driver     = {
>> >               .name   = "msm",
>> >               .of_match_table = dt_match,
>> 
>> Any more comments on this patch?
> 
> sorry, I managed to overlook this earlier.. I've pulled it in to 
> msm-next
> 

No problem, thanks Rob.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
