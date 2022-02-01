Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9A4A5D57
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4B610E22A;
	Tue,  1 Feb 2022 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718310E22A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HSc0TyLrN1Wvj1rxHVmacBdO1opBBuzEEVi910cNl0c=; b=Qdi0QzQywpTYVIggQulpTS3p7v
 GXlQs1bB+hZmyCaVmSsqKP7jxjh1Qv6P0KOyM/TWZ3Z6QtIonylvPmQam4E5G68UjawvjIn3UTYjk
 1ZbeH2Fe3vrIHKtKOlAf5WdebFVYuNqO54OBq7h7GAYibWUBXV/XLERqPOytKRl29N8T/7oCewIwI
 YaWfWfXF1cI34QIWRjw9gfDnUU08q/rR+G/zz2MnKO6sS2vcBZ8qohfnlgqylGghHg945NW7OQ57W
 G1fuYZmBG6x3waAACYq+HFp2xhsQkW7sU4k2CrLbCt4Om4es9oAAw7Nwb8z/raCyWOeMFtdoqLRxq
 2ls/xu8Q==;
Received: from [2a01:799:95e:a400:5d05:6ef3:cded:ad3] (port=54256)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nEt4v-0005ID-2B; Tue, 01 Feb 2022 14:20:13 +0100
Message-ID: <a6f267ea-7617-7d0e-06cd-7ec9c88576c3@tronnes.org>
Date: Tue, 1 Feb 2022 14:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <4322f58b-dbeb-b90f-2770-d6881f8005b4@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <4322f58b-dbeb-b90f-2770-d6881f8005b4@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.02.2022 14.06, skrev Javier Martinez Canillas:
> Hello Noralf,
> 
> On 2/1/22 13:58, Noralf Trønnes wrote:
>>
>>
>> Den 31.01.2022 21.52, skrev Sam Ravnborg:
>>> On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
>>>> There isn't a connector type for display controllers accesed through I2C,
>>>> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
>>>>
>>>> Add an I2C connector type to match the actual connector.
>>>>
>>>> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
>>>> type"), user-space should be able to cope with a connector type that does
>>>> not yet understand.
>>>>
>>
>> It turned out that I wasn't entirely correct here, mpv didn't cope with
>> unknown types. In the PR to add support Emil Velikov wondered if libdrm
>> should handle these connector names:
>> https://github.com/mpv-player/mpv/pull/8989#issuecomment-879187711
>>
> 
> I see, thanks for the information. What should we do then, just use the type
> DRM_MODE_CONNECTOR_Unknown then ?
> 

Not really, I just wanted to point out that it could be that not all
userspace will handle an unknown connector type (I just checked the DE's
at the time). I haven't seen any issues after adding the SPI type so it
can't be that many apps that has problems. Adding to that a tiny
monochrome display is limited in which applications it will encounter I
guess :) It was after adding the USB type that I discovered that mpv
didn't work.

Noralf.
