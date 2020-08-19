Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9924AFCF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CBD6E8DB;
	Thu, 20 Aug 2020 07:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17086E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597863902;
 bh=ovNaBxbYuzERcRwnFXmf/W5lE2dfM3JaLykQcJudcuE=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=bdMbnkNIepzXEgyh3n8sy47pdmdX70kObSQeW0yMDIfcEe4XpjqY064tbWon6A2N3
 KxYwJMQdSauS2vFXfCTS93bMwoj5vfznrVXVmzMSyBybAA7NKJLKoaP9bVPPyDDNm8
 qLB41IXHM4enMR9nbxSD9/sXx2LBSOFHa/mMxp48=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.76.97.101]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmULr-1kYhLD0Egz-00iQta; Wed, 19
 Aug 2020 21:05:02 +0200
Date: Wed, 19 Aug 2020 21:04:55 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
X-Provags-ID: V03:K1:I1SQA8RLE1ho3CZGRQd83x4wiGBSFj41+sUykOdSORmkkaF6OAt
 LPaLS/DxLwr1BK9smzW08UYet6YtujrlLy/ipTjGyg26bR8OGsQswRLSDPc+hIp/4vhJM9/
 eP7n24GYoCV/19w6QRWwlGTAp2W2A/7MpXBFp7OBhIOqWgJw+YlUSuj5RB+fC7Icw5fuBLt
 YSsIWMLrNHtWZkdwk1Tcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hM7lBukaAW4=:CEJojBvwJkGCGXTG2lIpE8
 qqfIoeuayh/LUZ7eLwfsZBSeWfTFByKvHnqNwTu5SS1b1+2pxdGvEwLnq0F60o5Hyeg0jnXsG
 YIRLLOkINYWzeutnZRpXeU1dfGrAn5gvHIgWfVkhq7tMWH7oRi/D5w7JZI0VUOy6+wuMIFagK
 CAl2CGZ3d+30CYn5+uWGWAI226LTZZQDF6sGYPPPtHuYnYkE+q9UDwpcj14vpT90uj/CROSUt
 OV0gU+6Dkw/+UbJ5PJsGjrbqf+aRZAWLaRViyqwO1f2APuFeVdCSLvs0oVusZNoE/EQkzpOnn
 MBVwtxj2MGeoVIDDCcVjLLT2pyMMqA+zc4Ld/WaLtb/Yt6xTCzl3cuO+91lKb7eRhIq92+rRZ
 SXJ+j6crZLjxopx2A9Q3AfISnjKfU42DdHivnasEumIZWQ/5EqRiTsVHne//Qihj9oKab+j+H
 PcJkZPYhTGbWUoOFWDvBgikpweeMCqVxZrQ7mhSFgHmjuG23NbX/5yO05CEy683klPIHyBFsm
 2xXNvxwXkXM+KiIyVpMYohuyThzhQ4cAWvhR5iXfH4N0TnDBnZ1CUBSmLV26iVeZ/Fw7rYJWV
 9oTQU1awJG00fAXYkwJMf9JBNsi5Dibw3zPtGgAW224Z6McMpKLTacvRMslcfjrBcCcwHHy1w
 RmEqoj7jgzV7E6BemDUXcgOdKrT9EeQdSDnJgqOR5SgLPU/Qgg3cFmgsM299mlkhAeL1wu7wY
 iJL8jl0TPOgQf8EC6ucFdzhQux707spxIkI9BEV22qnigJADlOO1Q5RAw2HL90MW3kKrogNqW
 8JA8hwi4yTA96H4YqufKBTi022ntxeLbbK1yvXd4HL2TbrEuYsWpF2+T985F8a+uYzZeB4RFb
 pU6AEf/oOUIlTm+MCmGKqtMJ+BOUSu2cBubfT8Zaf1cLNuADJr1FiU/xhaXsHTJ4JHqIxfKqP
 h0I2QRlcceJB1L222KeKl8n6OU3GjwCmevs44a07IrrSvUzAWEoXpO5qBlE9nLx79Oe3UMAdz
 ou5YC4tnoQyVOJoCGQGaiCiLSsl/0sJL4ZCdbQT188vjbUgoj/EmXChYChD36O8264XnnE1Tm
 mffDeHqOyoU/3aqD8JA08EqRjeEYG//7VXnBlRqAC2iAgKdFUkQW2YWv5w76DoIp41GaU3M6W
 83pTUrrUJblnfytprXQU2WGeg3WNC/bj+WDnnpm5BzYQdamMoSagKAJWf75qOX/ApjfK0uaan
 Hemx9WgrZ3pNWdFhnZQqwrTb7lwJo840EqA7fuQ==
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Reply-To: frank-w@public-files.de
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 19. August 2020 19:12:29 MESZ schrieb Matthias Brugger <matthias.bgg@gmail.com>:

>Isn't that worth a Fixes tag?

This could be

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc721b2968e3cadec520c60d2fc63498d865055 (add support for mt2701/mt7623).

It uses existing framework which calls mtk_hdmi_phy_enable_tmds by default in mtk_hdmi_phy_power_on.

Another way to fix it maybe not enabling it (use the flag in mtk_hdmi_phy_power_on) there instead of disabling after enabling it.

Maybe this is less hacky than current way (as ck hu pointed in v2).
regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
