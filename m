Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C47EEE9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431036ED18;
	Fri,  2 Aug 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318CA6E3C4
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 07:59:47 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190801075946euoutp02196708fac7e9cb2a055ebc221d4c5141~2vZk4oM0W0112901129euoutp02o
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 07:59:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190801075946euoutp02196708fac7e9cb2a055ebc221d4c5141~2vZk4oM0W0112901129euoutp02o
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190801075945eucas1p148c54c5c41f014ec4238e03d73209f3d~2vZkNXfay1104411044eucas1p1V;
 Thu,  1 Aug 2019 07:59:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 88.6E.04377.1FB924D5; Thu,  1
 Aug 2019 08:59:45 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190801075944eucas1p10f92b2f34172c4c8f85656983d335f64~2vZjRx4fk2237322373eucas1p15;
 Thu,  1 Aug 2019 07:59:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190801075944eusmtrp24b52198052c3e8764b8e81666c050d5b~2vZjDhtfg0694206942eusmtrp2o;
 Thu,  1 Aug 2019 07:59:44 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-b6-5d429bf12fd3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.83.04140.0FB924D5; Thu,  1
 Aug 2019 08:59:44 +0100 (BST)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190801075943eusmtip1f5f38bb917a2d719f295ac3ea68eae5d~2vZidr86Z1476114761eusmtip1I;
 Thu,  1 Aug 2019 07:59:43 +0000 (GMT)
Message-ID: <62557522be4924a01d3822d4734c30f2965c608b.camel@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 01 Aug 2019 09:59:42 +0200
In-Reply-To: <6e8b2081-2fb3-9ab8-37d1-8b5fe5fd8e11@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djP87ofZzvFGhz+KGqxccZ6VovrX56z
 Wsw/co7V4srX92wW0/duYrOYdH8Ci8X58xvYLTY9vsZqcXnXHDaLz71HGC1mnN/HZLH2yF12
 i9uNK9gsZkx+yebA57FpVSebx51re9g87ncfZ/LYvKTeo2/LKkaPz5vkAtiiuGxSUnMyy1KL
 9O0SuDJ+H3rJWLBBpuLKcs8Gxh7xLkZODgkBE4mX23cwdTFycQgJrGCU2LvnNwuE84VRYsq3
 VewQzmdGifam92xdjBxgLXdb+CHiyxklTv6fDlX0jFHiyp5TzCBzeQUCJC5dfcgKYgsLJEks
 eHQRzGYTcJf49/wKK0iDiMAnRomzS2YzgjjMAh8ZJRp+tYN1swioSizt280EYnMK2En8vrWU
 DeJaHYm3p/pYQM7gFRCU+LtDGCTMLCAv0bx1NjPIHAmBe+wSK6d0QNW7SPRtXMEOYQtLvDq+
 BcqWkfi/cz4ThF0s8XTnfVaI5gZGiU3LjjBDJKwlDh8HOZsDaIOmxPpd+hBhR4m3fUeZIUHB
 J3HjrSDEDXwSk7ZNhwrzSnS0CUGYWhILfkdDNEpINK2+BjXbQ6Ll0XP2CYyKsxB+mYXkl1kI
 WxcwMq9iFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITFqn/x3/soNx15+kQ4wCHIxKPLwK
 PY6xQqyJZcWVuYcYJTiYlUR4F4vbxwrxpiRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0kkJ5Y
 kpqdmlqQWgSTZeLglGpgnLni6xnpLQGJwfNuRr/glW86JHIzhrupyPahbfujSf1e9SdyHi/q
 eln+MmHF7w+ykyX/tOTYGFquef277K+5/9Q6/+DLhg7t7sq6X3r+JSos7TXcfKRfbq+zj9nD
 m2V7Zn1MiHzuLdvymOvQidfta6fpCNRq8TblWbDf+eN4m6Pt0G9+3iwtJZbijERDLeai4kQA
 C54i6lYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7ofZjvFGvT1iVpsnLGe1eL6l+es
 FvOPnGO1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2i02Pr7FaXN41h83ic+8RRosZ5/cxWaw9cpfd
 4nbjCjaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5ALYoPZui/NKSVIWM
 /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzfh14yFmyQqbiy3LOB
 sUe8i5GDQ0LAROJuC38XIxeHkMBSRonvB9cydzFyAsUlJD6uv8EKYQtL/LnWxQZiCwk8YZTY
 c50HxOYVCJC4dPUhWI2wQJLEgkcXwWw2AXeJf8+vsIIMFRH4zChxeNEnFpAEM4hzY1kOiM0i
 oCqxtG83E4jNKWAn8fvWUjaIK1qZJK5N2ssK0aAp0br9NzvEFToSb0/1sYBczSsgKPF3hzBE
 ibxE89bZzBMYBWch6ZiFUDULSdUCRuZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgdG47djP
 LTsYu94FH2IU4GBU4uE90ekYK8SaWFZcmXuIUYKDWUmEd7G4fawQb0piZVVqUX58UWlOavEh
 RlOgfyYyS4km5wMTRV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6p
 Bsb1q25rmmglLj/orXzOP+9HfIvQPAbDC5Vb7t53ZZXVUI1ecvfDntMdte1PzX9+8IlLKvud
 sfBB5pYVUd8eq69unzHLuUn4/b1jbGcE//8O2yWb7rn54uRbdWaZvhNE3h60UPN/vsYs7ubD
 2Defz29q8Fx288Sp2W/Yty4zWXwxbp+V6RqdA18TlViKMxINtZiLihMBIkRDMdwCAAA=
X-CMS-MailID: 20190801075944eucas1p10f92b2f34172c4c8f85656983d335f64
X-Msg-Generator: CA
X-RootMTR: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
 <6e8b2081-2fb3-9ab8-37d1-8b5fe5fd8e11@linaro.org>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564646386;
 bh=uCq2MLxSrtJv6mtG5c2BOzfNDZhr5+amxgb65dHy6RI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ds1V6aYMuCCKMDH/NjpiXFm8lRbBr1Bu1QfnNfxwT3VHpuf0dQFP0ufzFAYxj/BC+
 YB0yBchnYdgT3sCT8yZLu5OD0eZYRcAlKm2VH33MiPpyuRVqFtkc9ipMedlitc7UXD
 hhYvqQHSHAvgB6MB63YFPifkdMIRXm44W8NDW+Cc=
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
Cc: =?UTF-8?Q?Bart=C5=82omiej_?= =?UTF-8?Q?=C5=BBo=C5=82nierkiewicz?=
 <b.zolnierkie@samsung.com>, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VvcmdpLAoKT24gRnJpLCAyMDE5LTA3LTI2IGF0IDExOjA1ICswMzAwLCBHZW9yZ2kgRGph
a292IHdyb3RlOgo+IEhpIEFydHVyLAo+IAo+IE9uIDcvMjMvMTkgMTU6MjAsIEFydHVyIMWad2ln
b8WEIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIGludGVyY29ubmVjdCBmdW5jdGlvbmFsaXR5
IHRvIHRoZSBleHlub3MtYnVzIGRldmZyZXEKPiA+IGRyaXZlci4KPiA+IAo+ID4gVGhlIFNvQyB0
b3BvbG9neSBpcyBhIGdyYXBoIChvciwgbW9yZSBzcGVjaWZpY2FsbHksIGEgdHJlZSkgYW5kIG1v
c3Qgb2YgaXRzCj4gPiBlZGdlcyBhcmUgdGFrZW4gZnJvbSB0aGUgZGV2ZnJlcSBwYXJlbnQtY2hp
bGQgaGllcmFyY2h5IChjZi4KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
ZXZmcmVxL2V4eW5vcy1idXMudHh0KS4gVGhlIHByZXZpb3VzCj4gPiBwYXRjaCBhZGRzIG1pc3Np
bmcgZWRnZXMgdG8gdGhlIERUICh1bmRlciB0aGUgbmFtZSAncGFyZW50JykuIER1ZSB0bwo+ID4g
dW5zcGVjaWZpZWQgcmVsYXRpdmUgcHJvYmluZyBvcmRlciwgLUVQUk9CRV9ERUZFUiBtYXkgYmUg
cHJvcGFnYXRlZCB0bwo+ID4gZ3VhcmFudGVlIHRoYXQgYSBjaGlsZCBpcyBwcm9iZWQgYmVmb3Jl
IGl0cyBwYXJlbnQuCj4gPiAKPiA+IEVhY2ggYnVzIGlzIG5vdyBhbiBpbnRlcmNvbm5lY3QgcHJv
dmlkZXIgYW5kIGFuIGludGVyY29ubmVjdCBub2RlIGFzIHdlbGwKPiA+IChjZi4gRG9jdW1lbnRh
dGlvbi9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnJzdCksIGkuZS4gZXZlcnkgYnVzIHJlZ2lz
dGVycwo+ID4gaXRzZWxmIGFzIGEgbm9kZS4gTm9kZSBJRHMgYXJlIG5vdCBoYXJkY29kZWQgYnV0
IHJhdGhlciBhc3NpZ25lZCBhdAo+ID4gcnVudGltZSwgaW4gcHJvYmluZyBvcmRlciAoc3ViamVj
dCB0byB0aGUgYWJvdmUtbWVudGlvbmVkIGV4Y2VwdGlvbgo+ID4gcmVnYXJkaW5nIHJlbGF0aXZl
IG9yZGVyKS4gVGhpcyBhcHByb2FjaCBhbGxvd3MgZm9yIHVzaW5nIHRoaXMgZHJpdmVyIHdpdGgK
PiA+IHZhcmlvdXMgRXh5bm9zIFNvQ3MuCj4gCj4gSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUg
RXh5bm9zIGJ1cyB0b3BvbG9neSwgYnV0IGl0IHNlZW1zIHRvIG1lIHRoYXQgaXQncyBub3QKPiBy
ZXByZXNlbnRlZCBjb3JyZWN0bHkuIEFuIGludGVyY29ubmVjdCBwcm92aWRlciB3aXRoIGp1c3Qg
YSBzaW5nbGUgbm9kZSAocG9ydCkKPiBpcyBvZGQuIEkgd291bGQgZXhwZWN0IHRoYXQgZWFjaCBw
cm92aWRlciBjb25zaXN0cyBvZiBtdWx0aXBsZSBtYXN0ZXIgYW5kIHNsYXZlCj4gbm9kZXMuIFRo
aXMgZGF0YSB3b3VsZCBiZSB1c2VkIGJ5IGEgZnJhbWV3b3JrIHRvIHVuZGVyc3RhbmQgd2hhdCBh
cmUgdGhlIGxpbmtzCj4gYW5kIGhvdyB0aGUgdHJhZmZpYyBmbG93cyBiZXR3ZWVuIHRoZSBJUCBi
bG9ja3MgYW5kIHRocm91Z2ggd2hpY2ggYnVzZXMuCgpUbyBzdW1tYXJpemUgdGhlIGV4eW5vcy1i
dXMgdG9wb2xvZ3lbMV0gdXNlZCBieSB0aGUgZGV2ZnJlcSBkcml2ZXI6IFRoZXJlIGFyZQptYW55
IGRhdGEgYnVzZXMgZm9yIGRhdGEgdHJhbnNmZXIgaW4gU2Ftc3VuZyBFeHlub3MgU29DLiBFdmVy
eSBidXMgaGFzIGl0cyBvd24KY2xvY2suIEJ1c2VzIG9mdGVuIHNoYXJlIHBvd2VyIGxpbmVzLCBp
biB3aGljaCBjYXNlIG9uZSBvZiB0aGUgYnVzZXMgb24gdGhlCnBvd2VyIGxpbmUgaXMgcmVmZXJy
ZWQgdG8gYXMgJ3BhcmVudCcgKG9yIGFzICdkZXZmcmVxJyBpbiB0aGUgRFQpLiBJbiB0aGUKcGFy
dGljdWxhciBjYXNlIG9mIEV4eW5vczQ0MTJbMV1bMl0sIHRoZSB0b3BvbG9neSBjYW4gYmUgZXhw
cmVzc2VkIGFzIGZvbGxvd3M6CgpidXNfZG1jCi0tIGJ1c19hY3AKLS0gYnVzX2MyYwoKYnVzX2xl
ZnRidXMKLS0gYnVzX3JpZ2h0YnVzCi0tIGJ1c19kaXNwbGF5Ci0tIGJ1c19mc3lzCi0tIGJ1c19w
ZXJpCi0tIGJ1c19tZmMKCldoZXJlIGJ1c19kbWMgYW5kIGJ1c19sZWZ0YnVzIHByb2JhYmx5IGNv
dWxkIGJlIHJlZmVycmVkIHRvIGFzIG1hc3RlcnMsIGFuZCB0aGUKZm9sbG93aW5nIGluZGVudGVk
IG5vZGVzIGFzIHNsYXZlcy4gUGF0Y2ggMDgvMTEgb2YgdGhpcyBSRkMgYWRkaXRpb25hbGx5IGFk
ZHMKdGhlIGZvbGxvd2luZyB0byB0aGUgRFQ6CgpidXNfZG1jCi0tIGJ1c19sZWZ0YnVzCgpXaGlj
aCBtYWtlcyB0aGUgdG9wb2xvZ3kgYSB2YWxpZCB0cmVlLgoKVGhlIGV4eW5vcy1idXMgY29uY2Vw
dCBpbiBkZXZmcmVxWzNdIGlzIGRlc2lnbmVkIGluIHN1Y2ggYSB3YXkgdGhhdCBldmVyeSBidXMg
aXMKcHJvYmVkIHNlcGFyYXRlbHkgYXMgYSBwbGF0Zm9ybSBkZXZpY2UsIGFuZCBpcyBhIGxhcmdl
bHkgaW5kZXBlbmRlbnQgZW50aXR5LgpUaGlzIFJGQyBwcm9wb3NlcyBhbiBleHRlbnNpb24gdG8g
dGhlIGV4aXN0aW5nIGRldmZyZXEgZHJpdmVyIHRoYXQgYmFzaWNhbGx5CnByb3ZpZGVzIGEgc2lt
cGxlIFFvUyB0byBlbnN1cmUgbWluaW11bSBjbG9jayBmcmVxdWVuY3kgZm9yIHNlbGVjdGVkIGJ1
c2VzCihwb3NzaWJseSBvdmVycmlkaW5nIGRldmZyZXEgZ292ZXJub3IgY2FsY3VsYXRpb25zKSB1
c2luZyB0aGUgaW50ZXJjb25uZWN0CmZyYW1ld29yay4KClRoZSBoaWVyYXJjaHkgaXMgbW9kZWxs
ZWQgaW4gc3VjaCBhIHdheSB0aGF0IGV2ZXJ5IGJ1cyBpcyBhbiBpbnRlcmNvbm5lY3Qgbm9kZS4K
T24gdGhlIG90aGVyIGhhbmQsIHdoYXQgaXMgY29uc2lkZXJlZCBhbiBpbnRlcmNvbm5lY3QgcHJv
dmlkZXIgaGVyZSBpcyBxdWl0ZQphcmJpdHJhcnksIGJ1dCBmb3IgdGhlIHJlYXNvbnMgbWVudGlv
bmVkIGluIHRoZSBhYm92ZSBwYXJhZ3JhcGgsIHRoaXMgUkZDCmFzc3VtZXMgdGhhdCBldmVyeSBi
dXMgaXMgYSBwcm92aWRlciBvZiBpdHNlbGYgYXMgYSBub2RlLiBVc2luZyBhbiBhbHRlcm5hdGl2
ZQpzaW5nbGV0b24gcHJvdmlkZXIgYXBwcm9hY2ggd2FzIGRlZW1lZCBtb3JlIGNvbXBsaWNhdGVk
IHNpbmNlIHRoZSAnZGV2JyBmaWVsZCBpbgonc3RydWN0IGljY19wcm92aWRlcicgaGFzIHRvIGJl
IHNldCB0byBzb21ldGhpbmcgbWVhbmluZ2Z1bCBhbmQgd2UgYXJlIHRpZWQgdG8KdGhlICdzYW1z
dW5nLGV4eW5vcy1idXMnIGNvbXBhdGlibGUgc3RyaW5nIGluIHRoZSBkcml2ZXIgKGFuZCBtdWx0
aXBsZSBpbnN0YW5jZXMKb2YgZXh5bm9zLWJ1cyBwcm9iZWQgaW4gaW5kZXRlcm1pbmF0ZSByZWxh
dGl2ZSBvcmRlcikuCgpJJ20gbG9va2luZyBmb3J3YXJkIHRvIGhlYXJpbmcgYW55IGFkZGl0aW9u
YWwgdGhvdWdodHMgeW91IG1heSBoYXZlIG9uIHRoaXMKdG9waWMuCgpCZXN0IHJlZ2FyZHMsCi0t
IApBcnR1ciDFmndpZ2/FhApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxl
Y3Ryb25pY3MKClsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9l
eHlub3MtYnVzLnR4dApbMl0KYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29t
bW9uLmR0c2kKWzNdIGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMKKHN1YmplY3Qgb2YgdGhp
cyBwYXRjaCkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
