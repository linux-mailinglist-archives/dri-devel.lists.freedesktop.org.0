Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DE2A4454
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883B26EC42;
	Tue,  3 Nov 2020 11:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3320C6EC42
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:32:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201103113243euoutp0152b4b3114562fdeb42490952ac9882ab~D-C1Efxn40569605696euoutp01v
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:32:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201103113243euoutp0152b4b3114562fdeb42490952ac9882ab~D-C1Efxn40569605696euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604403163;
 bh=fReq/5gleB0cci52KJ0pEExEhZgxvPuj7W3jQgkJdxw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=i8x5TOUHnU8xa5Ck6fEa0cVA+SMV1W0JbEi3Bnl2asUlyTC8+qp8WxzIPe+kc+FPB
 b0IEShTPAu6YnhJ688l1mcRFvbZ4rEVkIvICWL7f7q/T1bt32+EnE8PrrteTaoTy6x
 pqn3kyXbTaUF1xBOXFKzaaknHRD0scbd6sJpHGIE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201103113236eucas1p25c4317debfce3dd093e24503f4a02295~D-CuDkbNN0380303803eucas1p25;
 Tue,  3 Nov 2020 11:32:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.82.06456.4DF31AF5; Tue,  3
 Nov 2020 11:32:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201103113235eucas1p282f0b782b066ea7aea385c0d85b53951~D-CtrFiAq0380303803eucas1p24;
 Tue,  3 Nov 2020 11:32:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201103113235eusmtrp2154c224a1b462956fbf31e688ec94053~D-CtqTkmS3132631326eusmtrp2K;
 Tue,  3 Nov 2020 11:32:35 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-7c-5fa13fd4f2d7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.14.06017.3DF31AF5; Tue,  3
 Nov 2020 11:32:35 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201103113234eusmtip1455972894957538c7a51aa7381fdf5ff~D-CsrFtLb2256922569eusmtip1i;
 Tue,  3 Nov 2020 11:32:34 +0000 (GMT)
Subject: Re: [PATCH v7 2/6] interconnect: Add generic interconnect driver
 for Exynos SoCs
To: Chanwoo Choi <cw00.choi@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6cc9a2f8-9d9a-68b7-9f47-e16fefb18d88@samsung.com>
Date: Tue, 3 Nov 2020 12:32:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <88af4e53-6c7a-c2e6-ad28-a9d6bb5bf623@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGc2fa6VApXgqkh4qCDYnFKEjEOIkr6kPji5j4YCQsFUdQaSUd
 QNAHF8CFijag7NLKTiOiiERBBEkBEVkiiAuQxogoGiFYwH2hHY28fef+57/n/MmhSWm/UE4f
 0MazOq06VkGJBfXtX3tWDmy6GrGqroRkrEVpiLmZWyNknk2/FTJGS4+QGZiZpJicplqKybQa
 BExv7w0R099QSDG2DAticnvvE0y1ZUTEDJ2spJi0JouIyc0apzYvVNWaz1Gq4cF7lMqq7yBU
 F+rMSGWrXRIi3CNev4+NPZDI6gI2Ropj2nrKUNygT9KHG53oBHrhmY6caMBBkJ3xk0hHYlqK
 KxG0XG8n7IIUTyOoNnvygg3BrE1P/nNUlhdTvFCBoG+6QsgXUwjyClJF9i43HAqvshocDnes
 hLyfA8jeROIZAs71mpBdoHAgZLRdcLAEb4SipwaHQYB9oe3NFcceHjgcDDdTBXyPK3TmjTrY
 CW+CiR+FDiaxDF6OGgmevSHldgFpHwZ4RgRlD8YQv/c2aDGf/pvBDd531Il49oLfd40Eb0hB
 cL5xSMQXBgTWDtNf9zoY7vk2l5qeG+EHNQ0BdgQcDE8sSh5d4PlHV34HF8iszyH5ZwmcPS3l
 //CF7+Ycgmc56Ed/CwxIkT8vWf68NPnz0uT/H2tCAjOSsQmcJprlArXsEX9OreEStNH+UYc1
 tWju1Lp+dXy6g2ae7G1FmEYKZ8lm1hQhFaoTuWRNKwKaVLhLtnR3hUsl+9TJR1nd4QhdQizL
 taJFtEAhk6wuHg+T4mh1PHuIZeNY3T+VoJ3kJ5BHbHBpNldapN+fZ6uWT+0yPgoJqpI1R0VG
 JqWPfCNWXi6R5nQLv5TLtT7iYpOLUTbW/Liy+bUrFR/Vdejaw3bnY96iGr/ZrXc2rAlfrjy4
 ULn9YOaOuDC9327/UC9j1YK1k+6XPh9bEdNcZT3l0nAmzPtWfcI7vLRv8cTFnY3By44rBFyM
 OnA5qePUfwDMfoauZgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qX7RfGG5xYpmpxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFvMmPySzYHfY9OqTjaPO9f2sHnc7z7O5NG3ZRWjx+dNcgGsUXo2RfmlJakK
 GfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZR88tZSy4plDxesNJ
 xgbGm5JdjJwcEgImEiuWLWLrYuTiEBJYyijxvuswaxcjB1BCSmJ+ixJEjbDEn2tdUDXvGSWO
 nt7OBlIjLBAtMfWDI0iNiICGxMy/VxhBapgFvjJJXN5/BarhC6PE7+uTGUGq2AQMJXqP9oHZ
 vAJ2EvOuTmAGsVkEVCSOPp3LBGKLCsRJ/JjYywZRIyhxcuYTFhCbU8Be4t2fOWA2s4C6xJ95
 l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4
 NC9dLzk/dxMjMIq3Hfu5ZQdj17vgQ4wCHIxKPLwOqQvihVgTy4orcw8xSnAwK4nwOp09HSfE
 m5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cAEk1cSb2hqaG5haWhubG5sZqEkztshcDBGSCA9
 sSQ1OzW1ILUIpo+Jg1OqgfEQX843rliR7mvVoS3Vsnf1D189Z2/KJBy6oz/IksdysWEMs0FP
 cmaZ+KQvs1z2eN3NvXzveMDPhdGfF+/9lGDe5LjL2k3o+vxTVVdXHr31LnimoX/Fnrvz7pzU
 WSNwvmydxZ3om+fEjFY6F7sdM3M4daVNtWTjwcXqLo3H8o1OXdiRy8KXslOJpTgj0VCLuag4
 EQC6appF+AIAAA==
X-CMS-MailID: 20201103113235eucas1p282f0b782b066ea7aea385c0d85b53951
X-Msg-Generator: CA
X-RootMTR: 20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9@eucas1p2.samsung.com>
 <20201030125149.8227-3-s.nawrocki@samsung.com>
 <88af4e53-6c7a-c2e6-ad28-a9d6bb5bf623@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, a.swigon@samsung.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com,
 krzk@kernel.org, georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuMTEuMjAyMCAxMDozNywgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IE9uIDEwLzMwLzIwIDk6
NTEgUE0sIFN5bHdlc3RlciBOYXdyb2NraSB3cm90ZToKPj4gVGhpcyBwYXRjaCBhZGRzIGEgZ2Vu
ZXJpYyBpbnRlcmNvbm5lY3QgZHJpdmVyIGZvciBFeHlub3MgU29DcyBpbiBvcmRlcgo+PiB0byBw
cm92aWRlIGludGVyY29ubmVjdCBmdW5jdGlvbmFsaXR5IGZvciBlYWNoICJzYW1zdW5nLGV4eW5v
cy1idXMiCj4+IGNvbXBhdGlibGUgZGV2aWNlLgo+Pgo+PiBUaGUgU29DIHRvcG9sb2d5IGlzIGEg
Z3JhcGggKG9yIG1vcmUgc3BlY2lmaWNhbGx5LCBhIHRyZWUpIGFuZCBpdHMKPj4gZWRnZXMgYXJl
IHNwZWNpZmllZCB1c2luZyB0aGUgJ3NhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudCcgaW4gdGhl
Cj4gCj4gc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50IC0+IGludGVyY29ubmVjdHM/CgpZZXMs
IEkgd2lsbCByZXBocmFzZSB0aGUgd2hvbGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQncyBhIGJpdCBv
dXRkYXRlZCBub3cuCgpJJ3ZlIGNoYW5nZWQgdGhlIHNlbnRlbmNlIHRvOgoiVGhlIFNvQyB0b3Bv
bG9neSBpcyBhIGdyYXBoIChvciBtb3JlIHNwZWNpZmljYWxseSwgYSB0cmVlKSBhbmQgaXRzCmVk
Z2VzIGFyZSBkZXNjcmliZWQgYnkgc3BlY2lmeWluZyBpbiB0aGUgJ2ludGVyY29ubmVjdHMnIHBy
b3BlcnR5CnRoZSBpbnRlcmNvbm5lY3QgY29uc3VtZXIgcGF0aCBmb3IgZWFjaCBpbnRlcmNvbm5l
Y3QgcHJvdmlkZXIgRFQgbm9kZS4iCgo+PiBEVC4gRHVlIHRvIHVuc3BlY2lmaWVkIHJlbGF0aXZl
IHByb2Jpbmcgb3JkZXIsIC1FUFJPQkVfREVGRVIgbWF5IGJlCj4+IHByb3BhZ2F0ZWQgdG8gZW5z
dXJlIHRoYXQgdGhlIHBhcmVudCBpcyBwcm9iZWQgYmVmb3JlIGl0cyBjaGlsZHJlbi4KPj4KPj4g
RWFjaCBidXMgaXMgbm93IGFuIGludGVyY29ubmVjdCBwcm92aWRlciBhbmQgYW4gaW50ZXJjb25u
ZWN0IG5vZGUgYXMKPj4gd2VsbCAoY2YuIERvY3VtZW50YXRpb24vaW50ZXJjb25uZWN0L2ludGVy
Y29ubmVjdC5yc3QpLCBpLmUuIGV2ZXJ5IGJ1cwo+PiByZWdpc3RlcnMgaXRzZWxmIGFzIGEgbm9k
ZS4gTm9kZSBJRHMgYXJlIG5vdCBoYXJkY29kZWQgYnV0IHJhdGhlcgo+PiBhc3NpZ25lZCBkeW5h
bWljYWxseSBhdCBydW50aW1lLiBUaGlzIGFwcHJvYWNoIGFsbG93cyBmb3IgdXNpbmcgdGhpcwo+
PiBkcml2ZXIgd2l0aCB2YXJpb3VzIEV4eW5vcyBTb0NzLgo+Pgo+PiBGcmVxdWVuY2llcyByZXF1
ZXN0ZWQgdmlhIHRoZSBpbnRlcmNvbm5lY3QgQVBJIGZvciBhIGdpdmVuIG5vZGUgYXJlCj4+IHBy
b3BhZ2F0ZWQgdG8gZGV2ZnJlcSB1c2luZyBkZXZfcG1fcW9zX3VwZGF0ZV9yZXF1ZXN0KCkuIFBs
ZWFzZSBub3RlCj4+IHRoYXQgaXQgaXMgbm90IGFuIGVycm9yIHdoZW4gQ09ORklHX0lOVEVSQ09O
TkVDVCBpcyAnbicsIGluIHdoaWNoCj4+IGNhc2UgYWxsIGludGVyY29ubmVjdCBBUEkgZnVuY3Rp
b25zIGFyZSBuby1vcC4KPj4KPj4gVGhlIGJ1cy13aWR0aCBEVCBwcm9wZXJ0eSBpcyB0byBkZXRl
cm1pbmUgdGhlIGludGVyY29ubmVjdCBkYXRhCj4+IHdpZHRoIGFuZCB0cmFzbGF0ZSByZXF1ZXN0
ZWQgYmFuZHdpZHRoIHRvIGNsb2NrIGZyZXF1ZW5jeSBmb3IgZWFjaAo+PiBidXMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgoK
Pj4gKysrIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvZXh5bm9zL2V4eW5vcy5jCgo+PiArc3RydWN0
IGV4eW5vc19pY2NfcHJpdiB7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2Owo+PiArCj4+ICsJLyog
T25lIGludGVyY29ubmVjdCBub2RlIHBlciBwcm92aWRlciAqLwo+PiArCXN0cnVjdCBpY2NfcHJv
dmlkZXIgcHJvdmlkZXI7Cj4+ICsJc3RydWN0IGljY19ub2RlICpub2RlOwo+PiArCj4+ICsJc3Ry
dWN0IGRldl9wbV9xb3NfcmVxdWVzdCBxb3NfcmVxOwo+PiArCXUzMiBidXNfY2xrX3JhdGlvOwo+
PiArfTsKPj4gKwo+PiArc3RhdGljIHN0cnVjdCBpY2Nfbm9kZSAqZXh5bm9zX2ljY19nZXRfcGFy
ZW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4+ICt7Cj4+ICsJc3RydWN0IG9mX3BoYW5kbGVf
YXJncyBhcmdzOwo+PiArCXN0cnVjdCBpY2Nfbm9kZV9kYXRhICppY2Nfbm9kZV9kYXRhOwo+PiAr
CXN0cnVjdCBpY2Nfbm9kZSAqaWNjX25vZGU7Cj4+ICsJaW50IG51bSwgcmV0Owo+PiArCj4+ICsJ
bnVtID0gb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MobnAsICJpbnRlcmNvbm5lY3RzIiwKPj4g
KwkJCQkJICIjaW50ZXJjb25uZWN0LWNlbGxzIik7Cj4+ICsJaWYgKG51bSA8IDEpCj4+ICsJCXJl
dHVybiBOVUxMOyAvKiBwYXJlbnQgbm9kZXMgYXJlIG9wdGlvbmFsICovCj4+ICsKPj4gKwkvKiBH
ZXQgdGhlIGludGVyY29ubmVjdCB0YXJnZXQgbm9kZSAqLwo+PiArCXJldCA9IG9mX3BhcnNlX3Bo
YW5kbGVfd2l0aF9hcmdzKG5wLCAiaW50ZXJjb25uZWN0cyIsCj4+ICsJCQkJCSIjaW50ZXJjb25u
ZWN0LWNlbGxzIiwgMCwgJmFyZ3MpOwo+PiArCWlmIChyZXQgPCAwKQo+PiArCQlyZXR1cm4gRVJS
X1BUUihyZXQpOwo+PiArCj4+ICsJaWNjX25vZGVfZGF0YSA9IG9mX2ljY19nZXRfZnJvbV9wcm92
aWRlcigmYXJncyk7Cj4+ICsJb2Zfbm9kZV9wdXQoYXJncy5ucCk7Cj4+ICsKPj4gKwlpZiAoSVNf
RVJSKGljY19ub2RlX2RhdGEpKQo+PiArCQlyZXR1cm4gRVJSX0NBU1QoaWNjX25vZGVfZGF0YSk7
Cj4+ICsKPj4gKwlpY2Nfbm9kZSA9IGljY19ub2RlX2RhdGEtPm5vZGU7Cj4+ICsJa2ZyZWUoaWNj
X25vZGVfZGF0YSk7Cj4+ICsKPj4gKwlyZXR1cm4gaWNjX25vZGU7Cj4+ICt9Cj4gCj4gSSBoYXZl
IGEgcXVlc3Rpb24gYWJvdXQgZXh5bm9zX2ljY19nZXRfcGFyZW50KCkuCj4gQXMgSSBjaGVja2Vk
LCB0aGlzIGZ1bmN0aW9uIHJldHVybnMgdGhlIG9ubHkgb25lIGljY19ub2RlCj4gYXMgcGFyZW50
IG5vZGUuIEJ1dCwgYnVzX2Rpc3BsYXkgZHQgbm9kZSBpbiB0aGUgZXh5bm9zNDQxMi5kdHNpCj4g
c3BlY2lmaWVzIHRoZSB0d28gaW50ZXJjb25uZWN0IG5vZGUgYXMgZm9sbG93aW5nIHdpdGggYnVz
X2xlZnRidXMsIGJ1c19kbWMsCj4gCj4gV2hlbiBJIGNoZWNrZWQgdGhlIHJldHVybiB2YWx1ZSBv
ZiBleHlub3NfaWNjX2dldF9wYXJlbnQoKQo+IGR1cmluZyBwcm9iaW5nIGZvciBidXNfZGlzcGxh
eSBkZXZpY2UsIGV4eW5vc19pY2NfZ2V0X3BhcmVudCgpIGZ1bmN0aW9uCj4gb25seSByZXR1cm5z
ICdidXNfbGVmdGJ1cycgaWNjX25vZGUuIERvIHlvdSBuZWVkIHRvIGFkZCB0d28gcGhhbmRsZQo+
IG9mIGljYyBub2RlPwoKWWVzLCBhcyB3ZSB1c2UgdGhlIGludGVyY29ubmVjdCBjb25zdW1lciBi
aW5kaW5ncyB3ZSBuZWVkIHRvIHNwZWNpZnkgYSBwYXRoLAppLmUuIGEgPGluaXRpYXRvciwgdGFy
Z2V0PiBwYWlyLiBXaGVuIHRoZSBwcm92aWRlciBub2RlIGluaXRpYWxpemVzIGl0IHdpbGwKbGlu
ayBpdHNlbGYgdG8gdGhhdCBwYXRoLiBDdXJyZW50bHkgdGhlIHByb3ZpZGVyIGRyaXZlciB1c2Vz
IGp1c3QgdGhlIGZpcnN0IApwaGFuZGxlLgoKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlu
b3M0NDEyLmR0c2kKPiBAQCAtNDcyLDcgKzQ3Miw3IEBACj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzE2MD47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBvcGVyYXRp
bmctcG9pbnRzLXYyID0gPCZidXNfZGlzcGxheV9vcHBfdGFibGU+Owo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGludGVyY29ubmVjdHMgPSA8JmJ1c19sZWZ0YnVzICZidXNfZG1jPjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAgICAgICAgICAgICAgIH07
CgotLSAKUmVnYXJkcywKU3lsd2VzdGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
