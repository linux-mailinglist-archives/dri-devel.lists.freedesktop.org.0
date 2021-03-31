Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7534FD84
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE56EA37;
	Wed, 31 Mar 2021 09:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F956EA37
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:55:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331095539euoutp01b5fe3d79143f06e1915fa1db4d2e966b~xZMVaYbLX0205502055euoutp01o
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210331095539euoutp01b5fe3d79143f06e1915fa1db4d2e966b~xZMVaYbLX0205502055euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617184540;
 bh=gMJiOGrhF20BZsQobIHMer5qNyPyBLX7IwREEKYEdSE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=D0mEM8Suo2myVpBQNoK/SFmgpg5dXLmlcNPdSOSbTUtN9XN+HejF+iSR0fZ9FJ/cD
 bHH5oie3CH1RB1kpMtobheqjBhE1kWbmMzbgGiLUzBjzhZH9O0/rt1eX5mDHapFM+l
 7DU4Woxj30fHBw4nq9oyPNbZU3R0TCHshnYiU/qU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331095539eucas1p26de1039b3796b58b6c3a2bfae6c25e52~xZMVIXH341615516155eucas1p2A;
 Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 63.C3.09439.B1744606; Wed, 31
 Mar 2021 10:55:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210331095539eucas1p298f10946de0d7fdfc7234d8694179327~xZMUmeuDU2419424194eucas1p2v;
 Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331095539eusmtrp16a7b7f506baf9522098fb70bca5bb285~xZMUlgkjD1808918089eusmtrp1h;
 Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-d3-6064471be993
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6B.07.08696.A1744606; Wed, 31
 Mar 2021 10:55:38 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331095535eusmtip135b3ced999d488f1f23ad7ed22a68cb2~xZMRsUTmf0245102451eusmtip1z;
 Wed, 31 Mar 2021 09:55:35 +0000 (GMT)
Message-ID: <c88a04f2-5968-dd3f-562d-ddf67cb983db@samsung.com>
Date: Wed, 31 Mar 2021 11:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 07/14] drm/bridge: ti-sn65dsi86: Get rid of the
 useless detect() function
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7djP87rS7ikJButeKVj0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGUsvf2Qp2MpT
 MaH1H3MD4yauLkZODgkBE4nl39+wdzFycQgJrGCUeL6xkRHC+cIosev4MVYI5zOjxOfb/9lg
 Wtr2nmQGsYUEljNKnL3MBFH0glFi7ftdQEUcHLwCdhJ7H7qBmCwCqhIPTnCAlPMKCEqcnPmE
 BcQWFUiQWHVjORNIibBAksTN3cIgYWYBcYmmLyvB1ooI/GOUWD3xMdh4ZoHPTBKfphxiAqli
 E9CU+Lv5Jtg9nAKhEmsfL2OD6JaXaN46mxnizlucEkve80PYLhKrlh9lhbCFJV4d38IOYctI
 nJ7cwwJh10vcX9HCDLJMQqCDUWLrhp1Qg6wl7pz7BfYXM9Di9bv0IcKOEjcvTWUECUsI8Enc
 eCsIcQKfxKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQQmUWkvdnIXlmFsLeBYws
 qxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQJT4+l/x7/uYFzx6qPeIUYmDsZDjBIczEoi
 vMIHEhOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8+7auiZeSCA9sSQ1OzW1ILUIJsvEwSnVwKQ0
 aULG/SW1emuWZU2ctVpsXuJSq70L7vy5KSaddu5yWbdvKvOdTZVPSmdM38qy9lFBa01pduM+
 q+0cZ9bbTbG8bH1v/gvvaQ8id2k+PP278MQnlVveyi8LzaZv5Zm3/kj5k3W2Vz6x3m6Zecpr
 g2XZX/m5G5fsNpJ+v2BZeniRDYvw+rSzUXnHHaZaea0WD+t2kDkmuuu0h5CKzunLRyq67Fk2
 SztWOTh9uxSmdftbkMoCBY8fdmcc3PzOmAieXZrROfkhj82v/fOSw6acZyld1ZgxrbD8df+i
 v+8NxTjFLma/Pixw6sTchvX7WQ7+vVzH6vZqT37BhisXhV6ln9xYsG3hhWtnE/a2tc2Vn7Hy
 jBJLcUaioRZzUXEiAFy1i638AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7pS7ikJBtsOWlv0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
 ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GUsvf2Qp2MpTMaH1H3MD4yauLkZODgkBE4m2
 vSeZuxi5OIQEljJK3FhwkBUiIS6xe/5bZghbWOLPtS42iKJnjBIzexaydDFycPAK2EnsfegG
 YrIIqEo8OMEBUs4rIChxcuYTFhBbVCBB4uyHeUwgtrBAksTOB+2MIDYz0PimLytZQUaKCDQw
 SVy6u5gJxGEW+Mok0fJqKTtIlZDAbUaJyd9rQWw2AU2Jv5tvsoHYnAKhEmsfL2ODmGQm0bW1
 C2qqvETz1tnMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZG
 YELYduznlh2MK1991DvEyMTBeIhRgoNZSYRX+EBighBvSmJlVWpRfnxRaU5q8SFGU2BgTGSW
 Ek3OB6akvJJ4QzMDU0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUamFINha07
 DU6UT/594BHzcj+Gl0m1mzbrNRj8ZVNb9HWrWsB6GcsJ5ufLVjkz1U1kMFr9qLVWf/8ztxXe
 rLI7/fwdn1wRtv1TKBX+jGtx1QbGF7xXj7WuU5oqox+84PPso5/P35G2K/gZvVs+/OqqGRHs
 /TOmv/uYZFrUvylUbprrnTOaPy98cDtXcmP6P6UZIalXi7ZYhP35P5dZIJd5H5uxcm3mtGPH
 NWtnK1/Q+C1wvtjxgS/3ja7Dd8uezN2wIa9YmCEtM41JOKWp0ZWfJ0GjoO2qSW5OMtvP4vRk
 wQ1rXT7ynPt49da3mA31raefMggWREwR/n7ZJCPXLK5tdrnIjcKiB8s9tj2vOO+xUomlOCPR
 UIu5qDgRAGNyjryRAwAA
X-CMS-MailID: 20210331095539eucas1p298f10946de0d7fdfc7234d8694179327
X-Msg-Generator: CA
X-RootMTR: 20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d@eucas1p2.samsung.com>
 <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
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

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IElm
IHdlIGp1c3QgbGVhdmUgdGhlIGRldGVjdCgpIGZ1bmN0aW9uIGFzIE5VTEwgdGhlbiB0aGUgdXBw
ZXIgbGF5ZXJzCj4gYXNzdW1lIHdlJ3JlIGFsd2F5cyBjb25uZWN0ZWQuIFRoZXJlJ3Mgbm8gcmVh
c29uIGZvciBhIHN0dWIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgoKUmVnYXJkcwpBbmRyemVqCj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2
MSkKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8IDEyIC0tLS0t
LS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gaW5kZXggNTBhNTJhZjhlMzlmLi5hMGEwMGRkMTE4
N2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiBAQCAtMzA2LDIw
ICszMDYsOCBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIHRpX3Nu
X2JyaWRnZV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewo+ICAgCS5tb2RlX3ZhbGlkID0gdGlf
c25fYnJpZGdlX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkLAo+ICAgfTsKPiAgIAo+IC1zdGF0aWMgZW51
bSBkcm1fY29ubmVjdG9yX3N0YXR1cwo+IC10aV9zbl9icmlkZ2VfY29ubmVjdG9yX2RldGVjdChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+IC17Cj4gLQkvKioK
PiAtCSAqIFRPRE86IEN1cnJlbnRseSBpZiBkcm1fcGFuZWwgaXMgcHJlc2VudCwgdGhlbiBhbHdh
eXMKPiAtCSAqIHJldHVybiB0aGUgc3RhdHVzIGFzIGNvbm5lY3RlZC4gTmVlZCB0byBhZGQgc3Vw
cG9ydCB0byBkZXRlY3QKPiAtCSAqIGRldmljZSBzdGF0ZSBmb3IgaG90IHBsdWdnYWJsZSBzY2Vu
YXJpb3MuCj4gLQkgKi8KPiAtCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKPiAt
fQo+IC0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyB0aV9zbl9i
cmlkZ2VfY29ubmVjdG9yX2Z1bmNzID0gewo+ICAgCS5maWxsX21vZGVzID0gZHJtX2hlbHBlcl9w
cm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLAo+IC0JLmRldGVjdCA9IHRpX3NuX2JyaWRnZV9j
b25uZWN0b3JfZGV0ZWN0LAo+ICAgCS5kZXN0cm95ID0gZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwLAo+
ICAgCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCwKPiAgIAkuYXRv
bWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNh
dGVfc3RhdGUsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
