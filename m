Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC829117C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462CA6EAC1;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0AD6E9CE;
 Thu, 15 Aug 2019 14:34:17 +0000 (UTC)
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FEXwBm007994; Thu, 15 Aug 2019 10:34:14 -0400
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 2ubydma4rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 10:34:14 -0400
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FEXPeJ151689; Thu, 15 Aug 2019 10:34:13 -0400
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
 [143.166.85.207])
 by mx0b-00154901.pphosted.com with ESMTP id 2ud59nuj2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 10:34:13 -0400
X-LoopCount0: from 10.166.132.131
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,346,1549951200"; d="scan'208";a="1285794537"
From: <Mario.Limonciello@dell.com>
To: <kherbst@redhat.com>
Subject: RE: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Topic: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Index: AQGgd6rdZMP3IawUTGaO286TGix+WwEoseSWASaOw1KnU3bBEIAAWGiA//+vQECAAFaFAP//rUBg
Date: Thu, 15 Aug 2019 14:34:02 +0000
Message-ID: <54add026bb6f45fd94a2dc2bae4adf9f@AUSX13MPC101.AMER.DELL.COM>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
In-Reply-To: <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-15T14:34:00.8636496Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150148
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150148
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=UpYxGwpBDDOYwILNOGHgjaERhXWVQgZr+JCy/gi4Q+A=;
 b=c3fBTIgPEdW384TiMe3/TyhtBuJnTiJcc4E4HHJy6UH4cOo54IsULRe7vOeY++d8FA8o
 igxO9kzSqcf0kWl7MzNN6nmFNmYEsE56xCym/tvXxeTB6i4ff9PTCyzCCvDRSJTnIZ+u
 SF91Cpxz7GBTlvPgt//bLOYTeuP36GZsT8fau3iHC7Wp1Uz8DOMPSXX0dZ39Q2AjsAkG
 uGqVfX4RUxhB13i7Nqoz8vIhRsaIzkbMlVsvrX0kVpM3MdJObpBGDgAKKf3nEsYZx7j9
 XwZUKlMD3DhbZZ8W+xn9vFZyL2aQPYtV4U9LehxvLGu7YA5zlhklIAajiDcDKV9JLVOw dg== 
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
Cc: nouveau@lists.freedesktop.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, alex.hung@canonical.com, bskeggs@redhat.com,
 airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYXJvbCBIZXJic3QgPGtoZXJi
c3RAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxNSwgMjAxOSA5OjI1IEFN
DQo+IFRvOiBMaW1vbmNpZWxsbywgTWFyaW8NCj4gQ2M6IERhdmUgQWlybGllOyBMS01MOyBMaW51
eCBBQ1BJIE1haWxpbmcgTGlzdDsgZHJpLWRldmVsOyBub3V2ZWF1OyBSYWZhZWwgSiAuDQo+IFd5
c29ja2k7IEFsZXggSHVuZzsgQmVuIFNrZWdnczsgRGF2aWQgQWlybGllDQo+IFN1YmplY3Q6IFJl
OiBbTm91dmVhdV0gW1BBVENIIDEvN10gUmV2ZXJ0ICJBQ1BJIC8gT1NJOiBBZGQgT0VNIF9PU0kg
c3RyaW5nIHRvDQo+IGVuYWJsZSBkR1BVIGRpcmVjdCBvdXRwdXQiDQo+IA0KPiANCj4gW0VYVEVS
TkFMIEVNQUlMXQ0KPiANCj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoyMCBQTSA8TWFyaW8u
TGltb25jaWVsbG9AZGVsbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiA+IFRoZXJlIGFyZSBkZWZp
bml0ZWx5IGdvaW5nIHRvIGJlIHJlZ3Jlc3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZCB3
aXRoDQo+IHRoZQ0KPiA+ID4gPiBpbiB0cmVlIGRyaXZlcnMgYnkgcmV2ZXJ0aW5nIHRoaXMuICBJ
IHRoaW5rIHdlIHNob3VsZCBoYXZlIGFuIGFuc3dlciBmb3IgYWxsIG9mDQo+ID4gPiB0aG9zZQ0K
PiA+ID4gPiBiZWZvcmUgdGhpcyByZXZlcnQgaXMgYWNjZXB0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+
IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50ZWwrTlZJRElBLCB3ZSdsbCBoYXZlIHRvIHdvcmsg
d2l0aCBwYXJ0bmVycyB0bw0KPiA+ID4gY29sbGVjdA0KPiA+ID4gPiBzb21lIGluZm9ybWF0aW9u
IG9uIHRoZSBpbXBhY3Qgb2YgcmV2ZXJ0aW5nIHRoaXMuDQo+ID4gPiA+DQo+ID4gPiA+IFdoZW4g
dGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVtIHdpdGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJl
cyBBTUQNCj4gR1BVIHRvDQo+ID4gPiB1c2UNCj4gPiA+ID4gIkh5YnJpZCBHcmFwaGljcyIgd2hl
biBvbiBXaW5kb3dzIGFuZCAiUG93ZXIgRXhwcmVzcyIgYW5kICJTd2l0Y2hhYmxlDQo+ID4gPiBH
cmFwaGljcyINCj4gPiA+ID4gd2hlbiBvbiBMaW51eC4NCj4gPiA+DQo+ID4gPiBhbmQgd2hhdCdz
IGV4YWN0bHkgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aG9zZT8gQW5kIHdoYXQncyB0aGUgYWN0
dWFsDQo+ID4gPiBpc3N1ZSBoZXJlPw0KPiA+DQo+ID4gRFAvSERNSSBpcyBub3QgZGV0ZWN0ZWQg
dW5sZXNzIHBsdWdnZWQgaW4gYXQgYm9vdHVwLiAgSXQncyBkdWUgdG8gbWlzc2luZyBIUEQNCj4g
PiBldmVudHMuDQo+ID4NCj4gDQo+IGFmYWlrIEx5dWRlIHdhcyB3b3JraW5nIG9uIGZpeGluZyBh
bGwgdGhhdCwgYXQgbGVhc3QgZm9yIHNvbWUgZHJpdmVycy4NCj4gSWYgdGhlcmUgaXMgc29tZXRo
aW5nIHdyb25nLCB3ZSBzdGlsbCBzaG91bGQgZml4IHRoZSBkcml2ZXJzLCBub3QNCj4gYWRkaW5n
IEFDUEkgd29ya2Fyb3VuZHMuDQoNCkkgZG9uJ3QgZGlzYWdyZWUsIGJ1dCB0aW1pbmcgaXMgZnJl
cXVlbnRseSBhIGxpbWl0YXRpb24gaWYgeW91IHdhbnQgdGhlIGhhcmR3YXJlIHRvDQp3b3JrIHdo
ZW4geW91IHB1dCBpdCBvbiB0aGUgbWFya2V0Lg0KDQpUaGUgd2hvbGUgaWRlYSBiZWhpbmQgdGhl
IE9TSSBzdHJpbmcgd2FzIHRoYXQgaXQgY291bGQgYmUgcmV2ZXJ0ZWQgd2hlbiB0aGUgdGltZQ0K
d2FzIHJpZ2h0LiAgRnJvbSB0aGlzIGRpc2N1c3Npb24gaXQgdmVyeSB3ZWxsIG1heSBiZSBmb3Ig
c3lzdGVtcyB3aXRoIEFNRCBHUFUsIGJ1dA0KaXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBhZ2Fpbi4N
Cg0KPiANCj4gQWxleDogZG8geW91IGtub3cgaWYgdGhlcmUgYXJlIHJlbWFpbmluZyBpc3N1ZXMg
cmVnYXJkaW5nIHRoYXQgd2l0aCBhbWRncHU/DQo+IA0KPiA+ID4NCj4gPiA+IFdlIGFscmVhZHkg
aGF2ZSB0aGUgUFJJTUUgb2ZmbG9hZGluZyBpbiBwbGFjZSBhbmQgaWYgdGhhdCdzIG5vdA0KPiA+
ID4gZW5vdWdoLCB3ZSBzaG91bGQgd29yayBvbiBleHRlbmRpbmcgaXQsIG5vdCBhZGRpbmcgc29t
ZSBBQ1BJIGJhc2VkDQo+ID4gPiB3b3JrYXJvdW5kcywgYmVjYXVzZSB0aGF0J3MgZXhhY3RseSBo
b3cgdGhhdCBsb29rcyBsaWtlLg0KPiA+ID4NCj4gPiA+IEFsc28sIHdhcyB0aGlzIGRpc2N1c3Nl
ZCB3aXRoIGFueWJvZHkgaW52b2x2ZWQgaW4gdGhlIGRybSBzdWJzeXN0ZW0/DQo+ID4gPg0KPiA+
ID4gPg0KPiA+ID4gPiBJIGZlZWwgd2UgbmVlZCBhIGtub2IgYW5kL29yIERNSSBkZXRlY3Rpb24g
dG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRoYXQgdGhlDQo+IEFTTA0KPiA+ID4gPiBub3JtYWxseSBw
ZXJmb3Jtcy4NCj4gPiA+DQo+ID4gPiBXaHkgZG8gd2UgaGF2ZSB0byBkbyB0aGF0IG9uIGEgZmly
bXdhcmUgbGV2ZWwgYXQgYWxsPw0KPiA+DQo+ID4gRm9sa3MgZnJvbSBBTUQgR3JhcGhpY3MgdGVh
bSByZWNvbW1lbmRlZCB0aGlzIGFwcHJvYWNoLiAgDQoNCkkgc2hvdWxkIGNsYXJpZnkgdGhpcyBp
cyBmcm9tIHRoZSBmb2xrcyBvbiBBTUQgZ3JhcGhpY3MgdGVhbSB0aGF0IGludGVyYWN0IHRvIE9F
TXMNCmxpa2UgRGVsbCB3aGljaCBhcmUgbm90IG5lY2Vzc2FyaWx5IHRoZSBzYW1lIGZvbGtzIHdo
byB3b3JrIG9uIHRoZSBkcml2ZXJzIGRpcmVjdGx5Lg0KDQo+IEZyb20gdGhlaXIgcGVyc3BlY3Rp
dmUNCj4gPiBpdCdzIG5vdCBhIHdvcmthcm91bmQuICBUaGV5IHZpZXcgdGhpcyBhcyBhIGRpZmZl
cmVudCBhcmNoaXRlY3R1cmUgZm9yIEFNRA0KPiBncmFwaGljcyBkcml2ZXIgb24NCj4gPiBXaW5k
b3dzIGFuZCBBTUQgZ3JhcGhpY3Mgdy8gYW1kZ3B1IGRyaXZlci4gIFRoZXkgaGF2ZSBkaWZmZXJl
bnQgQVNMIHBhdGhzDQo+IHVzZWQgZm9yDQo+ID4gZWFjaC4NCj4gDQo+IEBhbGV4OiBpcyB0aGlz
IHRydWU/DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
