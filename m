Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358F568C80
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9006010F437;
	Wed,  6 Jul 2022 15:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66B610F437
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657120795;
 bh=b+vt/0cGEYcZZG9BWVam5Ip3R961sQPxGZVgSe7MWj0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KxYkqTGKZCI/tspnJULL/opvxGa9gQzUjW4iKogMkmQFTuAYk9aeasjjGtKajq0RP
 uD7j9uGS8Z6obGwGNg368LxEk10VmtiKJao307VjUv1O4/7dQTTwsv5bhet3IUHmrX
 6qmQIkCdogO8TerPkFu8uj5dBZj0GNyPbdKr3Bdg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.81]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1o35Um3wAk-00THSi; Wed, 06
 Jul 2022 17:19:55 +0200
Message-ID: <1c8235c2-62ca-c464-76f6-b06db573adea@gmx.de>
Date: Wed, 6 Jul 2022 17:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] video: of_display_timing.h: include errno.h
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20220630173328.1369576-1-hsinyi@chromium.org>
 <CAE-0n50Pe2=tYeuuhBVHsTV9BqU1huU-w-xMMn-1scj2OxBWbg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAE-0n50Pe2=tYeuuhBVHsTV9BqU1huU-w-xMMn-1scj2OxBWbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n2uCNbVzwhkQ9zgDVeIADvB/xMYqvgs2r8gEs29DdUD0FcmdWPV
 fCn/APP0oFD8Ae1+JgXMBf0yEq5uP8cVusEGjVO5FImhwvHrvZVPsuDZwZ6Uoy2rgANeTIH
 Fgk1DNLv2kpj/QqZJ54hM2mCw6wtNIWzPItpeJhMe96C6wn04G9j8/+YGXvmY/qvZO+MsaW
 AKkfgA12Abd2P9HJmrh3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wEaaUDar/Eo=:IzN8sQ8xQY6lLOBf6dPtaL
 VJYnYKld5t6sQ97t4ftKIW3Y/eHAS9QgVnBa0uRN3710YXkemrbytArkZBug0OHrk368kLreY
 4bwoFCBuPglE0NCL91cIdGEvVDa8JIMv9AeEr3GVicRelAdYzxd06Kc7Hwa4qTZ4uJEzP9TCQ
 yk9ti2/BtU7RWZ1hxbp+nvSY34dLmfSHH5uyOGlgM+G54JMzU1qrfWUQkToHUREkuo52PYbsV
 jV8wHewZP1LMcg5ClP5iKdqT2wW/s9D2uH9xAtATh7CB7eo0WhRNtvXlD/hxiTY+cFa9e7T9v
 eet4dKpASuEkLO6UdCFgtY7JRPVGUio5NJj8PHIkfUvH7RdCYBHo6rs1m0UvoLLUUQ6EcyuGF
 TsiToVzVQunZKLLY9O8yJFPqjBpbYwq3vRrfuIfbXRl0qtMc3QLfiC7K1KMLBYpDdgqhoryvT
 +lBuU2CrgTvsgQeac6B2ay4qOm4ueU1g2sGYzIPSIzdbaCJ1YL8N4xEATCFF21Eg6M+VS1Oui
 Q7Poqk5tRS3SplFAcWa4PQluPt8F7rESAi0+SYl2Xm9Z6i2jTYmCbPuVfvd7nLkEEmz2aM9L9
 G5F+EPDb+IzVPy84/DwsnvJxsjPJ+7ktc7BaoSiT/4qvLY43uPmTfJwbRjOL+J61fhkDbw9KA
 xyg5dYcfdU3ugvqc5hw+wuqnM5G+hBiMV8c05NY7J1BvPIlziiK8VRbBaMqA4yuJghUbJJ9zf
 VoMWfuA0pNqW17CwFKLqrbWGVfgJF17Za4DjhuuyltT4pyQxLuuEczKpkUcpwho491DT542bA
 Bm1CBBj6/ZVkBAkqCbOSwr3zSRvrlkN0lUeRGDYCAm0TVK0G1NiwHJ0tkAVMJKR4faTyXVt4P
 lmw9PTwL9RcYLc7nCp1y8XAZE7JXrn/3v+2yo1L6oFF9Nr7QenF22xWdK7wm+b9Z/FF5RgIGH
 9Pu07Xm+0Yri9fHkiL2RmvKjZCIUe0BLUQwQBKvxJBbbJcO5cSXqHacDBe5zLmL2579L/+3A3
 4nvn2Ktq+yA1f4Eqi86RTql41FWMYTteu44ANcnwuIc+h/2wBWIvnitdsApkTYRD1lSS+ZkDi
 oF8lV53sGUMBBUxoDA1p31ajj2svwdbEThUHCwSsORB23/OJ0OlqTs8DQ==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/22 01:27, Stephen Boyd wrote:
> Quoting Hsin-Yi Wang (2022-06-30 10:33:29)
>> If CONFIG_OF is not enabled, default of_get_display_timing() returns an
>> errno, so include the header.
>>
>> Fixes: 422b67e0b31a ("videomode: provide dummy inline functions for !CO=
NFIG_OF")
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Applied to fbdev git tree.

Thanks!
Helge

