Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8822B082D8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 04:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D387110E2EE;
	Thu, 17 Jul 2025 02:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="SsnFMdME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14510E272;
 Thu, 17 Jul 2025 02:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=/F2PgCQKoPD0rq8kezRiNiQEZa/h4WP2ifWG1ROpCTA=; b=SsnFMdMEssCNfHvxp7PJ+56Up4
 ACIXXOxEiZwKWIib5PlP+6vWLMJpJl1nyxAgZW0qjLMletRTLCivAHSkYCp/oB85fXzANNOunKaSw
 QtHdehZwsp1FZgBUmmhW9aThyi5XYCisttQcpRXlNdwpC/p8x7LAOxcl3Z58mpw4XXAd2LsfGMpla
 uBf2YiNnAoqJsJ7Gh/OXypRBPPxgDv59iSjGv1R8yWATHvIpZRa10y6EP9nxE7HSd+viAOkL2lPka
 VNGBHTp2pXO5hjQzGoPeOSssDrDy+jJhtbddeff6TUJGp0Sg1SwY7E03WOL1gFfO64GT8QzRdoz0q
 KPSPRD1Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1ucEFb-000000093Na-09NI; Thu, 17 Jul 2025 02:21:35 +0000
Message-ID: <d9d1ece9-8567-4b8b-b47c-140cf6bedcc9@infradead.org>
Date: Wed, 16 Jul 2025 19:21:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Andy Yan <andyshrk@163.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/16/25 6:00 AM, Andy Yan wrote:
> 
> 
> Hi all,
> 
> At 2025-07-16 18:31:15, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct member 'connector' not described in 'drm_bridge_detect'
>>
>> Introduced by commit
>>
>>  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> 
> Once again, I apologize. I have sent a patch[0]  which I hope will fix this issue.
> When I ran "make htmldocs" locally, I didn't see this warning. I'm not sure if it's because my method was incorrect.
> 
> 
> [0]https://lore.kernel.org/dri-devel/20250716125602.3166573-1-andyshrk@163.com/T/#u

That patch [0] LGTM.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
