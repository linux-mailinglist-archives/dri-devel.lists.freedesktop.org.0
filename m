Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162734FD7E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367496E18E;
	Wed, 31 Mar 2021 09:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BEB6E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:53:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331095355euoutp01e33fca205dfed86ed4d49c0083970c72~xZKzqxd9c3180931809euoutp010
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:53:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210331095355euoutp01e33fca205dfed86ed4d49c0083970c72~xZKzqxd9c3180931809euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617184435;
 bh=eszsJ0h4CNavy2UxKzMZ8WNSLiPUDOmMpeexsv9ZMHE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=gSnZf5D3EVmvmDYeL5utntTrc9mGgheLb50lQeD4UvWsOawqWP0emOfAYPfPZzz9d
 4kt336VUKvnRww945Mw1dsUNQfy7DLSyUpsf6LFDcMjB+GdbgDPi7j/Mu8b2/HNBYi
 awSLPIBxyt2rZWLo7eqZhE/nMwh8y4XR2Uo2fgVI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331095354eucas1p20124a60da79b81e41d5572b14a5b852a~xZKzSPH571283812838eucas1p2H;
 Wed, 31 Mar 2021 09:53:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FC.33.09444.2B644606; Wed, 31
 Mar 2021 10:53:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210331095354eucas1p222219f83a7cc1b91a00f6b9e7cc602aa~xZKys-4nX2504025040eucas1p2c;
 Wed, 31 Mar 2021 09:53:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210331095353eusmtrp200f664897b5c3bde135a945c07681397~xZKysIN4a2673926739eusmtrp24;
 Wed, 31 Mar 2021 09:53:53 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-05-606446b264bb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.85.08705.1B644606; Wed, 31
 Mar 2021 10:53:53 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331095349eusmtip1d13da7d1e179d51e0e8d6b1a6b0ad284~xZKuaG5Jj0539505395eusmtip1T;
 Wed, 31 Mar 2021 09:53:49 +0000 (GMT)
Message-ID: <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
Date: Wed, 31 Mar 2021 11:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() /
 unregister() to detach()
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7djPc7qb3FISDObfUbLoPXeSyeL0/ncs
 FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
 8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
 ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKK4bFJSczLLUov07RK4Mt7sO8FS0M5b
 sXHGa+YGxitcXYycHBICJhLr995n7GLk4hASWMEosWP5IlYI5wujRPuy3VCZz4wSE44tYIdp
 OXHsH1TVckaJludf2CCcF4wSc+a1s4FU8QrYSdx+upkFxGYRUJU4v+EVE0RcUOLkzCdgcVGB
 BIlVN5aDxYUF0iXWTX/ICmIzC4hLNH1ZCbZBROAfo8TqiY+ZQBxmgc9MEp+mHALrYBPQlPi7
 +SbYNk6BUIm2lnWMEN3yEs1bZzODNEgIXOKUeHD3FNThLhINHe0sELawxKvjW6DiMhL/d85n
 grDrJe6vaIFq7mCU2LphJzNEwlrizrlfQNs4gDZoSqzfpQ8RdpR4evcHI0hYQoBP4sZbQYgb
 +CQmbZvODBHmlehoE4KoVpS4f3Yr1EBxiaUXvrJNYFSahRQus5D8PwvJN7MQ9i5gZFnFKJ5a
 WpybnlpslJdarlecmFtcmpeul5yfu4kRmCRP/zv+ZQfj8lcf9Q4xMnEwHmKU4GBWEuEVPpCY
 IMSbklhZlVqUH19UmpNafIhRmoNFSZw3acuaeCGB9MSS1OzU1ILUIpgsEwenVAOT+mfbjt+F
 bX8vmmUumjy76Jxovv+iI1xN02VmFu8+sX6Dy72QaoMO2Q1zpf50i904vf1Mi6CJqbX456NP
 dByWmUxL3/Gje7+W7DUe+9DE7tOhy+w/HmWb1MIR0JD0cpu+uuqUfdtrxCOLQ/bZBeZ5TjqU
 u/pqeGzBYSaPUxyfxTbWP9MR+d0S9yu2vd18S9CRTraut4bPd7y0+KFfK7b7SqtyooP1YuO9
 3gG/gx8bV5+flxnSFfCNT+0TV8euMy5Lt1yxO+HOtGLypJkzmmTKNhgU3/E5mcblu4ot6WDw
 E9Zr/CEbYqwTF3y0+O6+7Y2PV/GBIzvc3+hPne1c/ujc1WRD65p3CZK/on8l9+1QYinOSDTU
 Yi4qTgQAcGPurAEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Xd2NbikJBodemFn0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
 ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW/2nWApaOet2DjjNXMD4xWuLkZODgkBE4kT
 x/6xdjFycQgJLGWUaJg/kRUiIS6xe/5bZghbWOLPtS42iKJnjBJf5x5iAUnwCthJ3H66Gcxm
 EVCVOL/hFRNEXFDi5MwnYHFRgQSJsx/mgcWFBdIl1k1/CLaAGWhB05eVYJtFBBqYJC7dXcwE
 4jALfGWSaHm1lB1i3W1Gib3nboPdwSagKfF38002EJtTIFSirWUdI8QoM4murV1QtrxE89bZ
 zBMYhWYhuWQWko2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmBa2Hbs5+Yd
 jPNefdQ7xMjEwXiIUYKDWUmEV/hAYoIQb0piZVVqUX58UWlOavEhRlNgcExklhJNzgcmpryS
 eEMzA1NDEzNLA1NLM2Mlcd6tc9fECwmkJ5akZqemFqQWwfQxcXBKNTAtK11/t0T7+Rn+R/Xm
 PR/X/oq3D5HZH3qBg2VHl7K22eF+/SDne7bp2bWFT+aucf5ccWTb66xQHwOBzLdCS7Nc4yMZ
 Dy8S8OdfevR226208lSG+tUXvvG/vHpqzvG180Q6J/bphCVeYH46XzzD3dBBc+FCZzZu68y/
 n9ij51/JzZi/MS102YfDBu/WzkxdffbDEV6erKk/qtf+Xa95xsqw61LZpCc3vMsYHkR+2vDy
 xTxV3bWiMX/3NGWf8PpwSeX579OpQjsflr2sdC+T2BN0NIg769yGA/651398m+v4qNbdLI9f
 /c05R9E+NTuDG1e/njgXZxFkVcX0MGLvtJSr5X3X/Wat/utmnfDijV66EktxRqKhFnNRcSIA
 x019PpQDAAA=
X-CMS-MailID: 20210331095354eucas1p222219f83a7cc1b91a00f6b9e7cc602aa
X-Msg-Generator: CA
X-RootMTR: 20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4@eucas1p2.samsung.com>
 <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
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

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IFRo
ZSByZWdpc3RlcigpIC8gYXR0YWNoKCkgZm9yIE1JUEkgaGFwcGVuIGluIHRoZSBicmlkZ2Uncwo+
IGF0dGFjaCgpLiBUaGF0IG1lYW5zIHRoYXQgdGhlIGludmVyc2UgYmVsb25ncyBpbiB0aGUgYnJp
ZGdlJ3MKPiBkZXRhY2goKS4KCgpBcyBJIGNvbW1lbnRlZCBpbiBwcmV2aW91cyBwYXRjaCwgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGZpeCBtaXBpL2JyaWRnZSAKcmVnaXN0cmF0aW9uIG9yZGVyIGlu
IGhvc3QgYW5kIHRoaXMgZHJpdmVyLgoKSGF2ZSB5b3UgY29uc2lkZXJlZCB0aGlzPwoKClJlZ2Fy
ZHMKCkFuZHJ6ZWoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPgo+ICAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8IDE1ICsrKysrKysrKy0tLS0tLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+IGluZGV4IGMwMDY2NzhjOTkyMS4uZThl
NTIzYjNhMTZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gQEAg
LTQzNyw3ICs0MzcsMTUgQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfYXR0YWNoKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UsCj4gICAKPiAgIHN0YXRpYyB2b2lkIHRpX3NuX2JyaWRnZV9kZXRh
Y2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgIHsKPiAtCWRybV9kcF9hdXhfdW5yZWdp
c3RlcigmYnJpZGdlX3RvX3RpX3NuX2JyaWRnZShicmlkZ2UpLT5hdXgpOwo+ICsJc3RydWN0IHRp
X3NuX2JyaWRnZSAqcGRhdGEgPSBicmlkZ2VfdG9fdGlfc25fYnJpZGdlKGJyaWRnZSk7Cj4gKwo+
ICsKPiArCWlmIChwZGF0YS0+ZHNpKSB7Cj4gKwkJbWlwaV9kc2lfZGV0YWNoKHBkYXRhLT5kc2kp
Owo+ICsJCW1pcGlfZHNpX2RldmljZV91bnJlZ2lzdGVyKHBkYXRhLT5kc2kpOwo+ICsJfQo+ICsK
PiArCWRybV9kcF9hdXhfdW5yZWdpc3RlcigmcGRhdGEtPmF1eCk7Cj4gICB9Cj4gICAKPiAgIHN0
YXRpYyB2b2lkIHRpX3NuX2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Up
Cj4gQEAgLTEzMTUsMTEgKzEzMjMsNiBAQCBzdGF0aWMgaW50IHRpX3NuX2JyaWRnZV9yZW1vdmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgIAlpZiAoIXBkYXRhKQo+ICAgCQlyZXR1cm4g
LUVJTlZBTDsKPiAgIAo+IC0JaWYgKHBkYXRhLT5kc2kpIHsKPiAtCQltaXBpX2RzaV9kZXRhY2go
cGRhdGEtPmRzaSk7Cj4gLQkJbWlwaV9kc2lfZGV2aWNlX3VucmVnaXN0ZXIocGRhdGEtPmRzaSk7
Cj4gLQl9Cj4gLQo+ICAgCWtmcmVlKHBkYXRhLT5lZGlkKTsKPiAgIAo+ICAgCXRpX3NuX2RlYnVn
ZnNfcmVtb3ZlKHBkYXRhKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
