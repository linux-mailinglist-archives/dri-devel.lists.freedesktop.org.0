Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8A3843D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C80892E0;
	Fri,  7 Jun 2019 06:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830B0892E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:20:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607062017euoutp01ac916828c7985bb824b3309f3c9206b5~l1kArCcBU0065900659euoutp01f
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:20:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607062017euoutp01ac916828c7985bb824b3309f3c9206b5~l1kArCcBU0065900659euoutp01f
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607062016eucas1p13e01e39232b2e046b86020b06442914e~l1kARAACI3127831278eucas1p1l;
 Fri,  7 Jun 2019 06:20:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AA.D5.04325.0220AFC5; Fri,  7
 Jun 2019 07:20:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607062015eucas1p2cc1e99f263d505335ece18465b09fc80~l1j-UwqW80138001380eucas1p2M;
 Fri,  7 Jun 2019 06:20:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607062015eusmtrp1f5d6b43e61775a65f46adf09c386e0cd~l1j-FJLuw0816608166eusmtrp1Q;
 Fri,  7 Jun 2019 06:20:15 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-eb-5cfa0220a1a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.2B.04146.F120AFC5; Fri,  7
 Jun 2019 07:20:15 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607062014eusmtip29862da6c032a3c2305769c2fe4d67b16~l1j_ZQHn-0647806478eusmtip2V;
 Fri,  7 Jun 2019 06:20:14 +0000 (GMT)
Subject: Re: [PATCH v4 12/15] drm/bridge: tc358767: Introduce
 tc_pllupdate_pllen()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <45e628a7-6c99-7bd4-4e59-3add4b6c1eb0@samsung.com>
Date: Fri, 7 Jun 2019 08:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-13-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SW0gUYRTH+2ZmZ2at1XG19mBitV3oqpaRA5Vl9DAPPhj1YCXklpNZutqO
 WlaQrV221bwi4qppliQlaN5KjSgFp8hbqKGBF0rxUragbWrkmuMo+fY7/3POd/5/+Ghc3aZw
 o8P1MbxBr4vQkg5ETdNM66712J9g7+nfTmyi6SBrbEhQsEbTuIKd7mwk2HevRYzttFlJdiC/
 B2Pvpz+h2I66PJLt7XtPsGUFX8jDK7mOlAcYN5A1h3G1ll6KyzXlKLj+JBHjUme9ObH7JcZN
 VnhwrVktWKDylMOBUD4iPI43ePmFOFwobc6nou3uV+vtmxNQpcaMlDQwe2GuvYgwIwdazZQg
 GE4fweXiF4L2qdrFziSCvJ9WfGklo7NuceopgtRRMyUX4whGut9S0pQLcwKMdbYFdmUCYcJY
 S0qMMzYMOvqUEpPMNpit7JnXaVrF+MFdq6MkE8wmeFhSs3BsNRME/U3lColVjDN8yBkkJFYy
 h8Bcn0TIT66DxOpcXGYNfBkswCQ/wIxSYG0bRLLrozCTMkbK7AJjYhUlszt8zEwmZL4J/SW3
 cXnZhKC6vHYx8n5oFD8pJKP4vOmyOi9Z9gd7YSslycA4Qve4s+zBETJqsnFZVoHprlqe3gD9
 LdWLD2qguN1GpiGtZVkyy7I0lmVpLP/vFiLiGdLwsUJkGC/46PkrnoIuUojVh3mei4qsQPPf
 7KNdtL1Cb/6ebUAMjbSrVBw1E6xW6OKE+MgGBDSudVXFtU8Hq1WhuvhrvCHqjCE2ghca0Fqa
 0GpU11cMnFYzYboY/hLPR/OGpS5GK90SkKFPuUe88nmsqmn10GWXroEi+8nSonszG1948clH
 XNJTyR2Png2dOvkdvt3yKJ9q/bElwPw4JtPoxxZTTmm33xPDxRlcqXI4b414x3PrDddCn5Dt
 qqB9XfTOQn3z81Dh2PHmF9qJ7K8X05JX5WbOnS9ZmyBm2qx7oir8fX3zA8qqtYRwQbd7O24Q
 dP8AO2pLOWIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7ryTL9iDK4tE7Jo7rC1aDrUwGrR
 1PGW1eLHlcMsFgf3HGeyuPL1PZvFg7k3mSw6Jy5ht7i8aw6bxd17J1gs1s+/xebA7XG5r5fJ
 48HU/0weO2fdZfeY3TGT1eN+93Emj/6/Bh7Hb2xn8vi8Sc7j3NSzTAGcUXo2RfmlJakKGfnF
 JbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZa87MZS/4J1Ox+59qA+Nm
 8S5GTg4JAROJSVd2MXcxcnEICSxllJh5+AAjREJcYvf8t8wQtrDEn2tdbBBFrxkl7vXuZwFJ
 CAuESDTt+soOYosI+El0zTvA1MXIwcEs8J1J4iUfRP0xRom+71fA6tkENCX+br7JBlLDK2An
 0faeDyTMIqAiMW/FNrBdogIREmferwAr5xUQlDg58wmYzSlgL9G1uxvMZhZQl/gz7xIzhC0v
 0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefn
 bmIERu+2Yz8372C8tDH4EKMAB6MSD68Dw88YIdbEsuLK3EOMEhzMSiK8ZRd+xAjxpiRWVqUW
 5ccXleakFh9iNAV6biKzlGhyPjCx5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0t
 SC2C6WPi4JRqYOyZkb5GcYriZVaO+t2Z7M92eXwTFc1J3n/swcKepdv563+1m/5c0hGwskde
 olxke7/JxmfrhMsSjZSTjGq5gpvCXZeG8/9Vd/H4Gzr9b0Bua6vUx6hJeiU56qkLbz4LOpbh
 KrZqxhzGm/H7Zl/83N6Q37v7xdQ9RzvPqDm/uKg3dWHDptSZL5RYijMSDbWYi4oTAVF/Lu70
 AgAA
X-CMS-MailID: 20190607062015eucas1p2cc1e99f263d505335ece18465b09fc80
X-Msg-Generator: CA
X-RootMTR: 20190607044647epcas1p4293a910d9ceea202cff1473c5cfe93b6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044647epcas1p4293a910d9ceea202cff1473c5cfe93b6
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044647epcas1p4293a910d9ceea202cff1473c5cfe93b6@epcas1p4.samsung.com>
 <20190607044550.13361-13-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559888417;
 bh=QWgR1Mag9DtnhNNTuCferod2c+G3wcu7+9hJRlFhyTc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Lfw9bJRyXqh9nGHRORNe2F1rezGjZHhqi8ec9X8txiuKHCYqCgn1LQ+pTEHOG23rk
 SttzdKSr0bbuLIoO4CVbbd40HOOhO24KRMX3rPhms2bwKZce/5MV4sN0BDeVeva2b4
 E9gmRvpi1ceS/c681yD5x/5PTQ9brJcdi1gqEurA=
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gdGNfd2FpdF9wbGxf
bG9jaygpIGlzIGFsd2F5cyBjYWxsZWQgYXMgYSBmb2xsb3ctdXAgZm9yIHVwZGF0aW5nCj4gUExM
VVBEQVRFIGFuZCBQTExFTiBiaXQgb2YgYSBnaXZlbiBQTEwgY29udHJvbCByZWdpc3Rlci4gVG8g
c2ltcGxpZnkKPiB0aGluZ3MsIG1lcmdlIHRoZSB0d28gb3BlcmF0aW9uIGludG8gYSBzaW5nbGUg
aGVscGVyIGZ1bmN0aW9uCj4gdGNfcGxsdXBkYXRlX3BsbGVuKCkgYW5kIGNvbnZlcnQgdGhlIHJl
c3Qgb2YgdGhlIGNvZGUgdG8gdXNlIGl0LiBObwo+IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWls
LmNvbT4KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKCkkgZ3Vlc3MgdGNfcGxsdXBkYXRlIHdvdWxkIGJlIE9LIGFzIHdl
bGwsIGJ1dCBzaG9ydGVyLgoKQW55d2F5OgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagoKCj4gQ2M6IEFyY2hpdCBU
YW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KPiBDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVk
LmNvbT4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzog
Q29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiBDYzogQ2hyaXMgSGVhbHkgPGNwaGVh
bHlAZ21haWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyB8IDMwICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2Ny5jCj4gaW5kZXggYWM1NWI1OTI0OWUzLi5jOTk0YzcyZWIzMzAgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jCj4gQEAgLTQ0MywxMCArNDQzLDE4IEBAIHN0YXRpYyB1MzIgdGNf
c3JjY3RybChzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIAlyZXR1cm4gcmVnOwo+ICB9Cj4gIAo+IC1z
dGF0aWMgdm9pZCB0Y193YWl0X3BsbF9sb2NrKHN0cnVjdCB0Y19kYXRhICp0YykKPiArc3RhdGlj
IGludCB0Y19wbGx1cGRhdGVfcGxsZW4oc3RydWN0IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQg
cGxsY3RybCkKPiAgewo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSByZWdtYXBfd3JpdGUodGMt
PnJlZ21hcCwgcGxsY3RybCwgUExMVVBEQVRFIHwgUExMRU4pOwo+ICsJaWYgKHJldCkKPiArCQly
ZXR1cm4gcmV0Owo+ICsKPiAgCS8qIFdhaXQgZm9yIFBMTCB0byBsb2NrOiB1cCB0byAyLjA5IG1z
LCBkZXBlbmRpbmcgb24gcmVmY2xrICovCj4gIAl1c2xlZXBfcmFuZ2UoMzAwMCwgNjAwMCk7Cj4g
Kwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgdGNfcHhsX3BsbF9lbihzdHJ1
Y3QgdGNfZGF0YSAqdGMsIHUzMiByZWZjbGssIHUzMiBwaXhlbGNsb2NrKQo+IEBAIC01NDYsMTMg
KzU1NCw3IEBAIHN0YXRpYyBpbnQgdGNfcHhsX3BsbF9lbihzdHJ1Y3QgdGNfZGF0YSAqdGMsIHUz
MiByZWZjbGssIHUzMiBwaXhlbGNsb2NrKQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICAJLyogRm9y
Y2UgUExMIHBhcmFtZXRlciB1cGRhdGUgYW5kIGRpc2FibGUgYnlwYXNzICovCj4gLQlyZXQgPSBy
ZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgUFhMX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsK
PiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gLQl0Y193YWl0X3BsbF9sb2NrKHRj
KTsKPiAtCj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiB0Y19wbGx1cGRhdGVfcGxsZW4odGMsIFBY
TF9QTExDVFJMKTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCB0Y19weGxfcGxsX2RpcyhzdHJ1Y3Qg
dGNfZGF0YSAqdGMpCj4gQEAgLTYyNiwxNSArNjI4LDEzIEBAIHN0YXRpYyBpbnQgdGNfYXV4X2xp
bmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQo+ICAJICogSW5pdGlhbGx5IFBMTHMgYXJlIGlu
IGJ5cGFzcy4gRm9yY2UgUExMIHBhcmFtZXRlciB1cGRhdGUsCj4gIAkgKiBkaXNhYmxlIFBMTCBi
eXBhc3MsIGVuYWJsZSBQTEwKPiAgCSAqLwo+IC0JcmV0ID0gcmVnbWFwX3dyaXRlKHRjLT5yZWdt
YXAsIERQMF9QTExDVFJMLCBQTExVUERBVEUgfCBQTExFTik7Cj4gKwlyZXQgPSB0Y19wbGx1cGRh
dGVfcGxsZW4odGMsIERQMF9QTExDVFJMKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBlcnI7Cj4g
LQl0Y193YWl0X3BsbF9sb2NrKHRjKTsKPiAgCj4gLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJl
Z21hcCwgRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKPiArCXJldCA9IHRjX3BsbHVw
ZGF0ZV9wbGxlbih0YywgRFAxX1BMTENUUkwpOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycjsK
PiAtCXRjX3dhaXRfcGxsX2xvY2sodGMpOwo+ICAKPiAgCXJldCA9IHRjX3BvbGxfdGltZW91dCh0
YywgRFBfUEhZX0NUUkwsIFBIWV9SRFksIFBIWV9SRFksIDEsIDEwMDApOwo+ICAJaWYgKHJldCA9
PSAtRVRJTUVET1VUKSB7Cj4gQEAgLTkxNCwxNSArOTE0LDEzIEBAIHN0YXRpYyBpbnQgdGNfbWFp
bl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4g
IAkvKiBQTEwgc2V0dXAgKi8KPiAtCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBEUDBf
UExMQ1RSTCwgUExMVVBEQVRFIHwgUExMRU4pOwo+ICsJcmV0ID0gdGNfcGxsdXBkYXRlX3BsbGVu
KHRjLCBEUDBfUExMQ1RSTCk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLQl0Y193
YWl0X3BsbF9sb2NrKHRjKTsKPiAgCj4gLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwg
RFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKPiArCXJldCA9IHRjX3BsbHVwZGF0ZV9w
bGxlbih0YywgRFAxX1BMTENUUkwpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+IC0J
dGNfd2FpdF9wbGxfbG9jayh0Yyk7Cj4gIAo+ICAJLyogUmVzZXQvRW5hYmxlIE1haW4gTGlua3Mg
Ki8KPiAgCWRwX3BoeV9jdHJsIHw9IERQX1BIWV9SU1QgfCBQSFlfTTFfUlNUIHwgUEhZX00wX1JT
VDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
