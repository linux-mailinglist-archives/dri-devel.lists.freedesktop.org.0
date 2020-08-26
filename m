Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AD25341A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090E989FBC;
	Wed, 26 Aug 2020 15:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0565989FBC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:56:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826155638euoutp0140c6eb833471fb76d0955f01d837827a~u3Ijrltue1677016770euoutp01M
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:56:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826155638euoutp0140c6eb833471fb76d0955f01d837827a~u3Ijrltue1677016770euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598457398;
 bh=797iMJmF4byuxy4fF7Nm01q6tzaVQ6LfJQEWT6x0h6g=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=JvzFUU7wSeIMs3UQzuoU5rq7Q7PspI+03H2KTUIOhDEym5f34ehrqtOKgQttV8e36
 0Fq3rGGYBHQnwGNBy8TydQNAmm2MEJR4DeiUY0jS9JUBP837g2gyMAao84dSwYcZ5e
 QenV2XCqiTSN10UxXnbUjZ0XaoEgUKlNS99f4o0c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826155638eucas1p101b7326aaadecf7ae976ebb161229242~u3Ijh9WFU1495914959eucas1p14;
 Wed, 26 Aug 2020 15:56:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BC.CB.05997.636864F5; Wed, 26
 Aug 2020 16:56:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200826155637eucas1p1c3bcff270ebb9db1fbb81274da70676c~u3IjGsXLG0034200342eucas1p16;
 Wed, 26 Aug 2020 15:56:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826155637eusmtrp1900417ae7792446e5dbfae5825eb3eac~u3IjF-lcU2120121201eusmtrp14;
 Wed, 26 Aug 2020 15:56:37 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-5b-5f468636e6db
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 28.07.06314.536864F5; Wed, 26
 Aug 2020 16:56:37 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200826155636eusmtip19aef48af82f2e352218ab35e19107633~u3IhuHb862184121841eusmtip16;
 Wed, 26 Aug 2020 15:56:36 +0000 (GMT)
Subject: Re: [PATCH 2/2] drm/exynos: hdmi: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim
 <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <f15a4215-df2e-d186-7751-1188c6d3f9c1@samsung.com>
Date: Wed, 26 Aug 2020 17:56:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826145513.10657-2-krzk@kernel.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUYRSG+WZmZ0dxdFwtTyaaC4EpXrrZVCKaYROV2t8o11UHFa/srpb9
 SJFcXDXvedkk1G4qRIvrnTTZotXES1RiISppkJqYeMlMK8cx8t9zzvue870HPgqXvZE4UnFJ
 Gl6VpEyQk5ZE6+ufQ56+2mCFT/u0lL0z2Iexf1qLcfb9ygLJlkwUEezX8bcEWzg1h7NDQwYp
 O5D1Tco2TY1I2Hed1SRbOdSNsZWlM2SAFde1WkNwTY06kmtbnZRwE3lmjDM+zOAKmhsRt9Tk
 HCa9YukXzSfEpfEqb/8Iy9hfs7lkSgd2Y3ijQ5qJtFguoihgjsHLV/JcZEHJmHoE+eZ9uchy
 i5cRrHYtY2KxhGC4bA0JLmGg8H4mKQpPEGSOreBisYDgRfeXbZcdw4HRML3tsmee46BrHJcK
 Askcgk3jR1JgmvGHqoZmQmCCOQhZ+hGJwHuYcGgxf8BEjy30VU0TQlYL5jh8vntAaOOMC7TN
 V+MiO0DWcoNEeAuYESk0dPfg4m1n4XGxr5jaDmbNzVKRnaC/NJ8QOQMm6m/j4mwOghZDBy4K
 p2FscJ0U9uBbmZ91eovtQOg3GXbWW8PovK0YwRpKWit22jTkaGWi2xUmBlp2FjrAo+EVUmQO
 dD2bWBFy1e+6Ub/rMP2uw/T/M9QgohE58KnqxBhefSSJv+6lViaqU5NivKKSE5vQ1g/r/21e
 bkedG5EmxFBIbkW7KYIVMokyTZ2eaEJA4XJ7+sxAf7iMjlam3+RVyQpVagKvNqH9FCF3oI/W
 zVyTMTFKDR/P8ym86p+KURaOmciugLBfdA6OHNB4pwQYcdmt0PVLjv6uIfga7WakteFOS8k+
 CwXznnRvpW9r+Si2EmnncbWg3C3Vw9xXob142aSofSCz8fv0o85Fx4fXBmYEuWsMi3vHbSo9
 52pPnArjSi60Z/dGhWaPhei+P825Nzkef/5cGR8UmhfhXTt7MkJOqGOVh91xlVr5FxPmTCNd
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xu7qmbW7xBqdX6lr0njvJZPF/20Rm
 iytf37NZTLo/gcXixb2LLBb9j18zW5w/v4Hd4mzTG3aLTY+vsVpc3jWHzWLG+X1MFjMmv2Rz
 4PHY+20Bi8emVZ1sHtu/PWD1uN99nMlj85J6j74tqxg9Pm+SC2CP0rMpyi8tSVXIyC8usVWK
 NrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mv4/aqLrWAnU8WFPzvZGxjbmLoY
 OTkkBEwk+uc1sHUxcnEICSxllLg38Q1UQlxi9/y3zBC2sMSfa11QRW8ZJa4teAWWEBbwkNi8
 4QlYQkRgD7NE69tuFpCEkMBmRokHy/RBbDYBTYm/m2+ygdi8AnYSM1duAathEVCVaJp1jRXE
 FhWIk3jc+58ZokZQ4uTMJ0A1HBycAqYSj6YqgISZBcwk5m1+yAxhy0tsfzsHyhaXaPqyknUC
 o+AsJN2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIERuu3Yz807GC9t
 DD7EKMDBqMTDqxHvFi/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQL9N
 ZJYSTc4HJo+8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2Mfm+v
 cfZ84lnTVx6WWT/x6NMFNzt3qQpf17n/59qOBzW3ThYKWT0ubJov4fpWhjdwXZj8l/pfc9pE
 vlnfMXcrz7j6eOPSh5bMLLWtpTsuno437PTa31px9dYV+b2LLu6QfHlGabaPtpCNwWyZtnD9
 tiy+hY0Xq3+Lrai5wHtkbUnZwq+8LWnvlFiKMxINtZiLihMBQl27i+YCAAA=
X-CMS-MailID: 20200826155637eucas1p1c3bcff270ebb9db1fbb81274da70676c
X-Msg-Generator: CA
X-RootMTR: 20200826145531eucas1p25280dd4adb9f746e601a22ae0a154b6a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826145531eucas1p25280dd4adb9f746e601a22ae0a154b6a
References: <20200826145513.10657-1-krzk@kernel.org>
 <CGME20200826145531eucas1p25280dd4adb9f746e601a22ae0a154b6a@eucas1p2.samsung.com>
 <20200826145513.10657-2-krzk@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26.08.2020 16:55, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
