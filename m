Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B0268549
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895CC6E1C4;
	Mon, 14 Sep 2020 07:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920D76EAB3;
 Fri, 11 Sep 2020 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599843010;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
 b=mW8LGoOS/6Jq0Ib6WLcF6Pci/FZtFlRyzdcCdlKBlpD//1wd6KArghw/mjoqSXMY
 CosjOOmrfqPzyJRe2XZCO3hPGcqDIYLcPB5sz2/mh+IVNqTrGPjGT7l1YWXeFIY5WGv
 vq09NqpkiOBIyFepoB4G7DTfkzqkgtrwLbrAr8DA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599843010;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=75M3K27A75eW01qMnHulweMV5JfADkFu3ldMwzlgYeY=;
 b=lgrdhX1uI1QsEmsyPKHre9UuazR7joAymA204PS25rAS22EWcXBmuantTOZ9mBEi
 FFMFuRyu3/OjwgDInPOx4ApDrQkihBpZQMVP8LDd/ZA7w5uvh9keRGB9cWAsAnCmSXS
 PrTURa5HTQ6n+0S+1zRxe6BwizaaI9L5eu9g0WSk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 16:50:10 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
 <20200911160706.GA20802@willie-the-truck>
 <010101747df8e9df-fad2f88d-e970-4753-a99a-2cfeeb1a29a9-000000@us-west-2.amazonses.com>
 <7ff9b238-e203-059f-d793-1c44475c6aa2@arm.com>
Message-ID: <010101747e13064f-3cf95243-ff07-40a3-84fb-c554695a1372-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.186
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
Cc: Will Deacon <will@kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 22:04, Robin Murphy wrote:
> On 2020-09-11 17:21, Sai Prakash Ranjan wrote:
>> On 2020-09-11 21:37, Will Deacon wrote:
>>> On Fri, Sep 11, 2020 at 05:03:06PM +0100, Robin Murphy wrote:
>>>> BTW am I supposed to have received 3 copies of everything? Because I 
>>>> did...
>>> 
>>> Yeah, this seems to be happening for all of Sai's emails :/
>>> 
>> 
>> Sorry, I am not sure what went wrong as I only sent this once
>> and there are no recent changes to any of my configs, I'll
>> check it further.
> 
> Actually on closer inspection it appears to be "correct" behaviour.
> I'm still subscribed to LAKML and the IOMMU list on this account, but
> normally Office 365 deduplicates so aggressively that I have rules set
> up to copy list mails that I'm cc'ed on back to my inbox, in case they
> arrive first and cause the direct copy to get eaten - apparently
> there's something unique about your email setup that manages to defeat
> the deduplicator and make it deliver all 3 copies intact... :/
> 

No changes in my local setup atleast, but in the past we have
had cases with codeaurora mail acting weird or it could be my vpn,
will have to check.

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
