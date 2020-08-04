Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46E23C6AA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEB46E095;
	Wed,  5 Aug 2020 07:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341B86E23B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596555523;
 bh=KVIdFu4snYkr3f0Fmfu+cjnV5+Wi4qwOh8QwNS/ed8c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ashTFwDO+vcqxgOr36RVtsWHsXJJF443+1fukpwEObzeCAweNjSbUAzI41i+gk0qb
 Xzdu7DO1ExiCSJXwRHxM3Kk/IZ72sWE/dOXmfr4/5hAy150oJUrNAsU+2qHFqey/Wa
 fA3yDurcLYLtr1c1Eds8OOuFVgv+I1hRnyDo4rWs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 17:38:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-387bb173-6a50-4227-bf3c-90401dbf77ad-1596555523067@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 5/5] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 17:38:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-6-linux@fw-web.de>
 <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:AvRFvL6vHuGUQ5uZliiJaNJd4wt1NtazV/Qat3cVkfRNTmtJqvMDQKW9h9oDuBiDwO8Mn
 oi3RObTfOlRtNEXAyVHW2NweYjhXsSP30UIi6LJCUn5BjQhsIpG3/cN1ZFAPV/FIubTZT6SplmHU
 s5QEmlh5MhkmKG49LRBwwoJgH12ukqlazYcHIs1zvj13WAoYvMCm/GSEsMWaZMCh94kxHAz2BVP8
 /h4qsIzRszFNz6hkqNQqwICaX/HiDvg+sv31O06HNk842CYF8Gi5tNkKzwy+IUPgZWohVHLA/fS+
 z4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yNX/tQxieYA=:BIuFsOgMQlg98Dfeok5Br6
 osXUJXBjbntsuBNNb3ofJFWKIfT1DbO93O1YCbpAemnlcFLL4EWjOEc6XY3uxMjNnKdBLg+Ai
 5+XRHi2BH1EsXm9bJdhzBbJaI/2uOKXeLBMnINw4SgEl3GYxYwIklN0zeOd9bI7s/DCboO/oy
 dptBuU7tmXyAas4ItU+c4e0ZHwDw3hlJCnXDPmkNhDG1Mi5v5JGA8eGDeNHMGQ6e+f6zCc0V1
 9jVk1G4brldrTsPn0uqoZIUkOwYG6YTYhA2xuw0ISWq42I0Hf5ugmGfiAiclVsVzsyYYl5tK/
 coGstICAYKRtHKmm/0fGNfbAedvsRNGsunnwb7+pboVtRNKpTgpBNXXbmtcxiZsAGzyLxM3pn
 DuupVksCKzDEOonkh3JZF03WMEmO/NQoxNcR4FLM/cNW/BXMVQxJ57opmoy8DCU7rnqSNhfJO
 DcjRjfJs88rSjnXgdR7yLtKIyFImhD/Qq8Vc3Mibb9APwkGRc0E6O4GPDxSQfJBTtX1S6+jxn
 TJHXE4LqumuSQxRY6lu+wJE7Lpbq5zyUFwQBd85bpJIBLUlSsjd1pO9xhN0svmJTeHvUzp292
 tWA5/bYlK/3KMd+72fwdDRJT7krem+2YP6l4mm1pU+3NYjsRO2n+vH9b/PHLRDLCC+smVLUTM
 Z2qoZ/TB457pRswiA7ISCPGYB02/HNbPgtP9fEM+OlYzqcnxcmyDPS6ZNSt3bSzdkGBY=
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Dienstag, 04. August 2020 um 17:00 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> > +       display_components: dispsys@14000000 {
> > +               compatible = "mediatek,mt7623-mmsys",
> > +                            "mediatek,mt2701-mmsys";
>
> In mediatek,mmsys.txt [3], this should be:
>
> mmsys: syscon@14000000 {
>         compatible = "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
>
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.txt

oh i see i can drop this because there is already a mmsys-node with the compatibles from documentation.
only powerdomain is missing, but this seems not be needed (hdmi works without this "display_components" node)...

    mmsys: syscon@14000000 {
        compatible = "mediatek,mt7623-mmsys",
                 "mediatek,mt2701-mmsys",
                 "syscon";
        reg = <0 0x14000000 0 0x1000>;
        #clock-cells = <1>;
    };

    display_components: dispsys@14000000 {
        compatible = "mediatek,mt7623-mmsys",
                 "mediatek,mt2701-mmsys";
        reg = <0 0x14000000 0 0x1000>;
        power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
    };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
