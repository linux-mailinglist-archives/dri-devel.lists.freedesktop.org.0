Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD595B046E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4A388FBD;
	Wed,  7 Sep 2022 12:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Wed, 07 Sep 2022 12:55:47 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38C7789091
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:55:47 +0000 (UTC)
Received: from 8bytes.org (p4ff2bb62.dip0.t-ipconnect.de [79.242.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id E4F5524000A;
 Wed,  7 Sep 2022 14:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1662554947;
 bh=yGOX5Lwpalcu82yNs8ayh8dOtcer41jlk77UdSRJHzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uE78GVEgI4yTOR9KWvlR6IpZa67YTCKueETuj+yYYkM1pR/p3SMYfJwUC1JIQlv2e
 2ntTjhAKoTFc7sIl+Vu7+2KELvGsyWVaHSJ3AqSumJvsfUrT3HcwqC38Dl7VcnwroB
 8BFi6rWMsQWaBAZ6yGKr4LVWwTh2MQqqZIfvRsznMzAr1tqMQ4wbun1jLc6Q3oK5qR
 4cEjQ7+thJq/JFFPPZao/wMUvReiwhSBhAhxKOJVjYvypVQZSPwSzv7INhTevRqlKz
 tyLofbz/SQzQ1doEpWKl93VLrcpVkkQeTqcmZ4zf7b9+DgCzs3P+Ahm8FeqJQInzIE
 YZOdibS6/esUA==
Date: Wed, 7 Sep 2022 14:49:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/3] iommu/dma: Some housekeeping
Message-ID: <YxiTQRbsoJDG2QZJ@8bytes.org>
References: <cover.1660668998.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1660668998.git.robin.murphy@arm.com>
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, cohuck@redhat.com, sw0312.kim@samsung.com,
 alex.williamson@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 kyungmin.park@samsung.com, maz@kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 06:28:02PM +0100, Robin Murphy wrote:
> Robin Murphy (3):
>   iommu/dma: Clean up Kconfig
>   iommu/dma: Move public interfaces to linux/iommu.h
>   iommu/dma: Make header private

Applied, thanks.

>  include/linux/dma-iommu.h                   | 93 ---------------------

Squashed the updated file path in MAINTAINERS into the last patch.
