Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67094158D1F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 11:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4A6EA28;
	Tue, 11 Feb 2020 10:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D306EA28
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 10:59:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200211105942euoutp01afe551922e5254e06f05b3b9722a6fcb~yVAD2ecDC1207112071euoutp012
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 10:59:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200211105942euoutp01afe551922e5254e06f05b3b9722a6fcb~yVAD2ecDC1207112071euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1581418782;
 bh=Fa5qQmls/H/6geRZzZYQg6CEy4kHzChnR5WF2V9XkI4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ZeVBad9Cun7E32XoCcUl46nzAHUUDsBg9xTKzgLgv5+KNQl/cdNFd8T/ptYFwFBu3
 jOYa0XpGt+SWcCKATcDpLHYCUqw7NGqRkXxZu47VBo1KhYgF1E4gdWzYBB7XwxavUR
 aJkeMbt0gcsJci+qwL62oYYCw4JIJAkbJwCfDTk0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200211105942eucas1p22fe3192cb50e942e15b6923a9812ad0c~yVADv1uBE2835828358eucas1p2A;
 Tue, 11 Feb 2020 10:59:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 36.D3.61286.E19824E5; Tue, 11
 Feb 2020 10:59:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200211105941eucas1p1a4b93e3561fe7537e3945c5e84bdbbb0~yVADbuV762125021250eucas1p14;
 Tue, 11 Feb 2020 10:59:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200211105941eusmtrp1609c71ae576a69dae32f18ae9f761e11~yVADbLqLe1096010960eusmtrp1U;
 Tue, 11 Feb 2020 10:59:41 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-be-5e42891ee2c6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8A.FD.08375.D19824E5; Tue, 11
 Feb 2020 10:59:41 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200211105940eusmtip280802aeec1ff9b4ebcd07b93192b6b8b~yVACnruOy2260322603eusmtip2h;
 Tue, 11 Feb 2020 10:59:40 +0000 (GMT)
Subject: Re: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <09dba4da-5fd7-cafb-22a3-4baffb12c155@samsung.com>
Date: Tue, 11 Feb 2020 11:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWgGyt8w4zG-rf-b9uyfEx1aHV-CoLz4h_T3MpvzdniWQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7pynU5xBguvcFhc+fqezeLZrb1M
 Fif6PrBa7H5/n9Fi773PjA6sHocOdzB63O8+zuRxYvp3Fo/Pm+QCWKK4bFJSczLLUov07RK4
 Ms6eeMBUsIut4kXDeeYGxpWsXYycHBICJhKfT8xm7mLk4hASWMEo8W3JRTYI5wujxMGv/9gh
 nM+MEs9fL2aEabm6eTsrRGI5o8TOA80sEM5bRonLb84xgVQJC3hL7OtaB9TOwSEioCsx5ycT
 SA2zwHlGift3PoMtZxOwkpjYvgpsKq+AncT7hUdYQGwWAVWJ+ScbwOKiAhESnx4cZoWoEZQ4
 OfMJWA2nQKDE7rUX2EBsZgFxiVtP5jNB2PIS29/OAXtIQmAeu8Sl1mlQZ7tITNn0iRnCFpZ4
 dXwLO4QtI3F6cg8LRMM6Rom/HS+gurczSiyf/I8Nospa4s65X2wg7zALaEqs36UPEXaUaFl9
 hxUkLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJbFi2gQ1mbdfOlcwTGJVmIXltFpJ3ZiF5
 ZxbC3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzECE83pf8c/7WD8einpEKMAB6MS
 D29FoGOcEGtiWXFl7iFGCQ5mJRFeS2mgEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTS
 E0tSs1NTC1KLYLJMHJxSDYxmv+OKmrPPPD3Hun/u9MI1cjY5Hexeu+5ePXY2a3bprx88GefW
 3J8x3/2cfNXnzZwrfk8JOruiqWCtm8KKb07NMSWNlZ5PJ63f37p1Y4W5S6v3bOXvp/xZTXPL
 n3DfDix83Hnm/hOe47PP7ZhRcsi+54bocm67nkd71Vitl6aK/uDIWhv/LZ5XiaU4I9FQi7mo
 OBEA0rLJUDADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7qynU5xBosO61lc+fqezeLZrb1M
 Fif6PrBa7H5/n9Fi773PjA6sHocOdzB63O8+zuRxYvp3Fo/Pm+QCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Ms6eeMBUsIut4kXDeeYGxpWs
 XYycHBICJhJXN28Hsrk4hASWMkrsuzqbrYuRAyghI3F8fRlEjbDEn2tdbBA1rxklnm68zwyS
 EBbwltjXtY4dpF5EQFdizk8mkBpmgYuMEts2vIIaOptJYuqnpUwgDWwCVhIT21cxgti8AnYS
 7xceYQGxWQRUJeafbACLiwpESBzeMQuqRlDi5MwnYDWcAoESu9deYAOxmQXUJf7Mu8QMYYtL
 3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLz
 czcxAuNq27Gfm3cwXtoYfIhRgINRiYe3ItAxTog1say4MvcQowQHs5IIr6U0UIg3JbGyKrUo
 P76oNCe1+BCjKdBzE5mlRJPzgTGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUg
 tQimj4mDU6qB0TT9yfbmXYsPXn4Sfde6Zvt3n0cW/6+fEXdk3yv79U/ZrN29B82Fr77/KBnm
 xn2/j7/+4RSHyQwbHoTbvr7KEiDRnBc/zXrFcZ/O67wFG0qy5k7QtGkRnFVZue398hwpgwuq
 v88lvOTkCZZk54z5U+E1YafGRO8C9kbhXSekPW4fkt20K3LZHyWW4oxEQy3mouJEAOGBuvPB
 AgAA
X-CMS-MailID: 20200211105941eucas1p1a4b93e3561fe7537e3945c5e84bdbbb0
X-Msg-Generator: CA
X-RootMTR: 20200211084935eucas1p2f151e2ea9157c4e6b0766bf1f7cf2f84
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200211084935eucas1p2f151e2ea9157c4e6b0766bf1f7cf2f84
References: <20200112171521.22443-1-geert@linux-m68k.org>
 <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
 <CGME20200211084935eucas1p2f151e2ea9157c4e6b0766bf1f7cf2f84@eucas1p2.samsung.com>
 <CAMuHMdWgGyt8w4zG-rf-b9uyfEx1aHV-CoLz4h_T3MpvzdniWQ@mail.gmail.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/20 9:49 AM, Geert Uytterhoeven wrote:
> On Mon, Feb 10, 2020 at 12:16 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Sun, Jan 12, 2020 at 6:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> Replace the call to the custom non-existing function by a standard
>>> BUILD_BUG() invocation.
>>>
>>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> Thanks, applied and queued for v5.7.
> 
> Sorry, this is fbdev-material, not m68k-material.
> If you mind, I can drop it from the m68k for-v5.7 branch again.

I don't mind, lets keep it m68k tree (it should not cause any
conflicts with other fbdev changes).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
