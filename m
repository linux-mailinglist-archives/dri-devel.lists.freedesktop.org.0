Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A79175E88
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205A26E514;
	Mon,  2 Mar 2020 15:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA6F6E514
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154240euoutp01565b45dd4a4db1e91cd2d0229194a88e~4hw1ggr_Z1330713307euoutp01A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154240euoutp01565b45dd4a4db1e91cd2d0229194a88e~4hw1ggr_Z1330713307euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163760;
 bh=KWzOteUQaHJimJ522eyRNnUZIVwvvujxlZPPxP9BqIA=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=ZHQc0RESSl8K6Ftivo41sDPRdup7cZCMZEsgLzyfg121Fkr4OGMU5ybM/ONNrQQsG
 BkMH0hsBcFbuHm3ojr1W47yCsU7DTALa6PuururxBmOSz+kMCktKbOLlL5OqTakz46
 qlPisHxoUg+U7KMxY0avtSsF0ORBX+BP3ztOdUKE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200302154240eucas1p13c93cc0a78c632aa4bc02b5803bb67d1~4hw1Z0j6M0821908219eucas1p1k;
 Mon,  2 Mar 2020 15:42:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4B.20.60679.0792D5E5; Mon,  2
 Mar 2020 15:42:40 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154239eucas1p1a0bec3246c7e62f1698b46fdd5f4d087~4hw0xJhk92477324773eucas1p1s;
 Mon,  2 Mar 2020 15:42:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154239eusmtrp1c9c4771037707be72791a4124d74faf1~4hw0wgOEh2922329223eusmtrp1g;
 Mon,  2 Mar 2020 15:42:39 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-39-5e5d29703169
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C6.20.08375.F692D5E5; Mon,  2
 Mar 2020 15:42:39 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154239eusmtip17adf9ee8f0c96b9ac9baa9a9c1ffce59~4hw0dpRVB1015510155eusmtip1j;
 Mon,  2 Mar 2020 15:42:39 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2] video: remove set but not used variable 'mach64RefFreq'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <d2c1eb0f-2129-a658-b0ab-5c7c1ba203c1@samsung.com>
Date: Mon, 2 Mar 2020 16:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200120063327.43548-1-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87oFmrFxBrtPC1tc+fqezeJE3wdW
 i8u75rBZXHt3hs1izkI2i4WPbrA5sHm0HHnL6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZ
 jROfMBfM5Kn4tPIySwPjD84uRg4OCQETiU9v3LsYuTiEBFYwSnS/P80M4XwBcqZPZoJwPjNK
 NEydAORwgnU8ub6UHSKxnFHi/fNXUM5bRomJK5eyglSxCVhJTGxfxQhiCwsESpyZuoAdxBYR
 UJC41fwCrIFZoIdR4sCXPSwgCV4BO4mu5b/YQY5iEVCROHvaCyQsKhAh8enBYVaIEkGJkzOf
 gJVzClhI7Jy3FMxmFhCXuPVkPhOELS/RvHU22A8SAovYJS71XGSHONtFYu/tk4wQtrDEq+Nb
 oOIyEqcn97BANKxjlPjb8QKqezujxPLJ/9ggqqwl7pz7xQZyHbOApsT6XfoQYUeJ6S+eMkJC
 kk/ixltBiCP4JCZtm84MEeaV6GgTgqhWk9iwbAMbzNqunSuZJzAqzULy2iwk78xC8s4shL0L
 GFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCaZ0/+Of9nBuOtP0iFGAQ5GJR7eAObY
 OCHWxLLiytxDjBIczEoivL6c0XFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnN
 Tk0tSC2CyTJxcEo1MIZd9n37uez6SZ9Yc6av6bsKmEq//k+vqrrbwa17hGFh696JRxZ0P41Q
 nSd+1nPnw/KjMm/qvtzh93I/ZOFwYqbAkaQm77XH0zNmMRXU5FtecC9OXNkl3MZQf0Ds+T+h
 Vf+Du9u6M/MXOnIfzV18wZ7xuUj8m8o73n5H2c0iel99/PDqG9vHbCWW4oxEQy3mouJEAAGa
 1YguAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7r5mrFxBptm61hc+fqezeJE3wdW
 i8u75rBZXHt3hs1izkI2i4WPbrA5sHm0HHnL6nG/+ziTx+dNcgHMUXo2RfmlJakKGfnFJbZK
 0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZjROfMBfM5Kn4tPIySwPjD84u
 Rk4OCQETiSfXl7J3MXJxCAksZZRYcewZYxcjB1BCRuL4+jKIGmGJP9e62CBqXjNK7LlyiQkk
 wSZgJTGxfRUjiC0sEChxZuoCdhBbREBB4lbzCzCbWaCHUeLXvHiI5m5Gibn/57CBJHgF7CS6
 lv9iB1nGIqAicfa0F0hYVCBC4vCOWYwQJYISJ2c+YQGxOQUsJHbOW8oCMVNd4s+8S8wQtrjE
 rSfzmSBseYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yf
 u4kRGFPbjv3cvIPx0sbgQ4wCHIxKPLwBzLFxQqyJZcWVuYcYJTiYlUR4fTmj44R4UxIrq1KL
 8uOLSnNSiw8xmgL9NpFZSjQ5HxjveSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1ML
 Uotg+pg4OKUaGF2Cmw6Wbqhs31e3hn2+6gY30cqXL1/O+7n0zlplr3mVm56WvPz1YpFF716F
 mo+r/2gx/Lo+fWv6zCthv+zfPJv8+afH3XsyOyMTGpVm/31juPHllR6tiGKz3zFn7A+pzD1/
 WPiD57T+mlv7TymfEGs4ttn86HclvrdHoq4ukHioPWnzT235dT2HlViKMxINtZiLihMBCnfB
 dL8CAAA=
X-CMS-MailID: 20200302154239eucas1p1a0bec3246c7e62f1698b46fdd5f4d087
X-Msg-Generator: CA
X-RootMTR: 20200120063426eucas1p278d9f947fad536a5af16356afddab0e4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200120063426eucas1p278d9f947fad536a5af16356afddab0e4
References: <CGME20200120063426eucas1p278d9f947fad536a5af16356afddab0e4@eucas1p2.samsung.com>
 <20200120063327.43548-1-yukuai3@huawei.com>
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
Cc: zhengbin13@huawei.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yi.zhang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMjAvMjAgNzozMyBBTSwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9hdHkv
bWFjaDY0X2d4LmM6IEluIGZ1bmN0aW9uIOKAmGF0eV92YXJfdG9fcGxsXzgzOTjigJk6Cj4gZHJp
dmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2d4LmM6NjIxOjM2OiB3YXJuaW5nOiB2YXJpYWJs
ZQo+IOKAmG1hY2g2NFJlZkZyZXHigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KPiAKPiBJdCBpcyBuZXZlciB1c2VkLCBhbmQgc28gY2FuIGJlIHJlbW92ZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKUGF0Y2gg
cXVldWVkIGZvciB2NS43LCB0aGFua3MuCiAKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJv
bmljcwoKPiAtLS0KPiBjaGFuZ2VzIGluIFYyOgo+ICBGaXggdGhlIG1pc3Rha2UgdGhhdCBkZWZp
bml0aW9uIG9mICdtYWNoNjRNaW5GcmVxJyBhbmQgJ21hY2g2NE1heEZyZXEnCj4gIHdhcyByZW1v
dmVkLgo+IAo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9tYWNoNjRfZ3guYyB8IDMgKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2d4LmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9tYWNoNjRfZ3guYwo+IGluZGV4IDI3Y2I2NWZhMmJhMi4uOWMzN2UyOGZi
NzhiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9neC5jCj4g
KysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2d4LmMKPiBAQCAtNjE4LDE0ICs2
MTgsMTMgQEAgc3RhdGljIGludCBhdHlfdmFyX3RvX3BsbF84Mzk4KGNvbnN0IHN0cnVjdCBmYl9p
bmZvICppbmZvLCB1MzIgdmNsa19wZXIsCj4gIAl1MzIgbWh6MTAwOwkJLyogaW4gMC4wMSBNSHog
Ki8KPiAgCXUzMiBwcm9ncmFtX2JpdHM7Cj4gIAkvKiB1MzIgcG9zdF9kaXZpZGVyOyAqLwo+IC0J
dTMyIG1hY2g2NE1pbkZyZXEsIG1hY2g2NE1heEZyZXEsIG1hY2g2NFJlZkZyZXE7Cj4gKwl1MzIg
bWFjaDY0TWluRnJlcSwgbWFjaDY0TWF4RnJlcTsKPiAgCXUxNiBtLCBuLCBrID0gMCwgc2F2ZV9t
LCBzYXZlX24sIHR3b1RvS3RoOwo+ICAKPiAgCS8qIENhbGN1bGF0ZSB0aGUgcHJvZ3JhbW1pbmcg
d29yZCAqLwo+ICAJbWh6MTAwID0gMTAwMDAwMDAwIC8gdmNsa19wZXI7Cj4gIAltYWNoNjRNaW5G
cmVxID0gTUlOX0ZSRVFfMjU5NTsKPiAgCW1hY2g2NE1heEZyZXEgPSBNQVhfRlJFUV8yNTk1Owo+
IC0JbWFjaDY0UmVmRnJlcSA9IFJFRl9GUkVRXzI1OTU7CS8qIDE0LjMyIE1IeiAqLwo+ICAKPiAg
CXNhdmVfbSA9IDA7Cj4gIAlzYXZlX24gPSAwOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
