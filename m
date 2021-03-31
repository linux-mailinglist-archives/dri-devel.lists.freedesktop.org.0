Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907334FD91
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C1F6EA39;
	Wed, 31 Mar 2021 09:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0739E6EA38
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:58:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331095806euoutp0104e85ad3dc9acd5f2f99728d954bb5df~xZOeFE0gb0541305413euoutp01N
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:58:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210331095806euoutp0104e85ad3dc9acd5f2f99728d954bb5df~xZOeFE0gb0541305413euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617184686;
 bh=SJ8K9FtjJ7RXwx5dC7P6rkLLhFNehLE0d47oQ1bMEEU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=l3g5K6wDRZLE59OQTWswhLxt2V2jNRF2Bu9W6pmb6XwX1VhnFfQYRc/2A7MrKDfGl
 gs5CxLh/1brRIud4QU4O9AUoFX+5jPYA529APfOzgtIk8WL4GGResqkfQwauMJgDEP
 BkWPthMzi5WTk4YK5C76r2nUaJbRy++kQ8/OCCi0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331095806eucas1p27d08b0e29b83f6702629697cbb4e8c48~xZOdyu7uB2620526205eucas1p2O;
 Wed, 31 Mar 2021 09:58:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.F3.09444.EA744606; Wed, 31
 Mar 2021 10:58:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210331095805eucas1p13f223cf8e3f6edb9a3df0a807952542e~xZOdZL0j10433504335eucas1p1f;
 Wed, 31 Mar 2021 09:58:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331095805eusmtrp13480f17caf3d30d8e66396394d2742b4~xZOdYStoz1997919979eusmtrp1E;
 Wed, 31 Mar 2021 09:58:05 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-5c-606447ae5f8a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 51.87.08696.DA744606; Wed, 31
 Mar 2021 10:58:05 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331095803eusmtip2643b0a2d8460058c9644fdf0ac9fe8eb~xZOax5KAY1195211952eusmtip22;
 Wed, 31 Mar 2021 09:58:02 +0000 (GMT)
Message-ID: <ee62dae9-b1bd-71ea-31e6-95ce5a528f34@samsung.com>
Date: Wed, 31 Mar 2021 11:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 08/14] drm/bridge: ti-sn65dsi86: Remove extra call:
 drm_connector_update_edid_property()
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87rr3FMSDDa/ErXoPXeSyeL0/ncs
 FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
 8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
 ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKK4bFJSczLLUov07RK4Ms6fmMpWsI2n
 onfdKrYGxl6uLkZODgkBE4kjx6exdTFycQgJrGCU2PdzAjuE84VRYknHZ6jMZ0aJjl33gRwO
 sJYXD4Qh4ssZJQ4dnMgE4bxglPgw4zk7yFxeATuJx3PPs4DYLAKqEk86TzFCxAUlTs58AhYX
 FUiQWHVjOROILSxQKPH2zGqwGmYBcYmmLytZQYaKCPxjlFg98THYBmaBz0wSn6YcAutgE9CU
 +Lv5JthJnAKhEhO/1kE0y0s0b53NDFIvIXCNU+LyivNsEJ+6SJyZuZURwhaWeHV8CzuELSNx
 enIPC4RdL3F/RQtUcwejxNYNO5khEtYSd879AlvGDLR4/S59SFA4Ssx5bgBh8knceCsIcQKf
 xKRt05khwrwSHW1CEDMUJe6f3Qo1T1xi6YWvbBMYlWYhhcosJN/PQvLMLIS1CxhZVjGKp5YW
 56anFhvlpZbrFSfmFpfmpesl5+duYgSmx9P/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeIUPJCYI
 8aYkVlalFuXHF5XmpBYfYpTmYFES503asiZeSCA9sSQ1OzW1ILUIJsvEwSnVwJTnEbSP741y
 6K7P01VfvObJLBLrL3/7+vGraQoBPHZvXrBMlVKck832ZFnHj8z4Bl/uxjM//B/2eC1SUr7w
 /SsX2/GMXUyXHQ2/qJ60NyyetanimMhSjfNmhW3uYkn8MWZrl4bFJr74E9f3g+FBy29Hi0mb
 9T+ti1jmvW532VsDt3Xfpq1icMo89ODZ6wym3Cmbomp/3ald/Vg782HpIxe31dLfXc+veyxZ
 Uq1QeO/67KMTHv6Q+G5lPNmYi+lFlJmZ8tqUvISUM8/vHjwizj/76qNfwcw15icS3Vu5S20S
 Ii8cjFGe98WQpT2t32EZC4Py+hc/tthejju0yPXx7uXzukyCQ26b/VJ/cG1bfqoSS3FGoqEW
 c1FxIgBuZtGP/gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xe7pr3VMSDLomWlr0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
 ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GedPTGUr2MZT0btuFVsDYy9XFyMHh4SAicSL
 B8JdjFwcQgJLGSVWnd3P0sXICRQXl9g9/y0zhC0s8edaFxtE0TNGiYaGD+wgCV4BO4nHc8+D
 NbAIqEo86TzFCBEXlDg58wlYXFQgQeLsh3lMILawQKHE2zOrwWqYgRY0fVnJCjJURKCBSeLS
 3cVMIA6zwFcmiZZXS8E2CAncZpTofZIPYrMJaEr83XyTDeRsToFQiYlf6yAGmUl0be2CGiov
 0bx1NvMERqFZSO6YhWTfLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iRGYELYd
 +7llB+PKVx/1DjEycTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVEk/OB
 KSmvJN7QzMDU0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQamee/zZu9f+WPG
 ROblKidDWe6URM6YvEn2kdcav7UFf7Sdp35VmhMz/RHL9evPohkz+F/2GAR/Tz/6U6LONjn7
 0brSmdvvrHbt1I/M4ElytD2czDRhVdpxnpk/ZgBD7f+5X1LeN3ZuqzOcZzFpezan6ur1B/7E
 +Yh3KnPJtB1d7CbD0JkY5Pdxm4352oN7nsR/zwq5++Jt8662T/achUunTwhjz130YIvXcsll
 L92vNvmxTBNSf9kf1NuYLJWV5n7maPJHhh/eTI59EadYbWbOizqRK85o4NGVaV5WIB5cnTCh
 RO37txen+B5mfrnEXVa9984rDgMp2TU7hLsrUiP1LmlaefyV2rze3eEn+zIlluKMREMt5qLi
 RADz3W/SkQMAAA==
X-CMS-MailID: 20210331095805eucas1p13f223cf8e3f6edb9a3df0a807952542e
X-Msg-Generator: CA
X-RootMTR: 20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e@eucas1p1.samsung.com>
 <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
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

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IEFz
IG9mIGNvbW1pdCA1MTg2NDIxY2JmZTIgKCJkcm06IEludHJvZHVjZSBlcG9jaCBjb3VudGVyIHRv
Cj4gZHJtX2Nvbm5lY3RvciIpIHRoZSBkcm1fZ2V0X2VkaWQoKSBmdW5jdGlvbiBjYWxscwo+IGRy
bV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoKSBmb3IgdXMuIFRoZXJlJ3Mgbm8gcmVh
c29uIGZvciB1cwo+IHRvIGNhbGwgaXQgYWdhaW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKUmVnYXJkcwpBbmRyemVqCj4gLS0tCj4KPiAobm8g
Y2hhbmdlcyBzaW5jZSB2MSkKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYyB8IDExICsrKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4g
aW5kZXggYTBhMDBkZDExODdjLi45NTc3ZWJkNThjNGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMKPiBAQCAtMjcwLDcgKzI3MCw3IEBAIHN0YXRpYyBpbnQgdGlfc25f
YnJpZGdlX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKPiAgIHsKPiAgIAlzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSA9IGNvbm5lY3Rvcl90b190
aV9zbl9icmlkZ2UoY29ubmVjdG9yKTsKPiAgIAlzdHJ1Y3QgZWRpZCAqZWRpZCA9IHBkYXRhLT5l
ZGlkOwo+IC0JaW50IG51bSwgcmV0Owo+ICsJaW50IG51bTsKPiAgIAo+ICAgCWlmICghZWRpZCkg
ewo+ICAgCQlwbV9ydW50aW1lX2dldF9zeW5jKHBkYXRhLT5kZXYpOwo+IEBAIC0yNzksMTIgKzI3
OSw5IEBAIHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgIAl9Cj4gICAKPiAgIAlpZiAoZWRpZCAmJiBk
cm1fZWRpZF9pc192YWxpZChlZGlkKSkgewo+IC0JCXJldCA9IGRybV9jb25uZWN0b3JfdXBkYXRl
X2VkaWRfcHJvcGVydHkoY29ubmVjdG9yLCBlZGlkKTsKPiAtCQlpZiAoIXJldCkgewo+IC0JCQlu
dW0gPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiAtCQkJaWYgKG51bSkK
PiAtCQkJCXJldHVybiBudW07Cj4gLQkJfQo+ICsJCW51bSA9IGRybV9hZGRfZWRpZF9tb2Rlcyhj
b25uZWN0b3IsIGVkaWQpOwo+ICsJCWlmIChudW0pCj4gKwkJCXJldHVybiBudW07Cj4gICAJfQo+
ICAgCj4gICAJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMocGRhdGEtPnBhbmVsLCBjb25uZWN0
b3IpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
