Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED784A5E23
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB5410E65D;
	Tue,  1 Feb 2022 14:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF75F10E65D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vv+M0c9/+vvHAR+4n1g8BIf5PSlzor1xcAvAWfIItfU=; b=SIxfSMxadV7NfMVsEZAOlZ7bqW
 8fFHaUAUne5GMPC6IEFf0JbJR69XkvYTs1lL5EzV3yCFQrtw0lj4Vzvl/Oblw0tm0In6LehDamWKg
 s7rRXO8qZAT0pTx8zO8AZ+1PHCkn3b0Q8/UA9iRPkzqvDqjVxBKzHj/1B98iiaAhOWW6VQC39cRYl
 2Bo8RqqQJvdXqY25oZWfA598J5HIJ+YLo37iUHyuvr+n0nVJuIc/e6Nwv9N5SYIFv6VV0k0B5Qa/r
 ZSZxLINoAjamzhzq6vJJkfFxUU+C/qxQeYGnM1rGo68tXb2Dwhld3ctf8ss8Sx/WntMYIG/BbVIC1
 QJ8zLzWw==;
Received: from [2a01:799:95e:a400:5d05:6ef3:cded:ad3] (port=55645)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nEu14-00029Z-BL; Tue, 01 Feb 2022 15:20:18 +0100
Message-ID: <fb821f7c-ef35-5351-ebab-2801cd9bba2e@tronnes.org>
Date: Tue, 1 Feb 2022 15:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: Simon Ser <contact@emersion.fr>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <vbOCbsYZGDCHDj8wKOHAZ1u2HMTc_UKM5umAyMug7KZn5ABy4sDMMdNOtwLI5kH_ifctnfmzQejqC_HP1vhXNt6k7vEU0WqFVNUwKnibIn4=@emersion.fr>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <vbOCbsYZGDCHDj8wKOHAZ1u2HMTc_UKM5umAyMug7KZn5ABy4sDMMdNOtwLI5kH_ifctnfmzQejqC_HP1vhXNt6k7vEU0WqFVNUwKnibIn4=@emersion.fr>
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
 Emil Velikov <emil.l.velikov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.02.2022 14.38, skrev Simon Ser:
> 
> On Tuesday, February 1st, 2022 at 13:58, Noralf Trønnes <noralf@tronnes.org> wrote:
> 
>> It turned out that I wasn't entirely correct here, mpv didn't cope with
>> unknown types. In the PR to add support Emil Velikov wondered if libdrm
>> should handle these connector names:
> 
> Opened this MR to try to make things easier for user-space:
> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/222

Thanks Simon!
