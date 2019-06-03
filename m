Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D165833F92
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60593895C8;
	Tue,  4 Jun 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1204D891CB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 12:25:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53CMJC9025887; Mon, 3 Jun 2019 14:25:12 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sund0j1ya-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 14:25:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0803C31;
 Mon,  3 Jun 2019 12:25:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A93042A22;
 Mon,  3 Jun 2019 12:25:11 +0000 (GMT)
Received: from [10.48.1.93] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Jun
 2019 14:25:11 +0200
Subject: Re: drm_gem_dumb_map_offset patch
To: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <96fb4e89-2721-90bb-ce76-69667c2cf78a@st.com>
 <2a6c0803-b386-c8cc-78f8-26faa230ac44@tronnes.org>
 <CAKMK7uH=Lo+Ewc6UpjF_pEPB+O0NR4VOeDtM1mdpoAdV4HR6xQ@mail.gmail.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <e6985208-b386-d522-e433-91d8013eb531@st.com>
Date: Mon, 3 Jun 2019 14:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH=Lo+Ewc6UpjF_pEPB+O0NR4VOeDtM1mdpoAdV4HR6xQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_10:, , signatures=0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zexS0snTFz72Dv652QSpq7uEvjuhjfebhyRLyh/rAXk=;
 b=eBorfMV43xqWITBPTO8cZqhxWefLKPMGjuL5oOnxFvPbkO4kLLNO/kh2HS6fS2RQxC38
 KV4pUUCmbt0jfV9WPuR8xj7jYFwSmwnEi/KXKtQL19S431D7vt8cn/92hi7FG42nMIGS
 R18wzmMfsXOrMP7yt4qcogYEPLelAyIpArre2rpLIBG6XnxsbNtNnnGQV92JeorrXWvb
 NYbe9reYgLMFrAqjVcSUf8L/iwATnMb6jnq5vzXcVYuzAOGlmSpT1jiIxpcL/lq8VzBP
 jg87mmgjQ7C9AQTOgVumjBQwYp7m+lPOY+X+Uw6ja24/N5yN3MGeDqEzoqYxWKZIT5w+ 4A== 
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKTWFueSB0aGFua3MgZm9yIHlvdXIgdmFsdWFibGUgc3VwcG9ydCBhbmQgYW5zd2Vy
cy4KClNpbmNlIER1bWIgbW1hcCBpcyBmb3IgYnVmZmVyIGNyZWF0ZWQgdXNpbmcgZHVtYl9jcmVh
dGUgaW9jdGwgd2Ugd29uJ3QgdXNlIGl0CmFueW1vcmUuIEluIHBsYWNlIGEgbW1hcC91bW1hcCBp
cyBjYWxsZWQgd2l0aCBETUEgQnVmIEZELgpBZnRlciBzb21lIHRlc3RzIGl0IHNlZW1zIHdvcmtp
bmcgaW4gb3VyIHNpZGUuCgpNYW55IHRoYW5rcyBhZ2Fpbi4KUmVnYXJkcy4KCk9uIDUvMzEvMTkg
MTozNiBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIE1heSAzMSwgMjAxOSBhdCAx
OjI4IFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiB3cm90ZToKPj4KPj4g
SGksCj4+Cj4+IFthZGQgRGFuaWVsIFZldHRlcl0KPj4gW2NjIGRyaS1kZXZlbF0KPj4KPj4gRGVu
IDI5LjA1LjIwMTkgMTUuMDksIHNrcmV2IFBpZXJyZSBZdmVzIE1PUkRSRVQ6Cj4+PiBIZWxsbyBO
b3JhbGYsCj4+Pgo+Pj4gU29ycnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCBxdWVzdGlvbiBidXQg
SSBuZWVkIHRvIGJldHRlciB1bmRlcnN0YW5kIHRoZQo+Pj4gcmF0aW9uYWwgYWJvdXQgYSBwYXRj
aCB5b3UgZGlkIGluIERSTS9HRU0uCj4+Pgo+Pj4gRmlyc3Qgb2YgYWxsLCBsZXQgbWUgaW50cm9k
dWNlIG15c2VsZi4KPj4+IEknbSBjdXJyZW50bHkgZW1wbG95ZWUgdG8gU1RNaWNyb2VsZWN0cm9u
aWNzIGNvbXBhbnkgYW5kIGluIGNoYXJnZSBvZiBHUFUKPj4+IGludGVncmF0aW9uIHdpdGhpbiBT
VE0zMiBNUFUgKENvcnRleCBBNyArIENvcnRleCBNNCkKPj4+Cj4+PiBPbiBDb3J0ZXggQTcgaXMg
cnVubmluZyBhIExpbnV4IEtlcm5lbCA0LjE5IGFzIGZvciB0b2RheS4KPj4+Cj4+PiBXZSBjYW1l
IGFjcm9zcyBzb21lIHRyb3VibGUgd2hlbiB3ZSBzd2l0Y2ggZnJvbSBLZXJuZWwgNC4xNCB0byA0
LjE5IGZvciBHUFUKPj4+IHN0YWNrLiBPbiBhdWd1c3QgeW91IHN1Ym1pdCB0aGlzIGNvbW1pdCA6
Cj4+Pgo+Pj4gICAgICAgOTAzNzhlNTg5MTkyODU2MzdhYTBmMDYzYzA0YmEwYzY0NDlkOThiMQo+
Pj4gICAgICAgICAgIGRybS9nZW06IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCk6IHJlamVjdCBk
bWEtYnVmCj4+Pgo+Pj4gICAgICAgICAgIFJlamVjdCBtYXBwaW5nIGFuIGltcG9ydGVkIGRtYS1i
dWYgc2luY2UgaXMncyBhbiBpbnZhbGlkIHVzZS1jYXNlLgo+Pj4KPj4+IEluIFVzZXJsYW5kIEdQ
VSBzdGFjayB3ZSBoYXZlIHN1Y2ggc3RhdGVtZW50cyA6Cj4+PiAgICBib19tYXBfZmQKPj4+ICAg
ICAgICBEUk1fSU9DVExfTU9ERV9NQVBfRFVNQgo+Pj4gICAgICAgIG1tYXAgKG9mZnNldCkKPj4+
Cj4+PiBXaXRoIHRoZSBwYXRjaCBhYm92ZSwgaW9jdGwgcmV0dXJucyBhbiBlcnJvciBFSU5WQUwg
YW5kIHByZXZlbnRzIHRoZSBubWFwLgo+Pj4gQXMgZm9yIHRvZGF5IHdlIHJldmVydCB0aGlzIHBh
dGNoIGFuZCBpdCB3b3JrcyBmaW5lIGluIG91ciBlbmQuCj4gCj4gTGluayB0byBzb3VyY2UgY29k
ZSB3b3VsZCBiZSBnb29kLgo+IAo+Pj4gVGh1cyB0aGUgcXVlc3Rpb25zIGFyZSA6Cj4+PiAgLSB3
aGF0IGlzIHRoZSByYXRpb25hbCBiZWhpbmQgdGhpcyBmaXggPwo+Pj4gIC0gV2hhdCB3ZSBkb2lu
ZyB3cm9uZyB0aGlzIHNpdHVhdGlvbiA/Cj4+PiAgLSBXaGF0IGRvIHdlIG5lZWQgaW4gc3VjaCBz
aXR1YXRpb24gPwo+Pj4KPj4KPj4gSSBuZWVkIHRvIHBhc3MgdGhvc2Ugb24gdG8gRGFuaWVsIFZl
dHRlciAoRFJNIG1haW50YWluZXIpIHNpbmNlIGhlCj4+IHdhbnRlZCB0aGUgY2hhbmdlLiBUaGUg
ZGV0YWlscyB3ZXJlIG5ldmVyIGNsZWFyIHRvIG1lLgo+PiBTb21lIG9mIHRoZSBkaXNjdXNzaW9u
IGlzIGhlcmU6Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8xNzIy
NDIvCj4gCj4gRHVtYiBtbWFwIGlzIGZvciBidWZmZXIgY3JlYXRlZCB1c2luZyBkdW1iX2NyZWF0
ZSBpb2N0bCwgYW5kIG5vdGhpbmcKPiBlbHNlLiBBbnl0aGluZyBlbHNlIHJlYWxseSBoYXMgYXQg
YmVzdCB1bmRlZmluZWQgYmVoYXZpb3VyLiBFLmcuIGZvcgo+IGRtYS1idWYgeW91IHJlYWxseSBu
ZWVkIHRvIGNhbGwgdGhlIGJlZ2luL2VuZF9jcHVfYWNjZXNzIGlvY3RsLCBhbmQKPiBkdW1iIGJ1
ZmZlcnMgc2ltcGx5IGhhdmUgbm8gcHJvdmlzaW9uIGZvciB0aGF0LiBIZW5jZSB3aHkgd2UgY2Fu
J3QKPiBzdXBwb3J0IHRoaXMgaW4gZ2VuZXJhbC4KPiAKPiBUaGFua3MsIERhbmllbAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
