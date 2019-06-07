Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B828538B4F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 15:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4489ABE;
	Fri,  7 Jun 2019 13:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94589ABE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 13:15:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607131520euoutp01b7496cb41312dc28286f1637621a7a2e~l7OZz3c1V2489024890euoutp01C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 13:15:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607131520euoutp01b7496cb41312dc28286f1637621a7a2e~l7OZz3c1V2489024890euoutp01C
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607131519eucas1p21c3579210dd84a3d998a8544d021882c~l7OZJ0M180937409374eucas1p2O;
 Fri,  7 Jun 2019 13:15:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3D.A7.04325.7636AFC5; Fri,  7
 Jun 2019 14:15:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190607131518eucas1p11476b07d3c463eab67b1a5f5c6e20b86~l7OYZ052M1824118241eucas1p1R;
 Fri,  7 Jun 2019 13:15:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607131518eusmtrp1363324c6af5429506a9180f1a7ae434a~l7OYKNikg2955529555eusmtrp1y;
 Fri,  7 Jun 2019 13:15:18 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-85-5cfa6367887e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.D7.04140.6636AFC5; Fri,  7
 Jun 2019 14:15:18 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607131518eusmtip27b7618c46ea9277f6221c0a34ae603a6~l7OXuiCSc1422014220eusmtip2g;
 Fri,  7 Jun 2019 13:15:18 +0000 (GMT)
Subject: Re: [PATCH][next] drm/bridge: sii902x: fix comparision of u32 with
 less than zero
To: Colin King <colin.king@canonical.com>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4454a547-d8f9-2df8-d3fa-2026860a14a9@samsung.com>
Date: Fri, 7 Jun 2019 15:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603142102.27191-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7rpyb9iDM40yFv0njvJZPF7dS+b
 xf9tE5ktrnx9z2bR3dnBarH1lrRF58Ql7BaXd81hc+DwmNXQy+ax99sCFo/ZHTNZPbZ/e8Dq
 cb/7OJPH8RvbmTw+b5ILYI/isklJzcksSy3St0vgyrj0oJO5YBJnxfIzZ9gbGA+zdzFyckgI
 mEi8uPYTyObiEBJYwSgxqfMHG4TzhVHi6t4mZgjnM6PEy6Y5bDAtbyYsg0osZ5R4cqcPquUt
 o8S3Ff/AqoQFYiT+f+tjAkmICDxhlDh7ZSczSIJZwFFi3fw7LCA2m4CmxN/NN8EaeAXsJLrP
 dDKB2CwCKhLLG2YygtiiAhESX3ZuYoSoEZQ4OfMJWC8nUP3bC5egZspLbH87B8oWl7j1ZD7Y
 YgmBQ+wSx75fAGrmAHJcJC78d4Z4QVji1fEt0BCQkTg9uYcFwq6XuL+ihRmit4NRYusGiKMl
 BKwlDh+/yAoyhxno6PW79CHCjhILPmxngRjPJ3HjrSDECXwSk7ZNZ4YI80p0tAlBVCtK3D+7
 FWqguMTSC1/ZJjAqzULy2Cwkz8xC8swshL0LGFlWMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn
 525iBCao0/+Of93BuO9P0iFGAQ5GJR5eD/afMUKsiWXFlbmHGCU4mJVEeMsu/IgR4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwFgVMl+rOf9WSI1qxl8F
 8cXa7/u3n23hzGAtTmLPfF7HvqPVhvmqc+/mn6q9rteX6HKoTmXS21X3lpO33vFNltfc/x2n
 o3dPnHps8/L+Bw4rX8xrtT6+PUpc1jhIgGfa7vqfMQ0RzZma380+/tadqvA4a4bC8z3GpWUf
 ZUTfrdgqk57Iz/BpuRJLcUaioRZzUXEiAGN5mktMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7ppyb9iDB6s07LoPXeSyeL36l42
 i//bJjJbXPn6ns2iu7OD1WLrLWmLzolL2C0u75rD5sDhMauhl81j77cFLB6zO2ayemz/9oDV
 4373cSaP4ze2M3l83iQXwB6lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRv
 Z5OSmpNZllqkb5egl3HpQSdzwSTOiuVnzrA3MB5m72Lk5JAQMJF4M2EZcxcjF4eQwFJGiQUt
 61ghEuISu+e/ZYawhSX+XOtigyh6zSjRsfoEWLewQIzE/299TCAJEYEnjBJXV/9lAkkwCzhK
 rJt/hwXEFhKYyCixuUsWxGYT0JT4u/kmG4jNK2An0X2mE6yeRUBFYnnDTEYQW1QgQmL2rgYW
 iBpBiZMzn4DZnED1by9cYoaYry7xZx6MLS+x/e0cKFtc4taT+UwTGIVmIWmfhaRlFpKWWUha
 FjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMyW3Hfm7Zwdj1LvgQowAHoxIP7wymnzFC
 rIllxZW5hxglOJiVRHjLLvyIEeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YLrIK4k3NDU0
 t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAWD1B6/ULseOfAhVmLZrc3y0m
 voL7aEe8r4XcR5G69nOBz9LWnl8UKuOaZKS62uz54XeNMsZHrCXNfr85vf9i+5e/G1bnL3GP
 LM3gqGx+y3vw7fQ+o5d5MTeaCkQW8BaoyXjfftyQzXv1x6XGyZmH07K5JKtclkpq5RnJHRaz
 9974L0Na7HmPEktxRqKhFnNRcSIANqgxjt8CAAA=
X-CMS-MailID: 20190607131518eucas1p11476b07d3c463eab67b1a5f5c6e20b86
X-Msg-Generator: CA
X-RootMTR: 20190603142108epcas2p4625777c1aaea18257804ca86bcb64454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190603142108epcas2p4625777c1aaea18257804ca86bcb64454
References: <CGME20190603142108epcas2p4625777c1aaea18257804ca86bcb64454@epcas2p4.samsung.com>
 <20190603142102.27191-1-colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559913320;
 bh=XBMlqySQQ/GP/+OsC9coRem3GJuHR0Nx5AZ2FV6C2fk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=K5DlyyTPhfbwtpAcb3xboVmdOO19TPkUwVSd1KqMfVVEnlEMK9D+v0qIE3ZVRCix/
 St6fRrViJ3xihnIacXnCWCBzOCbN99btj3xWhlFFKmiR6EPmxhHGJSZALu6rH519zv
 o8tPl/x8W0G/xTZVacxntpnJqtwOfuG2/0vDCBWs=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuMDYuMjAxOSAxNjoyMSwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gVGhlIGxlc3MgdGhhbiBjaGVjayBm
b3IgdGhlIHZhcmlhYmxlIG51bV9sYW5lcyBpcyBhbHdheXMgZ29pbmcgdG8gYmUKPiBmYWxzZSBi
ZWNhdXNlIHRoZSB2YXJpYWJsZSBpcyBhIHUzMi4gIEZpeCB0aGlzIGJ5IG1ha2luZyBudW1fbGFu
ZXMgYW4KPiBpbnQgYW5kIGFsc28gbWFrZSBsb29wIGluZGV4IGkgYW4gaW50IHRvby4KPgo+IEFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQo+IEZpeGVz
OiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRp
byBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IGQ2Zjk4ZDM4OGFjMi4uMjFhOTQ3NjAz
Yzg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzE5LDcgKzcxOSw3IEBA
IHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5
MDJ4LAo+ICAJCS5tYXhfaTJzX2NoYW5uZWxzID0gMCwKPiAgCX07Cj4gIAl1OCBsYW5lc1s0XTsK
PiAtCXUzMiBudW1fbGFuZXMsIGk7Cj4gKwlpbnQgbnVtX2xhbmVzLCBpOwo+ICAKPiAgCWlmICgh
b2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgIiNzb3VuZC1kYWktY2VsbHMiKSkg
ewo+ICAJCWRldl9kYmcoZGV2LCAiJXM6IE5vIFwiI3NvdW5kLWRhaS1jZWxsc1wiLCBubyBhdWRp
b1xuIiwKClF1ZXVlZCB0byBkcm0tbWlzYy1uZXh0LgoKLS0KUmVnYXJkcwpBbmRyemVqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
