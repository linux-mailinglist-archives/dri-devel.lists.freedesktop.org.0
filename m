Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15030F38E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 13:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD4F6ECB3;
	Thu,  4 Feb 2021 12:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9A96ECB3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:59:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210204125923euoutp02035319b0a570ed50c13f17ce921976d5~gjODP3yR-1372213722euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:59:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210204125923euoutp02035319b0a570ed50c13f17ce921976d5~gjODP3yR-1372213722euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612443563;
 bh=w7hfHypJZijxK8JFc5TVj8rXVC9Oyo0ayBAp0KkUDYo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=i767CN/+1LE3Oaqdpn2tv6LHoQpsFPgXsgI+fZ4BkdiWMDSwvEgGmqwPN8GlX3h0S
 zy4QAqC1XMdHTHkNF8wjRHBQNazL9MCTqYvAUlmvmNEFsVc6HPhP32I+24V8Yd3vri
 ZejL1lwpMlA/Yp0ginJf8kvpMhY5I9r+wWb/GwBM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210204125923eucas1p2c90b7f8976b27a610e80bd7a32c18988~gjOCnmIHZ0262802628eucas1p2b;
 Thu,  4 Feb 2021 12:59:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E4.91.27958.AAFEB106; Thu,  4
 Feb 2021 12:59:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210204125922eucas1p2d832c777e404561418768f013ba983d5~gjOCPrrMW2557425574eucas1p2c;
 Thu,  4 Feb 2021 12:59:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210204125922eusmtrp266dd073b8b33d4465b881362b6806d40~gjOCOpXC-2733127331eusmtrp2j;
 Thu,  4 Feb 2021 12:59:22 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-85-601befaaa2ba
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DB.9C.21957.AAFEB106; Thu,  4
 Feb 2021 12:59:22 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210204125921eusmtip175e7f6d9d0285a6a206869ecda1f0a53~gjOBGaBtr1244612446eusmtip1D;
 Thu,  4 Feb 2021 12:59:21 +0000 (GMT)
Message-ID: <b680fef2-7c8a-183b-443a-6b2b9fe595d7@samsung.com>
Date: Thu, 4 Feb 2021 13:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
Content-Language: en-GB
To: Nicolas Boichat <drinkcat@chromium.org>, Robert Foss
 <robert.foss@linaro.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <CANMq1KAuUTqgM2mDR5WN6Ad+cATFXLPE+5rstyhfNE9Lc716+g@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7djP87qr30snGNw/zWjRe+4kk0XrsWeM
 FqfPnGKyeP1vOovFnjO/2C2ufH3PZrH6ygoWi8u3vjJbfLsClJ3Qup3Z4ur3l8wWJ99cZbHo
 nLiE3eLyrjlsFmuP3GW3ONQXbfFp1kNmixU/tzJaPFu7lNVi3t0fzA4iHnP37mL2eH+jld1j
 dsNFFo8dd5cwetzbd5jFY+esu+weCzaVeszumMnqcWLCJSaPO9f2sHls//aA1eN+93Emj903
 G9g8Pj69xeKxZNpVNo++LasYA4SiuGxSUnMyy1KL9O0SuDK+vNQq+C5UceDncdYGxmv8XYyc
 HBICJhLvd89hA7GFBFYwSqzeKNrFyAVkf2GUePN1CwuE85lRouPORSaYjtYvD6ESyxklPn5e
 wwrhvGeU2HP3GjtIFa+AncSbQ9OYQWwWARWJnqXvoeKCEidnPmEBsUUFEiQ2dG4GmyosYCkx
 52MLmM0sIC7R9GUlK4gtIhAs0bHsMBPIAmaBS6wS/StmgjWzCWhK/N18E+xwToFAiYmd3xkh
 muUlmrfOZgZpkBBo45LoeXCPBeJuF4nt68+xQ9jCEq+Ob4GyZST+75wP9Vu9xP0VLVDNHYwS
 WzfsZIZIWEvcOfcLaBsH0AZNifW79CHCjhJNqyYwgoQlBPgkbrwVhLiBT2LStunMEGFeiY42
 IYhqRYn7Z7dCDRSXWHrhK9sERqVZSMEyC8n7s5B8Mwth7wJGllWM4qmlxbnpqcWGeanlesWJ
 ucWleel6yfm5mxiBCff0v+OfdjDOffVR7xAjEwfjIUYJDmYlEd7ENqkEId6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4ryrZq+JFxJITyxJzU5NLUgtgskycXBKNTCp9Rm/fqCoKHpCyKVo1Rt35fO3
 PwS4bfM5KP2qVuj0xAXr7R0MJ/Wlz7hz/sfJloObNdIsRY2rP72dpxTCs+PMAYf+XWVJT2d5
 t9WqJqW7afF4HZL4eMhx+qQ1+zbvUppziOn037aqQ9PXcM7+wr7Ip6IxJE3c8/WLyq87RfVO
 7rikNT1KtXVDZOjLlhorkwCnHbl99+N+6N/3DTn/XZvleZaDj5D6lBDptfwL5KdZv4xg8ffc
 03Rnm806+7KnAgtszmZJmeidmrCY+dlUhzq/O5U5hxdMtra6vvlV4sT7l+ZJMWwJXv2Ko7k+
 sEch8fr6g9oV9jevZK2MFA96FPvAyXz/32XNdw2W3QgwFX+sxFKckWioxVxUnAgAmFtH/CcE
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xu7qr3ksnGHT+UbToPXeSyaL12DNG
 i9NnTjFZvP43ncViz5lf7BZXvr5ns1h9ZQWLxeVbX5ktvl0Byk5o3c5scfX7S2aLk2+uslh0
 TlzCbnF51xw2i7VH7rJbHOqLtvg06yGzxYqfWxktnq1dymox7+4PZgcRj7l7dzF7vL/Ryu4x
 u+Eii8eOu0sYPe7tO8zisXPWXXaPBZtKPWZ3zGT1ODHhEpPHnWt72Dy2f3vA6nG/+ziTx+6b
 DWweH5/eYvFYMu0qm0ffllWMAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehlfXmoVfBeqOPDzOGsD4zX+LkZODgkBE4nWLw9Zuhi5OIQEljJK
 nNu3lwUiIS6xe/5bZghbWOLPtS42iKK3jBLvHjaygyR4Bewk3hyaBlbEIqAi0bP0PVRcUOLk
 zCdgg0QFEiQm979mA7GFBSwl5nxsYQKxmYEWNH1ZyQpiiwgES8z4NxFsAbPAFVaJn8s/MUFs
 62eSODr7LdgkNgFNib+bb4JN4hQIlJjY+Z0RYpKZRNfWLihbXqJ562zmCYxCs5AcMgvJwllI
 WmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMMlsO/Zz8w7Gea8+6h1iZOJgPMQo
 wcGsJMKb2CaVIMSbklhZlVqUH19UmpNafIjRFBgaE5mlRJPzgWkuryTe0MzA1NDEzNLA1NLM
 WEmcd+vcNfFCAumJJanZqakFqUUwfUwcnFINTOlLttfnVHKcTPh37NjpX328cioyXU4L9yw3
 UNz533Def+0NJ1y/p8zM7/MqflM0MzF/b3Od4i+r745NaqFPvM5V3nNLE180z1uwJeRW8Qmn
 c/833mZ/U/5xwoe1TKtexj/e01Uyr9nIZf88PxGeLQaTX8ltuW/7au6sr/3vFMSTnJYk1HAf
 yuUVPdzw9JG3ug6jf9dXQ7XfH8SZM6MO7NCunmzK6F3PGxT/2nXpuhUPNP/FnrHj+J2uqd89
 VznbRmAq34WqvnWmjZwWOaKKXhaaa4qKA+tvvuexTzU78eKAyVs+nkJ9s1sngl06vv8v+3g9
 zOaG+H7d1bpMN8525ireTIhmFfBKdn37u+W4EktxRqKhFnNRcSIAZ++N8bsDAAA=
X-CMS-MailID: 20210204125922eucas1p2d832c777e404561418768f013ba983d5
X-Msg-Generator: CA
X-RootMTR: 20210204123452eucas1p1eb8fd9dc5b62b036ebd9e9208e796cb9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210204123452eucas1p1eb8fd9dc5b62b036ebd9e9208e796cb9
References: <20210128111549.GA8174@zhaomy-pc>
 <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
 <CGME20210204123452eucas1p1eb8fd9dc5b62b036ebd9e9208e796cb9@eucas1p1.samsung.com>
 <CANMq1KAuUTqgM2mDR5WN6Ad+cATFXLPE+5rstyhfNE9Lc716+g@mail.gmail.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAwNC4wMi4yMDIxIG/CoDEzOjM0LCBOaWNvbGFzIEJvaWNoYXQgcGlzemU6Cj4gT24g
VGh1LCBGZWIgNCwgMjAyMSBhdCA4OjA3IFBNIFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5h
cm8ub3JnPiB3cm90ZToKPj4gSGkgWGluLAo+Pgo+PiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPj4K
Pj4gT24gVGh1LCAyOCBKYW4gMjAyMSBhdCAxMjoxNywgWGluIEppIDx4amlAYW5hbG9naXhzZW1p
LmNvbT4gd3JvdGU6Cj4+PiBFbmFibGUgRFNJIEVPVFAgZmVhdHVyZSBmb3IgZml4aW5nIHNvbWUg
cGFuZWwgc2NyZWVuIGNvbnN0YW5jZQo+Pj4gc2hpZnQgaXNzdWUuCj4+PiBSZW1vdmluZyBNSVBJ
IGZsYWcgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUIHRvIGVuYWJsZSBEU0kgRU9UUC4KPj4gSSBk
b24ndCB0aGluayBJIHF1aXRlIHVuZGVyc3RhbmQgaG93IHJlbW92aW5nIHRoZQo+PiBNSVBJX0RT
SV9NT0RFX0VPVF9QQUNLRVQgZmxhZyB3aWxsIGNhdXNlIERTSSBFT1RQIHRvIGJlIGVuYWJsZWQu
IENvdWxkCj4+IHlvdSBleHRyYXBvbGF0ZSBvbiB0aGlzIGluIHRoZSBjb21taXQgbWVzc2FnZT8K
PiBUaGF0IGNvbmZ1c2VkIG1lIGFzIHdlbGwsIGJ1dCBpdCB0dXJucyBvdXQgdGhhdCdzIGhvdyB0
aGUgZmxhZyBpcyBkZWZpbmVkOgo+IGBgYAo+IC8qIGRpc2FibGUgRW9UIHBhY2tldHMgaW4gSFMg
bW9kZSAqLwo+ICNkZWZpbmUgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUIEJJVCg5KQo+IGBgYAo+
IChodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3YxL3VybD9rPTViZDk1ZWJkLTA0NDI2N2Zi
LTViZDhkNWYyLTBjYzQ3YTMwMDNlOC1jZTlkYjhlYTI2NGQ2OTAxJnE9MSZlPTkwMDU1NmRjLWQx
OTktNGMxOC05NDMyLTVjMzQ2NWE5OGVhZSZ1PWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsaW4u
Y29tJTJGbGludXglMkZsYXRlc3QlMkZzb3VyY2UlMkZpbmNsdWRlJTJGZHJtJTJGZHJtX21pcGlf
ZHNpLmglMjNMMTI5KQo+Cj4gSSdtIGFsbW9zdCB0ZW1wdGVkIHRvIHB1dCB0b2dldGhlciBhIG1h
c3MgcGF0Y2ggdG8gcmVuYW1lIGFsbCBvZiB0aGVzZSBmbGFncy4uLgoKClllcyB0aGF0IHdvdWxk
IGJlIGdvb2QsIG1hbnkgb2YgdGhlc2UgZmxhZ3Mgd2VyZSBqdXN0IGNvcHkgcGFzdGVkIGZyb20g
CnNvbWUgaHcgZGF0YXNoZWV0LCB3aXRob3V0IGdvb2QgYW5hbHlzaXMgaG93IHRvIGFkYXB0IHRo
ZW0gdG8gdGhlIGZyYW1ld29yay4KCgpSZWdhcmRzCgpBbmRyemVqCgoKPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyB8IDEgLQo+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW54NzYyNS5jCj4+PiBpbmRleCA2NWNjMDU5Li5lMzFlZWIxYiAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwo+Pj4gQEAgLTEzMzQsNyArMTMz
NCw2IEBAIHN0YXRpYyBpbnQgYW54NzYyNV9hdHRhY2hfZHNpKHN0cnVjdCBhbng3NjI1X2RhdGEg
KmN0eCkKPj4+ICAgICAgICAgIGRzaS0+Zm9ybWF0ID0gTUlQSV9EU0lfRk1UX1JHQjg4ODsKPj4+
ICAgICAgICAgIGRzaS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklERU8gICB8Cj4+PiAg
ICAgICAgICAgICAgICAgIE1JUElfRFNJX01PREVfVklERU9fU1lOQ19QVUxTRSAgfAo+Pj4gLSAg
ICAgICAgICAgICAgIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCAgICAgICAgfAo+Pj4gICAgICAg
ICAgICAgICAgICBNSVBJX0RTSV9NT0RFX1ZJREVPX0hTRTsKPj4+Cj4+PiAgICAgICAgICBpZiAo
bWlwaV9kc2lfYXR0YWNoKGRzaSkgPCAwKSB7Cj4+PiAtLQo+Pj4gMi43LjQKPj4+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vcHJv
dGVjdDIuZmlyZWV5ZS5jb20vdjEvdXJsP2s9NDU3ZjNmMzktMWFlNDA2N2YtNDU3ZWI0NzYtMGNj
NDdhMzAwM2U4LWI3MDIwNzJkYTcyOWQ4YzkmcT0xJmU9OTAwNTU2ZGMtZDE5OS00YzE4LTk0MzIt
NWMzNDY1YTk4ZWFlJnU9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWls
bWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
