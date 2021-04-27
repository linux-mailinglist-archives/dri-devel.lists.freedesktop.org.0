Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798FD36C506
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1260F89FA9;
	Tue, 27 Apr 2021 11:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189B89FA9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n99MYH9KB6XVOl2PjPq9XHT/BHcPgJy77LgUdJogers=; b=OuIoYHwKpGvvZNGwZBIBWAae2m
 8arFge8KNdRexJp2XzR426x7RiiJ1uOd6uQJ8ztxIOyYFruPTvAViAwlrp7GZ7U5ykGD5WkAfUwOS
 eYSW7eejXiBUbQiU53bJIDxAZHySc/8FjbD8x9C5g/X3DbYLKZgVW2nzMIPwxgm6CzlNXZ2F8s/S8
 JdbBPgf2TZ4C/6KIUFW1WxR8pMsMQxATZDRmeep7xDmyqU3Yz4y948FoKQzkYfFZErgjA2E7gVR+Y
 bkthcFKZPpTVWnqq9nebukju8Ffh6pRgcp7J5jhXM4K9wOZDiqXDF7EG1x0g175MDhF7gL90En9Px
 VE4GFDpA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=61453)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lbLrL-0005O3-I4; Tue, 27 Apr 2021 13:26:31 +0200
Subject: Re: [PATCH] drm/gud: cleanup coding style a bit
To: Bernard Zhao <bernard@vivo.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210402085523.76928-1-bernard@vivo.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4313dfba-7f3c-169e-5619-ca9c0a0a1f4d@tronnes.org>
Date: Tue, 27 Apr 2021 13:26:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210402085523.76928-1-bernard@vivo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.04.2021 10.55, skrev Bernard Zhao:
> Fix coccicheck warning:
> drivers/gpu/drm/gud/gud_internal.h:89:2-3: Unneeded semicolon
> drivers/gpu/drm/gud/gud_internal.h:107:2-3: Unneeded semicolon
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Applied to drm-misc-next.

Thanks,
Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
