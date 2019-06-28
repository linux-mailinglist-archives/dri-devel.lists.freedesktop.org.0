Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2F59C6E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22D16E8F4;
	Fri, 28 Jun 2019 13:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A122F6E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:03:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628130334euoutp02de29228c542e8d0955f7564f8e82150d~sXnH-50TD1230212302euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:03:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628130334euoutp02de29228c542e8d0955f7564f8e82150d~sXnH-50TD1230212302euoutp02Q
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628130333eucas1p10bfb6c7946045e775963fb75e2007b62~sXnHPeKHD0052100521eucas1p1V;
 Fri, 28 Jun 2019 13:03:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EB.46.04298.520161D5; Fri, 28
 Jun 2019 14:03:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628130332eucas1p2b302e7dfdae6ee7a73c650f7e10d3f6e~sXnGT8QcT0994209942eucas1p2X;
 Fri, 28 Jun 2019 13:03:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628130332eusmtrp1b48d12dbc245b313516d2fc7055c34b0~sXnGF071t2018320183eusmtrp1M;
 Fri, 28 Jun 2019 13:03:32 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-6c-5d16102504fc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E6.0C.04146.420161D5; Fri, 28
 Jun 2019 14:03:32 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628130331eusmtip20a23949761c8468302efce2c8937874b~sXnFlrF7y0827408274eusmtip2X;
 Fri, 28 Jun 2019 13:03:31 +0000 (GMT)
Subject: Re: [PATCH 07/12] fbdev: da8xx: add support for a regulator
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8c9f36c1-1c55-a2af-8b2f-4c6811e029f3@samsung.com>
Date: Fri, 28 Jun 2019 15:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-8-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7qqAmKxBrP7JC2+zD3FYrHrwTY2
 izNv7rJbLGoQs7jy9T2bxYovM9ktnm5+zGRx/+tRRospf5YzWWx6fI3V4kTfB1aLy7vmsFns
 793A5MDr8f5GK7vH4mu3WT12zrrL7rFpVSebx6f+k6wed67tYfO4332cyWPzknqP4ze2M3l8
 3iQXwBXFZZOSmpNZllqkb5fAldH85jtrwSGWiqsrn7A3MD5i7mLk5JAQMJG43fGRqYuRi0NI
 YAWjxPNLq6CcL4wSL6c2M0I4nxklDv/6xwbT8unUI3aIxHJGiZsX+qGq3jJKvDu1mAWkSljA
 RWLm5o1gS0QE1CUWrLsHNpdZ4CizxMvLq8FGsQlYSUxsX8UIYvMK2EkcuwjRzCKgKrH5+Xqw
 GlGBCIn7xzawQtQISpyc+QSshlPAWOLThlYwm1lAXOLWk/lMELa8xPa3c5hBlkkItHJITLjc
 ww5xt4vE7I5jUG8LS7w6vgUqLiNxenIPC0TDOkaJvx0voLq3M0osnwzztbXE4eMXgc7gAFqh
 KbF+lz5E2FFiZdMvFpCwhACfxI23ghBH8ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9g
 VJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMeaf/Hf+0
 g/HrpaRDjAIcjEo8vD94xGKFWBPLiitzDzFKcDArifBKnhOJFeJNSaysSi3Kjy8qzUktPsQo
 zcGiJM5bzfAgWkggPbEkNTs1tSC1CCbLxMEp1cDY7nZxt8bua3/rYxT9f/9Zq8YV/6st3H3W
 +1wh499XbKWiFGo/LL9xP3i/xXknxRMzb/vmTf/3J1m/pi3F7fv+eMEVImJ9LnNuvyyRVee7
 c6jh6ifTs7Fzb1ZOWvBQuvOB55mNvKt/LXPYzcazayP/y9ebDCrNM/bcXp/xWd5Rwj3tSFm/
 elKgEktxRqKhFnNRcSIAtY1X63UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xe7oqAmKxBss7pC2+zD3FYrHrwTY2
 izNv7rJbLGoQs7jy9T2bxYovM9ktnm5+zGRx/+tRRospf5YzWWx6fI3V4kTfB1aLy7vmsFns
 793A5MDr8f5GK7vH4mu3WT12zrrL7rFpVSebx6f+k6wed67tYfO4332cyWPzknqP4ze2M3l8
 3iQXwBWlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5eg
 l9H85jtrwSGWiqsrn7A3MD5i7mLk5JAQMJH4dOoRO4gtJLCUUWLbevEuRg6guIzE8fVlECXC
 En+udbF1MXIBlbxmlGhb8AKsV1jARWLm5o1gtoiAusSCdfeYQIqYBY4zSyx8MQWqYz2jxP3N
 3xhBqtgErCQmtq8Cs3kF7CSOXVzMAmKzCKhKbH6+ng3EFhWIkDjzfgULRI2gxMmZT8BsTgFj
 iU8bWsFsZqBtf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqml
 xbnpucWGesWJucWleel6yfm5mxiB8b3t2M/NOxgvbQw+xCjAwajEw7uASyxWiDWxrLgy9xCj
 BAezkgiv5DmRWCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aevJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjOJe8rPaa3WOeqR/s184terPkoWvP2/vt9ye
 99fZSkW8zeuSyG/Vw/K1iksEj/+8JBRpZa09Kyzufuyz16Er+UJWnhRgi1a5nHjMN+vxdpFv
 Czbu49W0kV2tuOTe8ZQFCy6+7ViX+tVo2al3fQv2H/yhnjcv/6GrpPQH645TIhJPsx8e+3V0
 f6cSS3FGoqEWc1FxIgD3ihLoBQMAAA==
X-CMS-MailID: 20190628130332eucas1p2b302e7dfdae6ee7a73c650f7e10d3f6e
X-Msg-Generator: CA
X-RootMTR: 20190625163511epcas1p20ccb516dce9a56e222779ecfd0a1084f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163511epcas1p20ccb516dce9a56e222779ecfd0a1084f
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163511epcas1p20ccb516dce9a56e222779ecfd0a1084f@epcas1p2.samsung.com>
 <20190625163434.13620-8-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561727014;
 bh=VbBmh0lqoFIOdVgmHOPMjXBb/1mrJ2U1b6I2moJwAto=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mwPlN3yBBU2PLxXQujGpz6gas1jzJ7a4jayeGBkTn5sIzg5RbJioLEWjPJhrBIkb0
 skaI2rgerQgpkgNFLQ+qI76Lm85PpNuboRHzwhp2DtulRUxtaIEvV1jzWp9sL91h3h
 6pqkp8naXK4UFMZSf1/tEbj5wUOmmd+gfYG+hWm0=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjozNCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IFdlIHdh
bnQgdG8gcmVtb3ZlIHRoZSBoYWNreSBwbGF0Zm9ybSBkYXRhIGNhbGxiYWNrIGZvciBwb3dlciBj
b250cm9sLgo+IEFkZCBhIHJlZ3VsYXRvciB0byB0aGUgZHJpdmVyIGRhdGEgYW5kIGVuYWJsZS9k
aXNhYmxlIGl0IG5leHQgdG8KPiB0aGUgY3VycmVudCBwYW5lbF9wb3dlcl9jdHJsKCkgY2FsbHMu
IFdlIHdpbGwgdXNlIGl0IGluIHN1YnNlcXVlbnQKPiBwYXRjaCBvbiBkYTg1MC1ldm0uCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT4KCkFja2VkLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVA
c2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
