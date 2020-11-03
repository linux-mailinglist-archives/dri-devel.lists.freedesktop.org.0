Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794AF2A3A3B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 03:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83BE6E364;
	Tue,  3 Nov 2020 02:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1056E364
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:08:54 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201103020852epoutp031ab7b58fda73448dc98996ac78e642a8~D3WhiNrtT0382103821epoutp03e
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:08:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201103020852epoutp031ab7b58fda73448dc98996ac78e642a8~D3WhiNrtT0382103821epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604369332;
 bh=MFuZlfb/Yn1FfDXGe9nnnS1LaE1d3HqlFqTNLWzKXtQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=CJihPDzySQyauHEF3YXWgGmeizM0KrqlnK6pBZ1JsZ4PMUoklju5445YtsFPKNGgi
 w/edSsEWMNxETNU5LlAZoHxRcg6auV4cRCOwxKolGf24+hbfpSDhwyQdUG9wZeDUs/
 b9l4U+bV4Pbc4kKqYZ/pacuY03259vVp6YNG1DMw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201103020852epcas1p29e1f632a9e5f1609e8e29b88e395b492~D3Wg9BiC12965429654epcas1p23;
 Tue,  3 Nov 2020 02:08:52 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CQCrK3zz1zMqYmB; Tue,  3 Nov
 2020 02:08:49 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.20.09582.6ABB0AF5; Tue,  3 Nov 2020 11:08:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201103020838epcas1p4496f5796cb600465f05b19c1ebce1098~D3WUBQ4TJ1044310443epcas1p4E;
 Tue,  3 Nov 2020 02:08:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201103020838epsmtrp2f3a72ca2f9749d3e5bfed43c02794da4~D3WUAV_0X2405724057epsmtrp2A;
 Tue,  3 Nov 2020 02:08:38 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-ff-5fa0bba68383
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.C7.08745.5ABB0AF5; Tue,  3 Nov 2020 11:08:38 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201103020837epsmtip17f8c1cb8b99ebd7ff1794daf1912910d~D3WTkkBsw2593625936epsmtip1g;
 Tue,  3 Nov 2020 02:08:37 +0000 (GMT)
Subject: Re: [PATCH v6 49/52] PM / devfreq: tegra20: Convert to EMC_STAT
 driver, support interconnect and device-tree
To: Dmitry Osipenko <digetx@gmail.com>, cwchoi00@gmail.com
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <7ee7e7bb-6c0d-dfd1-f00d-a718c06d7479@samsung.com>
Date: Tue, 3 Nov 2020 11:22:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <bff3bf4a-8111-7c96-92f6-46343d85be0d@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLJsWRmVeSWpSXmKPExsWy7bCmge6y3QviDWbu1rd4dlTb4t2np6wW
 84+cY7VY/fExo8WVr+/ZLKbv3cRm0TJrEYvF+fMb2C22Pl3DZHG26Q27xeVdc9gsPvceYbTo
 /DKLzeLiKVeL240r2CwmrZ3KaHH2mbdF694j7Bb/rm1ksfi5ax6LxeYHx9gcRD3e32hl99g5
 6y67x6Vzf5g9Nq3qZPO4c20Pm8f97uNMHr3N79g8+rasYvT4vEkugDMq2yYjNTEltUghNS85
 PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6DslhbLEnFKgUEBicbGSvp1N
 UX5pSapCRn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbGlwU5BZM4KzZ+ms3c
 wLiUvYuRk0NCwERi6tsvbF2MXBxCAjsYJZ5Me8QC4XxilJg3ZwZYlZDAZ0aJCSc0YDpmHDzG
 ClG0i1Hi6dJt7BDOe0aJiQdXMoFUCQuUS5ybuYURxBYRsJL49QqiiFmgmU1i9ZUtzCAJNgEt
 if0vbrCB2PwCihJXfzwGa+AVsJN4cO0KkM3BwSKgIrFiZy5IWFQgTOLkthaoEkGJkzOfsIDY
 nAK2EifXLwG7lFlAXOLWk/lMELa8RPPW2cwQV8/nlDh+2ALCdpF4P+UxC4QtLPHq+BZoWEhJ
 fH63lw3CrpZYefIIOFwkBDoYJbbsv8AKkTCW2L90MhPIbcwCmhLrd+lDhBUldv6eywixl0/i
 3dceVpASCQFeiY42IYgSZYnLD+4yQdiSEovbO9kmMCrNQvLNLCQfzELywSyEZQsYWVYxiqUW
 FOempxYbFhgjx/UmRnC61zLfwTjt7Qe9Q4xMHIyHGCU4mJVEeGsi58UL8aYkVlalFuXHF5Xm
 pBYfYjQFBu9EZinR5HxgxskriTc0NTI2NrYwMTQzNTRUEuf9o90RLySQnliSmp2aWpBaBNPH
 xMEp1cB06GqHZUbc528e/v9W1WUdzePrlY+dMDVh69pYtYqQ5O2RyyR2P56R+8RQoDtQ+uTm
 VruvnFOnLstiXmdiYJXJ6qQmpnebb9/nFR8WPloy71cB8+47u3XUCn1sS0U/dO89abjblfl4
 kTr3otkZ2voei0qT5+4wfMS/7Y3UhFP/e5sXLLlV4d1v63b0sESP0bTaDVs1T3lLLrn9KusD
 t87VzO8r18+OW6X38WumJJP21rL1zlWWzsVfz/GeqHmv9pXLXeblhoBEc9PCZUpbM8+3enjL
 fyh+f91dVWDmGfeblR3P2+SeCQtbef5U/etWfnu1ws+gEHuePhu3E6eZ5xXdtLw/uXphzqRQ
 eYUbt4KUWIozEg21mIuKEwHlsQPXgAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWy7bCSnO6y3QviDXZMYbZ4dlTb4t2np6wW
 84+cY7VY/fExo8WVr+/ZLKbv3cRm0TJrEYvF+fMb2C22Pl3DZHG26Q27xeVdc9gsPvceYbTo
 /DKLzeLiKVeL240r2CwmrZ3KaHH2mbdF694j7Bb/rm1ksfi5ax6LxeYHx9gcRD3e32hl99g5
 6y67x6Vzf5g9Nq3qZPO4c20Pm8f97uNMHr3N79g8+rasYvT4vEkugDOKyyYlNSezLLVI3y6B
 K+PLgpyCSZwVGz/NZm5gXMrexcjJISFgIjHj4DHWLkYuDiGBHYwSixefZoFISEpMu3iUuYuR
 A8gWljh8uBii5i2jxNmtT5hAaoQFyiXOzdzCCGKLCFhJ/Hq1jR2kiFmgk03i3ooGFoiOh0wS
 LXc3g61jE9CS2P/iBhuIzS+gKHH1x2Owbl4BO4kH164wgmxjEVCRWLEzFyQsKhAmsXPJYyaI
 EkGJkzOfgB3HKWArcXL9ErCRzALqEn/mXWKGsMUlbj2ZzwRhy0s0b53NPIFReBaS9llIWmYh
 aZmFpGUBI8sqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg2NfS2sG4Z9UHvUOMTByM
 hxglOJiVRHhrIufFC/GmJFZWpRblxxeV5qQWH2KU5mBREuf9OmthnJBAemJJanZqakFqEUyW
 iYNTqoFJrNssde/O+z2xW4I4o9esXq29aCrj73f/OkMeOopZTw+38G1p/Rob4ungGVdwcsfh
 BU5H/Q/GMjLeXeAz8//3xxttmDJX/+laKJnnHHL1zpLFnbaCi8Laf9VIXnv6K9Yk5V6x6+nf
 jKaGJyMVDhZW/NSJ+7+arWXBRqfes3/jOU+9yTJa+XSye0do5mfBpV/SvWbGfJ71+EHb7rrg
 9Wxac4QkWyxuSK2/YN6Szsd7d2FLo23Vp4aDho9chPKXlLF4x99svc3mMetZa9S95SvfH5HQ
 sFV6L+Y5uUdq27tp547XP2mc67Tb7dVWo8ZbkUul9mwI9Zp4XMhmoXD2pN97rIJyzreXL1J6
 d8Pmbj2vEktxRqKhFnNRcSIAXdvuBWwDAAA=
X-CMS-MailID: 20201103020838epcas1p4496f5796cb600465f05b19c1ebce1098
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201102200839epcas1p30a5235333319f7affbe0f0c814ec3308
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-50-digetx@gmail.com>
 <CAGTfZH0KxyZYLZ_AgM7Lr+4s35kaWJp1AenpZ-o_FRLCCHC+6A@mail.gmail.com>
 <0ffa84f6-625e-807c-e9af-7a67f0fe48e7@gmail.com>
 <CGME20201102200839epcas1p30a5235333319f7affbe0f0c814ec3308@epcas1p3.samsung.com>
 <bff3bf4a-8111-7c96-92f6-46343d85be0d@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMy8yMCA1OjA4IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDEuMTEuMjAyMCAx
NzoxMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gLi4uCj4+IFdlIHdpbGwgcHJvYmFi
bHkgbW92ZSB0aGUgVGVncmEyMCBFTUNfU1RBVCBkZXZmcmVxIGRyaXZlciBpbnRvIHRoZQo+PiBt
ZW1vcnkgZHJpdmVyIGFuZCByZW1vdmUgdGhlIG9sZGVyIElNQ19TVEFUIGRyaXZlciBpbiB2Nywg
bGlrZSBpdCB3YXMKPj4gc3VnZ2VzdGVkIGJ5IFRoaWVycnkgUmVkaW5nLiBUaGlzIHdpbGwgYmUg
YSBtdWNoIGxlc3MgaW52YXNpdmUgY29kZSBjaGFuZ2UuCj4+Cj4+PiBBbHNvLCBpZiB5b3Ugd2Fu
dCB0byBnZXQgbW9yZSByZXNwb25zaXZlbmVzcywgeW91IGNvdWxkIHVzZSBkZWxheWVkIHRpbWVy
Cj4+PiBpbnN0ZWFkIG9mIGRlZmVycmFibGUgdGltZXIgYnkgZWRpdGluZyB0aGUgZGV2ZnJlcV9k
ZXZfcHJvZmlsZSBzdHJ1Y3R1cmUuCj4+Cj4+IFRoYW5rcywgSSdsbCB0cnkgdGhlIGRlZmVycmFi
bGUgdGltZXIuCj4gCj4gSSB0b29rIGEgYnJpZWYgbG9vayBhdCB0aGUgZGVsYXllZCB0aW1lciBh
bmQgSSB0aGluayB0aGUgZGVmZXJyYWJsZQo+IHRpbWVyIHNob3VsZCBiZSBtb3JlIGEgcHJlZmVy
cmVkIG9wdGlvbiBiZWNhdXNlIHRoaXMgZGV2ZnJlcSBkcml2ZSBpcwo+IG1vcmUgYW4gYXNzaXN0
YW5jZSBmb3IgdGhlIG9wdGltYWwgYmFuZHdpZHRoIHNlbGVjdGlvbiBhbmQgaXQgd2lsbCBiZQo+
IG1vcmUgcHJlZmVycmVkIHRvIGtlZXAgc3lzdGVtIGlkbGluZyB3aGVuZXZlciBwb3NzaWJsZS4K
PiAKPiBNeSBwcmltYXJ5IGNvbmNlcm4gaXMgdGhlIGluaXRpYWwgcGVyZm9ybWFuY2UgbGFnIGlu
IGEgY2FzZSBvZgo+IG11bHRpbWVkaWEgYXBwbGljYXRpb25zLiBCdXQgdGhpcyB3aWxsIGJlIHJl
c29sdmVkIGJ5IGhvb2tpbmcgdXAKPiBwZXJmb3JtYW5jZSB2b3RpbmcgdG8gYWxsIGRyaXZlcnMs
IG9uY2Ugd2Ugd2lsbCBnZXQgYXJvdW5kIHRvIGl0LgoKT0suIFlvdSBjYW4gY2hvaWNlIHRoZSB0
eXBlIG9mIHRpbWVyIG9uIGJvdGggcHJvYmUKYW5kIHZpYSBzeXNmcyBmaWxlIG9uIHRoZSBydW50
aW1lLgoKCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpTYW1zdW5nIEVsZWN0cm9uaWNz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
