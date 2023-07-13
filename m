Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A77523BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5033510E6DD;
	Thu, 13 Jul 2023 13:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649310E6E3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689255029; x=1689859829; i=markus.elfring@web.de;
 bh=tnwq0rW5N5kWif/JvSJobNp/zZtDd3kva1i8BZvU6IY=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=iRwmRvPGwU144p8eTqvAvCQyusj+ZaR1XiOROvZdP24+LRkMGQitn+4cd8jQSwmNz1ZLgBq
 sNMQKoPZFU16zEL/yo1mrpJdawlj3sYZzbIN1hC1KImggn3p0abNr4FEL+JmNoeYnvlPfWKRy
 959rRmROZYzWmj+P8ku9nH1cTVPvIWUOkhhltyN6pt5qjrBBkeDrvcE499g/vGtFuhQupTtpG
 Boyte+JEVRVK9BSJOWwC5IWzBfhgdbc0ZDROWxNVFhy1Jt3iHS6n2ieQOj6Oom30dVxCTwDar
 NQpzqQP+Yt/nMP5Jl818Orz3td7xuXqRSDEJ+WVSm2Dnw6mVNMIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M43KW-1qJwOr2NJQ-000UJj; Thu, 13
 Jul 2023 15:30:29 +0200
Message-ID: <bce3be55-6088-f711-0daa-92ce7ad6ccd7@web.de>
Date: Thu, 13 Jul 2023 15:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Minjie Du <duminjie@vivo.com>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20230713090724.12519-1-duminjie@vivo.com>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: fix parameter check in
 nt35950_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230713090724.12519-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CctVgcfU6wob7ejGaTM6k7zumiCdujmGNCZdDGD7P28pcKuHCc0
 I42IsFMeaEWaaKg/97q1zkVFfp1iku1qfUwdHZ1owybtMSidiLJ2wIfSLv7IyPPWooEgEin
 0qVC1IXVil1/AdSopEDqXPptYVuK/S6upi4v9yPSCy2pqCGSYXAfI/EWVIg/Ca7v2WxHIa3
 bwv/Ao/oeAj7W0UO1TBSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GZV2eraT8R8=;kif9XB8oziHTp8GCPue4gagIMzP
 /5CZdoML9FzuMFQv/l5LeB8NS78342H6Qrbm/I7wo/ot9Dj1EsaUzzHOxaZ+rgQrkf3HcYjEs
 IZm4Ft+UphcR6JH6VJFtrfiVyORiXeNBTOkKwciT6hOGk8LprIvcUL3qHZ1mpJfD3IQz6RkmB
 fbz3PgoRY1XC4nXep5nit/emHC9G2bPUFUwdliK3yJ/qECOpzZJFyEx5/jnD2oxYOsdg198am
 q0mIjDEM1p3S2r4X2QRzcHkyaIvE/ecjuha2GYC2uAz4tN59kxJibpN3EDFpGDjISAmlM98XL
 xWY4bpvKNaqtlB13F9hYb52QVkykYctsSg+okdICp8GcHCqClzwLcGQ0a6TffPmTuo1KSnCJ8
 1dvTclvB4buCTox+4CqO/FT+GwIgXLSvkR0F+atz/VyYmeXvqKTEKd+Ka/Y6KpKvRqTCUc7rb
 Q1q9dJVYQI8g4HQSIWypcLdq5kM7VtANZgUvHrP4uuVl3qAAAU2ubTFZifpEoTh8TDde4qYb6
 76qK3l1qAZS9N38n7dJm7CxrK+loF54Wx6XX1s0kBgn3Uf1U6wYR82EMCaegTMtZztZXmllAw
 5R/gY57yegtnDFiRjE6omvQmgFzWdVdQoEqG/Z9McA/UBTCzpK4yty/TbFePtIB8QRcfBzMZP
 Rfr6T1gDFjYBq2CCx+WaWESReKQk+7rlJRAnbTq7aV5VVCQjtnP4c3uuH+/h7iXF7cXJEF/2c
 3wZAkyFFmyL3MwaFCvhbayHraQ/zLXH8NbZjVGBynpoTnDa1TOnwRaHUClTbyCWFlFrCKqBuU
 e5rnSpEbBXfS9muyquP5tJHXWPNZtUp9hu3Lb8v3SbqAU88BBSwzl19r0+wcPq9zMO9FOC1rl
 pU/0MNdzbAuw3dGgtyf6dU4Kvd+VYs2ZQNtD0uPBNC//PLgxwsPszchik9MnBC+jH6p5VIzXi
 X2muDw==
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


Would a subject like =E2=80=9C[PATCH v2] drm/panel: novatek-nt35950: Fix a=
n error check in nt35950_probe()
be more appropriate?

Regards,
Markus
