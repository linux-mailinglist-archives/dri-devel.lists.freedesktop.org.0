Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134719E4FB
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9D16E1CE;
	Sat,  4 Apr 2020 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Fri, 03 Apr 2020 20:21:56 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73BB6EC71;
 Fri,  3 Apr 2020 20:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585945315;
 bh=YCSEQQFKPx4YUEV/q483iyQSWD6SS6vFEJuUxuxVs5U=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=XrEoxDmvOBKKsDjtHyCoS/rugSkwkDK2Xm/Up4b9XE5CLIYTKPfq1VSx0TjFh/5Fk
 kymz9gnarlQoed/3TR9V3NCele9uK5JjXRbv5LQ4/cgNOZ+B0hYVaIU+IJwRsj/7a7
 iT9wDm7tvWfz1gxZOqQPDUxZiCBoPhzH1p/Ucy9o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.25.116]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPowc-1jOITa37ru-0052aT; Fri, 03
 Apr 2020 22:15:44 +0200
Subject: Re: [PATCH] drm/amd/display: Fix a compilation warning
To: Tang Bin <tangbin@cmss.chinamobile.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <467fae73-8d98-1cdc-b269-372137b3e883@web.de>
Date: Fri, 3 Apr 2020 22:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:JVerrNhmGzIam/AMmZff/En1ViqV1y8gz4sgLd7gEQ3ZpiDsNOI
 UBGMDstsUUYwmsBJk6KpZ5++nT2lS7HIk1BYsyV5dPSJ4zirUJeFr4P4HZAZ2ntt+bf0kCD
 o3Nmn/VMLa0Q49r6v3lJDqDluBDhbN2bEziA8cRDX6qkAx5FFOvtY4tVJY7T53IQU7Rb0aA
 ryE5dBqFAVuwPslQqsq4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vdeLA2VkFZ8=:WqmSndYTqGv8HIxNIzz5re
 htZDU+FutMYS9MfftLb5Kv1t2KuwuT2hAZdNrVq/1C21XTB0vt4Jkka5ZusL7rgNUIkNS4va0
 ocXHJckK4RwIw0XEBPyX4VjFLh2F2GMSdGGIIA91y6d3TUGhVkaikn2rejmtTTOX2d6mjCiyo
 sWJP5OKnPPmRL7LeZYiXLYzCv4YUkHqgtgTm1kmqmwBVbWbZnpV5TrYnosdedLsz8VWRzXq4S
 pnYMi+rz815xvR7lDmxkfux+4tV+0tIv3mfWqxeWsmB3sxLHDfkp3FZBoRuIqeFNAvnyxqiAm
 DYIbYbwXUbgUp9iQXQjO8cN57t4B5oLbnrgzvzRWRN/EPc/W22Z+yTmQ8TFCSftmE+k+fku5e
 mfNBSTDmJkhGAr8ZZ+5lCvB8bGp0FPabgrfn1wgY2YErV2+OAqKQYzgt3j97WjQ8uKvaXxGoD
 YXBGuXzOARRjfKjPf1UjD9fuwLRASZiTh0hYVkOpqD86sjUUhMHA8wTW2wKnqVqepu0KXiKgO
 Kwi/3b/lKk4UHFxf6mdfZX782MGL/PM2zh5Go45Pn/t/cc31AQgWcjzn1CK7kODVJQnG3CSEd
 y7L4VFhUlCdwDUoN99crYFD3/zPLA/O+6LeUT7rMRw2VSiDFdfwRjrvB747Oos7trNwyYY22E
 YwjkLaDiKJ4NGV2EoPNAhusKmUi/Za7a4FMVyiKA5YozN0+WulB3Z8qkyT+WNCkP8W+Jqa87l
 qJzU3zjANA8bDxiHV1ZjdtoV09NF7Tp6CKa3DQKj4HQQBlAcaAfr7jdN5QQIK1+oW6Gx6U5rH
 r/msLQAR2t0iesxNncVq/pgkJN+0mNgr5U1fRoS0NBXmTyMmiont2P0dDnBHWtAUvpjLfeGoB
 CNHT/R6Kk/KGZzTDWHzj0nbFlNtfURLyc+30Up9Q+oGf1X7f0wMsFfqkiNomQ2YIYv3tW6ifA
 dRvoqSSKYOjYbrzrksPu9E5hc8eGMQSOFPSLQ6sS+aUhum0SBXTUiMlUph+bXB8kEqA13yT8O
 H0wRd2uB2DM+jfO1QlsPKNLpPLKX2KXqKyjuMlh8BaPLWp6Ik3l7qb+0Cq3qGQt022r6EaXN7
 NOxKcYL4xKQtqfKImgsqxS64sqjDBJCh85ynDt+v9tbZvLX8h2JnztJQhO9l6E9PP8u5m6RSO
 2HXp6lpzr01Qw8izkw65fRMv7WKPDhTVa7vMxh3qI59fUWfCIR7pk7MeHphcpEGHH/bJI0AGY
 s5rMooaxldIeNSCK+
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: zhengbin <zhengbin13@huawei.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXaGVuIEkgY29tcGlsZSB0aGUgY29kZSBpbiBYODYsdGhlcmUgaXMgYSB3YXJuaW5nIGFib3V0
Cj4gIidQaXhlbFBURVJlcUhlaWdodFBURVMnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4g
dGhpcyBmdW5jdGlvbiIuCgpXb3VsZCB5b3UgbGlrZSB0byBhZGQgdGhlIHRhZyDigJxGaXhlc+KA
nSB0byB0aGUgY29tbWl0IG1lc3NhZ2U/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
