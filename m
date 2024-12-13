Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76869F09DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F110EFB5;
	Fri, 13 Dec 2024 10:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XIpPOtYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895E10EFB5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7445A42AD0;
 Fri, 13 Dec 2024 10:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114EEC4CED0;
 Fri, 13 Dec 2024 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734086537;
 bh=YCRSfsCR0H7j5DT02vvh1WjN/AA7pKlT4vzd9klUb9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XIpPOtYl+1Ss8ywsdiPsmsy9xA4GgA4kMKsRS9gp3SYldVavtdGgsKqf4EdP+5L/g
 56VMcEbMgL1Xr2mi5EZG5aThoMb3tdcEurNcY/HbNOFo4kwoBGwCn5mp5zkmU9299u
 3YdIMZ4CAEY1GBxn79TMcb7xIeuWBbHTx1nX2dafz0jmUt4g8kTuuzPS0NWcZ/cQrD
 /EJIJnyuSzQVH/Jej3EiqBejmnBSuO5Y+vMb2kgEXfvbqptJnf2Kvhg2zXQ/Ht5Tq5
 jwGJG3VgtNp6l4bSCBvvhtZFwJtnTo9yLhXeMxrDqp3Ia9gRRz9nme3zjzu9jQ5W0P
 qYp8yeERHNPtg==
Date: Fri, 13 Dec 2024 11:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
 luca.ceresoli@bootlin.com, mperttunen@nvidia.com,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Support host1x actmon
Message-ID: <jgqdgq6mifzex3tonl4sxbehwmcjo4jksfqmh7l4z5e2v4dqsj@uouomf3gyj7v>
References: <20241210174554.18869-1-johnliu@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210174554.18869-1-johnliu@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2024 at 09:45:49AM -0800, Johnny Liu wrote:
> Activity monitoring (actmon for short) is a means to dynamically
> measure the utilization of units in the system to help drive software
> power management policies.
> 

Is this a resend or v2? Please always mark your patches appropriately -
see submitting patches document.

b4 diff '20241210174554.18869-1-johnliu@nvidia.com'
Grabbing thread from lore.kernel.org/all/20241210174554.18869-1-johnliu@nvidia.com/t.mbox.gz
---
Analyzing 6 messages in the thread
Could not find lower series to compare against.

But I am sure I saw it somewhere...

Or just use b4, so all this problems disappear.

Best regards,
Krzysztof

