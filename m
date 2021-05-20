Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AA38B7F9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 22:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C36E436;
	Thu, 20 May 2021 20:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4D06E436
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 20:00:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D3783301;
 Thu, 20 May 2021 20:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3783301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1621540808; bh=2WNLJX/xlZc5xTtT/m0BAIjR0dGVeWDMrn8wfYaNCUM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JWiESVFNzhYgP3LIrHH+2tY7pTjoh+gKnctlpgARBvgwBWg4BACU+o/zkUA8eRdPF
 jS85XmMhRO5jK77x2BlQkPxDSbCrzhxlhaMXvDctoM1+BMQOa0yL/SZHdunNPbhAgt
 4USigcfd0H+vMC4CmQMvwXkhr8hvfRf3UC0K6z2vi4HY7A5m+ShwS2LJ/UDdBlnsDP
 SPBGKoeOrTvsAjV7A36ox1hL3nOjKNp5cU8ATBlHyBRqSKzr5ElccrOeoSfEDcgg8h
 LH4udeqBoy+VzdXLKBnnbzSb6qpvpqwupJQPHnbWB4IHmqCdgQ0/NFGZsiTs5E64Wr
 JxMzmR3UeuhAA==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 00/10] Documentation build warning fixes
In-Reply-To: <cover.1621413933.git.mchehab+huawei@kernel.org>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
Date: Thu, 20 May 2021 14:00:07 -0600
Message-ID: <87wnrtnpko.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-iio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 kvm@vger.kernel.org, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small series contain a series of fixes for the documentation. it is
> against your docs-next branch.
>
> Three of the patches fix duplicated symbols at the ABI documents.
> There are still some ABI warnings from IIO, but all but one were
> already fixed at linux-next. So, hopefully, after having everything
> merged, the ABI warnings will be solved.
>
> Mauro Carvalho Chehab (10):
>   docs: update sysfs-platform_profile.rst reference
>   docs: vcpu-requests.rst: fix reference for atomic ops
>   docs: translations/zh_CN: fix a typo at 8.Conclusion.rst
>   docs: sched-bwc.rst: fix a typo on a doc name
>   docs: update pin-control.rst references
>   docs: virt: api.rst: fix a pointer to SGX documentation
>   docs: ABI: iommu: remove duplicated definition for
>     sysfs-kernel-iommu_groups
>   docs: ABI: sysfs-class-backlight: unify ambient light zone nodes
>   docs: ABI: sysfs-class-led-trigger-pattern: remove repeat duplication
>   iio: documentation: fix a typo

Seems like good stuff.  The last patch in the series, though, adds a
warning:

  Documentation/ABI/testing/sysfs-bus-iio:799: WARNING: Inline emphasis start-string without end-string.

So I left that one out and applied the rest.

Thanks,

jon
