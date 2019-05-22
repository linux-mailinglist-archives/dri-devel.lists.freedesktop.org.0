Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA626156
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D78898E8;
	Wed, 22 May 2019 10:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7D898E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:04:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190522100436euoutp024305e9f93357069efa5adcd37612c3bf~g_TT0Ezrz2818328183euoutp02C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:04:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190522100436euoutp024305e9f93357069efa5adcd37612c3bf~g_TT0Ezrz2818328183euoutp02C
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190522100436eucas1p1fc6e02a3132020cad281edb2f7c5c061~g_TTJEG0D2378323783eucas1p1g;
 Wed, 22 May 2019 10:04:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BA.57.04298.3BE15EC5; Wed, 22
 May 2019 11:04:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190522100435eucas1p24398c029079c7a58e526299687bd1e61~g_TSa7tUX3161031610eucas1p2X;
 Wed, 22 May 2019 10:04:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190522100435eusmtrp1f7461ef5592a01ba9ed0e1569e61ffa0~g_TSMwqlk0941609416eusmtrp1r;
 Wed, 22 May 2019 10:04:35 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-22-5ce51eb3e78f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.EE.04140.3BE15EC5; Wed, 22
 May 2019 11:04:35 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190522100434eusmtip184c651f0e350b704d5486e7c496a33cf~g_TRpjFZY1044210442eusmtip1P;
 Wed, 22 May 2019 10:04:34 +0000 (GMT)
Subject: Re: [PATCH] fbcon: Remove fbcon_has_exited
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <6b9747cf-8845-0eb9-878e-f2953665fcec@samsung.com>
Date: Wed, 22 May 2019 12:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521142304.9652-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFKsWRmVeSWpSXmKPExsWy7djP87qb5Z7GGLTvMbdY+PAus8XyM+uY
 La58fc9m8eb4dCaL2RM2M1mc6c61eLzzJavF5V1z2CwWftzKYjH11Dt2i3c/etktzu9KdODx
 mN1wkcVj77cFLB4Les4zeyze85LJY97JQI/73ceZPN7vu8rmsb7nCKPH501yHq/3H2IM4Iri
 sklJzcksSy3St0vgyrhy7x9LQYN4xfFFM9gaGK8LdTFyckgImEhcvf6YCcQWEljBKNH8Rr+L
 kQvI/sIo0f33EQuE85lR4sq54ywwHd2b/zNDJJYzSsz4M5cdwnnLKLH42AdGkCphAWOJ3ndf
 2EFsEQEtiY7/LWCjmAV+MEvcv/ARbCGbgJXExPZVYA28AnYSe77tYgaxWQRUJQ58mgRWIyoQ
 IXH/2AZWiBpBiZMzn4CdwSlgLfHu9TqwemYBcYlbT+YzQdjyEs1bZzNDnPqXXWL3pkwI20Xi
 b/92NghbWOLV8S3sELaMxOnJPWDHSQisY5T42/GCGcLZziixfPI/qA5ricPHLwJdwQG0QVNi
 /S59iLCjxMNtp5lAwhICfBI33gpC3MAnMWnbdGaIMK9ERxs0rNUkNizbwAaztmvnSuYJjEqz
 kHw2C8k3s5B8Mwth7wJGllWM4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBKe70v+OfdjB+
 vZR0iFGAg1GJh9fi4eMYIdbEsuLK3EOMEhzMSiK8p089ihHiTUmsrEotyo8vKs1JLT7EKM3B
 oiTOW83wIFpIID2xJDU7NbUgtQgmy8TBKdXAaMorlh8uOsvbXvAjO29LxwzTPXe/GGce3Wr2
 IFR20itl3e9zFleUdjeW7NV70CHT7x2Tnn/y1YyczfaiP09OkknyWzI7x2tP/rU3Xmp6Ylt/
 m6TGla+ITb1SoC/9+3+WNo9Y7v8j/seE45a0bRR8fkJmnevPVI2wvWFn58Ymz9tevsOhIfin
 EktxRqKhFnNRcSIAoM++qW0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7qb5Z7GGNw6x2qx8OFdZovlZ9Yx
 W1z5+p7N4s3x6UwWsydsZrI4051r8XjnS1aLy7vmsFks/LiVxWLqqXfsFu9+9LJbnN+V6MDj
 MbvhIovH3m8LWDwW9Jxn9li85yWTx7yTgR73u48zebzfd5XNY33PEUaPz5vkPF7vP8QYwBWl
 Z1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl3Hl3j+W
 ggbxiuOLZrA1MF4X6mLk5JAQMJHo3vyfGcQWEljKKNG0IKaLkQMoLiNxfH0ZRImwxJ9rXWxd
 jFxAJa8ZJT7ea2AFSQgLGEv0vvvCDmKLCGhJdPxvYQEpYhb4xSyx6d8nZoiOg4wSHzofM4FU
 sQlYSUxsX8UIYvMK2Ens+bYLbDOLgKrEgU+TwGpEBSIkzrxfwQJRIyhxcuYTMJtTwFri3et1
 YPXMAuoSf+ZdgrLFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTc
 YiO94sTc4tK8dL3k/NxNjMCY3nbs55YdjF3vgg8xCnAwKvHwPrj3OEaINbGsuDL3EKMEB7OS
 CO/pU49ihHhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfmG7ySuINTQ3NLSwNzY3Njc0slMR5
 OwQOxggJpCeWpGanphakFsH0MXFwSjUwqtZ6SfElSM4Q81ZicTc89UtZZKeA4Vn3f1feH7jX
 /9Y9R3HNiytf8m7WnJDcnnrv/KX21tt7X7DUbQmddMlCtEuqo0zvd/LPiglr+cw6H4T6MYf9
 M75mcMJhn35qafCDGYa3vxn5rDDqEZz3fd3SYPfi/Y0ZFpMb1kjGe/Ybhv6ZXb/qgpCAEktx
 RqKhFnNRcSIAS5uLHf8CAAA=
X-CMS-MailID: 20190522100435eucas1p24398c029079c7a58e526299687bd1e61
X-Msg-Generator: CA
X-RootMTR: 20190521142317epcas2p44d184ead3ec7d514a8fa6784abf30747
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521142317epcas2p44d184ead3ec7d514a8fa6784abf30747
References: <20190520082216.26273-10-daniel.vetter@ffwll.ch>
 <CGME20190521142317epcas2p44d184ead3ec7d514a8fa6784abf30747@epcas2p4.samsung.com>
 <20190521142304.9652-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558519476;
 bh=fha/Fx6x2WdnhswPE74xM2jkxqehQxZKcmhjFF3aSc4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MJyyEDFv7cfW44rc9l7yKSR6NA9Bb+kE2QsBPN5RkGVTX6aFRDkpLRyWgnmcPQhD8
 WQKVMaSKQDpngVpmSbXbgXDUFRJh0PhfN/xFMtvwW/v134aNB71jVv2oLF/2XQj0pf
 uvvvYFYdGevrbaKsMp/q3VIlkUys98escyqEuP5Y=
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
Cc: Prarit Bhargava <prarit@redhat.com>, Kees Cook <keescook@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Konstantin Khorenko <khorenko@virtuozzo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhbmllbCwKCk9uIDUvMjEvMTkgNDoyMyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBU
aGlzIGlzIHVudXNlZCBjb2RlIHNpbmNlCj4gCj4gY29tbWl0IDYxMDRjMzcwOTRlNzI5ZjNkNGNl
NjU3OTcwMDIxMTI3MzVkNDljZDEKPiBBdXRob3I6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gRGF0ZTogICBUdWUgQXVnIDEgMTc6MzI6MDcgMjAxNyArMDIwMAo+IAo+
ICAgICBmYmNvbjogTWFrZSBmYmNvbiBhIGJ1aWx0LXRpbWUgZGVwZW5jeSBmb3IgZmJkZXYKPiAK
PiB3aGVuIGZiY29uIHdhcyBtYWRlIGEgY29tcGlsZS10aW1lIHN0YXRpYyBkZXBlbmRlbmN5IG9m
IGZiZGV2LiBXZQo+IGNhbid0IGV4aXQgZmJjb24gYW55bW9yZSB3aXRob3V0IGV4aXRpbmcgZmJk
ZXYgZmlyc3QsIHdoaWNoIG9ubHkgd29ya3MKPiBpZiBhbGwgZmJkZXYgZHJpdmVycyBoYXZlIHVu
bG9hZGVkIGFscmVhZHkuIEhlbmNlIHRoaXMgaXMgYWxsIGRlYWQKPiBjb2RlLgo+IAo+IHYyOiBJ
IG1pc3NlZCB0aGF0IGZiY29uX2V4aXQgaXMgYWxzbyBjYWxsZWQgZnJvbSBjb25fZGVpbml0IHN0
dWZmLCBhbmQKPiB0aGVyZSBmYmNvbl9oYXNfZXhpdGVkIHByZXZlbnRzIGRvdWJsZS1jbGVhbnVw
LiBCdXQgd2UgY2FuIGZpeCB0aGF0Cj4gYnkgcHJvcGVybHkgcmVzZXR0aW5nIGNvbjJmYl9tYXBb
XSB0byBhbGwgLTEsIHdoaWNoIGlzIHVzZWQgZXZlcnl3aGVyZQo+IGVsc2UgdG8gaW5kaWNhdGUg
Im5vIGZiX2luZm8gYWxsb2NhdGUgdG8gdGhpcyBjb25zb2xlIi4gV2l0aCB0aGF0Cj4gY2hhbmdl
IHRoZSBkb3VibGUtY2xlYW51cCAod2hpY2ggcmVzdWx0ZWQgaW4gYSBtb2R1bGUgcmVmY291bnQg
dW5kZXJmbG93LAo+IGFtb25nIG90aGVyIHRoaW5ncykgaXMgcHJldmVudGVkLgo+IAo+IEFzaWRl
OiBjb24yZmJfbWFwIGlzIGEgc2lnbmVkIGNoYXIsIHNvIGRvbid0IHJlZ2lzdGVyIG1vcmUgdGhh
biAxMjggZmJfaW5mbwo+IG9yIGhpbGFyaXR5IHdpbGwgZW5zdWUuCj4gCj4gdjM6IENJIHNob3dl
ZCBtZSB0aGF0IEkgc3RpbGwgZGlkbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIG9u
Cj4gaGVyZS4gVGhlIGxlYWtlZCByZWZlcmVuY2VzIGluIGNvbjJmYl9tYXAgaGF2ZSBiZWVuIHVz
ZWQgdXBvbgo+IHJlYmluZGluZyB0aGUgZmIgY29uc29sZSBpbiBmYmNvbl9pbml0LiBJdCB3b3Jr
ZWQgYmVjYXVzZSBmYmRldgo+IHVucmVnaXN0ZXJpbmcgc3RpbGwgY2xlYW5lZCBvdXQgY29uMmZi
X21hcCwgYW5kIHJlc2V0IGl0IHRvIGluZm9faWR4Lgo+IElmIHRoZSBsYXN0IGZiZGV2IGRyaXZl
ciB1bnJlZ2lzdGVyZWQsIHRoZW4gaXQgYWxzbyByZXNldCBpbmZvX2lkeCwKPiBhbmQgdW5yZWdp
c3RlcmVkIHRoZSBmYmNvbiBkcml2ZXIuCj4gCj4gSW1vIHRoYXQncyBhbGwgYSBiaXQgZnJhZ2ls
ZSwgc28gbGV0J3Mga2VlcCB0aGUgY29uMmZiX21hcCByZXNldCB0bwo+IC0xLCBhbmQgaW4gZmJj
b25faW5pdCBwaWNrIGluZm9faWR4IGlmIHdlJ3JlIHN0YXJ0aW5nIGZyZXNoLiBUaGF0Cj4gbWVh
bnMgdW5iaW5kaW5nIGFuZCByZWJpbmRpbmcgd2lsbCBjbGVhbnNlIHRoZSBtYXBwaW5nLCBidXQg
d2h5IGFyZQo+IHlvdSBkb2luZyB0aGF0IGlmIHlvdSB3YW50IHRvIHJldGFpbiB0aGUgbWFwcGlu
Zywgc28gc2hvdWxkIGJlIGZpbmUuCj4gCj4gQWxzbywgSSB0aGluayBpbmZvX2lkeCA9PSAtMSBp
cyBpbXBvc3NpYmxlIGluIGZiY29uX2luaXQgLSB3ZQo+IHVucmVnaXN0ZXIgdGhlIGZiY29uIGlu
IHRoYXQgY2FzZS4gU28gY2F0Y2gmd2FybiBhYm91dCB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJvbm5l
cy5vcmc+Cj4gQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KPiBDYzogS29uc3Rh
bnRpbiBLaG9yZW5rbyA8a2hvcmVua29AdmlydHVvenpvLmNvbT4KPiBDYzogUHJhcml0IEJoYXJn
YXZhIDxwcmFyaXRAcmVkaGF0LmNvbT4KPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIHwgMzkgKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pClRoaXMgcGF0Y2ggd2FzICMwOS8zMyBpbiB5b3VyIHBh
dGNoIHNlcmllcywgbm93IGl0IGlzIGluZGVwZW5kZW50IGNoYW5nZS4KCkRvIHlvdSB3YW50IG1l
IHRvIGFwcGx5IGl0IG5vdyBvciBzaG91bGQgSSB3YWl0IGZvciB0aGUgbmV3IHZlcnNpb24gb2YK
dGhlIHdob2xlIHNlcmllcz8KClsgSSBsb29rZWQgYXQgYWxsIHBhdGNoZXMgaW4gdGhlIHNlcmll
cyBhbmQgdGhleSBsb29rIGZpbmUgdG8gbWUuCiAgQWZ0ZXIgb3V0c3RhbmRpbmcgaXNzdWVzIGFy
ZSBmaXhlZCBJJ2xsIGJlIGhhcHB5IHRvIGFwcGx5IHRoZW0gYWxsCiAgdG8gZmJkZXYtZm9yLW5l
eHQgKEkgY2FuIGNyZWF0ZSBpbW11dGFibGUgYnJhbmNoIGlmIG5lZWRlZCkuIF0KCkJlc3QgcmVn
YXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUg
UG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
