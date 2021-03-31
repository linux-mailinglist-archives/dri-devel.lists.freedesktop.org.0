Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8C34FDD5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA4F6E1A2;
	Wed, 31 Mar 2021 10:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792FF6E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:12:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331101238euoutp01b36fbc013cf6b5b50b4cb9d57950907b~xZbKNUHEe2006320063euoutp014
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:12:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210331101238euoutp01b36fbc013cf6b5b50b4cb9d57950907b~xZbKNUHEe2006320063euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617185558;
 bh=IuD+yxbAFDnUrs1IElAd4pJHc//IKV7VHIBWdBNLg1A=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=N9jpzoGNeql5KyEj+t2QnpGC2aWUke8ulhOEy4IOr4sj8HAyvrrW2of+7iNzqKupe
 hx1ik9gjHifGe+k03l2jgQlHzwQrBcKDG+H9JS0R+FRRWo0l/HHuVM43uk/OOoaN5m
 q4keX8fqtUHIKTqYohk8xsRT13iCC57Wszm/aARg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331101238eucas1p2057f863548fde34dbf2ba7bf546fafa9~xZbJyUt8m0678706787eucas1p2Y;
 Wed, 31 Mar 2021 10:12:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 27.F6.09444.61B44606; Wed, 31
 Mar 2021 11:12:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210331101237eucas1p1ae152c11cd6959fa949a181a84a0a2b1~xZbJDxxPn3077430774eucas1p1O;
 Wed, 31 Mar 2021 10:12:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331101237eusmtrp1ee2a22286b721365132450f8d4bf6c73~xZbJC2_rQ2878428784eusmtrp13;
 Wed, 31 Mar 2021 10:12:37 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-4d-60644b163bfc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.4A.08696.51B44606; Wed, 31
 Mar 2021 11:12:37 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331101232eusmtip1bb0d13edb05953affdffa10885f15017~xZbEq2HeB1360313603eusmtip1K;
 Wed, 31 Mar 2021 10:12:32 +0000 (GMT)
Message-ID: <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
Date: Wed, 31 Mar 2021 12:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 10/14] drm/bridge: ti-sn65dsi86: Stop caching the
 EDID ourselves
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7djPc7pi3ikJBmdvcVj0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGRN6j7IXXBCu
 mNGzgrGBcRN/FyMnh4SAiURHxz7mLkYuDiGBFYwSU1qfsEM4XxglPh3dwAThfGaUuD2jlQWm
 pWHuYaiq5YwS81duYoRwXjBKzNraywxSxStgJ3G5pxesg0VAVeLkjDusEHFBiZMzn4DFRQUS
 JFbdWM4EYgsLREqsO/cCrIZZQFyi6ctKVpChIgL/GCVWT3wMdgezwGcmiU9TDoF1sAloSvzd
 fJMNxOYUCJPYsegDM0S3vETz1tlgL0kIXOKUWLDoNzPE4S4SO5ZNh3pCWOLV8S3sELaMxOnJ
 PVDxeon7K1qgmjsYJbZu2AnVbC1x59wvoG0cQBs0Jdbv0ocIO0q8aekEC0sI8EnceCsIcQOf
 xKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQwmUWkv9nIflmFsLeBYwsqxjFU0uL
 c9NTi43yUsv1ihNzi0vz0vWS83M3MQKT5Ol/x7/sYFz+6qPeIUYmDsZDjBIczEoivMIHEhOE
 eFMSK6tSi/Lji0pzUosPMUpzsCiJ8yZtWRMvJJCeWJKanZpakFoEk2Xi4JRqYJpwguvRpv+f
 GkJWxXed1//54iVPBN8MvaWtq2WS+AQur4nZlBNS3tF2PNaAxfph7sJrersDRByf8NzcMaHP
 JftGMhdT3sW/u5wuL5/3I/4yp9xfNSfrRnVN4Y0/LYKWH4xPmmoX9eaAuFP+lW3CvnVWYibL
 J52xWj7d85NznHp1wPRSF6G0ntRprlH2YnGHX7dNMm4OvClReCu3dsvMb7opqhsPaqQ/yuVa
 a/Aub8X8f44J19wffjJUrzTbWGszZVU1x47b9mxn1KfNKZZZPn1ejqs609O+PF/bRPVg5ntL
 Eksua09zmByQl98ktP+RTl6cp7qvZf41lz9bfNncQqJboz5f2PvEbePyruwWJZbijERDLeai
 4kQAeqgr6QEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4XV1R75QEg2c7JCx6z51ksji9/x2L
 xdllB9ksrnx9z2Zx9ftLZouTb66yWHROXMJuMXH/WXaLy7vmsFkc6ou2uPbzMbPFp1kPmS1W
 /NzKaNHeZWPx83obs8XxO0+ZHAQ83t9oZfeY3XCRxWN2x0xWj8V7XjJ5zFl0g9njxIRLTB53
 ru1h89j+7QGrx/3u40weS6ZdZfM40DuZxePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sL
 PSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jAm9R9kLLghXzOhZwdjAuIm/i5GTQ0LARKJh
 7mH2LkYuDiGBpYwSV7e0sEEkxCV2z3/LDGELS/y51gUWFxJ4xiix5moUiM0rYCdxuaeXBcRm
 EVCVODnjDitEXFDi5MwnYHFRgQSJsx/mMYHYwgKREv3zroHFmYHmN31ZyQqyWESggUni0t3F
 TCAOs8BXJomWV0uhTrrDKHFq/xSw1WwCmhJ/N98EszkFwiR2LPrADDHKTKJraxcjhC0v0bx1
 NvMERqFZSC6ZhWTjLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iRGYFLYd+7ll
 B+PKVx/1DjEycTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBwTmaVEk/OBaSmv
 JN7QzMDU0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQYmq5DkrmrP2XWnZPvb
 DuqlreGe8J3nrPnchxf9wjt7/ntHNNjbrmO/u/DxpZqPWg9ElvE4iF1ZaGieO7n6eUzYgwPt
 bcH5+0XSHy+/1MP07c8Wo0PM77gjz1Y5RbxsEj7VHXswf8rSC5M3byjfej5HLKQsfuWhr+Hc
 HOf4+X8Kr02YpXYmsSpO9PMBzulsMsXRS5geFD9Wcl13pWH1zHntzAabojxPpXLd2/Pl/Q/P
 aTq6VzXP87+tiTk7rU+/M+lmTYbF2neGEfVGCf5xidVz/Ri2rZ1wauvRa2znvjBf9r6w60GU
 6tSAZZsap9m2b/9uzjVH50kwj9syIameAyvvrNnfFq++hkWlwWj7zXORSizFGYmGWsxFxYkA
 m6aZjZMDAAA=
X-CMS-MailID: 20210331101237eucas1p1ae152c11cd6959fa949a181a84a0a2b1
X-Msg-Generator: CA
X-RootMTR: 20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5@eucas1p1.samsung.com>
 <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IE5v
dyB0aGF0IHdlIGhhdmUgdGhlIHBhdGNoICgiZHJtL2VkaWQ6IFVzZSB0aGUgY2FjaGVkIEVESUQg
aW4KPiBkcm1fZ2V0X2VkaWQoKSBpZiBlRFAiKSB3ZSBubyBsb25nZXIgbmVlZCB0byBtYWludGFp
biBvdXIgb3duCj4gY2FjaGUuIERyb3AgdGhpcyBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogQW5kcnpl
aiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KClJlZ2FyZHMKQW5kcnplago+IC0tLQo+Cj4g
KG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242
NWRzaTg2LmMgfCAyMiArKysrKysrKystLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS1zbjY1ZHNpODYuYwo+IGluZGV4IDk1NzdlYmQ1OGM0Yy4uYzAzOThkYWFhNGE2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gQEAgLTEyMSw3ICsxMjEsNiBAQAo+
ICAgICogQGRlYnVnZnM6ICAgICAgVXNlZCBmb3IgbWFuYWdpbmcgb3VyIGRlYnVnZnMuCj4gICAg
KiBAaG9zdF9ub2RlOiAgICBSZW1vdGUgRFNJIG5vZGUuCj4gICAgKiBAZHNpOiAgICAgICAgICBP
dXIgTUlQSSBEU0kgc291cmNlLgo+IC0gKiBAZWRpZDogICAgICAgICBEZXRlY3RlZCBFRElEIG9m
IGVEUCBwYW5lbC4KPiAgICAqIEByZWZjbGs6ICAgICAgIE91ciByZWZlcmVuY2UgY2xvY2suCj4g
ICAgKiBAcGFuZWw6ICAgICAgICBPdXIgcGFuZWwuCj4gICAgKiBAZW5hYmxlX2dwaW86ICBUaGUg
R1BJTyB3ZSB0b2dnbGUgdG8gZW5hYmxlIHRoZSBicmlkZ2UuCj4gQEAgLTE0Nyw3ICsxNDYsNiBA
QCBzdHJ1Y3QgdGlfc25fYnJpZGdlIHsKPiAgIAlzdHJ1Y3QgZHJtX2JyaWRnZQkJYnJpZGdlOwo+
ICAgCXN0cnVjdCBkcm1fY29ubmVjdG9yCQljb25uZWN0b3I7Cj4gICAJc3RydWN0IGRlbnRyeQkJ
CSpkZWJ1Z2ZzOwo+IC0Jc3RydWN0IGVkaWQJCQkqZWRpZDsKPiAgIAlzdHJ1Y3QgZGV2aWNlX25v
ZGUJCSpob3N0X25vZGU7Cj4gICAJc3RydWN0IG1pcGlfZHNpX2RldmljZQkJKmRzaTsKPiAgIAlz
dHJ1Y3QgY2xrCQkJKnJlZmNsazsKPiBAQCAtMjY5LDE3ICsyNjcsMTcgQEAgY29ubmVjdG9yX3Rv
X3RpX3NuX2JyaWRnZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAgc3RhdGlj
IGludCB0aV9zbl9icmlkZ2VfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQo+ICAgewo+ICAgCXN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhID0gY29u
bmVjdG9yX3RvX3RpX3NuX2JyaWRnZShjb25uZWN0b3IpOwo+IC0Jc3RydWN0IGVkaWQgKmVkaWQg
PSBwZGF0YS0+ZWRpZDsKPiAtCWludCBudW07Cj4gKwlzdHJ1Y3QgZWRpZCAqZWRpZDsKPiArCWlu
dCBudW0gPSAwOwo+ICAgCj4gLQlpZiAoIWVkaWQpIHsKPiAtCQlwbV9ydW50aW1lX2dldF9zeW5j
KHBkYXRhLT5kZXYpOwo+IC0JCWVkaWQgPSBwZGF0YS0+ZWRpZCA9IGRybV9nZXRfZWRpZChjb25u
ZWN0b3IsICZwZGF0YS0+YXV4LmRkYyk7Cj4gLQkJcG1fcnVudGltZV9wdXQocGRhdGEtPmRldik7
Cj4gLQl9Cj4gKwlwbV9ydW50aW1lX2dldF9zeW5jKHBkYXRhLT5kZXYpOwo+ICsJZWRpZCA9IGRy
bV9nZXRfZWRpZChjb25uZWN0b3IsICZwZGF0YS0+YXV4LmRkYyk7Cj4gKwlwbV9ydW50aW1lX3B1
dChwZGF0YS0+ZGV2KTsKPiAgIAo+IC0JaWYgKGVkaWQgJiYgZHJtX2VkaWRfaXNfdmFsaWQoZWRp
ZCkpIHsKPiAtCQludW0gPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiAr
CWlmIChlZGlkKSB7Cj4gKwkJaWYgKGRybV9lZGlkX2lzX3ZhbGlkKGVkaWQpKQo+ICsJCQludW0g
PSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiArCQlrZnJlZShlZGlkKTsK
PiAgIAkJaWYgKG51bSkKPiAgIAkJCXJldHVybiBudW07Cj4gICAJfQo+IEBAIC0xMzA4LDggKzEz
MDYsNiBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkKPiAgIAlpZiAoIXBkYXRhKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+IC0J
a2ZyZWUocGRhdGEtPmVkaWQpOwo+IC0KPiAgIAl0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShwZGF0YSk7
Cj4gICAKPiAgIAlkcm1fYnJpZGdlX3JlbW92ZSgmcGRhdGEtPmJyaWRnZSk7Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
