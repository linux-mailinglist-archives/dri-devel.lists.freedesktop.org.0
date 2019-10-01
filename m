Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC3C43B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 00:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A19F6E8AC;
	Tue,  1 Oct 2019 22:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1334 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2019 22:20:13 UTC
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.150.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97726E8AC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 22:20:13 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id AA42B8D23C0F
 for <dri-devel@lists.freedesktop.org>;
 Tue,  1 Oct 2019 16:57:58 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id FQ9eiUv7S3Qi0FQ9ei3ey6; Tue, 01 Oct 2019 16:57:58 -0500
X-Authority-Reason: nr=8
Received: from [187.192.22.73] (port=35754 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iFQ9e-0014bq-2C; Tue, 01 Oct 2019 16:57:58 -0500
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20191001171635.GA17306@embeddedor>
 <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
 <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
 <dc76a52b-09a2-7ab9-b53e-52500f4f8669@amd.com>
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
Message-ID: <3c6ebf4a-8cba-40e2-7d70-c4d5006a160b@embeddedor.com>
Date: Tue, 1 Oct 2019 16:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc76a52b-09a2-7ab9-b53e-52500f4f8669@amd.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.22.73
X-Source-L: No
X-Exim-ID: 1iFQ9e-0014bq-2C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.22.73]:35754
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H0qiex9RmtrMEEVNXKA/BGYgUi4eW/UijlkfLH1YdBQ=; b=fBn600iyGcdMLRzaVYHjMSX0N6
 yhjuNQ2uHTlE9+drdt8h7FAWcReGxIzQHKxdWay7NQUZJMcMFaXJ9KaMV6e6j1l4cTCashU0yXbjC
 MCV8/Bfdn/A1fZ3aAj4XsfiZpNT2Y3mmYxb9esQOJqylEKbSPpRICdmhxQBh2LSQbPRLpID5Uk1uD
 tLX5BkH0ARnnQuUHlbzYP0cfnIbPsEU/iyuIwE/GdGIeyfmtjDkFsl6ASRfZSjd+aOWSfLTW5ovY3
 ShZc20EIS2U8HC459zkq/3lF3UShyAopJSpDQuvvAhCXnBpGIibFhH/CKIdlAV17v5TKkba0knQ7x
 gcGQFpfA==;
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxMC8xLzE5IDE2OjQ2LCBMaXUsIExlbyB3cm90ZToKCj4+Pj4gKwkJcmluZy0+c2NoZWQu
cmVhZHkgPSB0cnVlOwo+Pj4gVGhpcyBpcyByZWR1bmRhbnQuIGFsbCB0aGUgc2NoZWQtPnJlYWR5
IGlzIGluaXRpYWxpemVkIGFzIHRydWUsIHBsZWFzZQo+Pj4gcmVmZXIgdG8gZHJtX3NjaGVkX2lu
aXQoKQo+Pj4KPj4gSSBzZWUuLi4gc28gaW4gdGhlIGZvbGxvd2luZyBjb21taXQgMWI2MWRlNDVk
ZmFmICgiZHJtL2FtZGdwdTogYWRkIGluaXRpYWwgVkNOMi4wIHN1cHBvcnQgKHYyKSIpCj4+IHRo
YXQgbGluZSBpcyBhbHNvIHJlZHVuZGFudD8KPiAKPiBZZXMuCj4gCgpPSy4KCj4gCj4+Pj4gICAg
CQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwo+Pj4+ICAgIAkJaWYgKHIpIHsKPj4+
PiAgICAJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+Pj4+IEBAIC0yNjYsOCArMjY3LDcg
QEAgc3RhdGljIGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkKPj4+PiAgICAKPj4+
PiAgICAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7Cj4+
Pj4gICAgCQkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtqXS5yaW5nX2VuY1tpXTsKPj4+PiAtCQkJ
cmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPj4+PiAtCQkJY29udGludWU7Cj4+Pj4gKwkJCXJp
bmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsKPj4+IEJlY2F1c2UgdGhlIFZDTiAyLjUgRlcgc3RpbGwg
aGFzIGlzc3VlIGZvciBlbmNvZGUsIHNvIHdlIGhhdmUgaXQKPj4+IGRpc2FibGVkIGhlcmUuCj4+
Pgo+PiBPSy4gU28sIG1heWJlIHdlIGNhbiBhZGQgYSBjb21tZW50IHBvaW50aW5nIHRoYXQgb3V0
Pwo+IAo+IFRoYXQgY291bGQgYmUgYmV0dGVyLgo+IAoKR3JlYXQuIEknbSBnbGFkIGl0J3Mgbm90
IGEgYnVnLiAgSSdsbCB3cml0ZSBhIHBhdGNoIGZvciB0aGF0IHNvIG90aGVyCnBlb3BsZSBkb24n
dCB3YXN0ZSB0aW1lIHRha2luZyBhIGxvb2suCgpJIGFwcHJlY2lhdGUgeW91ciBmZWVkYmFjay4K
VGhhbmtzCi0tCkd1c3Rhdm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
