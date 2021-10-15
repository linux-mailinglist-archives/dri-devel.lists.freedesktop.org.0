Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B742E638
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 03:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA066ECBD;
	Fri, 15 Oct 2021 01:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855A36ECBD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 01:43:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634262208; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=zizo19EQe4GGhvitAgZyDhwaOzRv7afytYC4gEFVJ5c=;
 b=RMgNKokyXQXMSWw+Mu9dSDKdHm0EMnx61ZXthVkBmQhUferUrEwYqKRbM8nzYSwn/bglokDw
 V3fwSM00wTT5KwjvBpafVioGekKCSW6o8G6mVZ6cm7KmgfJbnL2t2yQlETOu0hlDljRAUV+k
 6VZW7aaSiK8Rw2dn02KS3J1KA8I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6168dcbcf3e5b80f1f675cc4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 01:43:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3DF80C4360C; Fri, 15 Oct 2021 01:43:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.3] (cpe-70-95-175-72.san.res.rr.com [70.95.175.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 485EEC43460;
 Fri, 15 Oct 2021 01:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 485EEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
Date: Thu, 14 Oct 2021 18:43:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, seanpaul@chromium.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211001123115.GE2283@kili>
From: Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211001123115.GE2283@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hey Dan,

On 10/1/2021 5:31 AM, Dan Carpenter wrote:
> Hello Sean Paul,
>
> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> well" from Jul 25, 2018, leads to the following
> Smatch static checker warning:
>
> 	drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> 	warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
>
> drivers/gpu/drm/msm/dsi/dsi_host.c
>      721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>      722 {
>      723         if (!msm_host->mode) {
>      724                 pr_err("%s: mode not set\n", __func__);
>      725                 return -EINVAL;
>      726         }
>      727
>      728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>                  ^^^^^^^^^^^^^^^^^^^^^^
> I don't know why Smatch is suddenly warning about ancient msm code, but
> clock rates should be unsigned long.  (I don't remember why).
>
>      730         return 0;
>      731 }

I'm unable to recreate the warning with Smatch. After running 
build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker 
drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:

CHECK scripts/mod/empty.c
CALL scripts/checksyscalls.sh
CALL scripts/atomic/check-atomics.sh
CHECK arch/arm64/kernel/vdso/vgettimeofday.c
CC drivers/gpu/drm/msm/dsi/dsi_host.o
CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn: 
missing error code 'ret'

Is there a specific .config you're using (that's not the default 
mainline defconfig)? If so, can you please share it?

Thanks,

Jessica Zhang

> regards,
> dan carpenter
