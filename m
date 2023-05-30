Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C596716CF4
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C988C11;
	Tue, 30 May 2023 18:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEB910E1AC;
 Tue, 30 May 2023 18:58:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 200DD60909;
 Tue, 30 May 2023 18:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537C5C433EF;
 Tue, 30 May 2023 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685473104;
 bh=Wcn8rTNMfHUm/2FhfeLj6sJFQcGyH6K3vwEAzxGCG1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GNR0A/teOgfBoL20HGARL8/z8Grux+xbL11AyBOm6Vf8SyUEA4Wv6EeSYiSAECyBE
 M3Kde92E4Qp7raHOXychx2DcIyhPL+g46yHI3ZWVF+UoOo5ygziBPf+/wDvvmkY7Y+
 n1+GUvx4JDRv2NBjZUaXWE+sDVBGk9AkQxf0Zjap+CUoirJAjjbOe9gx1HKBgS3bA7
 OBzrz7kdcz3KJuFl35lsEi4z94SlGiZQmPiJqgNOPKapVAvlm/uwrJdkkIjZVgZaYB
 mIGULaIsmxDg7UYeEQftPmthKGo9erwS10y4KyqI6OWv5ocikVx8qpgwWB0Z+RMyTW
 pnTHpDb0xg97w==
Date: Tue, 30 May 2023 13:58:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v6 6/6] drm/etnaviv: allow usperspace create cached
 coherent bo
Message-ID: <ZHZHTi4AzPLbcU3+@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530160643.2344551-7-suijingfeng@loongson.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/usperspace/userspace/ (in subject)

On Wed, May 31, 2023 at 12:06:43AM +0800, Sui Jingfeng wrote:
> cached system RAM is coherent on loongson CPUs, and the GPU and DC allways
> snoop the CPU's cache. write-combine caching property is not suitiable for
> us.

s/allways/always/
s/suitiable/suitable/
