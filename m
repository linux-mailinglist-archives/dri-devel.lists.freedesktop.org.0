Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA972B77E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195236E439;
	Wed, 18 Nov 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs49.siol.net [185.57.226.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBF489F89
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 4709252209F;
 Tue, 17 Nov 2020 18:41:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ey-XaGR21hHq; Tue, 17 Nov 2020 18:41:12 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id ED433522170;
 Tue, 17 Nov 2020 18:41:11 +0100 (CET)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id E534F52209F;
 Tue, 17 Nov 2020 18:41:08 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: airlied@linux.ie, daniel@ffwll.ch,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: fix error return code in
 sun8i_dw_hdmi_bind()
Date: Tue, 17 Nov 2020 18:47:05 +0100
Message-ID: <2294800.5ACB0rnJnf@kista>
In-Reply-To: <1605488969-5211-1-git-send-email-wangxiongfeng2@huawei.com>
References: <1605488969-5211-1-git-send-email-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, chenzhou10@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wangxiongfeng2@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 16. november 2020 ob 02:09:29 CET je Xiongfeng Wang 
napisal(a):
> Fix to return a negative error code from the error handling case instead
> of 0 in function sun8i_dw_hdmi_bind().
> 
> Fixes: b7c7436a5ff0 ("drm/sun4i: Implement A83T HDMI driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied to drm-misc-fixes, thanks!

In future, please CC all people given by get_maintainer.pl script. In this 
case you missed Maxime Ripard and Chen-Yu Tsai.

Best regards,
Jernej


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
