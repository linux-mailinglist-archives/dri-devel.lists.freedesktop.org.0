Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4922926856E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A62A6E20D;
	Mon, 14 Sep 2020 07:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 16:29:02 UTC
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D106EAAF;
 Fri, 11 Sep 2020 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599841300;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=zLLjZiRypG0Wci37ZvhYi5U/numQqbf1L3QFevedjJ0=;
 b=iJMhZ976nod5AZSalkPB5j6GXuCSDStv0uDC5PReuuOIOkIIsGvPqswN+n0wUZ6f
 z7Vd8rw/gigWBsajjwQwNyHH4JHrx+ZUClQH0TOxOdg1RvGUduzZKRP8EHQ/uY9vyQe
 IFWRSswOgC2zFa/SUDG3Y15UFZfQbRGnfxZmLDQc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599841300;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=zLLjZiRypG0Wci37ZvhYi5U/numQqbf1L3QFevedjJ0=;
 b=XuwtVDwwCUmt9bLUJQukYpGyFFZNtoKqMorHmQHDso0qyNnJCmNXuRaSfLmMMRpf
 9qarabcDtHtEY6FsPXYioj1P3OmR2Wjay4GXrZUBrZsdqCpIvq1sVjYRmTLJH/QxbFX
 rm/yZY5IB58DF1x9cZjqy8s9bYt/oF06WoqBW6iw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 16:21:40 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <20200911160706.GA20802@willie-the-truck>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
Message-ID: <010101747df8ee05-fdaaacec-8120-49e6-aa11-d77701e0dfef-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 21:37, Will Deacon wrote:
> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>> BTW am I supposed to have received 3 copies of everything? Because I 
>> did...
> 
> Yeah, this seems to be happening for all of Sai's emails :/
> 

Sorry, I am not sure what went wrong as I only sent this once
and there are no recent changes to any of my configs, I'll
check it further.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
