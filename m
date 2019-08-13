Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F518BA2F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E966E132;
	Tue, 13 Aug 2019 13:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48C6E132
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:30:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190813133032euoutp0108871b50ae61257e8e0d5843764acdbf~6fpzfprmr2028920289euoutp01e
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:30:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190813133032euoutp0108871b50ae61257e8e0d5843764acdbf~6fpzfprmr2028920289euoutp01e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190813133032eucas1p23eec325b72a4db20801126d9312b19fb~6fpzGl_3S1030310303eucas1p2g;
 Tue, 13 Aug 2019 13:30:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F0.DF.04469.77BB25D5; Tue, 13
 Aug 2019 14:30:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190813133031eucas1p18e366022ea9fffdfcbf46ef861e32042~6fpyR-aZ63121731217eucas1p1q;
 Tue, 13 Aug 2019 13:30:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190813133031eusmtrp2177d46a66897df044aae036871f2f4ec~6fpyCfj2i1093610936eusmtrp2K;
 Tue, 13 Aug 2019 13:30:31 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-5b-5d52bb77c772
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E3.37.04166.77BB25D5; Tue, 13
 Aug 2019 14:30:31 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190813133030eusmtip189c92098638cc37e3935c84922b8c942~6fpxxPojJ2926929269eusmtip1d;
 Tue, 13 Aug 2019 13:30:30 +0000 (GMT)
Subject: Re: [PATCH 09/16] fbdev: remove w90x900/nuc900 platform drivers
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <cc732000-a147-bec2-1082-7bf58ee8f309@samsung.com>
Date: Tue, 13 Aug 2019 15:30:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809202749.742267-10-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7rlu4NiDY48tbL4O+kYu8WVr+/Z
 LE70fWC1uLxrDpvF4+t/2BxYPX7/msTosWlVJ5vH/e7jTB6fN8kFsERx2aSk5mSWpRbp2yVw
 Zfxa18xaMI+rYtbExWwNjD/Zuxg5OSQETCSmbLnHCGILCaxglLi1Q7SLkQvI/sIoMf3KaTYI
 5zOjxM79L1hgOr5faWaESCxnlFh+YiorhPOWUWLyr1tAGQ4OYQEPifal4iCmiIChROdMfhCT
 WSBBYvciM5AxbAJWEhPbV4Et5hWwk3i8+iLYQSwCqhLTfp4Hs0UFIiTuH9vAClEjKHFy5hMW
 kDGcAqYSk8+Ig4SZBcQlbj2ZzwRhy0tsfzuHGeQYCYF57BKLlh5hhjjZRaLp2XEmCFtY4tXx
 LVDPy0j83wnSDNKwjlHib8cLqO7tQH9N/scGUWUtcfj4RVaIBzQl1u/Shwg7Stz8NJkZJCwh
 wCdx460gxBF8EpO2TYcK80p0tAlBVKtJbFi2gQ1mbdfOlcwTGJVmIflsFpJ3ZiF5ZxbC3gWM
 LKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzEC08vpf8c/7WD8einpEKMAB6MSD2/AlqBY
 IdbEsuLK3EOMEhzMSiK8l0yAQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqem
 FqQWwWSZODilGhidcsWdNy5nTVD5lX19KuOGLxVbZouvWtt5afaRpMDiplNK5f3HPn5cNWvP
 sbKDMy7/vPpOa8KzY7IOv5Y2lRzZ/Y8vaeY06zP7Q7JS3yYflVnwea1FXt5Z3UgBkVdPpy1W
 WRZc5CIas+Dmw20rlz2dmze7W/RS1aX6HNtTl72PbPvTOsH//eWSWUosxRmJhlrMRcWJAN+u
 PQ8rAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7rlu4NiDdpesVr8nXSM3eLK1/ds
 Fif6PrBaXN41h83i8fU/bA6sHr9/TWL02LSqk83jfvdxJo/Pm+QCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mn6ta2YtmMdVMWviYrYGxp/s
 XYycHBICJhLfrzQzdjFycQgJLGWUuHBgNnMXIwdQQkbi+PoyiBphiT/Xutggal4zSuy6NY8F
 pEZYwEOifak4iCkiYCjROZMfpJxZIEFixdt2VojyTYwS9ycuZwFJsAlYSUxsX8UIYvMK2Ek8
 Xn0R7AYWAVWJaT/Pg9miAhESZ96vYIGoEZQ4OfMJ2CpOAVOJyWfEIearS/yZd4kZwhaXuPVk
 PhOELS+x/e0c5gmMQrOQdM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525i
 BEbUtmM/N+9gvLQx+BCjAAejEg9vwJagWCHWxLLiytxDjBIczEoivJdMgEK8KYmVValF+fFF
 pTmpxYcYTYF+m8gsJZqcD4z2vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
 fUwcnFINjJzuv1KPlL8PVCjzXn/2a8/nNUenWud/ebXr/Y3FBfPS3RQDH/xNianMMeQNe9H5
 18rlBtNNMb/0nwdMp300yQx4tVja/kxTS4TRhF1ds55cWjXDyXj3zL9pV4zln8pPiyr7caDv
 9/MP19ljG6/tzWoVzNCdpHJskYb7N4HzPj4SUuEyNn3rriqxFGckGmoxFxUnAgDaMNmZvgIA
 AA==
X-CMS-MailID: 20190813133031eucas1p18e366022ea9fffdfcbf46ef861e32042
X-Msg-Generator: CA
X-RootMTR: 20190809202857epcas2p14ab10d8ce2e50647671ab8c0ded385a8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190809202857epcas2p14ab10d8ce2e50647671ab8c0ded385a8
References: <20190809202749.742267-1-arnd@arndb.de>
 <CGME20190809202857epcas2p14ab10d8ce2e50647671ab8c0ded385a8@epcas2p1.samsung.com>
 <20190809202749.742267-10-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565703032;
 bh=jHLfqOUF0tHmhW0YtJIRsW8aaDK4tyJuMECOn3sKdck=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DuS2zmqldempkuCPO4FNBbF/Hz9qJSDmPvxVuozIHvnn4M4fPtMZ6tZovxtatJ//2
 9c0+IBPDNkexuuvg26AlM8qqSdu5umMu5tH87CbrTp+SX8CJfd8tiX+WFd6JQt4PDz
 eOGC9zZhodCGoW+1xDNzDPbfTtOn/D3I1JgsvQ0Y=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvOS8xOSAxMDoyNyBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBUaGUgQVJNIHc5MHg5
MDAgcGxhdGZvcm0gaXMgZ2V0dGluZyByZW1vdmVkLCBzbyB0aGlzIGRyaXZlciBpcyBvYnNvbGV0
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQWNr
ZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNv
bT4KCkJUVyB0aGVyZSBpcyBhIHZlcnkgbWlub3IgaXNzdWUgd2l0aCBpbnRlcm5hbCBiaXNlY3Rh
YmlsaXR5IG9mCnRoaXMgcGF0Y2ggc2VyaWVzIChub24taXNzdWUgaW4gcmVhbGl0eSBiZWNhdXNl
IGl0IGFmZmVjdHMgb25seQpjb25maWdzIHdpdGggQVJDSF9XOTBYOTAwPXkgYW5kIHN1Y2ggYXJl
IG5vdyBnb25lLCBqdXN0IEZZSSk6CgphcmNoL2FybS9tYWNoLXc5MHg5MDAvZGV2LmMgKHdoaWNo
IHN0YXlzIGluIHRyZWUgdW50aWwgcGF0Y2ggIzE2CigiQVJNOiByZW1vdmUgdzkweDkwMCBwbGF0
Zm9ybSIpIHVzZXMgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhLwpmaWxlcyByZW1vdmVkIGlu
IHBhdGNoZXMgIzcgKHNwaSksICM5IChmYmRldikgYW5kICMxMCAoa2V5Ym9hcmQpLgoKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKPiAgZHJpdmVycy92aWRlby9mYmRldi9LY29u
ZmlnICAgICAgICAgICAgICAgICAgfCAgMTQgLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2Vm
aWxlICAgICAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbnVjOTAw
ZmIuYyAgICAgICAgICAgICAgIHwgNzYwIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy92
aWRlby9mYmRldi9udWM5MDBmYi5oICAgICAgICAgICAgICAgfCAgNTEgLS0KPiAgaW5jbHVkZS9L
YnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQo+ICBpbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RhdGEvdmlkZW8tbnVjOTAwZmIuaCB8ICA3OSAtLQo+ICA2IGZpbGVzIGNo
YW5nZWQsIDkwNiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlk
ZW8vZmJkZXYvbnVjOTAwZmIuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9m
YmRldi9udWM5MDBmYi5oCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RhdGEvdmlkZW8tbnVjOTAwZmIuaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
