Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036747E45F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 15:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0C410E150;
	Thu, 23 Dec 2021 14:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D553610E150
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 14:11:23 +0000 (UTC)
Received: from maud (unknown [IPv6:2601:18d:8700:1ffa:ccf1:c9dd:4b35:443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 41B6C1F45433;
 Thu, 23 Dec 2021 14:11:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640268682;
 bh=fA9ijO6mQLbKFKtRMoV7fmI6cRGJDSW1bwdpMIsmXMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HX82UEIpoZPdeWdcTJi8hBDjEKZ9zTo38Db7yxJC+c1C3Oxef2HfU4tD+YYaL/Kw/
 /NWOU4viCPIX6tBP2yBxREObSowxdjQD4juNokoexYFk3+59TQBcZbCKGyHIlSZZt7
 4mqwilA8P/v58frkRhtzJ7KiSjVGcL9XcXFoVfhfYJmUb1S+j9APCBmbVxIvpqi22w
 8hcpojeV6b1zXn4el7cL+cwLzmxOQa/UCgmFce070sU31OVvh1eBabt8NZKi5qRdPH
 oTcULepm6ZXJC29OxIhbVL2d3dNfnD3UYCfXzvz5VjEI8U2kK0yqP/QjCco3mid5GV
 du9epEdoMpqog==
Date: Thu, 23 Dec 2021 09:11:12 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: asheplyakov@basealt.ru
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
Message-ID: <YcSDgIwrmHZ/BC2n@maud>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223110616.2589851-3-asheplyakov@basealt.ru>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The kernel driver itself can't guess which jobs need a such a strict
> affinity, so setting proper requirements is the responsibility of
> the userspace (Mesa). However the userspace is not smart enough [yet].
> Therefore this patch applies the above affinity rule to all jobs on
> dual core group GPUs.

What does Mesa need to do for this to work "properly"? What are the
limitations of the approach implemented here? If we need to extend it
down the line with a UABI change, what would that look like?

Thanks,

Alyssa
