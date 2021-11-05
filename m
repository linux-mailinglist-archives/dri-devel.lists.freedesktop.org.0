Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B664469A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45AD6EB2D;
	Fri,  5 Nov 2021 20:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2B36EADE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7xL3ULUvDEQY8y11JsWZ8qJvPv11YqU/ku2rqgY1ww=; b=iqUPoKkx2ggx9bqJoDGzYLoSFv
 ZTj25RKGAhdI0A7DLOIF2+4TH8ZVLKHUquDkvkhOx1W3Yg58DkzzhhNLeBFhfh4olfJMcU07scxQ6
 Yn2h7O+JoHEuxj+QUrQHL8mmD0RuqPpwPVfCvBHQ4LuIeqV3qafidcGwiSFUH3gby+FKwZEHvCxAA
 RcrRlxazQfnlaKoT0EULpKhBHlJCmu/MiQ84j0VB0fwk+7mH5kbL30e8B4S4ouDpkn8isCKpCh2WF
 m5lPL0D7s3v7KJtn2XRWABiG6h92aPjFc8Zgm2PM1EuFNBAMXPoYp77quZt3jhJaGupwbz++38H5c
 YUTNZofA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51024
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mj5ne-0006rL-Lg; Fri, 05 Nov 2021 21:26:58 +0100
Subject: Re: [PATCH] staging/fbtft: Fix backlight
To: gregkh@linuxfoundation.org
References: <20211030162901.17918-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9915936e-8a02-2e7a-5c47-f048c1f0319b@tronnes.org>
Date: Fri, 5 Nov 2021 21:26:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211030162901.17918-1-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 30.10.2021 18.29, skrev Noralf Trønnes:
> Commit b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate") forgot to
> update fbtft breaking its backlight support when FB_BACKLIGHT is a module.
> 
> Fix this by using IS_ENABLED().
> 
> Fixes: b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

I discovered that fb_ssd1351 also has this #ifdef, so need to fix that
as well. Will send a new version.

Noralf.
