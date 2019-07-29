Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887E789C1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 12:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C5189949;
	Mon, 29 Jul 2019 10:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.145.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D355689949
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 10:42:09 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 4E5961402BF
 for <dri-devel@lists.freedesktop.org>;
 Mon, 29 Jul 2019 05:42:09 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id s36XhJfTgiQers36XhiqD9; Mon, 29 Jul 2019 05:42:09 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=41804 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hs36W-004JYV-NW; Mon, 29 Jul 2019 05:42:08 -0500
To: Anders Roxell <anders.roxell@linaro.org>, b.zolnierkie@samsung.com
References: <20190726112835.19928-1-anders.roxell@linaro.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 mQINBFssHAwBEADIy3ZoPq3z5UpsUknd2v+IQud4TMJnJLTeXgTf4biSDSrXn73JQgsISBwG
 2Pm4wnOyEgYUyJd5tRWcIbsURAgei918mck3tugT7AQiTUN3/5aAzqe/4ApDUC+uWNkpNnSV
 tjOx1hBpla0ifywy4bvFobwSh5/I3qohxDx+c1obd8Bp/B/iaOtnq0inli/8rlvKO9hp6Z4e
 DXL3PlD0QsLSc27AkwzLEc/D3ZaqBq7ItvT9Pyg0z3Q+2dtLF00f9+663HVC2EUgP25J3xDd
 496SIeYDTkEgbJ7WYR0HYm9uirSET3lDqOVh1xPqoy+U9zTtuA9NQHVGk+hPcoazSqEtLGBk
 YE2mm2wzX5q2uoyptseSNceJ+HE9L+z1KlWW63HhddgtRGhbP8pj42bKaUSrrfDUsicfeJf6
 m1iJRu0SXYVlMruGUB1PvZQ3O7TsVfAGCv85pFipdgk8KQnlRFkYhUjLft0u7CL1rDGZWDDr
 NaNj54q2CX9zuSxBn9XDXvGKyzKEZ4NY1Jfw+TAMPCp4buawuOsjONi2X0DfivFY+ZsjAIcx
 qQMglPtKk/wBs7q2lvJ+pHpgvLhLZyGqzAvKM1sVtRJ5j+ARKA0w4pYs5a5ufqcfT7dN6TBk
 LXZeD9xlVic93Ju08JSUx2ozlcfxq+BVNyA+dtv7elXUZ2DrYwARAQABtCxHdXN0YXZvIEEu
 IFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPokCPQQTAQgAJwUCWywcDAIbIwUJ
 CWYBgAULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRBHBbTLRwbbMZ6tEACk0hmmZ2FWL1Xi
 l/bPqDGFhzzexrdkXSfTTZjBV3a+4hIOe+jl6Rci/CvRicNW4H9yJHKBrqwwWm9fvKqOBAg9
 obq753jydVmLwlXO7xjcfyfcMWyx9QdYLERTeQfDAfRqxir3xMeOiZwgQ6dzX3JjOXs6jHBP
 cgry90aWbaMpQRRhaAKeAS14EEe9TSIly5JepaHoVdASuxklvOC0VB0OwNblVSR2S5i5hSsh
 ewbOJtwSlonsYEj4EW1noQNSxnN/vKuvUNegMe+LTtnbbocFQ7dGMsT3kbYNIyIsp42B5eCu
 JXnyKLih7rSGBtPgJ540CjoPBkw2mCfhj2p5fElRJn1tcX2McsjzLFY5jK9RYFDavez5w3lx
 JFgFkla6sQHcrxH62gTkb9sUtNfXKucAfjjCMJ0iuQIHRbMYCa9v2YEymc0k0RvYr43GkA3N
 PJYd/vf9vU7VtZXaY4a/dz1d9dwIpyQARFQpSyvt++R74S78eY/+lX8wEznQdmRQ27kq7BJS
 R20KI/8knhUNUJR3epJu2YFT/JwHbRYC4BoIqWl+uNvDf+lUlI/D1wP+lCBSGr2LTkQRoU8U
 64iK28BmjJh2K3WHmInC1hbUucWT7Swz/+6+FCuHzap/cjuzRN04Z3Fdj084oeUNpP6+b9yW
 e5YnLxF8ctRAp7K4yVlvA7kCDQRbLBwMARAAsHCE31Ffrm6uig1BQplxMV8WnRBiZqbbsVJB
 H1AAh8tq2ULl7udfQo1bsPLGGQboJSVN9rckQQNahvHAIK8ZGfU4Qj8+CER+fYPp/MDZj+t0
 DbnWSOrG7z9HIZo6PR9z4JZza3Hn/35jFggaqBtuydHwwBANZ7A6DVY+W0COEU4of7CAahQo
 5NwYiwS0lGisLTqks5R0Vh+QpvDVfuaF6I8LUgQR/cSgLkR//V1uCEQYzhsoiJ3zc1HSRyOP
 otJTApqGBq80X0aCVj1LOiOF4rrdvQnj6iIlXQssdb+WhSYHeuJj1wD0ZlC7ds5zovXh+FfF
 l5qH5RFY/qVn3mNIVxeO987WSF0jh+T5ZlvUNdhedGndRmwFTxq2Li6GNMaolgnpO/CPcFpD
 jKxY/HBUSmaE9rNdAa1fCd4RsKLlhXda+IWpJZMHlmIKY8dlUybP+2qDzP2lY7kdFgPZRU+e
 zS/pzC/YTzAvCWM3tDgwoSl17vnZCr8wn2/1rKkcLvTDgiJLPCevqpTb6KFtZosQ02EGMuHQ
 I6Zk91jbx96nrdsSdBLGH3hbvLvjZm3C+fNlVb9uvWbdznObqcJxSH3SGOZ7kCHuVmXUcqoz
 ol6ioMHMb+InrHPP16aVDTBTPEGwgxXI38f7SUEn+NpbizWdLNz2hc907DvoPm6HEGCanpcA
 EQEAAYkCJQQYAQgADwUCWywcDAIbDAUJCWYBgAAKCRBHBbTLRwbbMdsZEACUjmsJx2CAY+QS
 UMebQRFjKavwXB/xE7fTt2ahuhHT8qQ/lWuRQedg4baInw9nhoPE+VenOzhGeGlsJ0Ys52sd
 XvUjUocKgUQq6ekOHbcw919nO5L9J2ejMf/VC/quN3r3xijgRtmuuwZjmmi8ct24TpGeoBK4
 WrZGh/1hAYw4ieARvKvgjXRstcEqM5thUNkOOIheud/VpY+48QcccPKbngy//zNJWKbRbeVn
 imua0OpqRXhCrEVm/xomeOvl1WK1BVO7z8DjSdEBGzbV76sPDJb/fw+y+VWrkEiddD/9CSfg
 fBNOb1p1jVnT2mFgGneIWbU0zdDGhleI9UoQTr0e0b/7TU+Jo6TqwosP9nbk5hXw6uR5k5PF
 8ieyHVq3qatJ9K1jPkBr8YWtI5uNwJJjTKIA1jHlj8McROroxMdI6qZ/wZ1ImuylpJuJwCDC
 ORYf5kW61fcrHEDlIvGc371OOvw6ejF8ksX5+L2zwh43l/pKkSVGFpxtMV6d6J3eqwTafL86
 YJWH93PN+ZUh6i6Rd2U/i8jH5WvzR57UeWxE4P8bQc0hNGrUsHQH6bpHV2lbuhDdqo+cM9eh
 GZEO3+gCDFmKrjspZjkJbB5Gadzvts5fcWGOXEvuT8uQSvl+vEL0g6vczsyPBtqoBLa9SNrS
 VtSixD1uOgytAP7RWS474w==
Subject: Re: [PATCH] video: fbdev: Mark expected switch fall-through
Message-ID: <6689420e-2383-b7d1-fccc-5d0a149975be@embeddedor.com>
Date: Mon, 29 Jul 2019 05:42:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726112835.19928-1-anders.roxell@linaro.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hs36W-004JYV-NW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.11.120]:41804
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tI1InY25XuRFb2ybHZ7jkvgFNykX+oW2psCL79T0A2M=; b=ikgY1QHyCWfCTl2KPmi0t2j1a3
 BS0xFue+R6gJGVdgydv8EMYCH8S+Y4Fg4EkBBJmW5ccRgMxHrIXAuOMc4CDlv0K4V5TPwtZ1i+m8o
 7QpuPa1qSaZyyg/R8nfYUlPq26XbMuxJ6bb8G41g2oeTdjbWZgnVyUDQITBUQFDBZKq4HfnvnzTys
 KDQwh/0WfKgugXS3CQMBnH33QN7F4ncNdAfNEW6akk+A1KlTjFfmMWGVAZYV4o4p/h4TC1JB+AfpX
 q11mLf4APGwoLvoQ2gF27A9Q5gynPX7pxxmaWUQZGm9nUUa17wfWNS2HvFP/CO+NsOgqw3havmJex
 tnSOu0vQ==;
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kZXJzLAoKT24gNy8yNi8xOSA2OjI4IEFNLCBBbmRlcnMgUm94ZWxsIHdyb3RlOgo+IFdo
ZW4gZmFsbC10aHJvdWdoIHdhcm5pbmdzIHdhcyBlbmFibGVkIGJ5IGRlZmF1bHQgdGhlIGZvbGxv
d2luZyB3YXJuaW5ncwo+IHdhcyBzdGFydGluZyB0byBzaG93IHVwOgo+IAo+IC4uL2RyaXZlcnMv
dmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jOiBJbiBmdW5jdGlvbiDigJhzaF9tb2JpbGVf
bGNkY19jaGFubmVsX2ZiX2luaXTigJk6Cj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2Jp
bGVfbGNkY2ZiLmM6MjA4NjoyMjogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKPiAg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgaW5mby0+Zml4LnlwYW5zdGVw
ID0gMjsKPiAgICB+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+Cj4gLi4vZHJpdmVycy92aWRlby9mYmRl
di9zaF9tb2JpbGVfbGNkY2ZiLmM6MjA4NzoyOiBub3RlOiBoZXJlCj4gICBjYXNlIFY0TDJfUElY
X0ZNVF9OVjE2Ogo+ICAgXn5+fgo+IC4uL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xj
ZGNmYi5jOiBJbiBmdW5jdGlvbiDigJhzaF9tb2JpbGVfbGNkY19vdmVybGF5X2ZiX2luaXTigJk6
Cj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MTU5NjoyMjogd2Fy
bmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKPiAgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD1dCj4gICAgaW5mby0+Zml4LnlwYW5zdGVwID0gMjsKPiAgICB+fn5+fn5+fn5+fn5+
fn5+fn5+Xn5+Cj4gLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmM6MTU5
NzoyOiBub3RlOiBoZXJlCj4gICBjYXNlIFY0TDJfUElYX0ZNVF9OVjE2Ogo+ICAgXn5+fgo+IAo+
IFJld29yayBzbyB0aGF0IHRoZSBjb21waWxlciBkb2Vzbid0IHdhcm4gYWJvdXQgZmFsbC10aHJv
dWdoLgo+IAo+IEZpeGVzOiBkOTM1MTJlZjBmMGUgKCJNYWtlZmlsZTogR2xvYmFsbHkgZW5hYmxl
IGZhbGwtdGhyb3VnaCB3YXJuaW5nIikKClRoaXMgaXMgYSBtaXN1c2Ugb2YgdGhlICdGaXhlcycg
dGFnLiBZb3UgYXJlIG5vdCBmaXhpbmcgdGhhdCBjb21taXQuIFlvdSBhcmUKYWRkcmVzc2luZyBh
IHdhcm5pbmcgZHVlIHRvIHRoZSBlbmFibGVtZW50IG9mIC1XaW1wbGljaXQtZmFsbHRocm91Z2gg
aW4KdGhhdCBjb21taXQuCgpJIHRoaW5rIHRoYXQgc2F5aW5nIHRoYXQgeW91IGFyZSBhZGRyZXNz
aW5nIGEgd2FybmluZyBkdWUgdG8gdGhlIGVuYWJsZW1lbnQKb2YgLVdpbXBsaWNpdC1mYWxsdGhy
b3VnaCBpcyB0aGUgcmlnaHQgd2F5IHRvIGp1c3RpZnkgdGhpcyBjaGFuZ2UuCgpUaGFua3MKLS0K
R3VzdGF2bwoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5j
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMKPiBpbmRleCBhYzBiY2FjOWE4NjUuLmMyNDk3NjNk
YmYwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIu
Ywo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCj4gQEAgLTE1
OTQsNiArMTU5NCw3IEBAIHNoX21vYmlsZV9sY2RjX292ZXJsYXlfZmJfaW5pdChzdHJ1Y3Qgc2hf
bW9iaWxlX2xjZGNfb3ZlcmxheSAqb3ZsKQo+ICAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxMjoKPiAg
CWNhc2UgVjRMMl9QSVhfRk1UX05WMjE6Cj4gIAkJaW5mby0+Zml4LnlwYW5zdGVwID0gMjsKPiAr
CQkvKiBGYWxsIHRocm91Z2ggKi8KPiAgCWNhc2UgVjRMMl9QSVhfRk1UX05WMTY6Cj4gIAljYXNl
IFY0TDJfUElYX0ZNVF9OVjYxOgo+ICAJCWluZm8tPmZpeC54cGFuc3RlcCA9IDI7Cj4gQEAgLTIw
ODQsNiArMjA4NSw3IEBAIHNoX21vYmlsZV9sY2RjX2NoYW5uZWxfZmJfaW5pdChzdHJ1Y3Qgc2hf
bW9iaWxlX2xjZGNfY2hhbiAqY2gsCj4gIAljYXNlIFY0TDJfUElYX0ZNVF9OVjEyOgo+ICAJY2Fz
ZSBWNEwyX1BJWF9GTVRfTlYyMToKPiAgCQlpbmZvLT5maXgueXBhbnN0ZXAgPSAyOwo+ICsJCS8q
IEZhbGwgdGhyb3VnaCAqLwo+ICAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxNjoKPiAgCWNhc2UgVjRM
Ml9QSVhfRk1UX05WNjE6Cj4gIAkJaW5mby0+Zml4LnhwYW5zdGVwID0gMjsKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
