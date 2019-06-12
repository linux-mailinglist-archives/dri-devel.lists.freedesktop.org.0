Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709041D18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BED6892A5;
	Wed, 12 Jun 2019 06:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C869892A5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:59:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612065956euoutp0297b820196e370a119fc221b2e9f6c93f~nYVENMOCy2516225162euoutp02A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:59:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190612065956euoutp0297b820196e370a119fc221b2e9f6c93f~nYVENMOCy2516225162euoutp02A
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190612065955eucas1p1a03daca794582331386dc0412803ad73~nYVDaq0IY0457804578eucas1p1r;
 Wed, 12 Jun 2019 06:59:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.E7.04377.BE2A00D5; Wed, 12
 Jun 2019 07:59:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190612065954eucas1p1f0fb1e6ba7e0dc9b379b7e64073250d2~nYVCf3Wgz0158001580eucas1p13;
 Wed, 12 Jun 2019 06:59:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190612065954eusmtrp20ca65c2769f74f278ffed1acebb36898~nYVCQ29091689216892eusmtrp2i;
 Wed, 12 Jun 2019 06:59:54 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-ac-5d00a2ebe44d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 38.88.04146.AE2A00D5; Wed, 12
 Jun 2019 07:59:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190612065953eusmtip23dd5a0fcc177b296ec03ace8429d3cb3~nYVBn9TCT0540905409eusmtip2U;
 Wed, 12 Jun 2019 06:59:53 +0000 (GMT)
Subject: Re: [PATCH v1 1/2] drm/bridge/synopsys: dsi: add power on/off
 optional phy ops
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Nickey Yang
 <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <742ec787-09e3-a588-f26e-2ea35a218b32@samsung.com>
Date: Wed, 12 Jun 2019 08:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1558952499-15418-2-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGuZ2l00JhLJieoBGpmghRXIJmEg3RRM345iOIBItMEISKraDA
 A4goUFREEKSsKg2gadQiq7JYE6sC7q27tFjiQl1iK4qClTIYefvO+f9zz/mTS2FSNxFIJSr3
 cyqlIllOivG2W+P3l4+e84pZaXEEMsfv3REwV+z9iMk13iUZd1sJxjz5/mWKhkcJprCkQcgY
 3loI5nFXNcloLHaCqZ3UE4zu92fEWPPeE0zTeCtiBsx9OJNfeITcQLPdY/U426l9LWSrCioJ
 9pXlOsm2j1kJdqjIJGBbGrLZhnIzyU5qe3G23VKLsTd6VrEjP7sx1mlYsE2yXbw+nktOTOdU
 KyJ2ind3nx8QpN6WHsy1NWE5qMdPg0QU0OHw7vQHXIPElJRuQnDMkY/4woXA1fKG5AsnAqej
 SPhvJG+iV8gLjQiKzY6ZkU8ITuRNEh6XPx0Fdc2HBB4hgK4m4Eb1j2mBpENgsuU56WEJHQGl
 F78KPIzTS8BerkcenktHgqvTgHjPHLhTacc9LKK3QElt27Qfo4PgcGsVxrMMXtjrppcBXUPB
 uQcdiL91E7icBoJnf/houjqTYT64O+sEPGfDUFMexg8XIGi93Inxwjq4aXo4NUxNbQiBS10r
 +PZGsDjbSU8baF949mkOf4MvnGqrwPi2BAqOSnl3MAwNts48KAPdg+8kzyxUuWzCkyhYOyul
 dlYy7axk2v831CP8ApJxaeqUBE69WskdCFMrUtRpyoSwXXtTDGjqW/b/Mbk6UNdEnBHRFJL7
 SPoq3DukhCJdnZFiREBh8gDJ6j1eMVJJvCIjk1PtjVWlJXNqI5pH4XKZJMvLGi2lExT7uT0c
 l8qp/qkCShSYg+ZnH4nVam7HLXqv+7Uu4JFfDTWyOWefbomsuSZhpWmztz7rTLvelh4ps+oo
 jca7o+xs0Fho6jfjs0FRcGZo5rKgDxlRMd5C760tBS/vbR9aY1bWY+Fu/eLheB+Xw7ywNAm3
 XdgRtlYxtmVpnBHXCLNvFhd1HfApkjxtjH59rSxJjqt3K1aFYiq14i+UZ/tHkgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4Pd1XixhiDa4sULToPXeSyWLjk9OM
 Fk2HTrFZ/N82kdniytf3QNaj16wWnROXsFtsenyN1eLyrjlsFl3XnrBazPu7ltVi6e93jBYP
 Wl6wWqz4uZXR4szVAywW7Z2tbA4CHnu/LWDx2DnrLrvH7I6ZrB53ru1h89j+7QGrx/3u40we
 m5fUeyyZdpXN4++s/Swe26/NY/Y4uM/Q4+mPvcwenzfJBfBG6dkU5ZeWpCpk5BeX2CpFG1oY
 6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GXsXXyGqeCEUEXTwxXMDYz7+LsYOTkk
 BEwkWv7sZwexhQSWMkq8v2IIEReX2D3/LTOELSzx51oXWxcjF1DNa6CahZfBEsICkRLzVzYy
 gSREBBawSrRd7WWEqLoKVDVrExNIFZuApsTfzTfZQGxeATuJyas/gMVZBFQlnkxbywhiiwpE
 SMze1cACUSMocXLmEzCbU8BNYuK8bWD1zALqEn/mXWKGsOUlmrfOhrLFJW49mc80gVFwFpL2
 WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAJLDt2M/NOxgvbQw+xCjA
 wajEw3tg+v8YIdbEsuLK3EOMEhzMSiK8RtkMsUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqc
 D0xQeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGGvm35zZdPdx
 7smzogcPF+3Q+OkmpR+zO0yuZt6iTp1PJ5RM/4d/Yy+ucVCoXXhd2lM6PcLuqcXHbdZacguu
 e8695Hx9yVl5td+bOxtsoo3jd5zeuqt790zzrUqWq6ojhcq7f4edOh748uO1Lwurky6WJ95f
 K7Bpy4PcvWGdS5gtvR0zi3d9O6/EUpyRaKjFXFScCABKikPjGAMAAA==
X-CMS-MailID: 20190612065954eucas1p1f0fb1e6ba7e0dc9b379b7e64073250d2
X-Msg-Generator: CA
X-RootMTR: 20190527102214epcas1p3608b43d2535a8b3ffcab61aa085a990b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190527102214epcas1p3608b43d2535a8b3ffcab61aa085a990b
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
 <CGME20190527102214epcas1p3608b43d2535a8b3ffcab61aa085a990b@epcas1p3.samsung.com>
 <1558952499-15418-2-git-send-email-yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560322796;
 bh=adIOOIL2VicBSBJGZrtq09f7Aw36EV/xU/ajnfWjQ24=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=fUZzpzOufbnqudtoDm4NigRfJv1+aYTAA3CNXwyr4uB6mbSsvbnlM2P8GJCA1aY24
 suck+WDHZ1NZJk2h6GYHW3VLKnJV0CGppiiEckolChPuditUWYpKvY4OlEP3Q5kanM
 ah/vTJVpbe0N7/JRgpKFpp64JbDg4wNZQBkS1sSo=
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

T24gMjcuMDUuMjAxOSAxMjoyMSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+IEFkZCBwb3dlciBv
biAmIG9mZiBvcHRpb25hbCBwaHlzaWNhbCBvcGVyYXRpb24gZnVuY3Rpb25zLCBoZWxwZnVsIHRv
Cj4gcHJvZ3JhbSBzcGVjaWZpYyByZWdpc3RlcnMgb2YgdGhlIERTSSBwaHlzaWNhbCBwYXJ0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAtLQpS
ZWdhcmRzCkFuZHJ6ZWoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1taXBpLWRzaS5jIHwgOCArKysrKysrKwo+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfbWlwaV9k
c2kuaCAgICAgICAgICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
bWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
Ywo+IGluZGV4IGU5MTVhZTguLjViYjY3NmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCj4gQEAgLTc3NSw2ICs3NzUsMTAgQEAgc3RhdGlj
IHZvaWQgZHdfbWlwaV9kc2lfY2xlYXJfZXJyKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQo+ICBz
dGF0aWMgdm9pZCBkd19taXBpX2RzaV9icmlkZ2VfcG9zdF9kaXNhYmxlKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UpCj4gIHsKPiAgCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gYnJpZGdlX3Rv
X2RzaShicmlkZ2UpOwo+ICsJY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgKnBoeV9v
cHMgPSBkc2ktPnBsYXRfZGF0YS0+cGh5X29wczsKPiArCj4gKwlpZiAocGh5X29wcy0+cG93ZXJf
b2ZmKQo+ICsJCXBoeV9vcHMtPnBvd2VyX29mZihkc2ktPnBsYXRfZGF0YS0+cHJpdl9kYXRhKTsK
PiAgCj4gIAkvKgo+ICAJICogU3dpdGNoIHRvIGNvbW1hbmQgbW9kZSBiZWZvcmUgcGFuZWwtYnJp
ZGdlIHBvc3RfZGlzYWJsZSAmCj4gQEAgLTg3NCwxMSArODc4LDE1IEBAIHN0YXRpYyB2b2lkIGR3
X21pcGlfZHNpX2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICBz
dGF0aWMgdm9pZCBkd19taXBpX2RzaV9icmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UpCj4gIHsKPiAgCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gYnJpZGdlX3RvX2RzaShi
cmlkZ2UpOwo+ICsJY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgKnBoeV9vcHMgPSBk
c2ktPnBsYXRfZGF0YS0+cGh5X29wczsKPiAgCj4gIAkvKiBTd2l0Y2ggdG8gdmlkZW8gbW9kZSBm
b3IgcGFuZWwtYnJpZGdlIGVuYWJsZSAmIHBhbmVsIGVuYWJsZSAqLwo+ICAJZHdfbWlwaV9kc2lf
c2V0X21vZGUoZHNpLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsKPiAgCWlmIChkc2ktPnNsYXZlKQo+
ICAJCWR3X21pcGlfZHNpX3NldF9tb2RlKGRzaS0+c2xhdmUsIE1JUElfRFNJX01PREVfVklERU8p
Owo+ICsKPiArCWlmIChwaHlfb3BzLT5wb3dlcl9vbikKPiArCQlwaHlfb3BzLT5wb3dlcl9vbihk
c2ktPnBsYXRfZGF0YS0+cHJpdl9kYXRhKTsKPiAgfQo+ICAKPiAgc3RhdGljIGVudW0gZHJtX21v
ZGVfc3RhdHVzCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5o
IGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmgKPiBpbmRleCA3ZDNkZDY5Li5kZjZl
ZGE2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmgKPiBAQCAtMTQsNiArMTQsOCBAQCBz
dHJ1Y3QgZHdfbWlwaV9kc2k7Cj4gIAo+ICBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wcyB7Cj4g
IAlpbnQgKCppbml0KSh2b2lkICpwcml2X2RhdGEpOwo+ICsJdm9pZCAoKnBvd2VyX29uKSh2b2lk
ICpwcml2X2RhdGEpOwo+ICsJdm9pZCAoKnBvd2VyX29mZikodm9pZCAqcHJpdl9kYXRhKTsKPiAg
CWludCAoKmdldF9sYW5lX21icHMpKHZvaWQgKnByaXZfZGF0YSwKPiAgCQkJICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiAgCQkJICAgICB1bnNpZ25lZCBsb25nIG1v
ZGVfZmxhZ3MsIHUzMiBsYW5lcywgdTMyIGZvcm1hdCwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
