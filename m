Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCD26854F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30986E1BA;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CDB6EAAA;
 Fri, 11 Sep 2020 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599841153;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=XBT+2F8Be9EUhOk79AkAkxBza69lSFrrfNDtXiYkez8=;
 b=euWd0+7eqo8MbdrMMWVlBYQMBGRLurCrGCwrkSMk0jSuBH102mf9idUFHplNp9+K
 j0jdD7hlGT8mEhyOUO6bSXtuzTzG/2lSHnOZ3KrBLMGAaSlmn2BbEbZSyvpOBIvPknI
 Znba3m5frXE18804MaEIODatnDiSCszlcjW/7W+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599841153;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=XBT+2F8Be9EUhOk79AkAkxBza69lSFrrfNDtXiYkez8=;
 b=oMQKTeF6+6z3A36Btwfbsi84MqnS5NZOZeHD5VCwnPyiQ7OwYCIj83i9goLtsM3e
 mq/qd1+x1drd2gONPdUHynTYuX56XnLoEThhlR6S5h8Uejhrr0wI4XUQkOPI+DFbZgn
 +OWxID+M2CeNpyYB6v+FDNnxTbHPHVE9eOPitFsg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 16:19:13 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
In-Reply-To: <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
 <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
Message-ID: <010101747df6b0d5-df55aa27-7d78-4e70-aa66-b60fea6828fd-000000@us-west-2.amazonses.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 21:33, Robin Murphy wrote:
> On 2020-09-11 15:28, Sai Prakash Ranjan wrote:
>> There are few places in arm-smmu-impl where there are
>> extra blank lines, remove them
> 
> FWIW those were deliberate - sometimes I like a bit of subtle space to
> visually delineate distinct groups of definitions. I suppose it won't
> be to everyone's taste :/
> 

Ah ok, I thought it was not intentional, I can drop it.

>> and while at it fix the
>> checkpatch warning for space required before the open
>> parenthesis.
> 
> That one, however, was not ;)
> 

I'll keep this one.

> BTW am I supposed to have received 3 copies of everything? Because I 
> did...
> 

Ugh no, I just sent it once but something seems to have gone wrong.
Apologies again if you receive this message also multiple times.
I'll check further what's going wrong with my setup.

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
