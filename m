Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628238E6B8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C09C6E91E;
	Thu, 15 Aug 2019 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245DE6E055
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:16:07 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190813061605epoutp04555cc20ed41997575107bb8eedd24c44~6ZueIFMvj1918719187epoutp04f
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190813061605epoutp04555cc20ed41997575107bb8eedd24c44~6ZueIFMvj1918719187epoutp04f
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190813061604epcas1p43d325761010aa4fdd5e36a6dac72ea4f~6ZuderG-x0120401204epcas1p4V;
 Tue, 13 Aug 2019 06:16:04 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4672XJ5vH5zMqYlv; Tue, 13 Aug
 2019 06:16:00 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 20.24.04066.0A5525D5; Tue, 13 Aug 2019 15:16:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190813061600epcas1p33ce1749e852497ea8d2093f978bb16f8~6ZuZxca7q0318403184epcas1p3I;
 Tue, 13 Aug 2019 06:16:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190813061600epsmtrp26ed9a09a69ca14b0dbc75289b4cb9ad4~6ZuZwe2k82316323163epsmtrp2r;
 Tue, 13 Aug 2019 06:16:00 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-e2-5d5255a015ec
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.93.03706.0A5525D5; Tue, 13 Aug 2019 15:16:00 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190813061559epsmtip1b78be1b5e0d8cf3a5a94bc24d44a8371~6ZuZX6mMb2327223272epsmtip1P;
 Tue, 13 Aug 2019 06:15:59 +0000 (GMT)
Subject: Re: [RFC PATCH 00/11] Simple QoS for exynos-bus driver using
 interconnect
From: Chanwoo Choi <cw00.choi@samsung.com>
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Organization: Samsung Electronics
Message-ID: <08be4ed8-5a6c-e0da-61a3-ca7b9fa61aab@samsung.com>
Date: Tue, 13 Aug 2019 15:19:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6be31199-a93d-c440-e0cd-7453e3ac1648@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDJsWRmVeSWpSXmKPExsWy7bCmvu6C0KBYg5utBhaHjm1lt5h/5Byr
 xZWv79kspu/dxGYx6f4EFovz5zewW2x6fI3V4vKuOWwWn3uPMFrMOL+PyWLtkbvsFrcbV7BZ
 zJj8ks2B12PTqk42jzvX9rB53O8+zuSxeUm9x8F3e5g8+rasYvT4vEkugD0q2yYjNTEltUgh
 NS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6FolhbLEnFKgUEBicbGS
 vp1NUX5pSapCRn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbG9o5O1oLpihXt
 Z7azNzC2SncxcnJICJhIzDx/lLGLkYtDSGAHo8Tly9fYIJxPjBKTv22DynxjlPjSu5oFpqXl
 3G+oqr2MEt/OnmcDSQgJvAdyjleB2MICIRLHN39lBLHZBLQk9r+4AVYjItDOJNG80QGkmVlg
 IqPE8+P/mUAS/AKKEld/PAZr4BWwk/izZBtQnIODRUBV4u1CEZCwqECExKcHh1khSgQlTs58
 AnYQp4C9xKW768BamQXEJW49mc8EYctLNG+dzQyyS0JgHbvElWNLmSE+cJHoPHuBCcIWlnh1
 fAs7hC0l8fndXjYIu1pi5ckjbBDNHYwSW/ZfYIVIGEvsXzoZ7DhmAU2J9bv0IcKKEjt/z4U6
 gk/i3dceVpASCQFeiY42IYgSZYnLD+5CrZWUWNzeyTaBUWkWkndmIXlhFpIXZiEsW8DIsopR
 LLWgODc9tdiwwBg5tjcxglOylvkOxg3nfA4xCnAwKvHwViQExgqxJpYVV+YeYpTgYFYS4b1k
 EhQrxJuSWFmVWpQfX1Sak1p8iNEUGNgTmaVEk/OB+SKvJN7Q1MjY2NjCxNDM1NBQSZx34Q+L
 WCGB9MSS1OzU1ILUIpg+Jg5OqQbG/r9bl8ZKzfs/+/O3zMVyZ4XsZDUXXZobbVN8YGtUfN9H
 G/tz/3MDT/9c+mbSzVDeiUrOXql3Ij5E7dBZtC5p6+K78yc4Wz/Z9KkjLslL/WAk+82p4m5/
 dl5dwFhs6S5WNdt76pJdF8R7/kyapWfCz9JsJR/3S1va+mFZRPLmKWzWuutvrOReoMRSnJFo
 qMVcVJwIAPbeD6ffAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsWy7bCSnO6C0KBYgxetAhaHjm1lt5h/5Byr
 xZWv79kspu/dxGYx6f4EFovz5zewW2x6fI3V4vKuOWwWn3uPMFrMOL+PyWLtkbvsFrcbV7BZ
 zJj8ks2B12PTqk42jzvX9rB53O8+zuSxeUm9x8F3e5g8+rasYvT4vEkugD2KyyYlNSezLLVI
 3y6BK2N7RydrwXTFivYz29kbGFuluxg5OSQETCRazv1m62Lk4hAS2M0ocf/2AkaIhKTEtItH
 mbsYOYBsYYnDh4shat4ySjy7NJ8NpEZYIETi+OavYPVsAloS+1/cABskItDOJNHdupURxGEW
 mMgo8fjwWmaI9lOMEv+P9oG18AsoSlz98RjM5hWwk/izZBsTyDoWAVWJtwtFQMKiAhESh3fM
 gioRlDg58wkLiM0pYC9x6e46sDizgLrEn3mXmCFscYlbT+YzQdjyEs1bZzNPYBSehaR9FpKW
 WUhaZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzg+tTR3MF5eEn+IUYCD
 UYmHtyIhMFaINbGsuDL3EKMEB7OSCO8lk6BYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxP845F
 CgmkJ5akZqemFqQWwWSZODilGhjD1tVfl+cyvViyNtHtyYYNdzZ7KFdMcBVmz3r4rGv+QTk7
 hjkqCrNOtE49EZfy5saDFM1b0icvK1+NjtvFGy/z//T6tXNvXXG/87ApPCfW8674hCPnp0V3
 Tzg0i/E098LXMW+qhD51aymX7o3pOMdltKYg2Eb4dISZDN+MJx1u6+95F5+O4/ynxFKckWio
 xVxUnAgAVept3MsCAAA=
X-CMS-MailID: 20190813061600epcas1p33ce1749e852497ea8d2093f978bb16f8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190723122022eucas1p2f568f74f981f9de9012eb693c3b446d5
References: <CGME20190723122022eucas1p2f568f74f981f9de9012eb693c3b446d5@eucas1p2.samsung.com>
 <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <6be31199-a93d-c440-e0cd-7453e3ac1648@samsung.com>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565676965;
 bh=aJ0BBXg/PQedMyWJYwbpKNP9D6ywJDdijDmPYYIiPy4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bT/OhGwWBS3YbDJUKMtt8wULIC/f9JDR+Su61V3orZAkCvAS+zE+dZBapCCFlPM/8
 aCyWbA8+Hz1SG6edv1WDzXvUAkVIx2mg0hjWYHaYAiAgy1TDp/sUrv5/m7vDTOgGD/
 nLFPZU+bFwwSJEKnljsDelOhXnVPVqh6tMAvvKB4=
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
Cc: sw0312.kim@samsung.com, krzk@kernel.org, myungjoo.ham@samsung.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJ0dXIsCgpPbiAxOS4gOC4gMTMuIOyYpO2bhCAzOjE3LCBDaGFud29vIENob2kgd3JvdGU6
Cj4gSGkgQXJ0dXIuCj4gCj4gVGhlIHBhdGNoMS00IGluIHRoaXMgc2VyaWVzIGRlcGVuZCBvbiBv
dGhlciBwYXRjaGVzWzFdIG9uIG1haW5saW5lLgo+IE9uIG5leHQgdjIgdmVyc2lvbiwgcGxlYXNl
IG1ha2Ugc29tZSBwYXRjaGVzIGJhc2VkIG9uIHBhdGNoZXNbMV0KPiBpbiBvcmRlciB0byBwcmV2
ZW50IHRoZSBtZXJnZSBjb25mbGljdC4gCj4gCj4gWzFdIFtSRVNFTkQgUEFUQ0ggdjUgMC80XSBh
ZGQgY291cGxlZCByZWd1bGF0b3JzIGZvciBFeHlub3M1NDIyLzU4MDAKPiAtIGh0dHBzOi8vcHJv
dGVjdDIuZmlyZWV5ZS5jb20vdXJsP2s9NGYzNTk0NGZiMDdiNmJhMi40ZjM0MWYwMC05NDk4ZTgz
MWUzYzg2YmZiJnU9aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOC84LzIxNwoKQWRkIGNvcnJl
Y3QgcmVmZXJlbmNlIHVybCBhcyBmb2xsb3dpbmc6Ci0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTkvOC84LzIxNwoKPiAKPiBBbHNvLCBhcyBJIGNvbW1lbnRlZCwgd2UgYmV0dGVyIHRvIGRpc2N1
c3MgaXQgYmVmb3JlIHNlbmRpbmcgdGhlIHYyLgo+IAo+IE9uIDE5LiA3LiAyMy4g7Jik7ZuEIDk6
MjAsIEFydHVyIMWad2lnb8WEIHdyb3RlOgo+PiBUaGUgZm9sbG93aW5nIHBhdGNoc2V0IGFkZHMg
aW50ZXJjb25uZWN0WzFdWzJdIGZyYW1ld29yayBzdXBwb3J0IHRvIHRoZQo+PiBleHlub3MtYnVz
IGRldmZyZXEgZHJpdmVyLiBFeHRlbmRpbmcgdGhlIGRldmZyZXEgZHJpdmVyIHdpdGggaW50ZXJj
b25uZWN0Cj4+IGNhcGFiaWxpdGllcyBzdGFydGVkIGFzIGEgcmVzcG9uc2UgdG8gdGhlIGlzc3Vl
IHJlZmVyZW5jZWQgaW4gWzNdLiBUaGUKPj4gcGF0Y2hlcyBjYW4gYmUgc3ViZGl2aWRlZCBpbnRv
IGZvdXIgbG9naWNhbCBncm91cHM6Cj4+Cj4+IChhKSBSZWZhY3RvcmluZyB0aGUgZXhpc3Rpbmcg
ZGV2ZnJlcSBkcml2ZXIgaW4gb3JkZXIgdG8gaW1wcm92ZSByZWFkYWJpbGl0eQo+PiBhbmQgYWNj
b21tb2RhdGUgZm9yIGFkZGluZyBuZXcgY29kZSAocGF0Y2hlcyAwMS0tMDQvMTEpLgo+Pgo+PiAo
YikgVHdlYWtpbmcgdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmsgdG8gc3VwcG9ydCB0aGUgZXh5
bm9zLWJ1cyB1c2UgY2FzZQo+PiAocGF0Y2hlcyAwNS0tMDcvMTEpLiBFeHBvcnRpbmcgb2ZfaWNj
X2dldF9mcm9tX3Byb3ZpZGVyKCkgYWxsb3dzIHVzIHRvCj4+IGF2b2lkIGhhcmRjb2RpbmcgZXZl
cnkgc2luZ2xlIGdyYXBoIGVkZ2UgaW4gdGhlIERUIG9yIGRyaXZlciBzb3VyY2UsIGFuZAo+PiBy
ZWxheGluZyB0aGUgcmVxdWlyZW1lbnQgY29udGFpbmVkIGluIHRoYXQgZnVuY3Rpb24gcmVtb3Zl
cyB0aGUgbmVlZCB0bwo+PiBwcm92aWRlIGR1bW15IG5vZGUgSURzIGluIHRoZSBEVC4gQWRqdXN0
aW5nIHRoZSBsb2dpYyBpbgo+PiBhcHBseV9jb25zdHJhaW50cygpIChkcml2ZXJzL2ludGVyY29u
bmVjdC9jb3JlLmMpIGFjY291bnRzIGZvciB0aGUgZmFjdAo+PiB0aGF0IGV2ZXJ5IGJ1cyBpcyBh
IHNlcGFyYXRlIGVudGl0eSBhbmQgdGhlcmVmb3JlIGEgc2VwYXJhdGUgaW50ZXJjb25uZWN0Cj4+
IHByb3ZpZGVyLCBhbGJlaXQgY29uc3RpdHV0aW5nIGEgcGFydCBvZiBhIGxhcmdlciBoaWVyYXJj
aHkuCj4+Cj4+IChjKSBJbXBsZW1lbnRpbmcgaW50ZXJjb25uZWN0IHByb3ZpZGVycyBpbiB0aGUg
ZXh5bm9zLWJ1cyBkZXZmcmVxIGRyaXZlcgo+PiBhbmQgYWRkaW5nIHJlcXVpcmVkIERUIHByb3Bl
cnRpZXMgZm9yIG9uZSBzZWxlY3RlZCBwbGF0Zm9ybSwgbmFtZWx5Cj4+IEV4eW5vczQ0MTIgKHBh
dGNoZXMgMDgtLTA5LzExKS4gRHVlIHRvIHRoZSBmYWN0IHRoYXQgdGhpcyBhaW1zIHRvIGJlIGEK
Pj4gZ2VuZXJpYyBkcml2ZXIgZm9yIHZhcmlvdXMgRXh5bm9zIFNvQ3MsIG5vZGUgSURzIGFyZSBn
ZW5lcmF0ZWQgZHluYW1pY2FsbHkKPj4gcmF0aGVyIHRoYW4gaGFyZGNvZGVkLiBUaGlzIGhhcyBi
ZWVuIGRldGVybWluZWQgdG8gYmUgYSBzaW1wbGVyIGFwcHJvYWNoLAo+PiBidXQgZGVwZW5kcyBv
biBjaGFuZ2VzIGRlc2NyaWJlZCBpbiAoYikuCj4+Cj4+IChkKSBJbXBsZW1lbnRpbmcgYSBzYW1w
bGUgaW50ZXJjb25uZWN0IGNvbnN1bWVyIGZvciBleHlub3MtbWl4ZXIgdGFyZ2V0ZWQKPj4gYXQg
dGhlIGlzc3VlIHJlZmVyZW5jZWQgaW4gWzNdLCBhZ2FpbiB3aXRoIERUIGluZm8gb25seSBmb3Ig
RXh5bm9zNDQxMgo+PiAocGF0Y2hlcyAxMC0tMTEvMTEpLgo+Pgo+PiBJbnRlZ3JhdGlvbiBvZiBk
ZXZmcmVxIGFuZCBpbnRlcmNvbm5lY3QgZnVuY3Rpb25hbGl0aWVzIGNvbWVzIGRvd24gdG8gb25l
Cj4+IGV4dHJhIGxpbmUgaW4gdGhlIGRldmZyZXEgdGFyZ2V0KCkgY2FsbGJhY2ssIHdoaWNoIHNl
bGVjdHMgZWl0aGVyIHRoZQo+PiBmcmVxdWVuY3kgY2FsY3VsYXRlZCBieSB0aGUgZGV2ZnJlcSBn
b3Zlcm5vciwgb3IgdGhlIG9uZSByZXF1ZXN0ZWQgd2l0aCB0aGUKPj4gaW50ZXJjb25uZWN0IEFQ
SSwgd2hpY2hldmVyIGlzIGhpZ2hlci4gQWxsIG5ldyBjb2RlIHdvcmtzIGVxdWFsbHkgd2VsbCB3
aGVuCj4+IENPTkZJR19JTlRFUkNPTk5FQ1QgaXMgJ24nIChhcyBpbiBleHlub3NfZGVmY29uZmln
KSBpbiB3aGljaCBjYXNlIGFsbAo+PiBpbnRlcmNvbm5lY3QgQVBJIGZ1bmN0aW9ucyBhcmUgbm8t
b3BzLgo+Pgo+PiAtLS0KPj4gQXJ0dXIgxZp3aWdvxYQKPj4gU2Ftc3VuZyBSJkQgSW5zdGl0dXRl
IFBvbGFuZAo+PiBTYW1zdW5nIEVsZWN0cm9uaWNzCj4+Cj4+IC0tLQo+PiBSZWZlcmVuY2VzOgo+
PiBbMV0gRG9jdW1lbnRhdGlvbi9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnJzdAo+PiBbMl0g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVyY29ubmVjdC9pbnRlcmNvbm5l
Y3QudHh0Cj4+IFszXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODYxNzU3
Cj4+Cj4+IEFydHVyIMWad2lnb8WEICgxMCk6Cj4+ICAgZGV2ZnJlcTogZXh5bm9zLWJ1czogRXh0
cmFjdCBleHlub3NfYnVzX3Byb2ZpbGVfaW5pdCgpCj4+ICAgZGV2ZnJlcTogZXh5bm9zLWJ1czog
RXh0cmFjdCBleHlub3NfYnVzX3Byb2ZpbGVfaW5pdF9wYXNzaXZlKCkKPj4gICBkZXZmcmVxOiBl
eHlub3MtYnVzOiBDaGFuZ2UgZ290by1iYXNlZCBsb2dpYyB0byBpZi1lbHNlIGxvZ2ljCj4+ICAg
ZGV2ZnJlcTogZXh5bm9zLWJ1czogQ2xlYW4gdXAgY29kZQo+PiAgIGljYzogRXhwb3J0IG9mX2lj
Y19nZXRfZnJvbV9wcm92aWRlcigpCj4+ICAgaWNjOiBSZWxheCByZXF1aXJlbWVudCBpbiBvZl9p
Y2NfZ2V0X2Zyb21fcHJvdmlkZXIoKQo+PiAgIGljYzogUmVsYXggY29uZGl0aW9uIGluIGFwcGx5
X2NvbnN0cmFpbnRzKCkKPj4gICBhcm06IGR0czogZXh5bm9zOiBBZGQgcGFyZW50cyBhbmQgI2lu
dGVyY29ubmVjdC1jZWxscyB0byBFeHlub3M0NDEyCj4+ICAgZGV2ZnJlcTogZXh5bm9zLWJ1czog
QWRkIGludGVyY29ubmVjdCBmdW5jdGlvbmFsaXR5IHRvIGV4eW5vcy1idXMKPj4gICBhcm06IGR0
czogZXh5bm9zOiBBZGQgaW50ZXJjb25uZWN0cyB0byBFeHlub3M0NDEyIG1peGVyCj4+Cj4+IE1h
cmVrIFN6eXByb3dza2kgKDEpOgo+PiAgIGRybTogZXh5bm9zOiBtaXhlcjogQWRkIGludGVyY29u
bmVjdCBzdXBwb3J0Cj4+Cj4+ICAuLi4vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9u
LmR0c2kgICAgfCAgIDEgKwo+PiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpICAg
ICAgICAgICAgIHwgIDEwICsKPj4gIGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgICAgICAg
ICAgICAgICAgICB8IDI5NiArKysrKysrKysrKysrKy0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX21peGVyLmMgICAgICAgICB8ICA2OCArKystCj4+ICBkcml2ZXJzL2ludGVy
Y29ubmVjdC9jb3JlLmMgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0KPj4gIGluY2x1ZGUvbGlu
dXgvaW50ZXJjb25uZWN0LXByb3ZpZGVyLmggICAgICAgICB8ICAgNiArCj4+ICA2IGZpbGVzIGNo
YW5nZWQsIDMxNCBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkKPj4KPiAKPiAKCgotLSAK
QmVzdCBSZWdhcmRzLApDaGFud29vIENob2kKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
