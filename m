Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622D256651
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550456E1B5;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67A6E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:46:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598615167; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sNWgcqQR+6QhQGkc4LU06y2pSDolaw9TtjGFrjyf1bY=;
 b=quJZiHPU+yQW92K6JsSXURC8mJ14ln5pdcbFI50y2F801RXXIJZrnsrMBdBolvowbuFg229o
 3m2ebLDlijY4D14O9XtfrdXSkbMi6dkdoC8jmoDcS0cMGyxI9pDuIYWs6UWrP3PUWc05qJux
 SWY31zzCLg6NGFsfe82GQFlKieI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f48ee692fd6d21f0a2f762d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Aug 2020 11:45:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F6ECC43387; Fri, 28 Aug 2020 11:45:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rojay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B36EC433C6;
 Fri, 28 Aug 2020 11:45:44 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 28 Aug 2020 17:15:44 +0530
From: rojay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
In-Reply-To: <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
 <159796912574.334488.10846610259602895929@swboyd.mtv.corp.google.com>
Message-ID: <fe91d99821775d82c3bd8de9d0988548@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: akashast@codeaurora.org, saiprakash.ranjan@codeaurora.org,
 rnayak@codeaurora.org, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, wsa@kernel.org,
 linaro-mm-sig@lists.linaro.org, mka@chromium.org, agross@kernel.org,
 msavaliy@qti.qualcomm.com, linux-media@vger.kernel.org, skakit@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-21 05:48, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-20 03:35:21)
>> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
>> data scope. For example during shutdown callback to unmap DMA mapping,
>> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
>> and geni_se_rx_dma_unprep functions.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
> 
> Can this be squashed with the next patch? I don't see how this stands 
> on
> its own.

Okay.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
