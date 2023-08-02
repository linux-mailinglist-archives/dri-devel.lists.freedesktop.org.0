Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8F76D066
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1510E1F6;
	Wed,  2 Aug 2023 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8630B10E160
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:45:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id CA048380;
 Wed,  2 Aug 2023 14:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA048380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1690987516; bh=gjlHNSiPJH2mSvqtWTZhAzkJgjQu1TEBb+RZEZs8VC8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GDXKA1gx0lsSxBw05FF03T0dOuntbILT+c/h97Tdew0kSKeYeJ+2vN82Py2YHx5P7
 klcB4yyhpsD7KElDrdxfPIlFCuEV0+NEaYoCAGsmYmsGJy3C3JHz/MIxzlm06h3vJB
 8rqbFBcz2oW0ewXlDV49rg3nGFnfBw8qAngycoLwh/upSTevQv4p6G+y4gyChHelwi
 CQ0+RtM5LH8GXxMbHRpj+VPCTUikdeRsFVdKejKHs8NsfJT39RdddBbmDAnUX6CzVT
 o/NAOlbgSZbUVCMyIEzVT7CjijP6+sNyTeKjo/AWIK3vKVWWBIdv7hkRoSL1b5IOio
 wi8N/osGJSSjg==
From: Jonathan Corbet <corbet@lwn.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Lee Jones
 <lee@kernel.org>
Subject: Re: [PATCH 02/37] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
In-Reply-To: <20230320231551.GQ20234@pendragon.ideasonboard.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-3-lee@kernel.org>
 <20230319142432.GM10144@pendragon.ideasonboard.com>
 <20230320081700.GH9667@google.com>
 <20230320231551.GQ20234@pendragon.ideasonboard.com>
Date: Wed, 02 Aug 2023 08:45:15 -0600
Message-ID: <87o7jpa4g4.fsf@meer.lwn.net>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> I haven't seen anything either. I tried moving the documentation inline,
> and the scripts/kernel-doc script ignores the comment blocks for the
> inner fields.
>
> Mauro, Jon, is this a known issue ? If so, are there plans to fix it ?
> What's the recommended way to proceed here ?

As far as I can recall, nobody has ever complained about problems with
nested structure definitions like that; kernel-doc certainly isn't set
up to handle such a thing.  It could certainly be added, but it would
require somebody diving into that delightful code to do that work.  I
can't promise to be able to do that in the near future.

Sorry,

jon
