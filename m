Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FD157158
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290716EB8E;
	Mon, 10 Feb 2020 08:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC4F6FC6A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 12:38:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581079126; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qzairh/+yw4wEAbV6wFRDDG7JyWfCMeJmBCkct0T2fc=;
 b=kuLckCUBy6u9CFWfKnjXHAqKTcyI4ARj9v6iT87gLfJOi87PyC/oy9hfehyvMhW4/upYnCSS
 rBlfIeMElaxIJolMVEoHAU0T6BYoe9gmJWEl9jNXrgsFaRXO2zXxDuDYwM9Hl49Dulwj83S1
 cVcMOO7aL5CtdVX8s/t2MH8MLKs=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d5a51.7fb1f267c570-smtp-out-n03;
 Fri, 07 Feb 2020 12:38:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84753C433CB; Fri,  7 Feb 2020 12:38:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5976C43383;
 Fri,  7 Feb 2020 12:38:39 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 07 Feb 2020 18:08:39 +0530
From: harigovi@codeaurora.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
In-Reply-To: <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
Message-ID: <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-06 20:29, Jeffrey Hugo wrote:
> On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org> 
> wrote:
>> 
>> For a given byte clock, if VCO recalc value is exactly same as
>> vco set rate value, vco_set_rate does not get called assuming
>> VCO is already set to required value. But Due to GDSC toggle,
>> VCO values are erased in the HW. To make sure VCO is programmed
>> correctly, we forcefully call set_rate from vco_prepare.
> 
> Is this specific to certain SoCs? I don't think I've observed this.

As far as Qualcomm SOCs are concerned, since pll is analog and the value 
is directly read from hardware if we get recalc value same as set rate 
value, the vco_set_rate will not be invoked. We checked in our idp 
device which has the same SOC but it works there since the rates are 
different.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
