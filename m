Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0E5E6847
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAD410ECA0;
	Thu, 22 Sep 2022 16:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88FF10EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 16:20:04 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDQmW-1oS5WK1kYw-00ASPa; Thu, 22 Sep 2022 18:19:58 +0200
Message-ID: <9c5f17f7-f400-7806-8499-1f9b77e1f66a@i2se.com>
Date: Thu, 22 Sep 2022 18:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Content-Language: en-US
To: Marc Kleine-Budde <mkl@pengutronix.de>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RrFC1jWMYZL0Pk7BVJu812FFhQFxqDPUm529A7b+avoWLohiEN9
 pH7MOFUPfrgcsXE9gEkSa9wktkCRynH0jUJfkoqnmdpDpcymCMvnIRMopLKyjvsA7q0glki
 ld3TVzNvjJpelKAUzC3Fvlhk6elAnddZN/Ggmj2YmzmA+uNDHqmlaEaFlsW24PBj7TPQfJn
 nK1XJy9uiEkb5xoYSx9/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7q5y2rDcB40=:zAWesKnInlFIK5iZwJnFVT
 hjfgUFwVMzGPCALbwsSN3XHGdIEXhXW9fJKi74OwY5cBoiB9NTcPhGQYs/jgk/2IzxirczvLe
 jyOud7hsAAq/kOegZ381JckGDhXXEvrRh8G+vUY6D4ARjAuqQlM1GOC7IFYFSlzQaNZto3Cyo
 CeA93iB1jOQHDbe72jZ8CnI1KP67dcaR+fCRpZ2ll9NQPPhEdln092CS1eTwMQg6GQrOUbm7r
 XD96jmlJQE1ImUpwQxWBhwi0xYsP+ACjbLECmV/sG+yXFv6MmvTf8BZmhlR5JveVXZJs0e/9H
 svrSZS22PW/W3yV+E+8tB7u/hnBTWOqXsZAXAhOmefOK5xJHBRCF3FzF6ExfIBkVjiz5Ue7hz
 RnriElsI1Ehhjm+B6IUveQmE4aQY+aF6EEFi1fsxBSK03ukJTmkhXzI28vP0I0DVB7hQFQ8fC
 X2NPceBrCifu9++SdfK8IyRHB22eAr3mHLgFNEInlpFvE5ZoC9zq4DsCqGMhQ0M4j85RqXvbk
 ujWMtbvYR/WklW0pSbVGh8KK66mrglMAWOfxHBEuWr4wb/EfPp5rE8D1V4t87EYpa1Xd9it8Q
 2CoV8FPQSRAQMi2L9/E1LcKoSYMPybD9eiI1EWSWuH5q0ZViBr+EiGTzACz281L1NeyBic3Xo
 53QgO2OoNUb/8trIVPJMomyQIKnx2Vl7lM9zFB8SeqltSKzfwQXChR86BzWBLlXNMx1tn0kHL
 s2uvQ/Npyl+My+4OOT7famHG94S5B6bEK2yTDIap17ilpDjcqJd0omdASlPLsZbLkWEsL8GhC
 TAWwUxB
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

Hi Marc,

Am 22.09.22 um 16:54 schrieb Marc Kleine-Budde:
> Hello,
>
> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>
> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> 9-01)
> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>
> As soon a the vc4 module is loaded the following warnings hits 4
> times, then the machine stops.
additionally to Maxime's reply, could you also please provide md5sum and 
filesize of your bcm2837-rpi-3-b-plus.dtb
