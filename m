Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F392475243E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9DE10E6E0;
	Thu, 13 Jul 2023 13:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFD710E6E0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689256376; x=1689861176; i=markus.elfring@web.de;
 bh=shQ0SzQl5jo01jGU4Uz+CKxL7orQvxecCc71nov30J4=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=EnWq2yUtjKs6k4r2WHzKuq6mxovCFeFho5uJy9CpjmkCcDkHcHn1kOYdt8Vdt62l/VQamBD
 G6sVVzqPt2KoXLJgVQTNqkHPRhgq29VSf6nJXd3nmFcLHZC41+HFU4HXxwhitqyrK0qUgwzps
 DnIXshWbmrjDqct02lIL44Lny2qyaUmedO6ys0McEtwD0s4/O9FPTDzr2MEQh6w1effqsuiJ0
 Y/8fOWePyYhwhbSzNt3ii4I4hbIS8kNJtcijZr7PFX6NAVKna5M6I+bkWi7XYUAp27adzzmHZ
 OKX7tNV24WmGusyoR9SIznBG3iOlpPdHRSmqXGhVoAsgQ2XzPniQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6bD0-1ptGqM2PJG-018BFR; Thu, 13
 Jul 2023 15:52:56 +0200
Message-ID: <2bc21249-53a1-a431-ed47-f30f6a0f0f57@web.de>
Date: Thu, 13 Jul 2023 15:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Minjie Du <duminjie@vivo.com>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20230713095328.13823-1-duminjie@vivo.com>
Subject: Re: [PATCH] drm/panel: nt36523: fix parameter check in nt36523_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230713095328.13823-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tzr94duwOx+eWOg9JAGnRxsakQnukgZwmgN6eqzqh7Aeutgo6U/
 OUB6MK3BlJXVRdj9nL/NvjZE4ksoIMLK7c5Cz/D6GSNlG++QHjas2Hu9K7W5+6DJgEuqpa3
 q9hT4hoZkxU46tjvC2ggj4KzdAvQutDXp3JRPgXaubzniHL7vR9VHM8GdlQ+ogvjPi0Iuo9
 c4HnMALxZDGrQiZU8DrjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZPvqCrWBl8Y=;h5wEq9ZsK+2yXIS7ERdETfd6msF
 13ZjyjtImHfFyq8TTpDc6V0MamG+QZy7n/A0KaLW1Pjgn5DuzJldktRkUdlbj6ZEfLEeaGk0W
 qhqVhZDZGd46kiWZOO3dMhOt7ExTtyrzuAVAjCZcXckFVN/l8ghHqbk3y4VheCMIzy5NMreHA
 jy5BTXOKVBZQx44+NvNGhUMFvBH4iZQ/DF2j3BSn4k9oCPMtMmPXrIlMpoXRsW+O8VsK5dEV1
 8+79d0z4S4oqmexKaaI9BmPigRumT4A2kypBchODuBIyt4Aehl5nKtchM72xjyWk9hbOsvong
 8AfSRz6544BDse5TA8QBxI8paYh31oSRh6rsZkiemmJaLNJMCDJJ9jVWcRsRx1Dy+VV28VSMy
 CKGjaLI2pYGLKSsIFir3FIsZMh16e8b45yBbK5bcNDbMz5cXzW8tMMGthjrNUTozxOdGamPfk
 WY5aVzptOg4e9cHdrUdsTRP4TAzLj1djLbfp/fUUo5lmxty9Qq8gfm5EBHytGiZIqxCob8cIs
 HjCFP16oDxWdOlTNeAxgnulmLNzpF2LNPxt/wxhYht+TqIIqkAe22lXb9Uavlt8MHVHbhHORI
 RLMbLrFWHlVCZs6R5R/U15j20Zxn3RhLZp/1Gm6euZ6bv8Vnx2VCPSheVRLf2MnWSebUvmDZM
 OdmIMCpYdT6+sajj4/hkGi5F6asHqLNFNWyhbZuocjL6SAiDJLqysLDDOHMO8lMlF8FfhD1pV
 7gWfMZG1B4cE9YUaOIplcXn+FJ2qtyIzQ8EN+fRDT6s14m54ZQZfS59mkk022ehTkhFgd8cyP
 SGZzSLY1XlJEjBe8E5KbhrLMNYuve9v0CN7XS42HlxAfDuHv/WF2ko1M8sBhTapyYfM8ngERx
 B2BHIoNCyzVqApqYuECMlh4v6/gxAlerRE6o1LStwDMFaNccqEzKTZ8lZTUv9y38rT/8o+pqR
 FCwxIHYFXG2nsXsUx50Gx4Gxk3Q=
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Make IS_ERR() judge the mipi_dsi_device_register_full() function return

Would the term =E2=80=9Creturn value=E2=80=9D be relevant here?

Would you like to improve this change description also according to
review comments from other patches?


How do you think about to add the tag =E2=80=9CFixes=E2=80=9D because of a=
 desirable
source code adjustment?


Would a subject like =E2=80=9C[PATCH v2] drm/panel: nt36523: Fix an error =
check in nt36523_probe()
be more appropriate?

Regards,
Markus
