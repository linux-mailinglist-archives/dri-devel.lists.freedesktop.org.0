Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025D76972A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AC010E2A2;
	Mon, 31 Jul 2023 13:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425D10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690808836; x=1691413636; i=deller@gmx.de;
 bh=I5E7In3qLeawhm32r5BW4CB4+4g3GLRaXOk7wIj51uQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jy4RS8jDrPWTY6SPcrgNBJ1FF1cWboSWULhoDUdhJmNGCdgEyaKuo0336hWU3juf3tLZ3vJ
 dzDKhqe6J8yuaOhl5K5WiapKQZCE9sukFIqeizRf+mScsK/loIAcHnYzApgG5puLbS96ynImV
 9C8o+VgFoDF/0G54ZDu27FXqDdwfWHPe3yX2tJ+vrRHBol0cwG/VwRFUZe5Masxe0xpweZkXB
 oQzG05NQS5T6sx8OY62CkxgPaF5OQ6AmoBgiSaTRJlGxg4VEzb25L3a6yorOjqEajLkf/QvOx
 C9j+101Nsad20clG95wdIH2KluYlnBYQwUHguXtTobC2NgvF4Wrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1pwtId2EpP-00gnhA; Mon, 31
 Jul 2023 15:07:16 +0200
Message-ID: <0cb2ab66-ca30-b2ab-47f7-04208b2400cd@gmx.de>
Date: Mon, 31 Jul 2023 15:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev: fbmem: mark registered_fb static
Content-Language: en-US
To: Min-Hua Chen <minhuadotchen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230714003748.91129-1-minhuadotchen@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230714003748.91129-1-minhuadotchen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yveMOZcZH+xrsKsZ6Pi0xpCrONbM7Mh2l8rwBB+bHzDNdZPfLPO
 KeuC8wh1lMClf4wil/HxE7bv8ROOsclvZSc7SbCBxYkCFjLF/FqKAimjnT/+t7pplEMtpr1
 O9abhaQGAaB/xjU8ymui+4ozryAHXFx4nW2pHsriT6bqdsojdrVzbzS9hIkA0BeXxPEePix
 ILKK7B5K/u7hhFTusq9Pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8SGNccr63Dg=;iqSetT1mEEkMwDOYOlNV+x50HA5
 94myZ1MfqzceDvtuJCPoAV7EbJquvxs8TIZOOUO9YAwqNFYqSUta47+S+0+MsfVqGGXpH2h84
 xKNjlEaUM1uohHMC1eOzameC0i1XfyjFFhzhygyjsaYjNlBFPvr19t/spzsp5fFbV3HbIyL7K
 7JN+mOujNxIflMn4F25/TBRL6AO/BuMqPZRBL8/Dt08DjKqkVZbw/JqXG50kqjNWNfV3zj5vI
 yoFGJ7IwJw/kFHeRO0qZsWiGgipDGU7xebMme6buuSjKISoqA3AsjcXpblXYGKgsGWAwjP8PE
 Th4bGivCUcjGz1TfSst70Z8FnFrCA7/aXCWm0C49AlFJf+482x7MK5usdZuGZnHaJQTaaGMux
 uIs3U8Jg4V2XGH94KLgckEKsMTLyqw6HteHJ9YAFrBeXKRc6Vf8jA86z3o79c3Kgkmwq7tTXT
 gEHjYaIgO7cYC7wr7PuyG0rl8fA5Vxv7Z7h7y4gup0rqJNtwjJf+CcPN+EaggfN3uoVXcGH0n
 xcxUVyClKD0eDeVvp4+i+NysAxTqYK5JkWY2Fxekbrj/WJmdQfpf+QS4aBIHGykpcARWxt1ac
 wbilIg1xfU9ZCwuc1Of99q+DMjHDM5zWB4TwQl0mW7x9JUARYLnQfbQNo9RMwWRzwYCFiesVQ
 J0FN9Z4Ema+nOAelOVjJKMT/tD90bmqKkjVgceOL4P7pkqGuvK3qYYuHS2BL66gcBIyQh+Xjx
 GNXp5PJRJt/dPJNONThyKMvJBbZWE5EFYKi2q3bT/8kf87zo1rzCfiyaE8wnqdn5ulT12Q1+G
 ooqmWcx4bYiP83HqtMIEV4UuWy1YnxAp5S1XLfHOTS1bFenHUgn5+Utpl4crTKkA+km8Z6/nw
 CSJvcGrZ90mnDICj6QSKVfH4zuleJ3jvFSy2Qc0X4ZAs/ubkmWUAv7THHkIOMNw6vGkLIDUDV
 fWgheuawauKKUgBy8Si/qpr+Ez0=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/23 02:37, Min-Hua Chen wrote:
> Mark registered_fb, num_registered_fb, fbcon_registered_fb, and
> fbcon_num_registered_fb static to fix the following sparse
> warnings:
>
> drivers/video/fbdev/core/fbmem.c:51:16: sparse: warning: symbol 'registe=
red_fb' was not declared. Should it be static?
> drivers/video/fbdev/core/fbmem.c:52:5: sparse: warning: symbol 'num_regi=
stered_fb' was not declared. Should it be static?
> drivers/video/fbdev/core/fbcon.c:105:16: sparse: warning: symbol 'fbcon_=
registered_fb' was not declared. Should it be static?
> drivers/video/fbdev/core/fbcon.c:106:5: sparse: warning: symbol 'fbcon_n=
um_registered_fb' was not declared. Should it be static?
>
> No functional change intended.

num_registered_fb is still used in:
drivers/staging/olpc_dcon/olpc_dcon.c:  if (num_registered_fb < 1) {

Helge
