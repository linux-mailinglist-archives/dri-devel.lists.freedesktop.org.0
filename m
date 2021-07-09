Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E83C224E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 12:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C2989183;
	Fri,  9 Jul 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECB089183
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625827104;
 bh=dmnsbIWk0nset7dhBQ9h1s9ni+AQTT4cJf8My5/V3U0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f5WnjM+VaLylQA+8+GuXR7H8whZMW9Tth2ckqJdq2TXWnxDwCSwnE567o//z0d0Wd
 nHqdImvP1Ttc3LSg1tGPzBMg/jheZDZA1SWPGpsfU5zaQ6xs6sNT9rrQv1S04w0zU4
 xEl4kuYY62AjKgaLmt270S/dpdR4pFee94cDX4AA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 12:38:24 +0200
MIME-Version: 1.0
Message-ID: <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 9 Jul 2021 12:38:24 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:muffxs4aezILt2UyUlQ93ZSkDRulvqVdkx+j5agssMTXU875Oz1fv9Tz5iDhWeg2hjbH0
 Oye7YLDYcf8bJTz1b4Mjb7uuaoT3MSRq5wfNGatPq5goTj/ScVDQgSEoMD51RrO29pSyKmmbUYkH
 SAsQ5BRMA1VW6SXHxdzVNFrh+CRjugnh7YsHgmoYcPwUj69fIso0NpyE9Iv+jE5MsFSNwNWIu2ki
 JLLg0nC9oUUD1/Sa4zWUYdqh0AF4D8yU2g8WMZHQQj/sW5ZTKrtz1RYzLip534AEZ2shbixerJKt
 HA=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:06RW9iJ3g3w=:9nyJxXy0IvK8vq2Hqz7VvN
 sGc89fXVi02zmNnxVJdKosLH7WbITc7S/qreaebnMgE5yKeSVJkpcdLX/epI+52liEWiEKY7S
 kSggzV3S5Verwuf7Vp4BmIf0MHjuj18YI/UzuP+xLorATgozgIDCbqGI19Opj6L2IPB0jLuoY
 CRkJ7FpZZYNcm6jixMJ42PPVn5UJdGnBVdYicGuPn7bH3WvUOzy/GM1xVqdXa6GW9qrQGkLti
 YFKoP7Tg/uYlH3Tfdfi+W0BKQco1A+Xn86V3a4O8dhzd5Di+QrYIixueV1kNABIqYm3lFauWt
 jgoxvYd50G5+vAA49KE4vghVAVmagku16EDe+Ya0ymNMbcfEMyNlbxjra9SVOfJEd2GHTRaCa
 U/6TmPRyLtVsThALy9eRthvJLmDENGzkr64Fdb1OLr3b7XU6cSW9fmo/DX5dkgoiyvBdPOk3B
 IN4ZOf8EMlHZXW5IKA+VtkKHwOjV6FG0oOqTbNebD8Y2JxzPMpA/5XcoEuyt404EnLa/zx+o1
 5CKCX6OPqrqxHLOtAbUqIiQXvrtyJaPTnNK5ReocJ8DW3Qh1tujpBoti2NEXhJfLGaVVBTwAa
 VyWjn6jgIrtjNq3OlwMhUdbQCFTEX/XHU+XcNHyUbVih1VIFmKyv7TlY03k0FWGPSeCebM2Ye
 hx2zd4Te4yhHjqExY0TJpD3MItuIUCdWpgqp2Lg0C31SjgoBTsuPlrEc8DJ2BJfHBJDSiUoQS
 pSwYsOe2GJtikn/K92rNoXOTtbbYFgpnvTzya89ZpmFNd1SyfTpB/QMeIt4Zh+lDB75LyMN8c
 V9rs2u8YXgLpe1IKwsqnTPje45N6bz9FH+0RRnSOZ0vD1tadrs=
Content-Transfer-Encoding: quoted-printable
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Gesendet: Freitag, 09. Juli 2021 um 12:24 Uhr
> Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> If this is the offending commit, could you try if the following patch
> fixes the issue for you?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/c=
ommit/?h=3Dv5.13-next/fixes&id=3Ddb39994e0bd852c6612a9709e63c09b98b161e00
>
> If not, and that patch is the offending commit, it probably means that
> the default routing table doesn't work for mt7623. Needs a specific
> soc table.

Hi Eric,

thanks for response, but it does not fix the issue for me. hdmi on mt7623 =
is DPI not DSI. There is already a mt7623 specific routing-table defined (=
one for DPI/HDMI and one for external=3DDSI/MIPI):

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mt=
k_drm_drv.c#L74

maybe it can be included or compared with the "default" route?

regards Frank
