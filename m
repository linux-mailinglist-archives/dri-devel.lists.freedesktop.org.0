Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE0632A0C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 17:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104C10E195;
	Mon, 21 Nov 2022 16:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4723110E195
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SG3IFde9v1FXNN+qmS3U7oUZxUIMsSHLQSifYyRuHrQ=; b=mN9orELHv4UA+leiwa61sWFj0+
 Gn03eFMm5CVLyKXDD2Vw0bYFQ13/oZlW71pSVGkGSX50AiFwXn1luRlZJdgPZsXg9AiKojOitqY3c
 A4yKoOKrrYVnRWcVmtztDxnJScsxjp6fZ57l7yuabYSOLpR/heCBzdOnQ18wcDGxvVcUuU9ed7d6G
 BTRk5heye/2ZZGp4eWdMdmF1AxowbezirKPGDmvrL8dKblpQtbTsLsCrGkcoLRI+8+Z5QNPMjTB0U
 kdZZOmaJ5WHBLnZ9/4ArQ327XZbHymNyXJzFCITkiZ5upXXKw5iy9d02WfxBVJgtnoJwkW4cWlv1y
 wHIbVdfw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=64270)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oxA2N-00079a-6C; Mon, 21 Nov 2022 17:52:51 +0100
Message-ID: <72e873e9-d4df-895b-2531-30168b8a4d64@tronnes.org>
Date: Mon, 21 Nov 2022 17:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: git send-email friendly smtp provider anyone?
To: Simon Ser <contact@emersion.fr>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <9-qCHLoI7vMtVX2UmZbrcDSyMIJRqoWx6G2sZEn08RP15vYjPwng_fInDkKYPvllUddwXshfYs_fIpPH3_TeFLat2MQx_LT5Hfb0dxb1vGA=@emersion.fr>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <9-qCHLoI7vMtVX2UmZbrcDSyMIJRqoWx6G2sZEn08RP15vYjPwng_fInDkKYPvllUddwXshfYs_fIpPH3_TeFLat2MQx_LT5Hfb0dxb1vGA=@emersion.fr>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 14.33, skrev Simon Ser:
> I think you can apply for a linux.dev mailbox [1].
> 

Yeah you're right, I didn't know about that possibility.
But it depends on whether or not I can just use their smtp server and
keep my current email address. This looks like what's the problem with
my current ISP, I need to use the email account I have in their email
service (that I've never used) for sending through their smtp server,
but I want to send From: another email address.

Noralf.

> [1]: https://korg.docs.kernel.org/linuxdev.html
