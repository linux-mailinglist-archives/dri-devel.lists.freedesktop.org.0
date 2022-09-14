Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEC5B8E97
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212B10E9B1;
	Wed, 14 Sep 2022 18:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1059 seconds by postgrey-1.36 at gabe;
 Wed, 14 Sep 2022 18:09:15 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF48010E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:09:15 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.23]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MuUSa-1pOyz02OMU-00rbw0; Wed, 14 Sep 2022 20:09:08 +0200
Message-ID: <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
Date: Wed, 14 Sep 2022 20:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
 <20220914180508.0EDD9C433D6@smtp.kernel.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220914180508.0EDD9C433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:358rqWuFgwGCsMPeKhZuVvvPDRSWHvGTGkBAq+AeXJq3xhwRwjZ
 JTLcbIuj7tEVqsIPuyXnb/VR12dq7+ql1OHO0WJ72y64Ckv3OdoEfQyx0tJihzzXiUn7CQB
 9jyqy8n3KXbmSuu/2aU01Lx+L2qRdFYFcjEwKupjYgqY0kn85BZXedZG683cdDcILh3aYMz
 Q33IvjFJAkU+msDBWQxMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m+Qg1abObpU=:c2bZcMCteY4fa3E0+QRzpM
 rX25HIg4naNX47Jz4X2HUu+85hrM6Q7Sd3n85F8MnGMFaiKenEnU2TVpiPeiPE5hcyyX4wGxQ
 OwDzyCl6ATirYQ73zeFFWoqmZGfattmU/ZCWofaOV6YbpgffsIPdLh0pvLw4DUCK2yhajjHYo
 f3wXFedgo2QWnME1QXVirPfCCoIJhkuTxgbnM5MZ8eR8vNbPKTr6XXjzrH9S8CalwrcWbZPdE
 v9R7gpzW8kzrRfNC3vEW0mFPdXpRrqPkyqph5PffRgyESnrGbsdpML+/1EV/WYezYmMVdast5
 cCLBHVmTOAviWeHagLPmR/48NspOlr+yJp2RiO3tm4clMHRZNYDH7j1FINxjtsVoyExpKJ/Oy
 0f5hmxYCkCOp//rbI5nC6eqrFthYXIe+Vnx/H50eR9+BguS9e3KTAAI9EU4fcex1rc0EqfKB2
 Nd2uZKZHGroIDf/a1NVCyPhmWEQcQEZghciF66PNzEur+5GWE73biBCaqg296JM20XW5nkuc3
 daSOwN6SGcTQCCMgDEmqsbBz9NrEem9DaqnAFi76UfpPKZ7eKs71u6uo3z6gUv14MRQOirj15
 I8wtW7Vp1UlvImJgeJtd6D1HbcS20SNAeUffnSomtJAwrw1Nr6aRp4aH7gzr67D6evckpcva8
 JSVJu/NvEQlE0y98R1yOk0Jb3hVlnC+X1J6+0bvMSXVI9UP3arMt81wcLoMTOGiekjzYmhSLd
 kdQgW+VnUXvUSllg0/mcdmq6423ANMzaqV0zyCpfGYNRSRAGRm7/LSFnKQIy0MZQveFucYUa0
 FvAO2lx
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.09.22 um 20:05 schrieb Stephen Boyd:
> Quoting Stefan Wahren (2022-09-14 10:45:48)
>> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
>>> Furthermore, I wonder if even that part needs to be implemented.  Why
>>> not make a direct call to rpi_firmware_property() and get the max rate?
>>> All of that can live in the drm driver. Making it a generic API that
>>> takes a 'struct clk' means that it looks like any clk can be passed,
>>> when that isn't true. It would be better to restrict it to the one use
>>> case so that the scope of the problem doesn't grow. I understand that it
>>> duplicates a few lines of code, but that looks like a fair tradeoff vs.
>>> exposing an API that can be used for other clks in the future.
>> it would be nice to keep all the Rpi specific stuff out of the DRM
>> driver, since there more users of it.
> Instead of 'all' did you mean 'any'?
yes
