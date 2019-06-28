Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44015985A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCF6E8CB;
	Fri, 28 Jun 2019 10:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7896E8CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:27:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628102720euoutp02d49a2e7636c9721a2e8f617eb3feb243~sVet_wJdD2448924489euoutp02e
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:27:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628102720euoutp02d49a2e7636c9721a2e8f617eb3feb243~sVet_wJdD2448924489euoutp02e
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628102720eucas1p12869ba4574dd05263b88133cce69c3d9~sVetaWheX0397803978eucas1p1d;
 Fri, 28 Jun 2019 10:27:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 74.EF.04325.78BE51D5; Fri, 28
 Jun 2019 11:27:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628102719eucas1p2c601b723f6cefca76a9e9246d7f9447a~sVeszABqC0359603596eucas1p2M;
 Fri, 28 Jun 2019 10:27:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628102719eusmtrp1d776940a506c18ffceed114468c842bb~sVesk5x3t1691316913eusmtrp1k;
 Fri, 28 Jun 2019 10:27:19 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-68-5d15eb87bb13
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0A.63.04140.68BE51D5; Fri, 28
 Jun 2019 11:27:18 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628102718eusmtip26c0203e6afed48bef2d8aef30b26f4c8~sVesJoY2L1337713377eusmtip2D;
 Fri, 28 Jun 2019 10:27:18 +0000 (GMT)
Subject: Re: [PATCH 2/3] video: fbdev: intelfb: return -ENOMEM on
 framebuffer_alloc() failure
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <ff1c6cab-ecc0-10e2-b1ad-69d73368a754@samsung.com>
Date: Fri, 28 Jun 2019 12:27:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a659cb04-b16c-a3a0-30f4-b2f90b0d7196@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7rtr0VjDf5eN7G48vU9m8WJvg+s
 Fpd3zWGz+HWSyYHF4/rPG0we97uPM3l83iQXwBzFZZOSmpNZllqkb5fAlfHk2lfmgutMFX+3
 bGFrYJzH1MXIySEhYCLR/rWTpYuRi0NIYAWjxP9r89hAEkICXxgl/k61hEh8ZpSYcOwbI0zH
 wenbmCESyxkltix6zAThvGWUWLaoFWyusEC8xOcvr1lAbDYBK4mJ7avAukUEEiRWTJ8BZHNw
 MAuoSVxfVA0S5hWwk5h4sgmshEVAVeL33cWsILaoQITE/WMbWCFqBCVOznwCNpJTwF5i45RW
 ZhCbWUBc4taT+UwQtrzE9rdzwI6TEOhml5jecRDqaheJs0tfMUPYwhKvjm9hh7BlJE5P7mGB
 aFgH9HLHC6ju7YwSyyf/Y4OospY4fPwiK8TVmhLrd+lDhB0lJtw6DxaWEOCTuPFWEOIIPolJ
 26YzQ4R5JTrahCCq1SQ2LNvABrO2a+dK5gmMSrOQvDYLyTuzkLwzC2HvAkaWVYziqaXFuemp
 xcZ5qeV6xYm5xaV56XrJ+bmbGIHp5PS/4193MO77k3SIUYCDUYmHV2GnSKwQa2JZcWXuIUYJ
 DmYlEV7Jc0Ah3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwcnFIN
 jOUPA+VjJj+X0Gzfmip58Vi3Fj+Xyr+se3ezLpcLHnd4mXFVcuL65S+q7Ir82hVl1TN/v78b
 3TDr7Vp7x4yITZPq39Vmf73J5bk0u//RQqsf26cmO+Sc+Wv58n1ldMXFKKb4j2HxLsWaGm/L
 Zz+N2bbb/WTUVC3ub81Txe5sUXtfNyP5wSEjOyWW4oxEQy3mouJEAOKjqVQjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7rtr0VjDfat4LG48vU9m8WJvg+s
 Fpd3zWGz+HWSyYHF4/rPG0we97uPM3l83iQXwBylZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdk
 YqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/Hk2lfmgutMFX+3bGFrYJzH1MXIySEhYCJxcPo2
 5i5GLg4hgaWMEo/fLGfsYuQASshIHF9fBlEjLPHnWhcbRM1rRolPfY8YQRLCAvESn7+8ZgGx
 2QSsJCa2rwKLiwgkSDx9PZ8NZA6zgJrE9UXVIGEhATuJ5beWsoLYvED2xJNNYOUsAqoSv+8u
 BouLCkRInHm/ggWiRlDi5MwnYDangL3EximtzCA2s4C6xJ95l6BscYlbT+YzQdjyEtvfzmGe
 wCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZg9Gw79nPLDsau
 d8GHGAU4GJV4eBV2isQKsSaWFVfmHmKU4GBWEuGVPAcU4k1JrKxKLcqPLyrNSS0+xGgK9NxE
 ZinR5HxgZOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBsX8DA
 cz385vNF9fX7+R60P01f7+T3eqsW/y/Lg8kbdSZuE/GOmH2I/cPqHLbCLveapX3l11xe7tNe
 tVSaUyDO9+Xy87w+pbx7ldfFSXQVffhQvsxpxekvnCFfDNnDqsyu+ijnrpnu1aEg7mBfkhE3
 p/nX3aZjulbzvI8fFDJZ3Oy2+Zsu8w0lluKMREMt5qLiRAAUYFzNtAIAAA==
X-CMS-MailID: 20190628102719eucas1p2c601b723f6cefca76a9e9246d7f9447a
X-Msg-Generator: CA
X-RootMTR: 20190628102719eucas1p2c601b723f6cefca76a9e9246d7f9447a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190628102719eucas1p2c601b723f6cefca76a9e9246d7f9447a
References: <a659cb04-b16c-a3a0-30f4-b2f90b0d7196@samsung.com>
 <CGME20190628102719eucas1p2c601b723f6cefca76a9e9246d7f9447a@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561717640;
 bh=IR57OlJ6q19NWP/1YHwDGXEZrUWkd2VUa8JWG7Fmdts=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=arF6hBfpe46LgoPZCB2162zlbbgUreatFSTzGJeooRx8XenDqUVxFgTvsWEigLsfR
 ZRpTCsWYHQv5/URBNk+9ax9usqVd5l5NVa6X2/3hfEL7MgknbWPljvQ8wClmVmKvXn
 rJ36jV/Z5AJvqsy+CW25DbFA4w5wa9QTk+y1lRV0=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maik Broemme <mbroemme@libmpq.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTQvMTkgNDo0OCBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBG
aXggZXJyb3IgY29kZSBmcm9tIC1FTk9ERVYgdG8gLUVOT01FTS4KPiAKPiBDYzogTWFpayBCcm9l
bW1lIDxtYnJvZW1tZUBsaWJtcHEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KSSBxdWV1ZWQgdGhlIHBhdGNo
IGZvciB2NS4zLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNh
bXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
