Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1034D2AE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 16:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFE06E0D6;
	Mon, 29 Mar 2021 14:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1793E6E056;
 Mon, 29 Mar 2021 14:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B735660295;
 Mon, 29 Mar 2021 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617029254;
 bh=QmIftYcSBB5/j37ikRpbaopMaPJQYPRqWGVN0N5sWFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFhNX5fo7AsHwvq51sdRIDHwQybyYINTNq3/3EiYjmzRfe8orwPSfNlSIeyIBBtpx
 8R7GSjvjU7teEUghRvUzonKqpXFS0aSTUxMefyqv2iZCJ4PBCG7fkFWudLQGv5ZHBj
 S+HOPJ9kNO2wOfx+jjhEIsQPDM01f811bsOJBbNcrtv1394E07pFR7j3czTu1TBEju
 B+k25ajEQk5NDWmDLKo3PuGCEhUNT4iJ12TPzCFmlUW3yDjjDzhLrpxAaGnoStFYNW
 jn7MvkFREy7cxAHBBpKvspSP3heLGB3YM89OMZhggpSR9T3Pi5lTPe091nYsHseM/7
 4cJHGpsFuRPIQ==
Date: Mon, 29 Mar 2021 15:47:29 +0100
From: Will Deacon <will@kernel.org>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
Message-ID: <20210329144729.GB4203@willie-the-truck>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.

What do you mean by "doesn't have separate pagetables support yet"? The
compatible string doesn't feel like the right way to determine this.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
