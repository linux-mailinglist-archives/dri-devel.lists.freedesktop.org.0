Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBA59C06C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9458BA26;
	Mon, 22 Aug 2022 13:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12F8B981
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:23:57 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5AC056600015;
 Mon, 22 Aug 2022 14:23:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661174635;
 bh=UWbfv/xp8Lk8ZUHhil0GHBm6jDjKPoDOB/7CHnZRRRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sq83uFV+QSihfQTDt7FEavpyBX/VxM6/UOHzdLT8d6pkw7k5Y2lHtZJmun5vXOwls
 L3LRRTqee/6f1tWjvVI7UUSu1splKLhhoejOsFAvIndDyZ1WrYubEbP7Hpmx2xrINd
 nqocg17Nrpzgrg/ZoDiyNX16AbWNikAqsOXyV7ckD9b+8oj0r+51yqH5mUieAiPJH0
 P3RPQ2PHGtGMdEu+q1AGGzCQ2gdgsGKiPJr+m8QHCyeOO5CJsNyr9b81gv45N35w1H
 TnNiHYinvQypJjoUoEEz4MjVX8ZF1Hhfle14tDNi8QhWIYUxgFlnvgDa4fuPiltG1m
 56oOwr547m/rg==
Date: Mon, 22 Aug 2022 09:23:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220822132350.tw73ph6nnvti6h5i@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
 <20220819185400.aokd53xln6rmc3xk@notapiano>
 <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 22, 2022 at 08:50:45PM +0800, xinlei.lee wrote:
[..]
> Hi Nícolas:
> 
> Thanks for your careful review.
> I will correct it in the next version:
> 1. Modify key nouns in the description;
> 2. Modify the label of jitao to Co-developed-by;

To be clear, you shouldn't change jitao's signed-off-by to a co-developed-by,
but add a co-developed-by. If you check the link I sent earlier [1], it should
be clear that you should have something like

Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Thanks,
Nícolas

> 3. Macro definition address lowercase problem and function naming.
> 
> If there are no other questions, I will send out the second edition in
> the near future.
> 
> Best Regards!
> xinlei
> 
