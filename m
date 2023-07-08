Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138874BD6E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 14:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCDB10E027;
	Sat,  8 Jul 2023 12:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B018A10E027
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688819300; x=1689424100; i=markus.elfring@web.de;
 bh=VOWd3ofaOz8qqB6uuUxBjPzEMmh7MMv690c0VSPed/E=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=dAtPWg2zkiCCy43fN37VCT30BwDltDSvfzSqd+KR+Tj4on7XZj+TMvykMd/YVkv2kGXUnno
 Eq296gFmfKUgAVhGQU/LucAmzwleS6+2cwutbwhC3VD13FK8e2bIQrhQGFlH03/PWjkMAHxzA
 Z+JnYzReAOJ6knAHnxW/lDX8ThlcBlMaR6wrE7Ho5JruZELGNYJ+eWvR86O+BSCYbarQ16YvJ
 iVTSB9ec6LSfIEK43bGwRV8/WEzJduyM7kict8ZbKjQKyFG8c5fASaInq4PTJ2OfMQKzBJ9hX
 7PWsFSXTeno8Jgoia6+hITdkCVUEMhJJdnrUrJEbqely3XLESlMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrg7-1qRhP43GLd-00RgA8; Sat, 08
 Jul 2023 14:28:19 +0200
Message-ID: <11855f14-bc3e-c947-c790-47d043ac920e@web.de>
Date: Sat, 8 Jul 2023 14:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20230630160645.3984596-1-kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp/g94: enable HDMI
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230630160645.3984596-1-kherbst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:34UcEa2++m5vsfYir2cGI1kLfUG2JHF6JCNLaW2Ky2lKO2eKwN3
 kVME6xU8TxoCiMIkZ4KQ9u8Yn/kfbNJ9waJibf/+woDtPZNvNizS3GRuEg6hhd9fLVPvzaW
 +huMqwqibbrddyCj5YgVYRzc3XVljUzu5YJ2EQJSCU4N1vKBVd8LyMUCLv1g2KmFSeRxb+O
 GbU1HR8BaqedGJfdxTXNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xWKSVvZ8btc=;J2MbatJPoq69nuNFfHHUpRJ1IXp
 Ewzodth2GQAaEXy99eqyEyNtVPh/ltY+C0uXLragiKyHdw4Jz0VT8HyibD6lXDZZN/GoCyXqp
 vQtf4pa3POzqI/os50+mMnUQ4+UUsBHrrurOl6Ma/Hk6+7BThWt8Y+EDJDR1wTOmuZsgjPi/+
 GAGaFkfvQ78PVb66uenBgDHEy7oCume1UCpN0CR69UxseXMX9SmCvJL8N/JVF9/9jFwM5yHSl
 6xad0bdBdH/PX/7wSjzJ5+d+grTwttbcLZFN6oiaF4PfgrLOnNmXItz+UVCwXipuGe6k2p0N6
 4a5vXeZ1FQ42RMQMx+VLTw00UWT3jpHcD56ZQ5U2btijPER1eSUr2mM1bMZMvKByOnm3BEA8a
 gmE2K57YNTHkAaHNVO8fyHjwKMfDNF7atzzQllPv2Y4cV7FRZqSEhWKRDvXnH4JDTFumhePA3
 lKDMGcTeW5FiBmbDWBZ6Hb3I+t5+mGLt/Uvx4/ryW60JHCEka94mB5e8PigdKeAIAZd1RGGZ3
 cye4FutrzMX3yf+Hc30LljLvyJsZbzLyHk1gyr7lVbmiRDmRSS3Iqm/wWq+fm2w2n3u0sPny5
 s6Hk+OeN5GL0KGvWuDj+zmbF6ParIlPHD9KDdjHwwVs70EPmRmAfqvHec3qSUVd4NJ4rlbqAn
 he0TsMzISTkFz/VHDkY4md51VAtg4PpiwNG3Z4e+6bx1M1v/6aXt+mYopOLIHZO/RfvJhgUKw
 eJvC2Q353BUIELusgg5oauSIQUqL/OdlYnX8mrH6qBHWW+eH6arRL906w1HhuqbZO2/fgaJUD
 NL9E3TUMD+AqcqWwCx/fCyKoeKvPJ4bh450jKE14PCoRlc96yaVnmMm4X6EDTk7y1KJ9BvnVS
 9HfSGIGmZuK2hxwestuAz/V5cMXC7gUpCBd4ELVMXPlb38fQfa8b3RJjQ7w/zp7ClOQHcFQZC
 HlFQfw==
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
Cc: LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Would a corresponding imperative description be helpful also for such a small change?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n94

Regards,
Markus
