Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC0150244
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1706EB3A;
	Mon,  3 Feb 2020 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E346FAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 08:08:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00V830u4015648; Fri, 31 Jan 2020 09:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lHn3hsnBweOo3xubj4V/5edBG0xugDlmxQ4iesCGeFo=;
 b=bxGNeJBXi6nEwByPboUUKteCSfHDCaxMkRhvAIimv/j67+PwG7fVF+vcqndGlzntti67
 OeBX/iOtvs+m9dQ6gIuL2YJNhoHDRFY0sjRP/H8+qMo/dxkZNwj5xk4NyQzri2/j3cX+
 p7f4/7VpzSM7Q8BQhK10/GHGtJzUxt4iMGJum5H7oLmFkCE6vDQyVoJ9YP64mJnyyIKO
 TDYmWCmU0UI3342W7PvObN9MZpU0INdAB5LFrzy3Z+hQJzvSRMfT2cO9wB1cFNPARfwA
 +2GtC7TASOUkoBBVtTIP0a7COX7tny3fHqD9p3MdVN10mrLPoVHXaj1+sgD7iFONfPCI Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekvhuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 09:08:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A4CA100034;
 Fri, 31 Jan 2020 09:08:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF6BC21ECF3;
 Fri, 31 Jan 2020 09:08:34 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 31 Jan
 2020 09:08:34 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 31 Jan 2020 09:08:34 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Dave Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix W=1 warnings
Thread-Topic: [PATCH v3] drm/dp_mst: Fix W=1 warnings
Thread-Index: AQHVpfLdCTG3TRn1q0qMv+WgKbKtSqeqKGOAgBJQjICABqb1AIAcO4cAgBtNdQCABCA3gIAFUbCAgAAQtACAAJMdAA==
Date: Fri, 31 Jan 2020 08:08:34 +0000
Message-ID: <f64197e6-74bd-6577-2aa7-9c69cfdb9080@st.com>
References: <20191128135057.20020-1-benjamin.gaignard@st.com>
 <878snsvxzu.fsf@intel.com>
 <CA+M3ks5WvYoDLSrbvaGBbJg9+nnkX=xyCiD389QD8tSCdNqB+g@mail.gmail.com>
 <CA+M3ks4Y4LemFh=dQds91Z-LGJPK3vHKv=GeUNYHjNhdwz_m2g@mail.gmail.com>
 <CA+M3ks4yEBejzMoXPw_OK_LNP7ag5SNXZjvHqNeuZ8+9r2X-qw@mail.gmail.com>
 <b273036b10d8c2882800d01dcda7392e93b731fa.camel@redhat.com>
 <CA+M3ks5cuC5yJ-e0DCUiY1HtyyeU=mM9z56y4e_UduKaxcbw-A@mail.gmail.com>
 <08f4b69b1e48a81e90f28e7672da15cc5165969c.camel@redhat.com>
 <CAPM=9txafoQNfMFf0Ff1SnBTgq6jYyvjJyjCSJua6-SJVVkScQ@mail.gmail.com>
In-Reply-To: <CAPM=9txafoQNfMFf0Ff1SnBTgq6jYyvjJyjCSJua6-SJVVkScQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <FCC1E6061AA3DF4BA26EAE549BDE65E5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_02:2020-01-30,
 2020-01-31 signatures=0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxLzMxLzIwIDEyOjIyIEFNLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4+Pj4gaGktYWN0dWFs
bHkgeWVzLCB3ZSBzaG91bGQgcHJvYmFibHkgYmUgdXNpbmcgdGhpcyBpbnN0ZWFkIG9mIGp1c3Qg
ZHJvcHBpbmcNCj4+Pj4gdGhpcy4gQWxzbywgSSBkaWRuJ3Qgd3JpdGUgdGhpcyBjb2RlIG9yaWdp
bmFsbHkgSSBqdXN0IHJlZmFjdG9yZWQgYSBidW5jaA0KPj4+PiBvZg0KPj4+PiBpdCAtIERhdmUg
QWlybGllZCBpcyB0aGUgb3JpZ2luYWwgYXV0aG9yLCBidXQgdGhlIG9yaWdpbmFsIHZlcnNpb24g
b2YgdGhpcw0KPj4+PiBjb2RlIHdhcyB3cml0dGVuIGFnZXMgYWdvLiB0YmgsIEkgdGhpbmsgaXQn
cyBhIHNhZmUgYmV0IHRvIHNheSB0aGF0IHRoZXkNCj4+Pj4gcHJvYmFibHkgZGlkIG1lYW4gdG8g
dXNlIHRoaXMgYnV0IGZvcmdvdCB0byBhbmQgbm8gb25lIG5vdGljZWQgdW50aWwgbm93Lg0KPj4+
IEhpLA0KPj4+DQo+Pj4gQW55IGNsdWUgYWJvdXQgaG93IHRvIHVzZSBjcmMgdmFsdWUgPyBEb2Vz
IGl0IGhhdmUgdG8gYmUgY2hlY2tlZA0KPj4+IGFnYWluc3Qgc29tZXRoaW5nIGVsc2UgPw0KPj4+
IElmIGNyYyBhcmUgbm90IG1hdGNoaW5nIHdoYXQgc2hvdWxkIHdlIGRvIG9mIHRoZSBkYXRhIGNv
cGllZCBqdXN0IGJlZm9yZSA/DQo+PiBXZSBzaG91bGQgYmUgYWJsZSB0byBqdXN0IHRha2UgdGhl
IENSQyB2YWx1ZSBmcm9tIHRoZSBzaWRlYmFuZCBtZXNzYWdlIGFuZA0KPj4gdGhlbiBnZW5lcmF0
ZSBvdXIgb3duIENSQyB2YWx1ZSB1c2luZyB0aGUgc2lkZWJhbmQgbWVzc2FnZSBjb250ZW50cywg
YW5kIGNoZWNrDQo+PiBpZiB0aGUgdHdvIGFyZSBlcXVhbC4gSWYgdGhleSBhcmVuJ3QsIHNvbWV0
aGluZyB3ZW50IHdyb25nIGFuZCB3ZSBkaWRuJ3QNCj4+IHJlY2VpdmUgdGhlIG1lc3NhZ2UgcHJv
cGVybHkuDQo+Pg0KPj4gTm93IGFzIHRvIHdoYXQgd2Ugc2hvdWxkIGRvIHdoZW4gd2UgaGF2ZSBD
UkMgbWlzbWF0Y2hlcz8gVGhhdCdzIGEgYml0IG1vcmUNCj4+IGRpZmZpY3VsdC4gSWYgeW91IGhh
dmUgYWNjZXNzIHRvIHRoZSBEUCBNU1Qgc3BlYywgSSBzdXBwb3NlIGEgcGxhY2UgdG8gc3RhcnQN
Cj4+IGZpZ3VyaW5nIHRoYXQgb3V0IHdvdWxkIGJlIGNoZWNraW5nIGlmIHRoZXJlJ3MgYSB3YXkg
Zm9yIHVzIHRvIHJlcXVlc3QgdGhhdCBhDQo+PiBicmFuY2ggZGV2aWNlIHJlc2VuZCB3aGF0ZXZl
ciBtZXNzYWdlIGl0IHNlbnQgcHJldmlvdXNseS4gSWYgdGhlcmUgaXNuJ3QsIEkNCj4+IGd1ZXNz
IHdlIHNob3VsZCBqdXN0IHByaW50IGFuIGVycm9yIGluIGRtZXNnIChwb3NzaWJseSB3aXRoIGEg
aGV4ZHVtcCBvZiB0aGUNCj4+IGZhaWxlZCBtZXNzYWdlIGFzIHdlbGwpIGFuZCBub3QgZm9yd2Fy
ZCB0aGUgbWVzc2FnZSB0byB0aGUgZHJpdmVyLiBOb3Qgc3VyZSBvZg0KPj4gYW55IGJldHRlciB3
YXkgb2YgaGFuZGxpbmcgaXQgdGhlbiB0aGF0DQo+IFllYWggSSB0aGluayB0aGlzIHJlZmxlY3Rz
IHdoYXQgSSB3YW50ZWQgdG8gZG8sIEkndmUgbm8gbWVtb3J5IG9mIGENCj4gcmV0cmFuc21pdCBv
cHRpb24gaW4gdGhlIHNwZWMsIGJ1dCBJJ3ZlIGF3YXkgZnJvbSBpdCBmb3IgYSB3aGlsZS4gQnV0
DQo+IHdlJ2Qgd2FudCB0byBjb21wYXJlIHRoZSBDUkMgd2l0aCB3aGF0IHdlIGdvdCB0byBtYWtl
IHN1cmUgdGhlIGFyZSB0aGUNCj4gc2FtZS4NCg0KSG1tLCB0aGF0IGZhciBtb3JlIGNvbXBsZXgg
dGhhbiBqdXN0IGZpeCBjb21waWxhdGlvbiB3YXJuaW5ncyA6KQ0KDQpJIHdpbGwgc3BsaXQgdGhl
IHBhdGNoIGluIHR3bzoNCg0KLSBvbmUgZm9yIG9mIGFsbCBvdGhlciB3YXJuaW5ncywgaG9wZWZ1
bGx5IGl0IGNhbiBnZXQgcmV2aWV3ZWQNCg0KLSBvbmUgZm9yIHRoaXMgY3JjNCB2YXJpYWJsZS4g
RG9lcyBjaGVja2luZyBjcmMgdmFsdWUgYW5kIHByaW50IGFuIGVycm9yIA0Kc2hvdWxkIGJlIGFj
Y2VwdGFibGUgPw0KDQpTb21ldGhpbmcgbGlrZToNCg0KaWYgKGNyYzQgIT0gbXNnLT5jaHVua1tt
c2ctPmN1cmNodW5rX2xlbiAtIDFdKQ0KDQogwqDCoMKgIHByaW50X2hleF9kdW1wKEtFUk5fREVC
VUcsICJ3cm9uZyBjcmMiLCBEVU1QX1BSRUZJWF9OT05FLCAxNiwgMSwgDQptc2ctPmNodW5rLMKg
IG1zZy0+Y3VyY2h1bmtfbGVuLCBmYWxzZSk7DQoNCg0KQmVuamFtaW4NCg0KDQo+DQo+IERhdmUu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
