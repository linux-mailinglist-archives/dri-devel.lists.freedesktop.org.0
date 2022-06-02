Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400953B839
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 13:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAA6112F45;
	Thu,  2 Jun 2022 11:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jun 2022 11:54:38 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161FD112F43
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 11:54:37 +0000 (UTC)
Received: from [192.168.41.62] ([46.114.149.130]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MmDAW-1nW9vb09hI-00iGku; Thu, 02 Jun 2022 13:48:55 +0200
Message-ID: <cae71804-ccbb-5d55-839c-9806539be8be@i2se.com>
Date: Thu, 2 Jun 2022 13:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 5/6] ARM: configs: Enable DRM_V3D
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-6-pbrobinson@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220601110249.569540-6-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JvQauzxAxzLvPrRCwKoPIKI/irxXISdpoEZy5ps6DWbfJHQNGrQ
 hQiTE5zpMEIvHDl/OJWmYAFiS47l4N3JezDooUZ+laKmlethewAA2VteXGJDtB0ixQJUw0b
 BwzwuJ58tGXQY2tCyCzWWalO297u2+WVNzbALLbdaa5GNXwpYsz2dePAr9sfQsk5KY1bMnI
 tUQg25P7xa75LV76dRRTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ee7cyVasZY0=:OBH67STRoLTIBqau91xcez
 4U/ZFBIad6gD1eZSvkomLHOayu88zeaNhQXqhOzeIUVPzG6h24HI3VidxOwUKCN0FBQ460ps3
 R1zPaioPq4yrlPIIxXET2uLNsvkGW/SFL96H1L3aH56Molo60pTZOWRH43mlfr53VfodVUGVp
 TBMZ8hrVp6bb/mmYKdsMJi2xyk4nJnmN4ulxwEcbZPFV0eL8e/cBlt3AeUvcOAhrUNoCXzdge
 iHNkbPIYqtYHwsNe0AuLlbHmJudLOANClhoA5S7Yn9hJyvi/3S9+EdMbj3W2uYxGBz10bGE3h
 h/jVWPVto2PYYtTt3TrJqKJqMz21AB5y/wzlSevudAtzXtz2O1Iw4PlGdmtBFU45gVIDm5Bf/
 hEh+rCVhyiVbGnx2cB/K1bhQ1DjZyKhDMrcM1YCpbRpOuXANSZhkhtxCicGsStrGnSXwyKTCw
 UB4F3GF43pflV2H7HnY+cdrQA6zF+cq3KoIjz8eLRn6rWJAYsQzGowOO1mV1mA0AJVKOO6Fyi
 0svIqsnuJSm/eep3FwE/rzzK/fXu/uqS9+04kWw6LGjD2BErSzsa4N9/dDy+qneh11LQdc0uy
 /lF67T2BuyjwxZEgSbZNYX6P03gCste5YRdn6niSCAWR3lTqebTsW6e+j1cNBUtU2faaa+jU9
 Yql6WLW50EPwWRI00qI+hGU+ExhGnqsP2xqv6tSLXo7SPrrqKASJ9E672U06akTq4MfEpl9SW
 nXFrUQYomMF2Xy10ug9foZKmL1Un3ApUJZRV3/hQHnatwjym9DsIZLKqIdI=
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 13:02 schrieb Peter Robinson:
> BCM2711, the SoC used on the Raspberry Pi 4 has a different 3D
> render GPU IP than its predecessors. Enable it it on multi v7
> and bcm2835 configs.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
