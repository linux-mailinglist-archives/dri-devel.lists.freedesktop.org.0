Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFF12D77F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AF289F2E;
	Tue, 31 Dec 2019 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48489333
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 09:35:27 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191230093525euoutp01bdf34a3732891907ac21edd5ad265aab~lHHMn24wc1035210352euoutp01l
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 09:35:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191230093525euoutp01bdf34a3732891907ac21edd5ad265aab~lHHMn24wc1035210352euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577698525;
 bh=Xypm1AJvMupF3z7nKOYeVDuwvHXqOAOdFl7YrwTD918=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=cCcn6fejyXueb5UOEl5uzqv5Z2p0XgGZ0U8RwY4hNGAHFDvnetTQEoza6GiI9tgS3
 p85hSIIszSwoOfodTyVToyGy+XRTnT5BoHNRpfKU9FOEgasBBvNsc6AZJpBEbgfYqE
 +d6Aq2FeufUHHdeeNG2Z7pgMjImv5q0vVl2PVwnY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191230093525eucas1p27718806b19626b7b45579c53cd1f6948~lHHMWm6Uh2788427884eucas1p2H;
 Mon, 30 Dec 2019 09:35:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 59.09.60679.CD4C90E5; Mon, 30
 Dec 2019 09:35:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191230093524eucas1p171d0a5c805100c5cddc807a27c2f7657~lHHL8EVQj1988119881eucas1p1L;
 Mon, 30 Dec 2019 09:35:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191230093524eusmtrp2235b15ad248353efa1cbe6e829e56c25~lHHL2J17s0819408194eusmtrp2u;
 Mon, 30 Dec 2019 09:35:24 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-6f-5e09c4dc89c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.0F.08375.CD4C90E5; Mon, 30
 Dec 2019 09:35:24 +0000 (GMT)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20191230093523eusmtip1975ed3256410df9f51c198561a7c2d7d~lHHLE1W_J1785117851eusmtip1g;
 Mon, 30 Dec 2019 09:35:23 +0000 (GMT)
Message-ID: <43b0e5d3fc28c48e139c5fbc2120903d678904a0.camel@samsung.com>
Subject: Re: [RFC PATCH v3 7/7] drm: exynos: mixer: Add interconnect support
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 30 Dec 2019 10:35:21 +0100
In-Reply-To: <6e8aa13a-c831-a7ee-70d3-f6b08fe6fbc3@samsung.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTURzHObu7d3ejzesU/KG9HKgUpVaSBworCLqURAYRhForLyb5WLvq
 1IJsgfQgG67StlCzUPHtWqXDXjKzLF2hqGlm0Qul15gJZWm73oX99z3f3+/z/Z4DhybUvWQw
 nZaZzekztekaSiG9/ehn3+oxpzw52gy4tayZxENTn0hc4ewj8cCPbxQuvWujcMm4SYpdrhYZ
 rh1zk9j2bpDE/Y6rFPacdyJc5ronwY3OMRkePVlL4TLzBLXZj7XVnaHYV4MdFDt+rlvC3rxx
 gm392iZhi+11iPXYlu6S7VNsTOHS03I5fVTcAcXhopoBQucJzZu5/xYVIlPIWSSngYmBeuNr
 maDVTC2C6X6/s0jh1VMIjD0vKPHgQWA22ch/hKvyGSkOahC8N13ybX1E0NjehIQtJcNCYZeD
 EHQAEw9FxhapoClmE/SOTksEIJCZQPBh1jpPE8wIgo4LT+c7pEwYXHSfmaflXuLl8zmJ2L0K
 vvQUe5Nob4M//GkLEGyCWQanblkJIQcYtwxmH/YT4v5W6DB3+XQATHbbZaJeDHPtFb5MHj60
 j5MiXIjAVu30ARvgVd8vSigjmBXQ7IgS7S3w2dVKCjYwKhj+4i/eQQUlt0sJ0VbC6SK1KDXg
 uKISQQBj/aAvm4WqxmKZCYVaFt5i+e8tloXWSkTUoSAuh89I5fi1mZwhktdm8DmZqZGHsjJs
 yPvJns52T7Uhx++DnYihkWaRsqyUTlaT2lw+P6MTAU1oApUxifJktTJFm1/A6bP263PSOb4T
 hdBSTZByXdVEkppJ1WZzRzhOx+n/TSW0PLgQRZYq8jzteLnlprFa9WQPvRPlTz+eGfme+ybc
 PlESoTw+mRfWtTcpJetr9P5wyfo777NvLTJeDrLp3FV4ya+7caNV5epru10Gp/xHg2Eofq6O
 m9I1jFDXF4dYuURrcGxRyIXtdNiW8m0bwppidxyd8S+I8xgiXqYdsz9IyEl4NqyR8oe1a1YS
 el77F9SeV3VgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xu7p3jnDGGeyfJGOxccZ6VovrX56z
 Wsw/co7V4srX92wW0/duYrOYdH8Ci8X58xvYLVbc/chqsenxNVaLy7vmsFl87j3CaDHj/D4m
 i7VH7rJb3G5cwWYxY/JLNgd+j02rOtk87lzbw+Zxv/s4k8fmJfUeG9/tYPLo27KK0ePzJrkA
 9ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jLbl
 V5gLPitW/N7/kLGBcYJ0FyMnh4SAicT5BWdYuxi5OIQEljJKnHu+ghUiISHxcf0NKFtY4s+1
 LjYQW0jgCaPErSYwm1fAQ6Lh6C5mEFtYwEeirWkDC4jNJmAvcfb2NyaQoSICrxglWid8YgZx
 mAXuMEo0fnwE1sEioCox5WMnmM0J1HHzwn8miDM+M0ocuLyeCSTBLKAp0br9NzvEGToSb0/1
 Aa3gAFotKPF3hzBEibxE89bZzBMYBWch6ZiFUDULSdUCRuZVjCKppcW56bnFhnrFibnFpXnp
 esn5uZsYgXG67djPzTsYL20MPsQowMGoxMM7YzpHnBBrYllxZe4hRgkOZiURXpMYzjgh3pTE
 yqrUovz4otKc1OJDjKZA/0xklhJNzgemkLySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp
 2ampBalFMH1MHJxSDYz5u11qb65Lln1++ym7vvzWlli1i10f3MvMNr1oXVRQ1j/ZfYXDozta
 t9ZHF/1bpHpP2DXSZ2dHKfPVk6ufbT+Q3bPJpd41favihY2xl+N3b7vRoXjn5rWHO7c8jq34
 t3Hdpj/3l7THGb37Vso6M/394/bYttjUtPS71+6eV1xWtPbK25oE9hXTlViKMxINtZiLihMB
 yMmhb+kCAAA=
X-CMS-MailID: 20191230093524eucas1p171d0a5c805100c5cddc807a27c2f7657
X-Msg-Generator: CA
X-RootMTR: 20191220120146eucas1p22a7b0457be4f378b113f67dc25f2eba7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120146eucas1p22a7b0457be4f378b113f67dc25f2eba7
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120146eucas1p22a7b0457be4f378b113f67dc25f2eba7@eucas1p2.samsung.com>
 <20191220115653.6487-8-a.swigon@samsung.com>
 <6e8aa13a-c831-a7ee-70d3-f6b08fe6fbc3@samsung.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDIwMTktMTItMjQgYXQgMTM6NTYgKzA5MDAsIElua2kgRGFlIHdyb3RlOgo+
IEhpLAo+IAo+IDE5LiAxMi4gMjAuIOyYpO2bhCA4OjU27JeQIEFydHVyIMWad2lnb8WEIOydtCjq
sIApIOyTtCDquIA6Cj4gPiBGcm9tOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggYWRkcyBpbnRlcmNvbm5lY3Qgc3VwcG9ydCB0
byBleHlub3MtbWl4ZXIuIFRoZSBtaXhlciB3b3Jrcwo+ID4gdGhlIHNhbWUgYXMgYmVmb3JlIHdo
ZW4gQ09ORklHX0lOVEVSQ09OTkVDVCBpcyAnbicuCj4gPiAKPiA+IENvLWRldmVsb3BlZC1ieTog
QXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
QXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDcxICsrKysrKysrKysrKysr
KysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfbWl4ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKPiA+
IGluZGV4IDZjZmRiOTVmZWYyZi4uYTdlNzI0MGEwNTVmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+ID4gQEAgLTEzLDYgKzEzLDcgQEAKPiA+ICAjaW5jbHVk
ZSA8bGludXgvY29tcG9uZW50Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcmNvbm5lY3Qu
aD4KPiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L2lycS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+IEBAIC05Nyw2ICs5OCw3
IEBAIHN0cnVjdCBtaXhlcl9jb250ZXh0IHsKPiA+ICAJc3RydWN0IGV4eW5vc19kcm1fY3J0Ywkq
Y3J0YzsKPiA+ICAJc3RydWN0IGV4eW5vc19kcm1fcGxhbmUJcGxhbmVzW01JWEVSX1dJTl9OUl07
Cj4gPiAgCXVuc2lnbmVkIGxvbmcJCWZsYWdzOwo+ID4gKwlzdHJ1Y3QgaWNjX3BhdGgJCSpzb2Nf
cGF0aDsKPiA+ICAKPiA+ICAJaW50CQkJaXJxOwo+ID4gIAl2b2lkIF9faW9tZW0JCSptaXhlcl9y
ZWdzOwo+ID4gQEAgLTkzMSw2ICs5MzMsNDAgQEAgc3RhdGljIHZvaWQgbWl4ZXJfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IGV4eW5vc19kcm1fY3J0YyAqY3J0YykKPiA+ICAJbWl4ZXJfcmVnX3dyaXRl
bWFzayhtaXhlcl9jdHgsIE1YUl9JTlRfRU4sIDAsIE1YUl9JTlRfRU5fVlNZTkMpOwo+ID4gIH0K
PiA+ICAKPiA+ICtzdGF0aWMgdm9pZCBtaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aChzdHJ1Y3Qg
ZXh5bm9zX2RybV9jcnRjICpjcnRjKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKm1vZGUgPSAmY3J0Yy0+YmFzZS5zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKPiA+ICsJc3RydWN0
IG1peGVyX2NvbnRleHQgKmN0eCA9IGNydGMtPmN0eDsKPiA+ICsJdW5zaWduZWQgbG9uZyBidywg
YmFuZHdpZHRoID0gMDsKPiA+ICsJaW50IGksIGosIHN1YjsKPiA+ICsKPiA+ICsJaWYgKCFjdHgt
PnNvY19wYXRoKQo+ID4gKwkJcmV0dXJuOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgTUlY
RVJfV0lOX05SOyBpKyspIHsKPiA+ICsJCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gJmN0eC0+
cGxhbmVzW2ldLmJhc2U7Cj4gPiArCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3Jt
YXQ7Cj4gPiArCj4gPiArCQlpZiAocGxhbmUtPnN0YXRlICYmIHBsYW5lLT5zdGF0ZS0+Y3J0YyAm
JiBwbGFuZS0+c3RhdGUtPmZiKSB7Cj4gPiArCQkJZm9ybWF0ID0gcGxhbmUtPnN0YXRlLT5mYi0+
Zm9ybWF0Owo+ID4gKwkJCWJ3ID0gbW9kZS0+aGRpc3BsYXkgKiBtb2RlLT52ZGlzcGxheSAqCj4g
PiArCQkJCQkJCWRybV9tb2RlX3ZyZWZyZXNoKG1vZGUpOwo+ID4gKwkJCWlmIChtb2RlLT5mbGFn
cyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQo+ID4gKwkJCQlidyAvPSAyOwo+ID4gKwkJCWZv
ciAoaiA9IDA7IGogPCBmb3JtYXQtPm51bV9wbGFuZXM7IGorKykgewo+ID4gKwkJCQlzdWIgPSBq
ID8gKGZvcm1hdC0+dnN1YiAqIGZvcm1hdC0+aHN1YikgOiAxOwo+ID4gKwkJCQliYW5kd2lkdGgg
Kz0gZm9ybWF0LT5jcHBbal0gKiBidyAvIHN1YjsKPiA+ICsJCQl9Cj4gPiArCQl9Cj4gPiArCX0K
PiA+ICsKPiA+ICsJLyogYWRkIDIwJSBzYWZldHkgbWFyZ2luICovCj4gPiArCWJhbmR3aWR0aCA9
IGJhbmR3aWR0aCAvIDQgKiA1Owo+ID4gKwo+ID4gKwlkZXZfZGJnKGN0eC0+ZGV2LCAiZXh5bm9z
LW1peGVyOiBzYWZlIGJhbmR3aWR0aCAlbGQgQnBzXG4iLCBiYW5kd2lkdGgpOwo+ID4gKwlpY2Nf
c2V0X2J3KGN0eC0+c29jX3BhdGgsIEJwc190b19pY2MoYmFuZHdpZHRoKSwgMCk7Cj4gPiArfQo+
ID4gKwo+ID4gIHN0YXRpYyB2b2lkIG1peGVyX2F0b21pY19iZWdpbihzdHJ1Y3QgZXh5bm9zX2Ry
bV9jcnRjICpjcnRjKQo+ID4gIHsKPiA+ICAJc3RydWN0IG1peGVyX2NvbnRleHQgKmN0eCA9IGNy
dGMtPmN0eDsKPiA+IEBAIC05ODIsNiArMTAxOCw3IEBAIHN0YXRpYyB2b2lkIG1peGVyX2F0b21p
Y19mbHVzaChzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjKQo+ID4gIAlpZiAoIXRlc3RfYml0
KE1YUl9CSVRfUE9XRVJFRCwgJm1peGVyX2N0eC0+ZmxhZ3MpKQo+ID4gIAkJcmV0dXJuOwo+ID4g
IAo+ID4gKwltaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aChjcnRjKTsKPiA+ICAJbWl4ZXJfZW5h
YmxlX3N5bmMobWl4ZXJfY3R4KTsKPiA+ICAJZXh5bm9zX2NydGNfaGFuZGxlX2V2ZW50KGNydGMp
Owo+ID4gIH0KPiA+IEBAIC0xMDI5LDYgKzEwNjYsNyBAQCBzdGF0aWMgdm9pZCBtaXhlcl9kaXNh
YmxlKHN0cnVjdCBleHlub3NfZHJtX2NydGMgKmNydGMpCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBN
SVhFUl9XSU5fTlI7IGkrKykKPiA+ICAJCW1peGVyX2Rpc2FibGVfcGxhbmUoY3J0YywgJmN0eC0+
cGxhbmVzW2ldKTsKPiA+ICA+ICsJbWl4ZXJfc2V0X21lbW9yeV9iYW5kd2lkdGgoY3J0Yyk7Cj4g
Cj4gWW91ciBpbnRlbnRpb24gaXMgdG8gc2V0IHBlYWsgYW5kIGF2ZXJhZ2UgYmFuZHdpZHRoIHRv
IDAgYXQgZGlzYWJsaW5nIG1peGVyIGRldmljZT8KClllcy4gSW4gZ2VuZXJhbCwgc2V0dGluZyB0
aGUgcmVxdWVzdGVkIGJhbmR3aWR0aCB0byB6ZXJvIG1lYW5zICJkbyBub3Qgb3ZlcnJpZGUKdGhl
IGRldmZyZXEgc2V0dGluZyIgYmVjYXVzZSBvbmx5IGNvbnN0cmFpbnRzIG9mIHR5cGUgREVWX1BN
X1FPU19NSU5fRlJFUVVFTkNZCmFyZSB1c2VkIChjZi4gcGF0Y2ggMDUgb2YgdGhpcyBzZXJpZXMp
LiBJIHdpbGwgbWFrZSBzdXJlIHRvIHJlZmxlY3QgdGhhdCBpbiB0aGUKY29tbWl0IG1lc3NhZ2Uu
CgpNb3Jlb3ZlciwgdGhpcyBSRkMgZG9lcyBub3QgcmVhbGx5IG1ha2UgdXNlIG9mIHRoZSBwZWFr
IGJhbmR3aWR0aCAoeWV0KS4gSXQgaXMKc2V0IHRvIHplcm8gaW4gdGhpcyBwYXRjaCBhbmQgaWdu
b3JlZCBpbiBwYXRjaCAwNSAoY2YuIGV4eW5vc19idXNfaWNjX3NldCgpKS4KT25seSB0aGUgYXZl
cmFnZSBiYW5kd2lkdGggaXMgdHJhbnNsYXRlZCB0byBhIG1pbmltdW0gZnJlcXVlbmN5IGNvbnN0
cmFpbnQsCm92ZXJyaWRpbmcgZGV2ZnJlcSBpZiBuZWNlc3NhcnkuCgpBIHBvc3NpYmxlIG1vZGlm
aWNhdGlvbiB0byBtaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aCgpIGNvdWxkIGJlOgotIGJhbmR3
aWR0aCA9IGJhbmR3aWR0aCAvIDQgKiA1OworIHBlYWtfYmFuZHdpZHRoID0gYmFuZHdpZHRoIC8g
NCAqIDU7CmluIG1peGVyX3NldF9tZW1vcnlfYmFuZHdpZHRoKCkgcGx1cyBzb21lIGFkZGl0aW9u
YWwgbG9naWMgaW4gZXh5bm9zX2J1c19pY2Nfc2V0KCkuCgpCZXN0IHJlZ2FyZHMsCi0tIApBcnR1
ciDFmndpZ2/FhApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25p
Y3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
