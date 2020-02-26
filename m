Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21331701EF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718E76E362;
	Wed, 26 Feb 2020 15:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6C06E362
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 20AB83F8E4;
 Wed, 26 Feb 2020 16:07:48 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lVdLTcL1; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXF4yDzgdqdu; Wed, 26 Feb 2020 16:07:47 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A03BC3F57C;
 Wed, 26 Feb 2020 16:07:39 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 88C6D360093;
 Wed, 26 Feb 2020 16:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582729659; bh=lPS3867HzqYzHXHV6VBd4NXViR4RnWnrBwSw+bRBFfc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=lVdLTcL1esbpBW5Vw1Jh3MOfQ8q6aJdWqPtO/XaNLqWAkbqkp7mSQI/nCy68cA68Y
 W+J1iSvysnNzS3sBYoLdHL8iktpi+p7uW4Dh6TxbOz0/pCHRWWGhdtfhN7IIFb43nq
 WTinluohrg5jShTr0Z3/odiRWZkoUXkaVj9FJxgo=
Subject: Re: [PATCH 3/3] drm/vmwgfx: Correct typo in comment
To: Maya Rashish <coypu@sdf.org>, dri-devel@lists.freedesktop.org
References: <20200223204041.GA27186@homeworld.netbsd.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <3c5e7beb-a3e0-ed01-550f-2ce90faf628a@shipmail.org>
Date: Wed, 26 Feb 2020 16:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200223204041.GA27186@homeworld.netbsd.org>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/20 9:40 PM, Maya Rashish wrote:
> Signed-off-by: Maya Rashish <coypu@sdf.org>
> Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
> Co-authored-by: Thomas Klausner <wiz@NetBSD.org>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index f47d5710cc95..5195c19d25a4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2016,7 +2016,7 @@ void vmw_disable_vblank(struct drm_device *dev, unsigned int pipe)
>    * plugin and generate DRM uevent
>    * @dev_priv: device private
>    * @num_rects: number of drm_rect in rects
> - * @rects: toplogy to update
> + * @rects: topology to update
>    */
>   static int vmw_du_update_layout(struct vmw_private *dev_priv,
>   				unsigned int num_rects, struct drm_rect *rects)

Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

I'll include in the next vmwgfx-next pull request.

Out of curiosity, how was this patch co-authored :-) ?

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
