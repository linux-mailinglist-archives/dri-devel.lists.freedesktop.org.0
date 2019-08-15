Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17691142
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D8C6E52D;
	Sat, 17 Aug 2019 15:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 622 seconds by postgrey-1.36 at gabe;
 Thu, 15 Aug 2019 14:30:29 UTC
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC0F6E9CB;
 Thu, 15 Aug 2019 14:30:28 +0000 (UTC)
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FEUATv007639; Thu, 15 Aug 2019 10:30:26 -0400
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2uc0y81nma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 10:30:25 -0400
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FEDFUB047845; Thu, 15 Aug 2019 10:30:22 -0400
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com
 [143.166.148.206])
 by mx0b-00154901.pphosted.com with ESMTP id 2ud7t4skjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 10:30:22 -0400
X-LoopCount0: from 10.166.132.128
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="1344994176"
From: <Mario.Limonciello@dell.com>
To: <alexdeucher@gmail.com>, <kherbst@redhat.com>
Subject: RE: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Topic: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Thread-Index: AQGgd6rdZMP3IawUTGaO286TGix+WwEoseSWASaOw1KnU3bBEIAAWGiAgAACc4CAAACTAIAAAJCA//+tJOA=
Date: Thu, 15 Aug 2019 14:23:58 +0000
Message-ID: <6ed1c393ffeb4c24ab5875927d6a37ac@AUSX13MPC101.AMER.DELL.COM>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
 <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
 <CADnq5_PWuLU0pcG549-xThMHy3W0P2+fAO_Ledk6FP2TVG3+gQ@mail.gmail.com>
In-Reply-To: <CADnq5_PWuLU0pcG549-xThMHy3W0P2+fAO_Ledk6FP2TVG3+gQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-15T14:23:56.6441607Z;
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
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150147
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
 bh=f0iGJhrq+GrTI3zfJkt8Ce4ymzzLkXTrhUwgkk5HVzU=;
 b=Ob9IM8r4VZ8HmJWCNe8hvHSFkaXH7HuOvzEU+NOBu20SN9iD4XHdYzZqCANNHv3HuAiw
 e7SPal8TLMA7bA84P6lm0fX55zpn7Qv6bM6n215sb1A0tc2RICvvUu8Pand7fZCp+lZM
 uyvwut57UpDpKxSMcRaPvUYltazZ6wEpSX1qE2KThRd+LRRQ9GDSmNMEqg1f1tA6ysLf
 40yqk374Cu5HBoCe8VWWgsjagP67Mx1xP00dUsMbu6wk5rHv/u0KvEbk/L2IdndtwROQ
 n9TjTkZ0oUJgTL16hfu6sJdLinPjpxMpJGaopQA+N4UmpN3OVYURbS4KEvRha9/He+QE iw== 
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

PiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoxNSBBTSBLYXJvbCBIZXJic3QgPGtoZXJic3RA
cmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCA0OjEz
IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPg0KPiB3cm90ZToNCj4gPiA+
DQo+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDowNCBBTSBLYXJvbCBIZXJic3QgPGto
ZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IE9uIFRodSwgQXVnIDE1
LCAyMDE5IGF0IDM6NTYgUE0gPE1hcmlvLkxpbW9uY2llbGxvQGRlbGwuY29tPiB3cm90ZToNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4g
PiA+IEZyb206IGxpbnV4LWFjcGktb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1hY3BpLQ0K
PiBvd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uDQo+ID4gPiA+ID4gPiBCZWhhbGYgT2YgRGF2ZSBB
aXJsaWUNCj4gPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE0LCAyMDE5IDU6NDgg
UE0NCj4gPiA+ID4gPiA+IFRvOiBLYXJvbCBIZXJic3QNCj4gPiA+ID4gPiA+IENjOiBMS01MOyBM
aW51eCBBQ1BJOyBkcmktZGV2ZWw7IG5vdXZlYXU7IFJhZmFlbCBKIC4gV3lzb2NraTsgQWxleCBI
dW5nOw0KPiBCZW4NCj4gPiA+ID4gPiA+IFNrZWdnczsgRGF2ZSBBaXJsaWUNCj4gPiA+ID4gPiA+
IFN1YmplY3Q6IFJlOiBbTm91dmVhdV0gW1BBVENIIDEvN10gUmV2ZXJ0ICJBQ1BJIC8gT1NJOiBB
ZGQgT0VNIF9PU0kNCj4gc3RyaW5nIHRvDQo+ID4gPiA+ID4gPiBlbmFibGUgZEdQVSBkaXJlY3Qg
b3V0cHV0Ig0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IE9uIFRodSwgMTUgQXVnIDIwMTkgYXQg
MDc6MzEsIEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPg0KPiB3cm90ZToNCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2
NmQ1NTMxYmNhZWYyZjY4ZTRhYmJkODcyNDJjLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgZGlkbid0IGV2ZW4gbWFrZSBzZW5zZS4gQU1E
IF9kb2VzXw0KPiBzdXBwb3J0IGl0IGFuZA0KPiA+ID4gPiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5v
dXZlYXUgYXMgd2VsbC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQWxzbyB3aGF0IHdh
cyB0aGUgaXNzdWUgYmVpbmcgc29sdmVkIGhlcmU/IE5vIHJlZmVyZW5jZXMgdG8gYW55IGJ1Z3MN
Cj4gYW5kIG5vdA0KPiA+ID4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlzc3VlIGF0IGFs
bCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gQW5kIGV2ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0
byBtYWtlIGl0IHdvcmsNCj4gaW5zaWRlIHRoZQ0KPiA+ID4gPiA+ID4gPiBkcml2ZXIsIG5vdCBh
ZGRpbmcgc29tZSBoYWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuDQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZlcnMgZG8gb3Ig
ZG8gbm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUNCj4gYml0IGFueXdheS4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIHRoaW5rIHRoZSByZXZlcnRzIHNob3Vs
ZCBiZSBtZXJnZWQgdmlhIFJhZmFlbCdzIHRyZWUgYXMgdGhlIG9yaWdpbmFsDQo+ID4gPiA+ID4g
PiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdldCB0aGVtIGluIGFz
YXAuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJs
aWVkQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPiBEYXZlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
VGhlcmUgYXJlIGRlZmluaXRlbHkgZ29pbmcgdG8gYmUgcmVncmVzc2lvbnMgb24gbWFjaGluZXMg
aW4gdGhlIGZpZWxkIHdpdGgNCj4gdGhlDQo+ID4gPiA+ID4gaW4gdHJlZSBkcml2ZXJzIGJ5IHJl
dmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbiBhbnN3ZXIgZm9yIGFsbA0K
PiBvZiB0aG9zZQ0KPiA+ID4gPiA+IGJlZm9yZSB0aGlzIHJldmVydCBpcyBhY2NlcHRlZC4NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50ZWwrTlZJRElBLCB3
ZSdsbCBoYXZlIHRvIHdvcmsgd2l0aCBwYXJ0bmVycyB0bw0KPiBjb2xsZWN0DQo+ID4gPiA+ID4g
c29tZSBpbmZvcm1hdGlvbiBvbiB0aGUgaW1wYWN0IG9mIHJldmVydGluZyB0aGlzLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gV2hlbiB0aGlzIGlzIHVzZWQgb24gYSBzeXN0ZW0gd2l0aCBJbnRlbCtB
TUQgdGhlIEFTTCBjb25maWd1cmVzIEFNRA0KPiBHUFUgdG8gdXNlDQo+ID4gPiA+ID4gIkh5YnJp
ZCBHcmFwaGljcyIgd2hlbiBvbiBXaW5kb3dzIGFuZCAiUG93ZXIgRXhwcmVzcyIgYW5kDQo+ICJT
d2l0Y2hhYmxlIEdyYXBoaWNzIg0KPiA+ID4gPiA+IHdoZW4gb24gTGludXguDQo+ID4gPiA+DQo+
ID4gPiA+IGFuZCB3aGF0J3MgZXhhY3RseSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlPyBB
bmQgd2hhdCdzIHRoZSBhY3R1YWwNCj4gPiA+ID4gaXNzdWUgaGVyZT8NCj4gPiA+DQo+ID4gPiBI
eWJyaWQgR3JhcGhpY3MgaXMgdGhlIG5ldyAic3RhbmRhcmQiIHdheSBvZiBoYW5kbGluZyB0aGVz
ZSBsYXB0b3BzLg0KPiA+ID4gSXQgdXNlcyB0aGUgc3RhbmRhcmQgX1BSMyBBUENJIG1ldGhvZCB0
byBoYW5kbGUgZEdQVSBwb3dlci4gIFN1cHBvcnQNCj4gPiA+IGZvciB0aGlzIHdhcyBhZGRlZCB0
byBMaW51eCByZWxhdGl2ZWx5IGxhdGVyIGNvbXBhcmVkIHRvIHdoZW4gdGhlDQo+ID4gPiBsYXB0
b3BzIHdlcmUgbGF1bmNoZWQuICAiUG93ZXIgRXhwcmVzcyIgdXNlZCB0aGUgb3RoZXIgQU1EIHNw
ZWNpZmljDQo+ID4gPiBBVFBYIEFDUEkgbWV0aG9kIHRvIGhhbmRsZSBkR1BVIHBvd2VyLiAgVGhl
IGRyaXZlciBzdXBwb3J0cyBib3RoIHNvDQo+ID4gPiBlaXRoZXIgbWV0aG9kIHdpbGwgd29yay4N
Cj4gPiA+DQo+ID4gPiBBbGV4DQo+ID4gPg0KPiA+DQo+ID4gdGhhbmtzIGZvciBjbGFyaWZ5aW5n
LiBCdXQgdGhhdCBzdGlsbCBtZWFucyB0aGF0IHdlIHdvbid0IG5lZWQgc3VjaA0KPiA+IHdvcmth
cm91bmRzIGZvciBBTUQgdXNlcnMsIHJpZ2h0PyBhbWRncHUgaGFuZGxlcyBoeWJyaWQgZ3JhcGhp
Y3MganVzdA0KPiA+IGZpbmUsIHJpZ2h0Pw0KPiANCj4gWWVhaCBpdCBzaG91bGQsIGFzc3VtaW5n
IHlvdSBoYXZlIGEgbmV3IGVub3VnaCBrZXJuZWwgd2hpY2ggc3VwcG9ydHMNCj4gSEcsIHdoaWNo
IGhhcyBiZWVuIHNldmVyYWwgeWVhcnMgYXQgdGhpcyBwb2ludCBJSVJDLg0KPiANCj4gQWxleA0K
PiANCg0KQ2FuIHlvdSBkZWZpbmUgaG93IG5ldyBvZiBhIGtlcm5lbCBpcyBhIG5ldyBlbm91Z2gg
a2VybmVsPw0KDQpMb29raW5nIG9uIG15IHNpZGUgdGhlc2UgcHJvYmxlbXMgd2VyZSBvbiBuZXcg
aGFyZHdhcmUgKFByZWNpc2lvbiA3NzQwKSBhbmQNCmFyZSBjaGVja2VkIGFzIHJlY2VudGx5IGFz
IHN0YXJ0IG9mIHRoaXMgc3VtbWVyLCB3LyBrZXJuZWwgNC4xNS4NCg0KV2UgY2FuIGFycmFuZ2Ug
dG8gaGF2ZSBpdCBjaGVja2VkIGFnYWluIG9uIDUuM3JjWCB3LyB0aGUgT1NJIGRpc2FibGVkLg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
