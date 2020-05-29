Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E881E89B0
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 23:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43126E973;
	Fri, 29 May 2020 21:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825696E973;
 Fri, 29 May 2020 21:11:54 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200529211152euoutp02ae3b517eb5fe4ae0e036cdedab0df92f~TnBZEd7Ue2875928759euoutp02v;
 Fri, 29 May 2020 21:11:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200529211152euoutp02ae3b517eb5fe4ae0e036cdedab0df92f~TnBZEd7Ue2875928759euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590786712;
 bh=dvY+FiUsAiJnTxLNORQDyXbiOs6V4mCD33FUXV5Ad88=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Ozzupd1ctUphYt3GU2BT13dlis6OagTDMd4G49JEHhF3W3TRB1/uwLOPQxCwwOQzt
 3tyvdbBpNWH2VHEYRrlMa5Z9Atzv6PRWiKMQJ7tOO7QTfV4gghTsiQoVGqHenbz6+x
 GHn7sbuI6nh0x46MVxuWsGrNSwfb4yzK3v1qW0b0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200529211152eucas1p24a7256775766c6fb0b55d9d24858f1d2~TnBYp0imp1322213222eucas1p2Q;
 Fri, 29 May 2020 21:11:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 60.64.61286.89A71DE5; Fri, 29
 May 2020 22:11:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200529211151eucas1p1de3ce652a119f37c714b741aa5e3525f~TnBYAWsMn1592015920eucas1p14;
 Fri, 29 May 2020 21:11:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200529211151eusmtrp28aaacc47cb6378c7d91e19ecfae46848~TnBX-O7F50926509265eusmtrp2Q;
 Fri, 29 May 2020 21:11:51 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-3b-5ed17a981e36
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.AA.07950.79A71DE5; Fri, 29
 May 2020 22:11:51 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200529211149eusmtip2b6bf63acde89c62ed24f4ddf485421f9~TnBWRY2ve2357023570eusmtip2o;
 Fri, 29 May 2020 21:11:49 +0000 (GMT)
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig
 <hch@infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
Date: Fri, 29 May 2020 23:11:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxiG856vnnYrOT0wecUlc000kWwi0S3PdDG4ze2YLcu2xD8uolWP
 YATUVhg4khGKMDvQg87JDk35kAhzTLBVtARaYZlN09GWDwkjLKgwBBxFEE1ARwc9svHvvu/3
 evI894+XJfkpJo49lHFcNGYY0vSMhmq6PRt4s+xEZ/KGiulo8A89o6DE7yXgabiYAZ87RIEU
 HEfQ82SSgdKfzpHg/Ht04UGqJqBcchBQ6d4Ctd0NCPJ+DtJQIFdT0FpFQGHlp3Bm6CEJgUCj
 Cqznj4F9qJeGUneHCrqbrQx0mzsRTN8NkyBVmUkoC7gIODUjM1Bz0sNAfsFGcFq9NMxLszS0
 PRqmwS33qsBhP0/CbLONgtoOGwMFA28lrRHqbfVIaLvfzggjd0aQ4JT/VAmOunjhYssYIdgv
 n2KEgd4WRgj5/SrhxtO7tGDzfi4MfuchBEfNN8K5vloklJhDjDDpusN8xu/SvHtATDuUJRoT
 tu7VpF7tyzkqr8oeq3dSecixwoLULOY24UCZnbIgDctzdQj/cb0GKWYG4Wcj9wnFPEb4d99J
 1dLIw19LX1C1CBf2V9CKmUTYVe4mF6lo7hMsBRuYRR3DfYGLJuQIRHINGuxwlUYghkvElglL
 BNJyW7G1pYha1BS3BpfM9UTyV7jduHhwnFQYHfb+OBxh1FwSbix6FGFI7jVsvl5OKjoW9w9X
 RO7GnF+Nu25OEcrdH+ALt68yio7G455rL/q8isPOpQEzwvf8v6gUU4xwd34ZUqgteMA/tzDN
 LqxYhxuaE5R4G7aVS5EYc1G4b0KnHBGFzzZdIJVYi78t5BV6LZY9V/5b2xbsIiWkl5dVk5fV
 kZfVkf/fW4moyyhWzDSlp4imxAzxq/UmQ7opMyNl/f4j6Xa08BF8857pm+hJ1752xLFI/7I2
 O74zmacNWaac9HaEWVIfo32vw5fMaw8Yck6IxiN7jJlpoqkdrWIpfax2Y/XYbp5LMRwXD4vi
 UdG49Eqw6rg8BJ3XEvi5KevKr1t/u/WSbu9F/mz+rkujb+Tyde8HNJwh+FHo+6z9ufT2bRr5
 sKyL2fd49bGQvXXet32n9PaHJer+PfaqKw9Q4+jmhKhbuntyn7g6O3XHx68/z/lyMK6pZ+h5
 eAfJ/PDX5hbrTKL34Hz4NFiicu2h7KTUf95RuW5k6SlTqiExnjSaDP8CU3RiiAQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjG8z+3FmK3s4L6HyNezsI+eKkeSu2LY4wsITkmc5ljydywaKNH
 MNLW9RQj8IFGEGYV10Zx85RVQAcTiGLrZTVMQh0jDeEWkBCjyAYhQ1dEFBS3yEq7JXx78jy/
 34c3eZWk+iiToDxgtolWszGfY2KprtedIxu/K+rP2Xyn/D3oGfubgsqeIAFzCycZ6GqbosDZ
 9wjB4OwTBlyXTpPg/+vP8OCsI8Dt9BFQ0/Y+NAxcQWBv6qOhTK6j4JdaAsprPoFvxx6T0Nvb
 ooDqqq/BOzZEg6utWwEDt6oZGCjtRzAzukCCs7aUhO97bxNw/LnMwMVjnQwcLdOCvzpIw2vn
 PA3t0+M0tMlDCvB5q0iYv+WhoKHbw0DZfV1GktDsaUZC+x8BRpi4O4EEv/xAIfh+WidcaJ0k
 BG/jcUa4P9TKCFM9PQrh5twoLXiCO4SHJzoJwXexRDg93ICEytIpRnhy+y7zqforTZrVUmAT
 1+RZJNsHXDYPyRo+FTTJKakaXqs3bE3WcZvS0/aJ+QcOi9ZN6Xs0eVeHCw/J7xyZbPZTduRb
 4UAxSsym4Md3XGgxq9kfEZ5zvR3tE3HwrJ2O5jj8z5CDcaDYMBNCeMQdigxx7MfY2XeFWczx
 7GfYfipELkIk64vFp37tUESNHwg8K1+mFimG5bEj5IgYKjYdV7dWRHqKTcKVrwYj/XLWgE9c
 eKmIMm/h4LnxCBPDZuCWiukIQ7JbsMf3OxnNq3Hpdfd/eSW+N36ecCK1vESXlyjyEkVeotQg
 qhHFiwWSKdckJWsko0kqMOdq9lpMXhT+vxu/zV/7GTmmsgKIVSJumapvQ3+OmjYelgpNAYSV
 JBev+qi7K0et2mcsLBKtlt3WgnxRCiBd+DgXmbB8ryX8zWbbbl7H6yGV12v12i3ArVR9w7bv
 UrO5Rpt4UBQPidb/PUIZk2BHJdPZj65x5cV09oqsxHtkZkW9gaoY3u4dHXzWqJ9Jyzwz00qn
 dn1Yp880xG131593F43tedM/8YU2v9G4jHtj9ez+L7PSqnSrSjJDa+MN765fe2xNYrFpmyOl
 /fPacxtqzAv8joaOI2cvF7Y0BewpGahjcv/GkRc7XXMvimkvm/SUo6Q8I7+OtErGfwHumZIe
 lQMAAA==
X-CMS-MailID: 20200529211151eucas1p1de3ce652a119f37c714b741aa5e3525f
X-Msg-Generator: CA
X-RootMTR: 20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG9nYW4sCgpPbiAyOS4wNS4yMDIwIDIxOjA1LCBMb2dhbiBHdW50aG9ycGUgd3JvdGU6Cj4g
T24gMjAyMC0wNS0yOSA2OjQ1IGEubS4sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+PiBPbiBU
aHUsIE1heSAyOCwgMjAyMCBhdCAwNjowMDo0NFBNIC0wNjAwLCBMb2dhbiBHdW50aG9ycGUgd3Jv
dGU6Cj4+Pj4gVGhpcyBpc3N1ZSBpcyBtb3N0IGxpa2VseSBpbiB0aGUgaTkxNSBkcml2ZXIgYW5k
IGlzIG1vc3QgbGlrZWx5IGNhdXNlZCBieSB0aGUgZHJpdmVyIG5vdCByZXNwZWN0aW5nIHRoZSBy
ZXR1cm4gdmFsdWUgb2YgdGhlIGRtYV9tYXBfb3BzOjptYXBfc2cgZnVuY3Rpb24uIFlvdSBjYW4g
c2VlIHRoZSBkcml2ZXIgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSBoZXJlOgo+Pj4+IGh0dHBz
Oi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20vdXJsP2s9Y2EyNWEzNGItOTdmN2I4MTMtY2EyNDI4MDQt
MGNjNDdhMzFjOGI0LTBlY2RmZmM5ZjU2ODUxZTEmcT0xJnU9aHR0cHMlM0ElMkYlMkZnaXRodWIu
Y29tJTJGdG9ydmFsZHMlMkZsaW51eCUyRmJsb2IlMkY3ZTAxNjViMmYxYTkxMmEwNmUzODFlOTFm
MGY0ZTQ5NWY0YWMzNzM2JTJGZHJpdmVycyUyRmdwdSUyRmRybSUyRmk5MTUlMkZnZW0lMkZpOTE1
X2dlbV9kbWFidWYuYyUyM0w1MQo+Pj4+Cj4+Pj4gUHJldmlvdXNseSB0aGlzIGRpZG7igJl0IGNh
dXNlIGlzc3VlcyBiZWNhdXNlIHRoZSBpbnRlbCBtYXBfc2cgYWx3YXlzIHJldHVybmVkIHRoZSBz
YW1lIG51bWJlciBvZiBlbGVtZW50cyBhcyB0aGUgaW5wdXQgc2NhdHRlciBnYXRoZXIgbGlzdCBi
dXQgd2l0aCB0aGUgY2hhbmdlIHRvIHRoaXMgZG1hLWlvbW11IGFwaSB0aGlzIGlzIG5vIGxvbmdl
ciB0aGUgY2FzZS4gSSB3YXNu4oCZdCBhYmxlIHRvIHRyYWNrIHRoZSBidWcgZG93biB0byBhIHNw
ZWNpZmljIGxpbmUgb2YgY29kZSB1bmZvcnR1bmF0ZWx5Lgo+PiBNYXJrIGRpZCBhIGJpZyBhdWRp
dCBpbnRvIHRoZSBtYXBfc2cgQVBJIGFidXNlIGFuZCBpbml0aWFsbHkgaGFkCj4+IHNvbWUgaTkx
NSBwYXRjaGVzLCBidXQgdGhlbiBnYXZlIHVwIG9uIHRoZW0gd2l0aCB0aGlzIGNvbW1lbnQ6Cj4+
Cj4+ICJUaGUgYmlnZ2VzdCBUT0RPIGlzIERSTS9pOTE1IGRyaXZlciBhbmQgSSBkb24ndCBmZWVs
IGJyYXZlIGVub3VnaCB0byBmaXgKPj4gICBpdCBmdWxseS4gVGhlIGRyaXZlciBjcmVhdGl2ZWx5
IHVzZXMgc2dfdGFibGUtPm9yaWdfbmVudHMgdG8gc3RvcmUgdGhlCj4+ICAgc2l6ZSBvZiB0aGUg
YWxsb2NhdGUgc2NhdHRlcmxpc3QgYW5kIGlnbm9yZXMgdGhlIG51bWJlciBvZiB0aGUgZW50cmll
cwo+PiAgIHJldHVybmVkIGJ5IGRtYV9tYXBfc2cgZnVuY3Rpb24uIEluIHRoaXMgcGF0Y2hzZXQg
SSBvbmx5IGZpeGVkIHRoZQo+PiAgIHNnX3RhYmxlIG9iamVjdHMgZXhwb3J0ZWQgYnkgZG1hYnVm
IHJlbGF0ZWQgZnVuY3Rpb25zLiBJIGhvcGUgdGhhdCBJCj4+ICAgZGlkbid0IGJyZWFrIGFueXRo
aW5nIHRoZXJlLiIKPj4KPj4gaXQgd291bGQgYmUgcmVhbGx5IG5pY2UgaWYgdGhlIGk5MTUgbWFp
bnRhaW5lcnMgY291bGQgaGVscCB3aXRoIHNvcnRpbmcKPj4gdGhhdCBBUEkgYWJ1c2Ugb3V0Lgo+
Pgo+IEkgYWdyZWUgY29tcGxldGVseSB0aGF0IHRoZSBBUEkgYWJ1c2Ugc2hvdWxkIGJlIHNvcnRl
ZCBvdXQsIGJ1dCBJIHRoaW5rCj4gdGhhdCdzIG11Y2ggbGFyZ2VyIHRoYW4ganVzdCB0aGUgaTkx
NSBkcml2ZXIuIFByZXR0eSBtdWNoIGV2ZXJ5IGRtYS1idWYKPiBtYXBfZG1hX2J1ZiBpbXBsZW1l
bnRhdGlvbiBJIGxvb2tlZCBhdCBpZ25vcmVzIHRoZSByZXR1cm5lZCBuZW50cyBvZgo+IHNnX2F0
dHJzLiBUaGlzIHN1Y2tzLCBidXQgSSBkb24ndCB0aGluayBpdCdzIHRoZSBidWcgVG9tIHJhbiBp
bnRvLiBTZWU6Cj4KPiBhbWRncHVfZG1hX2J1Zl9tYXAKPiBhcm1hZGFfZ2VtX3ByaW1lX21hcF9k
bWFfYnVmCj4gZHJtX2dlbV9tYXBfZG1hX2J1Zgo+IGk5MTVfZ2VtX21hcF9kbWFfYnVmCj4gdGVn
cmFfZ2VtX3ByaW1lX21hcF9kbWFfYnVmCj4KPiBTbyB0aGlzIHNob3VsZCBwcm9iYWJseSBiZSBh
ZGRyZXNzZWQgYnkgdGhlIHdob2xlIEdQVSBjb21tdW5pdHkuCgpQYXRjaGVzIGFyZSBwZW5kaW5n
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDIwMDUxMzEzMjExNC42MDQ2
LTEtbS5zenlwcm93c2tpQHNhbXN1bmcuY29tL1QvCgo+IEhvd2V2ZXIsIGFzIFJvYmluIHBvaW50
ZWQgb3V0LCB0aGVyZSBhcmUgb3RoZXIgdWdseSB0cmlja3MgbGlrZSBzdG9wcGluZwo+IGl0ZXJh
dGluZyB0aHJvdWdoIHRoZSBTR0wgd2hlbiBzZ19kbWFfbGVuKCkgaXMgemVyby4gRm9yIGV4YW1w
bGUsIHRoZQo+IEFNRCBkcml2ZXIgYXBwZWFycyB0byB1c2UgZHJtX3ByaW1lX3NnX3RvX3BhZ2Vf
YWRkcl9hcnJheXMoKSB3aGljaCBkb2VzCj4gdGhpcyB0cmljayBhbmQgdGh1cyBsaWtlbHkgaXNu
J3QgYnVnZ3kgKG90aGVyd2lzZSwgSSdkIGV4cGVjdCBzb21lb25lIHRvCj4gaGF2ZSBjb21wbGFp
bmVkIGJ5IG5vdyBzZWVpbmcgQU1EIGhhcyBhbHJlYWR5IHN3aXRjaGVkIHRvIElPTU1VLURNQS4K
CkknbSBub3Qgc3VyZSB0aGF0IHRoaXMgaXMgYSB0cmljay4gU3RvcHBpbmcgYXQgemVybyBzZ19k
bWFfbGVuKCkgd2FzIApzb21ld2hlcmUgZG9jdW1lbnRlZC4KCj4gQXMgSSB0cmllZCB0byBwb2lu
dCBvdXQgaW4gbXkgcHJldmlvdXMgZW1haWwsIGk5MTUgZG9lcyBub3QgZG8gdGhpcwo+IHRyaWNr
LiBJbiBmYWN0LCBpdCBjb21wbGV0ZWx5IGlnbm9yZXMgc2dfZG1hX2xlbigpIGFuZCBpcyB0aHVz
Cj4gY29tcGxldGVseSBicm9rZW4uIFNlZSBpOTE1X3NjYXR0ZXJsaXN0LmggYW5kIHRoZSBfX3Nn
dF9pdGVyKCkgZnVuY3Rpb24uCj4gU28gaXQgZG9lc24ndCBzb3VuZCB0byBtZSBsaWtlIE1hcmsn
cyBmaXggd291bGQgYWRkcmVzcyB0aGUgaXNzdWUgYXQKPiBhbGwuIFBlciBteSBwcmV2aW91cyBl
bWFpbCwgSSdkIGd1ZXNzIHRoYXQgaXQgY2FuIGJlIGZpeGVkIHNpbXBseSBieQo+IGFkanVzdGlu
ZyB0aGUgX19zZ3RfaXRlcigpIGZ1bmN0aW9uIHRvIGRvIHNvbWV0aGluZyBtb3JlIHNlbnNpYmxl
Lgo+IChCZXR0ZXIgeWV0LCBpZiBwb3NzaWJsZSwgZGl0Y2ggX19zZ3RfaXRlcigpIGFuZCB1c2Ug
dGhlIGNvbW1vbiBEUk0KPiBmdW5jdGlvbiB0aGF0IEFNRCB1c2VzKS4KPgo+IFRoaXMgd291bGQg
YXQgbGVhc3QgYWxsb3cgdXMgdG8gbWFrZSBwcm9ncmVzcyB3aXRoIFRvbSdzIElPTU1VLURNQSBw
YXRjaAo+IHNldCBhbmQgb25jZSB0aGF0IGdldHMgaW4sIGl0IHdpbGwgYmUgaGFyZGVyIGZvciBv
dGhlciBkcml2ZXJzIHRvIG1ha2UKPiB0aGUgc2FtZSBtaXN0YWtlLgoKQmVzdCByZWdhcmRzCi0t
IApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
