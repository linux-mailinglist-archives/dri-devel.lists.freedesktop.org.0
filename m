Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B4491181
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928E36EA5F;
	Sat, 17 Aug 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6376A6E418;
 Thu, 15 Aug 2019 16:20:03 +0000 (UTC)
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FGAa4t013323; Thu, 15 Aug 2019 12:19:58 -0400
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2udahs02bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 12:19:57 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FGDSMU043880; Thu, 15 Aug 2019 12:19:55 -0400
Received: from ausxipps310.us.dell.com (AUSXIPPS310.us.dell.com
 [143.166.148.211])
 by mx0b-00154901.pphosted.com with ESMTP id 2ud80xkda8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 12:19:55 -0400
X-LoopCount0: from 10.166.132.129
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="408820564"
From: <Mario.Limonciello@dell.com>
To: <tiwai@suse.de>, <alexdeucher@gmail.com>
Subject: RE: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Topic: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Index: AQGgd6rdZMP3IawUTGaO286TGix+WwEoseSWASaOw1KnU3bBEIAAWGiA//+vQECAAFaFAIAAA1mAgAAFeoD//8KZYA==
Date: Thu, 15 Aug 2019 16:19:52 +0000
Message-ID: <8724585e50004bc8b6f310587555f4a1@AUSX13MPC101.AMER.DELL.COM>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
 <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
 <s5ho90qa34m.wl-tiwai@suse.de>
In-Reply-To: <s5ho90qa34m.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-15T16:19:51.1871148Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150159
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150159
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=EeZtSFfcASxzQDiDgQ5G5QblMNz9X1uWYaIgK2p9tnY=;
 b=Tu+T6myXCWoUSFAl0NxM5b/ntnWKClidfeali/n2ICHJgIRVJ9S+6wGyrGCpOA/VuKLQ
 577HT7V65Td9lsnAOU2iQ734oU7J+uLSdOPbZZvfGw+Vlud8X3vngzLVGET8UYaF8Kl0
 bfmRpWi6AAGx8+1mYNhbzqvsZg8WyJQsGAq2zqoo3IqsR0+TedWbqj9n9m8RzGXfMkA4
 pdb+cuJHmlVKVVH+dYi68lXMVQBe2hSzdLSQe5LFc6gw0v54HQAfxEAqxBmtl6FOMNw/
 qfDx1Xig+V46SFCnS77dW9JJbL/kfrQ6tUqmnj87fqfjmZ0Tly7/b55W6Vc/se2B3wD6 Uw== 
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 alex.hung@canonical.com, bskeggs@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFRha2FzaGkgSXdhaSA8dGl3YWlA
c3VzZS5kZT4KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDE1LCAyMDE5IDk6NTcgQU0KPiBUbzog
QWxleCBEZXVjaGVyCj4gQ2M6IEthcm9sIEhlcmJzdDsgTGltb25jaWVsbG8sIE1hcmlvOyBub3V2
ZWF1OyBSYWZhZWwgSiAuIFd5c29ja2k7IExLTUw7IGRyaS1kZXZlbDsKPiBMaW51eCBBQ1BJIE1h
aWxpbmcgTGlzdDsgQWxleCBIdW5nOyBCZW4gU2tlZ2dzOyBEYXZpZCBBaXJsaWUKPiBTdWJqZWN0
OiBSZTogW05vdXZlYXVdIFtQQVRDSCAxLzddIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9FTSBf
T1NJIHN0cmluZyB0bwo+IGVuYWJsZSBkR1BVIGRpcmVjdCBvdXRwdXQiCj4gCj4gCj4gW0VYVEVS
TkFMIEVNQUlMXQo+IAo+IE9uIFRodSwgMTUgQXVnIDIwMTkgMTY6Mzc6MDUgKzAyMDAsCj4gQWxl
eCBEZXVjaGVyIHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEwOjI1IEFN
IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
VGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoyMCBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRv
IGJlIHJlZ3Jlc3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZAo+IHdpdGggdGhlCj4gPiA+
ID4gPiA+IGluIHRyZWUgZHJpdmVycyBieSByZXZlcnRpbmcgdGhpcy4gIEkgdGhpbmsgd2Ugc2hv
dWxkIGhhdmUgYW4gYW5zd2VyIGZvciBhbGwKPiBvZgo+ID4gPiA+ID4gdGhvc2UKPiA+ID4gPiA+
ID4gYmVmb3JlIHRoaXMgcmV2ZXJ0IGlzIGFjY2VwdGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBSZWdhcmRpbmcgc3lzdGVtcyB3aXRoIEludGVsK05WSURJQSwgd2UnbGwgaGF2ZSB0byB3b3Jr
IHdpdGggcGFydG5lcnMKPiB0bwo+ID4gPiA+ID4gY29sbGVjdAo+ID4gPiA+ID4gPiBzb21lIGlu
Zm9ybWF0aW9uIG9uIHRoZSBpbXBhY3Qgb2YgcmV2ZXJ0aW5nIHRoaXMuCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVtIHdpdGggSW50ZWwrQU1EIHRo
ZSBBU0wgY29uZmlndXJlcyBBTUQKPiBHUFUgdG8KPiA+ID4gPiA+IHVzZQo+ID4gPiA+ID4gPiAi
SHlicmlkIEdyYXBoaWNzIiB3aGVuIG9uIFdpbmRvd3MgYW5kICJQb3dlciBFeHByZXNzIiBhbmQK
PiAiU3dpdGNoYWJsZQo+ID4gPiA+ID4gR3JhcGhpY3MiCj4gPiA+ID4gPiA+IHdoZW4gb24gTGlu
dXguCj4gPiA+ID4gPgo+ID4gPiA+ID4gYW5kIHdoYXQncyBleGFjdGx5IHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAo+ID4gPiA+ID4gaXNzdWUgaGVy
ZT8KPiA+ID4gPgo+ID4gPiA+IERQL0hETUkgaXMgbm90IGRldGVjdGVkIHVubGVzcyBwbHVnZ2Vk
IGluIGF0IGJvb3R1cC4gIEl0J3MgZHVlIHRvIG1pc3NpbmcKPiBIUEQKPiA+ID4gPiBldmVudHMu
Cj4gPiA+ID4KPiA+ID4KPiA+ID4gYWZhaWsgTHl1ZGUgd2FzIHdvcmtpbmcgb24gZml4aW5nIGFs
bCB0aGF0LCBhdCBsZWFzdCBmb3Igc29tZSBkcml2ZXJzLgo+ID4gPiBJZiB0aGVyZSBpcyBzb21l
dGhpbmcgd3JvbmcsIHdlIHN0aWxsIHNob3VsZCBmaXggdGhlIGRyaXZlcnMsIG5vdAo+ID4gPiBh
ZGRpbmcgQUNQSSB3b3JrYXJvdW5kcy4KPiA+ID4KPiA+ID4gQWxleDogZG8geW91IGtub3cgaWYg
dGhlcmUgYXJlIHJlbWFpbmluZyBpc3N1ZXMgcmVnYXJkaW5nIHRoYXQgd2l0aCBhbWRncHU/Cj4g
Pgo+ID4gVGhlcmUgd2FzIGFuIGlzc3VlIHdpdGggaHBkIGV2ZW50cyBub3QgbWFraW5nIGl0IHRv
IHRoZSBhdWRpbyBzaWRlCj4gPiB3aGVuIHRoaW5ncyB3ZXJlIHBvd2VyZWQgZG93biB0aGF0IHdh
cyBmaXhlZCB3aXRoIHRoaXMgcGF0Y2ggc2V0Ogo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzMxNjc5My8KPiA+IFRob3NlIHBhdGNoZXMgZGVwZW5kZWQgb24gYSBi
dW5jaCBvZiBhbHNhIGNoYW5nZXMgYXMgd2VsbCB3aGljaCBtYXkKPiA+IGhhdmUgbm90IGJlZW4g
YXZhaWxhYmxlIGluIHRoZSBkaXN0cm8gdXNlZCBmb3IgYSBwYXJ0aWN1bGFyIE9FTQo+ID4gcHJv
Z3JhbS4KPiAKPiBGWUksIHRoZSBjb3JyZXNwb25kaW5nIGNvbW1pdCBmb3IgQUxTQSBwYXJ0IGlz
IGRlc3RpbmVkIGZvciA1LjQKPiBrZXJuZWw6Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGl3YWkvc291bmQuZ2l0L2NvbW1pdC8/aWQ9YWRlCj4g
NDlkYjMzN2E5ZDQ0YWM1ODM1Y2ZjZTFlZTg3MzU0OTAxMWIyNwo+IAo+IEJUVywgTm91dmVhdSBz
aG91bGQgc3VmZmVyIGZyb20gdGhlIHNhbWUgcHJvYmxlbS4gIFRoZSBwYXRjaCB0byBhZGQKPiB0
aGUgYXVkaW8gY29tcG9uZW50IHN1cHBvcnQgaXMgZm91bmQgYXQ6Cj4gICBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzE5MTMxLwo+IAo+IAoKSXQgc291bmRzIGxpa2Ug
NS4zcmNYIHdvbid0IGJlIGEgdXNlZnVsIGNoZWNrIHRoZW4uCgpTbyBhbSBJIGNvcnJlY3QgdG8g
dW5kZXJzdGFuZCB0aGF0IGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byB0aGUgQU1EIGZhaWx1cmVzCmRl
c2NyaWJlZCBpbiB0aGlzIHRocmVhZCBzaG91bGQgYmUgaW4gbGludXgtbmV4dCBhdCB0aGlzIHBv
aW50PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
