Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844D24D4A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3948B892ED;
	Tue, 21 May 2019 10:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EC3892E5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:53:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521105327euoutp02d68cc5cef3e7754b5f8b431d0126f0d5~grUqcMIKp1480014800euoutp02B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:53:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190521105327euoutp02d68cc5cef3e7754b5f8b431d0126f0d5~grUqcMIKp1480014800euoutp02B
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190521105326eucas1p152e5f185848fb01c3bb7e60943fb0da0~grUqFqK9-0211502115eucas1p1H;
 Tue, 21 May 2019 10:53:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B1.35.04298.6A8D3EC5; Tue, 21
 May 2019 11:53:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190521105325eucas1p2df66ee0fd67d652cc26200701e4275da~grUpB0iYa1262912629eucas1p25;
 Tue, 21 May 2019 10:53:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521105325eusmtrp1e5be1b92fa81b91aa4663864c0c0b3b0~grUoyY0R01645916459eusmtrp1U;
 Tue, 21 May 2019 10:53:25 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-37-5ce3d8a6a406
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.15.04140.5A8D3EC5; Tue, 21
 May 2019 11:53:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190521105325eusmtip253c2ec007ceb2162f92ee06c418a76dc~grUoktqdI2718927189eusmtip2E;
 Tue, 21 May 2019 10:53:24 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: da8xx-fb: add COMPILE_TEST support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <fe534641-82b7-c3f7-4296-db4ba4ff30e6@samsung.com>
Date: Tue, 21 May 2019 12:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd1lNx7HGBx6I2Jx5et7NosTfR9Y
 LS7vmsPmwOxxv/s4k8fnTXIBTFFcNimpOZllqUX6dglcGR96F7MUHGer6J98lKWB8QRrFyMn
 h4SAicTnu4cYuxi5OIQEVjBKNB+9COV8YZS4/PoyM4TzmVHiV9NlNpiW9TMfsEEkljNKPH+3
 hwXCecso8fT+LrAqNgEriYntq4BmcXAIC7hIbNwuBRIWEUiQWDF9BiOIzStgJ3HyRj9YOYuA
 qsTMffOZQGxRgQiJ+8c2sELUCEqcnPmEBcRmFhCXuPUEooZZQF5i+9s5YNdJCFxnk2g/9JIR
 4joXiRX3PkDZwhKvjm9hh7BlJE5P7mGBaFjHKPG34wVU93ZGieWT/0H9Zi1x+PhFVpCrmQU0
 Jdbv0ocIO0psvruDDSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0lsWLaBDWZt186VzBC2
 h8STuYfAThMSiJX4uWc+0wRGhVlI3pyF5M1ZSN6chXDPAkaWVYziqaXFuempxYZ5qeV6xYm5
 xaV56XrJ+bmbGIHp4/S/4592MH69lHSIUYCDUYmHN2PKoxgh1sSy4srcQ4wSHMxKIrynTwGF
 eFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MBrf6jtcz/H4
 +DFdddfQu0yVDLyLnVWZZ8mesDy78PZndrUexWSv7Q5y66/sd3Pmm+D/tWm7e8i3xPB3XRPa
 PGLnRRcdSOlVvOiRxBR27YT927k2L71+q2VU6U2QSbsi+uKJTbr/et5osbm/3Hw9z5elLst+
 NFknIMWkwu7j9peL0sLcZO9OVWIpzkg01GIuKk4EAETg9xMbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsVy+t/xe7pLbzyOMdh4g8fiytf3bBYn+j6w
 WlzeNYfNgdnjfvdxJo/Pm+QCmKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxM
 lfTtbFJSczLLUov07RL0Mj70LmYpOM5W0T/5KEsD4wnWLkZODgkBE4n1Mx+wdTFycQgJLGWU
 mPn6PpDDAZSQkTi+vgyiRljiz7UuqJrXjBKrJ15nAUmwCVhJTGxfxQhSLyzgIrFxuxRIWEQg
 QeLp6/lsIDavgJ3EyRv9YDaLgKrEzH3zmUBsUYEIiTPvV7BA1AhKnJz5BMxmFlCX+DPvEjOE
 LS5x6wlEPbOAvMT2t3OYJzDyz0LSMgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeu
 l5yfu4kRGOLbjv3csoOx613wIUYBDkYlHt6MKY9ihFgTy4orcw8xSnAwK4nwnj4FFOJNSays
 Si3Kjy8qzUktPsRoCvTQRGYp0eR8YPzllcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpgPPzEPMS9R6H4gOjuLQevzZG+aLb4ftw/XoY9PbqXlsulZ2asdPd/t3LR
 JP7lzE6ey/aJhRxlvZmgn7XG+tbRu60zapb9P2jCLui+k195A/O5ucemP3yVoOJVLjJTTf0h
 88fiyEd+nlfYNhbq/GOMknazlT2rJnw0UYXzxopLiZa+q+JWfnSwUWIpzkg01GIuKk4EAAJr
 AMiHAgAA
X-CMS-MailID: 20190521105325eucas1p2df66ee0fd67d652cc26200701e4275da
X-Msg-Generator: CA
X-RootMTR: 20190521105325eucas1p2df66ee0fd67d652cc26200701e4275da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521105325eucas1p2df66ee0fd67d652cc26200701e4275da
References: <CGME20190521105325eucas1p2df66ee0fd67d652cc26200701e4275da@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558436007;
 bh=stp1eF22evOzaYs842QuDkmDZgGFtH7ykSzcPoTOKWM=;
 h=From:Subject:To:Date:References:From;
 b=TXOP0h+0sTbxfyL3LgMFNX9VMQz+CU0oMdMqiex43HtCsCbTUwzx3UyG/49r1AMlN
 TS2Y4ygtGqUgcxIr+5aD5yIlZ/14X12FXq4L4CWd5mBwfcB1WB8pqbQ7pJKwjg8f9s
 VNVT/gF97C+9eJf3r7UDQ4jRuvTUQsxmnuQA8/EE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGRhOHh4LWZiIGRyaXZlciBmb3IgYmV0dGVyIGNv
bXBpbGUKdGVzdGluZyBjb3ZlcmFnZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCnYyOiBhZGQgbWlzc2luZyBI
QVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCgogZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnIHwgICAgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZwo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZworKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L0tjb25maWcKQEAgLTIwNTcsNyArMjA1Nyw4IEBAIGNvbmZpZyBGQl9TSDc3NjAKIAogY29u
ZmlnIEZCX0RBOFhYCiAJdHJpc3RhdGUgIkRBOHh4L09NQVAtTDF4eC9BTTMzNXggRnJhbWVidWZm
ZXIgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEZCICYmIChBUkNIX0RBVklOQ0lfREE4WFggfHwgU09D
X0FNMzNYWCkKKwlkZXBlbmRzIG9uIEZCICYmIEhBVkVfQ0xLICYmIEhBU19JT01FTQorCWRlcGVu
ZHMgb24gQVJDSF9EQVZJTkNJX0RBOFhYIHx8IFNPQ19BTTMzWFggfHwgQ09NUElMRV9URVNUCiAJ
c2VsZWN0IEZCX0NGQl9GSUxMUkVDVAogCXNlbGVjdCBGQl9DRkJfQ09QWUFSRUEKIAlzZWxlY3Qg
RkJfQ0ZCX0lNQUdFQkxJVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
