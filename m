Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B673D74EAD6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97E110E351;
	Tue, 11 Jul 2023 09:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jul 2023 09:39:30 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D675C10E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689068366; x=1689673166; i=markus.elfring@web.de;
 bh=17tTqyziyzuCI8B7pVZQGfLLmIKtSO4jWi22/8UOgoM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=uQiEriQrpyzZAAXm191jwSbz2ksbZSw1GaPvTb3C8YrOvtQ9oFjHUcpJWMndr8dPdVgH6YO
 QxHGDZ4pmI+KHbH7r2llSHfWZkI3gAwMC6JZBj1XM4MdJ+2r8ovaSP7bUmxEw2U+iPu079MQj
 Er1zxK4XExUdoKNVRi0fW76w1oeu09Xohfa8/E+Zi5pTY/DI+Q0bsnv1uPBZbyII5pNH6oWeP
 Lpj596qL90t9fWBkEQgUKXFyWJAOaQm4czwonmOE+lZx7d0vMZvWdP2KNomg9xBj4sQcP03FC
 cJTH+4Ttaij/DZ02EFtTpyLFBlzP1e+qEaRywxuIWUVH1WyY972w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeUc2-1pj07o3jOO-00aLdp; Tue, 11
 Jul 2023 11:34:00 +0200
Message-ID: <6baf8384-af7a-06e1-6f91-8c4e8aa65197@web.de>
Date: Tue, 11 Jul 2023 11:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Su Hui <suhui@nfschina.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20230711090030.692551-1-suhui@nfschina.com>
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230711090030.692551-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QjUYBdtKWqzzTg1PX8U7bJrfV85b59P0CdvvMl7WyDGsYNhJD8Q
 JaMhllt+uwQj+xRa1Xw4OY7y4IJa0l/AuizTWEVu4qwK1ap7QYT4IETCZ87eo9S86UbR+n/
 cQ/VrgbKsbTs/ENAzT6oBIl2+l36MZFiynH2XaMJLCR1rWxwDoi7iBCn3HotRgPmzs4a3u5
 pwkf3rJp0DdvvmK/fBRKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W3IhONzXvh8=;brF5YQOLuN3HevOykwhm+GsK4bk
 MuMcs+DVcL1AO5GGvR5kdcldsigr+1vKxA9cBR2zxdyyZi37i5yxVD6+D3PwwnkJbQkkTXm3I
 rEVOdvd68aMjxP3pCLnHpWkmLzhzbPQf8Lwe4Pi6w4MlBRF/bzcab2WFCv9qeA9jtf4WhSwBK
 wz9+cVx2iuj9N80+yym4HwgKfmWSVp0Q3i5ClDn6BU3FH26plO2L3utA6hLOAr2slx7leVvw6
 SCppSoraMrzq0P900pFM1xS4H+5XhporYkwdCr6N0fOZxsXDCI2/eT+Fabkot9ZbT7p96H553
 yutMhuaWxduHj85AuMlR7bPQbRVnqUjTAPfb3bMmOU9BQTHNkriI3snoDWf5PaWlx0F0H0vHD
 YeJVfyBhzEoWgt02xeWTkl9neAkTGNpjjRfN09bn37eB/P6TXvI+Pj9tI2CLUimLN2kQgDXKp
 M0rHffqQckGlaqEcAMUDvezdJr9qI2nal+mpDjA9Y64EwQ57FimXj1exmgMpivGB5pHO8dmOL
 eitfiwNAWvKwhuRO9JagQlpKGzKHCJS04h6RHQKr0FVsPPygZM35c+51I+Y61JjQ8uMakTYOp
 4nfWIsULzHdiF3Yad+2B0mN2qLjq9gY72qmrSuVa0+pBP4KrL/BqooW9/DJgbpODuz1Zezueg
 3rU2ZbDu+RRt/CDkXiLAS196AuwpClLbeEVGCFq496lotV0NF8LNJ86VMAPaQ8tOWMtO0dWcn
 fFDb+zyPZ4PU/VM5h39nE0yKYpdGUm085MqDWrpoUEruv3IPPgNfoCQoNQt/eZ/6NMHWMf9vH
 jVbfKsXQwpFrumfN/HrEPET0+4+a9axjJt0XUa8g7soJWoJiRx34/m68k+v7cvL1bumgdtM5E
 9bWEzJbsnZAtqouYAy9epO3JjmihxGYdf3/Nd/IcePWegBGm2TWxT7yb+k9BQOiYEzbcqrtRO
 zZn2ZA==
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

> virtio_gpu_get_vbuf always be successful,
> so remove the error judgment.

How do you think about to improve this change description any more?

Regards,
Markus
