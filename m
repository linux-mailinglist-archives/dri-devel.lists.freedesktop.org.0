Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD73DFB24
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 07:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D246E9BE;
	Wed,  4 Aug 2021 05:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B786E9BE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 05:37:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628055463; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XdIMy/+KYlx0LiNJkuSBANk6R6Hn89TlHZhiYcNm2Ec=;
 b=or3AYq+UArJDFZWthU6v9Xt1UFX306ni4Kl2/QecwiskwgGhzOYAtVoXwsnCUhJCNBFHE/BI
 lFkUVMP1rTAQzzWRhq2Pj3aDrw0lZn3cFBZdO05YzAeJG0Bcc2gvjTzCL1ReIa+W52skky/E
 yG4jFIVoX2tZmWKeL9Alp2AHD0g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 610a27a61175e6c417ce3512 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 05:37:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 93EF0C433F1; Wed,  4 Aug 2021 05:37:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BDDD1C433D3;
 Wed,  4 Aug 2021 05:37:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Aug 2021 11:07:40 +0530
From: kalyan_t@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, dianders@chromium.org,
 mkrishn@codeaurora.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, stable@vger.kernel.org
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: add safe lut config in dpu
 driver
In-Reply-To: <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
 <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
Message-ID: <b6aca5dda4e100694a3d8cb39cfc650d@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-04 01:43, Stephen Boyd wrote:
> Quoting Kalyan Thota (2021-08-03 03:41:47)
>> Add safe lut configuration for all the targets in dpu
>> driver as per QOS recommendation.
>> 
>> Issue reported on SC7280:
>> 
>> With wait-for-safe feature in smmu enabled, RT client
>> buffer levels are checked to be safe before smmu invalidation.
>> Since display was always set to unsafe it was delaying the
>> invalidaiton process thus impacting the performance on NRT clients
>> such as eMMC and NVMe.
>> 
>> Validated this change on SC7280, With this change eMMC performance
>> has improved significantly.
>> 
>> Changes in v1:
>> - Add fixes tag (Sai)
>> - CC stable kernel (Dimtry)
>> 
>> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for 
>> SC7280 target)
> 
> This is wrong format and commit hash
> 
My bad, i'll fix it right away
- KT

> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for
> SC7280 target")
> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> 
>> (sc7280, sc7180)
