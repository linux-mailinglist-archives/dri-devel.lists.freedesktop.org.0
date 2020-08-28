Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11E255D01
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 16:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876616E4C5;
	Fri, 28 Aug 2020 14:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409386E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:49:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200828144936euoutp01cf8d0b6999a22a38172ad23e27e26af8~vdgmZl7v41154511545euoutp01C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:49:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200828144936euoutp01cf8d0b6999a22a38172ad23e27e26af8~vdgmZl7v41154511545euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598626176;
 bh=rnJHZDd3J2Cg79B07RVoEV7HxwE8uhmX3bSXaJNxqDs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pnpm4ey7TSKo/uhiM2rz4EYvwE7vHPTKFc2Q0m61F6qEDlZ9yAZfspJuUk7YoI0G6
 LO936QYAvhpEfm1VbmXNNnpKwDrE9z2RoEAilyE96uB6pk/tFhLxvQsKpedZOXAH1T
 d/qnIegvCOZDOyeg61HDf9pYy1ci8h+tgJRTxy+w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200828144935eucas1p21bc6d076e38045d6b6e8590b1b889724~vdgmDisXY0200302003eucas1p2D;
 Fri, 28 Aug 2020 14:49:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C6.3D.06318.F79194F5; Fri, 28
 Aug 2020 15:49:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200828144935eucas1p144aa5bfceb24dc26b5149a4bcd462a48~vdglnRCu41371413714eucas1p1-;
 Fri, 28 Aug 2020 14:49:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200828144935eusmtrp1a5ca3fb1aa00dd2762742fb47b3cb456~vdglmZUdP0687706877eusmtrp1K;
 Fri, 28 Aug 2020 14:49:35 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-5c-5f49197f0318
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7C.1B.06017.F79194F5; Fri, 28
 Aug 2020 15:49:35 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200828144934eusmtip164aea37a1e5a1a68977a9bb8f8567f7e~vdgkZI_v01183611836eusmtip18;
 Fri, 28 Aug 2020 14:49:34 +0000 (GMT)
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: exynos-bus: Add documentation
 for interconnect properties
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Rob Herring <robh@kernel.org>, georgi.djakov@linaro.org
Message-ID: <35d9d396-b553-a815-1f3b-1af4dc37a2ca@samsung.com>
Date: Fri, 28 Aug 2020 16:49:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <65af1a5c-8f8a-ef65-07f8-e0b3d04c336c@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3e3V2lyfVqelpRMgysyAf6xy3DzAomVERQZKW27KKSU9tV
 SwkfvXPTzB7qDF8YipGu+cgsh4o1xJzQfJWvHqOYZBLzgSktt2vkf5/vOd/D9xw4JEaPCSVk
 fGIKq0yUJ0gJZ7zl7aJxZ9aG8Gj/GWMQM1l2AzHPixuEzPDsdyFT3m0UMgNzMwRT1K4jmMLJ
 Apzp79eKGN3XISFjantMMNa8bsQU9+sFzLPucREzmlNLMLbXrSKm+L6FCKVkuro7hGxs6DUh
 m1QZBLLG6ixZflMdkll1m48Sp5z3nGcT4tNYpV/IWee4paKUZC19efynRZSN5l1ykRMJVBA8
 Kn6P5yJnkqZqEZjuTot4MYugcbAM44UVwberVdi/kcJPPauNGgT63D4BL34hmO0dENldblQc
 LL5QE3YmqADIe5OP7OxOBcPTkR+OQIy6jkGe5amjIaZCQFc54hjGqa1gelLjGF5PRUGzYVDA
 e1yhp8SM29mJ2gs2VafDg1Ge8NFcLuB5C1xrLl1dNYeEhbdZPB8ATbVFxLMbTBmaVnkT9N5X
 OxYC6hoC9atRES8KEEwaKhDvCoYx4++VNHIlYRs0tPnx5X2gtb0U2MtAucDItCu/gwsUthRh
 fFkMt2/SvNsbluqKBDxLQGW24QVIqllzmWbNNZo112j+51YgvA55sqmcIpblAhPZS76cXMGl
 Jsb6xiQpdGjl53r/GOZakX75XBeiSCRdJx4hwqNpoTyNS1d0ISAxqbs4rK83ihafl6dnsMqk
 aGVqAst1oY0kLvUUB1ZZImkqVp7CXmDZZFb5rysgnSTZaHfa5uQEetcO75Izn49HeNLjA1qX
 g5r+qY5bb465hl6RHJgJq52YV0aYvMjlw/hovv9FVfCw+nRnvTJ9z6hfpDbT4sNNyJLivfaF
 xQx1eLzzsH2w4ldL9m9SlFaaT2wJrT32xePkYP38wqF206MYfYb4XmlZ5pGHqgdBPjne+lKx
 FOfi5AHbMSUn/wvR+ny4bwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xu7r1kp7xBts+i1vcn9fKaLFxxnpW
 i+tfnrNazD9yjtXiytf3bBbT925is5h0fwKLxfnzG9gtNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2Cz+79nBbjFj8ks2BwGPTas62TzuXNvD5nG/+ziTx+Yl9R59W1YxenzeJBfA
 FqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8Xt6
 ScEGoYq7716yNzB+4+ti5OSQEDCRmPTgJHMXIxeHkMBSRokV7/YzdTFyACWkJOa3KEHUCEv8
 udbFBlHznlGi7/g7VpCEsECGxLJ9LxhBbDYBQ4neo31gtoiAtcTqG29YQBqYBVqYJb5OmsEE
 0T2NSeJY70IWkCpeATuJTQtvsIPYLAKqEpeXLmcDsUUF4iQe9/5nhqgRlDg58wlYPaeAvcT/
 7oNgNcwC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi
 3PTcYiO94sTc4tK8dL3k/NxNjMC43nbs55YdjF3vgg8xCnAwKvHw3mDzjBdiTSwrrsw9xCjB
 wawkwut09nScEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucDU05eSbyhqaG5haWhubG5sZmF
 kjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGOZdvnHhyVU3kzdId3pL/tbQ0U/euK2ZP+LXv
 Wmdn3NMcFf1d9/VusG76/PfKB8vb8x4Ifuh9JHK1VCHkjETDOrf1T8wZctNe5Kzu//965/9Z
 fvdbUp3THl+canvvAHOfyHbF/f0Cfl5n7EW3T/aWmLS7/fRRzaclYXW9LAcLn4VKPY17l6Xe
 q8RSnJFoqMVcVJwIAIbpuC0BAwAA
X-CMS-MailID: 20200828144935eucas1p144aa5bfceb24dc26b5149a4bcd462a48
X-Msg-Generator: CA
X-RootMTR: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3@eucas1p2.samsung.com>
 <20200702163724.2218-2-s.nawrocki@samsung.com>
 <20200709210448.GA876103@bogus>
 <65af1a5c-8f8a-ef65-07f8-e0b3d04c336c@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, krzk@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAuMDcuMjAyMCAxNDoyOCwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3RlOgo+IE9uIDA5LjA3
LjIwMjAgMjM6MDQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBUaHUsIEp1bCAwMiwgMjAyMCBh
dCAwNjozNzoxOVBNICswMjAwLCBTeWx3ZXN0ZXIgTmF3cm9ja2kgd3JvdGU6Cj4+PiBBZGQgZG9j
dW1lbnRhdGlvbiBmb3IgbmV3IG9wdGlvbmFsIHByb3BlcnRpZXMgaW4gdGhlIGV4eW5vcyBidXMg
bm9kZXM6Cj4+PiBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQsICNpbnRlcmNvbm5lY3QtY2Vs
bHMsIGJ1cy13aWR0aC4KPj4+IFRoZXNlIHByb3BlcnRpZXMgYWxsb3cgdG8gc3BlY2lmeSB0aGUg
U29DIGludGVyY29ubmVjdCBzdHJ1Y3R1cmUgd2hpY2gKPj4+IHRoZW4gYWxsb3dzIHRoZSBpbnRl
cmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNpZmljCj4+PiBiYW5kd2lk
dGggcmVxdWlyZW1lbnRzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFN5bHdlc3RlciBOYXdyb2Nr
aSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KCj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dAo+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9zLWJ1cy50eHQKPj4+IEBAIC01
MSw2ICs1MSwxMyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzIG9ubHkgZm9yIHBhcmVudCBidXMgZGV2
aWNlOgo+Pj4gIC0gZXh5bm9zLHNhdHVyYXRpb24tcmF0aW86IHRoZSBwZXJjZW50YWdlIHZhbHVl
IHdoaWNoIGlzIHVzZWQgdG8gY2FsaWJyYXRlCj4+PiAgCQkJdGhlIHBlcmZvcm1hbmNlIGNvdW50
IGFnYWluc3QgdG90YWwgY3ljbGUgY291bnQuCj4+PiAgCj4+PiArT3B0aW9uYWwgcHJvcGVydGll
cyBmb3IgaW50ZXJjb25uZWN0IGZ1bmN0aW9uYWxpdHkgKFFvUyBmcmVxdWVuY3kgY29uc3RyYWlu
dHMpOgo+Pj4gKy0gc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50OiBwaGFuZGxlIHRvIHRoZSBw
YXJlbnQgaW50ZXJjb25uZWN0IG5vZGU7IGZvcgo+Pj4gKyAgcGFzc2l2ZSBkZXZpY2VzIHNob3Vs
ZCBwb2ludCB0byBzYW1lIG5vZGUgYXMgdGhlIGV4eW5vcyxwYXJlbnQtYnVzIHByb3BlcnR5LgoK
Pj4gQWRkaW5nIHZlbmRvciBzcGVjaWZpYyBwcm9wZXJ0aWVzIGZvciBhIGNvbW1vbiBiaW5kaW5n
IGRlZmVhdHMgdGhlIAo+PiBwb2ludC4KCkFjdHVhbGx5IHdlIGNvdWxkIGRvIHdpdGhvdXQgYW55
IG5ldyBwcm9wZXJ0eSBpZiB3ZSB1c2VkIGV4aXN0aW5nIGludGVyY29ubmVjdApjb25zdW1lcnMg
YmluZGluZyB0byBzcGVjaWZ5IGxpbmtpbmcgYmV0d2VlbiB0aGUgcHJvdmlkZXIgbm9kZXMuIEkg
dGhpbmsgdGhvc2UKZXh5bm9zLWJ1cyBub2RlcyBjb3VsZCB3ZWxsIGJlIGNvbnNpZGVyZWQgYm90
aCB0aGUgaW50ZXJjb25uZWN0IHByb3ZpZGVycyAKYW5kIGNvbnN1bWVycy4gVGhlIGV4YW1wbGUg
d291bGQgdGhlbiBiZSBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIAooeWVzLCBJIGtub3cgdGhl
IGJ1cyBub2RlIG5hbWluZyBuZWVkcyB0byBiZSBmaXhlZCk6CgoJc29jIHsKCQlidXNfZG1jOiBi
dXNfZG1jIHsKCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vcy1idXMiOwoJCQkvKiAuLi4g
Ki8KCQkJc2Ftc3VuZyxkYXRhLWNsb2NrLXJhdGlvID0gPDQ+OwoJCQkjaW50ZXJjb25uZWN0LWNl
bGxzID0gPDA+OwoJCX07CgoJCWJ1c19sZWZ0YnVzOiBidXNfbGVmdGJ1cyB7CgkJCWNvbXBhdGli
bGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKCQkJLyogLi4uICovCgkJCWludGVyY29ubmVjdHMg
PSA8JmJ1c19sZWZ0YnVzICZidXNfZG1jPjsKCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsK
CQl9OwoKCQlidXNfZGlzcGxheTogYnVzX2Rpc3BsYXkgewoJCQljb21wYXRpYmxlID0gInNhbXN1
bmcsZXh5bm9zLWJ1cyI7CgkJCS8qIC4uLiAqLwoJCQlpbnRlcmNvbm5lY3RzID0gPCZidXNfZGlz
cGxheSAmYnVzX2xlZnRidXM+OwoJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwoJCX07CgoK
CQkmbWl4ZXIgewoJCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zNDIxMi1taXhlciI7CgkJ
CWludGVyY29ubmVjdHMgPSA8JmJ1c19kaXNwbGF5ICZidXNfZG1jPjsKCQkJLyogLi4uICovCgkJ
fTsKCX07CgpXaGF0IGRvIHlvdSB0aGluaywgR2VvcmdpLCBSb2I/CgotLSAKUmVnYXJkcwpTeWx3
ZXN0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
