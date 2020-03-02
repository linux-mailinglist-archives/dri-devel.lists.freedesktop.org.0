Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B71C17652D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A312F6E83A;
	Mon,  2 Mar 2020 20:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B216E83A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:41:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583181682; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=khx1KQYqxxQvmwAnOnZ7jUWNWknzXliTUbWl7Gfuk+s=;
 b=jgnclWXnxF/n3dL8EYDDebmtv3GeSvULje1I3PrGSS00zjVu0zaSnTUhU45LEp6Nw4PbvxHV
 9/9l3mWuf0SFT14k1g6QN5Y2cpLSICWDlN2FZILdZSJFLJVUn5ziWmJpkfafXCFyr2FbsimT
 Si8Lt44j6MFQ1UdHlFrd21CCVok=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5d6f66.7f8a9bef5148-smtp-out-n02;
 Mon, 02 Mar 2020 20:41:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0B9E6C4479C; Mon,  2 Mar 2020 20:41:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 24B45C43383;
 Mon,  2 Mar 2020 20:41:08 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 02 Mar 2020 12:41:08 -0800
From: abhinavk@codeaurora.org
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Reverting https://patchwork.freedesktop.org/patch/336850/
In-Reply-To: <20200302080912.GA1690850@ulmo>
References: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
 <20200302080912.GA1690850@ulmo>
Message-ID: <67a9625bc57d85f675af5074f9ded248@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: treding@nvidia.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, varar@quicinc.com, seanpaul@chromium.org,
 daniel.vetter@ffwll.ch, aravindh@codeaurora.org, chandanu@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry

Thanks for the response.
We shall reimplement these locally in our drivers and push the next 
patchset.

Thanks

Abhinav
On 2020-03-02 00:09, Thierry Reding wrote:
> On Fri, Feb 28, 2020 at 05:35:51PM -0800, abhinavk@codeaurora.org 
> wrote:
>> Hi Thierry
>> 
>> For DP drivers using MSM chipsets, we are using drm_dp_link_configure,
>> drm_dp_link_power_up and drm_dp_link_power_down functions. Here is the 
>> patch
>> for reference:
>> 
>> https://patchwork.freedesktop.org/patch/343346/
>> 
>> We will be posting a newer version of the driver soon.
>> 
>> For that, we plan to revert 
>> https://patchwork.freedesktop.org/patch/336850/
>> as now there are more users of the functions and not just tegra.
>> 
>> Let us know if this is the right approach or shall we make the 
>> required
>> functions local to our drivers.
> 
> I think reimplementing these locally in you drivers is the preferred
> way. It's not so much a lack of users (there were 5 or so in total when
> I made the change to remove these helpers), but rather the general
> approach that was being criticized by other driver maintainers. I'm not
> aware of any of their opinions having changed on this subject, so I'd
> recommend going down the path of least resistance.
> 
> Thierry
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
