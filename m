Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E82280A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803706E2E5;
	Tue, 21 Jul 2020 13:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3A189D86
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:59:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LCv7SQ024874; Tue, 21 Jul 2020 14:58:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=FG8Jpl88uMJR2Haodeqb+M02x+DZQPQlOWwZUmrVcUA=;
 b=EnkM8LhL48Qm5Tc33FT+Mm9bbek5SiuCwmBudd95SfBBA3CMuo4EC1mHnE+nEZb5eibf
 XrSHD1iOYavvex1XaflRy+33LRTvHIKC5TsKjmC7h0Z2j/7e4fg+cG3kBcDptsU/uBG0
 U/BsrIjOPjcpVmAq+XNveXjyAq3vgACDJc5VdBmj/aVZyLflszg5DrGYcN/KcJmfc1X+
 0pWax5B1Pkqf9WMIjH3L5TCcC1p38SicwwsranTlt4dtYjGCvsf+QROOlvtfOLWEGhpU
 YoyxN7GiYXeVYmstM/jxDHNa7Yu6F0/u649t99REgf9mJX7YwwnMLQUIK1ujWh0rMBUs dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6uwy66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 14:58:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FBBE100034;
 Tue, 21 Jul 2020 14:58:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F5D32BE25A;
 Tue, 21 Jul 2020 14:58:50 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 14:58:49 +0200
Subject: Re: [PATCH v5 0/8] Enable ili9341 and l3gd20 on stm32f429-disco
To: dillon min <dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
 <198ad79c-ab12-55f0-814f-afc454a7e8ef@st.com>
 <CAL9mu0L3ZF5+nh2ENzxnu0f6AAh1ygoWx1bEkS3WkJt8TN7C7Q@mail.gmail.com>
 <d7986a59-1337-ca33-fed0-0b6af458dbbb@st.com>
 <CAL9mu0LyJ9RP4_m_43a-eCfEUp=1A2ZEQQLwZ2Xg4kzfsXruhA@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <112dd65b-2a3c-a776-8d31-f0d0b8f2c355@st.com>
Date: Tue, 21 Jul 2020 14:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LyJ9RP4_m_43a-eCfEUp=1A2ZEQQLwZ2Xg4kzfsXruhA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_08:2020-07-21,
 2020-07-21 signatures=0
X-Mailman-Approved-At: Tue, 21 Jul 2020 13:11:23 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA3LzIxLzIwIDI6NTUgUE0sIGRpbGxvbiBtaW4gd3JvdGU6Cj4gSGksIEFsZXhhbmRyZSwK
PiAKPiAKPiBPbiBUdWUsIEp1bCAyMSwgMjAyMCBhdCA3OjU0IFBNIEFsZXhhbmRyZSBUb3JndWUK
PiA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiA3LzIxLzIw
IDEyOjM5IFBNLCBkaWxsb24gbWluIHdyb3RlOgo+Pj4gSGkgQWxleGFuZHJlLAo+Pj4KPj4+IE9u
IFR1ZSwgSnVsIDIxLCAyMDIwIGF0IDU6MTkgUE0gQWxleGFuZHJlIFRvcmd1ZQo+Pj4gPGFsZXhh
bmRyZS50b3JndWVAc3QuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEhpIERpbGxvbgo+Pj4+Cj4+Pj4g
T24gNS8yNS8yMCA1OjQwIEFNLCBkaWxsb24ubWluZmVpQGdtYWlsLmNvbSB3cm90ZToKPj4+Pj4g
RnJvbTogZGlsbG9uIG1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+Cj4+Pj4+Cj4+Pj4+IFY1
J3MgdXBkYXRlIGJhc2VkIG9uIE1hcmsgQnJvd24ncyBzdWdnZXN0aW9uLCB1c2UgJ1NQSV9NQVNU
RVJfTVVTVF9SWCcKPj4+Pj4gZm9yIFNQSV9TSU1QTEVYX1JYIG1vZGUgb24gc3RtMzIgc3BpIGNv
bnRyb2xsZXIuCj4+Pj4+Cj4+Pj4+IFY1Ogo+Pj4+PiAxIGluc3RlYWQgb2YgYWRkIHNlbmQgZHVt
bXkgZGF0YSBvdXQgdW5kZXIgU0lNUExFWF9SWCBtb2RlLAo+Pj4+PiAgICAgICBhZGQgZmxhZ3Mg
J1NQSV9DT05UUk9MTEVSX01VU1RfVFgnIGZvciBzdG0zMiBzcGkgZHJpdmVyCj4+Pj4+IDIgYnlw
YXNzICdTUElfQ09OVFJPTExFUl9NVVNUX1RYJyBhbmQgJ1NQSV9DT05UUk9MTEVSX01VU1RfUlgn
IHVuZGVyCj4+Pj4+ICdTUElfM1dJUkUnIG1vZGUKPj4+Pj4KPj4+Pgo+Pj4+IENvbmNlcm5pbmcg
RFQgcGF0Y2hlcywgdGhleSBsb29rIGdvb2RzIGZvciBtZS4gSG93ZXZlciBJJ2xsIG1lcmdlIHRo
ZW0KPj4+PiB3aGVuIGRyaXZlcnMgcGFydHMgd2lsbCBiZSBtZXJnZWQuCj4+Pj4KPj4+PiByZWdh
cmRzCj4+Pj4gQWxleAo+Pj4gVGhpcyBwYXRjaHNldCBzdGF0dXMgaXMgOgo+Pj4gZHRzOgo+Pj4g
ICAgICAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgZG1hIGNvbmZpZyBmb3Igc3BpNQo+Pj4gICAgICAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgcGluIG1hcCBmb3IgbHRkYyAmIHNwaTUgb24gc3RtMzJmNDI5
LWRpc2NvIGJvYXJkCj4+PiAgICAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBsdGRjIGJpbmRp
bmcgd2l0aCBpbGk5MzQxLCBneXJvIGwzZ2QyMCBvbgo+Pj4gICAgICAgICBzdG0zMjQyOS1kaXNj
byBib2FyZAo+Pj4KPj4+IHBhbmVsLWJpbmRpbmdzOiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmfv
vIwgbmVlZCBtb3JlIHJldmlld2luZyB0byBtZXJnZQo+Pj4gICAgICAgZHQtYmluZGluZ3M6IGRp
c3BsYXk6IHBhbmVsOiBBZGQgaWxpdGVrIGlsaTkzNDEgcGFuZWwgYmluZGluZ3MKPj4+Cj4+PiBj
bGs6IEFja2VkLWJ5OiBTdGVwaGVuIEJveWQgLCBuZWVkIG1vcmUgcmV2aWV3aW5nIHRvIG1lcmdl
Cj4+PiAgICAgICBjbGs6IHN0bTMyOiBGaXggc3RtMzJmNDI5J3MgbHRkYyBkcml2ZXIgaGFuZyBp
biBzZXQgY2xvY2sgcmF0ZSwKPj4+ICAgICAgICAgZml4IGR1cGxpY2F0ZWQgbHRkYyBjbG9jayBy
ZWdpc3RlciB0byAnY2xrX2NvcmUnIGNhc2UgbHRkYydzIGNsb2NrCj4+PiAgICAgICAgICAgdHVy
biBvZmYgYnkgY2xrX2Rpc2FibGVfdW51c2VkKCkKPj4+Cj4+PiBkcm0tcGFuZWw6ICBSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiAuIG5lZWQgbW9yZSByZXZpZXdpbmcgdG8gbWVyZ2UKPj4+ICAg
ICAgIGRybS9wYW5lbDogQWRkIGlsaXRlayBpbGk5MzQxIHBhbmVsIGRyaXZlcgo+Pj4KPj4+IHNw
aS1kcml2ZXI6IEFja2VkLWJ5OiBNYXJrIEJyb3duIO+8jG1lcmdlZCBpbnRvIG1haW5saW5lCj4+
PiAgICAgICBzcGk6IHN0bTMyOiBBZGQgJ1NQSV9TSU1QTEVYX1JYJywgJ1NQSV8zV0lSRV9SWCcg
c3VwcG9ydCBmb3Igc3RtMzJmNAo+Pj4gICAgICAgc3BpOiBmbGFncyAnU1BJX0NPTlRST0xMRVJf
TVVTVF9SWCcgYW5kICdTUElfQ09OVFJPTExFUl9NVVNUX1RYJyBjYW4ndAo+Pj4gICAgICAgICBi
ZWNvZXhpdCB3aXRoICdTUElfM1dJUkUnIG1vZGUKPj4+Cj4+PiBGb3IgaWxpOTM0MSBkcml2ZXJz
LCBpdCBzZWVtcyB0byBuZWVkIG1vcmUgdGltZSB0byByZXZpZXcsIG9yIG1pZ2h0IGJlIGRyb3Bw
ZWQuCj4+PiBzaW5jZSB0aGUgZHJtIG1haW50YWluZXIgbWlnaHQgY3JlYXRlIGEgbmV3IGludGVy
ZmFjZSB0byBzdXBwb3J0Cj4+PiBEUEksREJJLERTSSBpbiBvbmUgZHJpdmVyLgo+Pj4gQ3VycmVu
dGx5IGl0J3MgdW5kZXIgZGlzY3Vzc2lvbi4gSSB3aWxsIHJld29yayB0aGUgaWxpOTM0MSBkcml2
ZXIgYWZ0ZXIgdGhhdC4KPj4+Cj4+PiBCdXQsIHdlIGNhbiB1c2UgdGhlIGV4aXN0aW5nICJkcml2
ZXJzL2dwdS9kcm0vdGlueS9pbGk5MzQxLmMiIGRyaXZlciB0byBzdXBwb3J0Cj4+PiBpbGk5MzQx
IG9uIHN0bTMyZjQyOS1kaXNjbyBib2FyZCBvbmx5IHVzaW5nIHRoZSBzcGkgYnVzLiBleGNlcHQg
dGhlCj4+PiBkaXNwbGF5IHJlZnJlc2ggcGVyZm9ybWFuY2UgaXMgbm90IGFzIGdvb2QgYXMgdGhl
IGx0ZGMgaW50ZXJmYWNlLgo+Pj4KPj4+IEkgY2FuIHN1Ym1pdCBhIG5ldyBwYXRjaCBqdXN0IHdp
dGggZHRzIGNoYW5nZWQgdGhpcyB3ZWVrIGZvciBpdCwgaWYgeW91IG5lZWQuCj4+Pgo+Pgo+Pgo+
PiBUaGFua3MgZm9yIHRoaXMgc3RhdHVzLiBJJ20gY2xvc2UgdG8gc2VuZCBteSBQUiBmb3IgdjUu
OS4gVGhlcmUgaXMgbm8KPj4gbmVlZHMgdG8gaGF2ZSBhbiBpbnRlcm1lZGlhdGUgdmVyc2lvbiAo
RXhjZXB0IHlvdSBhYnNvbHV0ZWx5IHdhbnQgaXQpLgo+Pgo+PiBUaGFua3MKPj4gYWxleAo+IE9r
LCBJIHByZWZlciB0byB1c2UgdGhlIGx0ZGMgaW50ZXJmYWNlIHRvIGRyaXZlIGlsaTkzNDEgZWl0
aGVyLgoKT2ssIHNvIGxldCdzIHdhaXQgZm9yIHRoZSBmdWxsIHJldmlldyBvZiB0aGlzIHNlcmll
cy4KCkNoZWVycwpBbGV4Cgo+IAo+IFRoYW5rcywKPiBEaWxsb24uCj4+Cj4+PiBUaGFua3MsCj4+
PiBEaWxsb24uCj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4+IFY0Ogo+Pj4+PiBBY2NvcmRpbmcgdG8gYWxl
eGFuZHJlIHRvcmd1ZSdzIHN1Z2dlc3Rpb24sIGNvbWJpbmUgaWxpOTM0MSBhbmQKPj4+Pj4gbDNn
ZDIwJ3MgbW9kaWZpY2F0aW9uIG9uIHN0bTMyZjQyOS1kaXNjbyBib2FyZCB0byBvbmUgcGF0Y2hz
ZXQuCj4+Pj4+Cj4+Pj4+IENoYW5nZXM6Cj4+Pj4+Cj4+Pj4+IGlsaTkzNDE6Cj4+Pj4+Cj4+Pj4+
IDEgdXBkYXRlIGlsaTkzNDEgcGFuZWwgZHJpdmVyIGFjY29yZGluZyB0byBMaW51cydzIHN1Z2dl
c3Rpb24KPj4+Pj4gMiBkcm9wIFYxJ3MgTm8uNSBwYXRjaCwgc3VtYml0IG5ldyBjaGFuZ2VzIGZv
ciBjbGstc3RtMzJmNAo+Pj4+PiAzIG1lcmdlIGwzZ2QyMCdzIGNoYW5nZSB0byB0aGlzIHBhdGNo
c2V0Cj4+Pj4+Cj4+Pj4+IFYzOgo+Pj4+PiAxIG1lcmdlIG9yaWdpbmFsIHRpbnkvaWxpOTM0MS5j
IGRyaXZlciB0byBwYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTM0MS5jCj4+Pj4+ICAgICAgdG8gc3Vw
cG9ydCBzZXJpYWwgc3BpICYgcGFyYWxsZWwgcmdiIGludGVyZmFjZSBpbiBvbmUgZHJpdmVyLgo+
Pj4+PiAyIHVwZGF0ZSBpbGl0ZWssaWxpOTM0MS55YW1sIGR0cyBiaW5kaW5nIGRvY3VtZW50YXRp
b24uCj4+Pj4+IDMgdXBkYXRlIHN0bTMyZjQyOS1kaXNjbyBkdHMgYmluZGluZwo+Pj4+Pgo+Pj4+
PiBWMjoKPj4+Pj4gMSB2ZXJpZnkgaWxpdGVrLGlsaTkzNDEueWFtbCB3aXRoIG1ha2UgTz0uLi9s
aW51eC1zdG0zMgo+Pj4+PiAgICAgIGR0X2JpbmRpbmdfY2hlY2sKPj4+Pj4gICAgICBEVF9TQ0hF
TUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
Cj4+Pj4+ICAgICAgaWxpdGVrLGlsaTkzNDEueWFtbAo+Pj4+Pgo+Pj4+PiBWMToKPj4+Pj4gMSBh
ZGQgaWxpOTM0MSBkcm0gcGFuZWwgZHJpdmVyCj4+Pj4+IDIgYWRkIGx0ZGMsIHNwaTUgY29udHJv
bGxlciBmb3Igc3RtMzJmNDI5LWRpc2NvCj4+Pj4+IDMgYWRkIGx0ZGMsIHNwaTUgcGluIG1hcCBm
b3Igc3RtMzJmNDI5LWRpc2NvCj4+Pj4+IDQgYWRkIGRvY3MgYWJvdXQgaWxpOTM0MQo+Pj4+PiA1
IGZpeCBsdGRjIGRyaXZlciBsb2FkaW5nIGhhbmcgaW4gY2xrIHNldCByYXRlIGJ1Zwo+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBMM2dkMjA6Cj4+Pj4+IFYzOgo+Pj4+PiAxIG1lcmdlIHN0bTMyZjQyOS1kaXNj
byBkdGJzIGJpbmRpbmcgd2l0aCBpbGk5MzQxIHBhcnQKPj4+Pj4KPj4+Pj4gVjI6Cj4+Pj4+IDEg
aW5zZXJ0IGJsYW5rIGxpbmUgYXQgc3RtMzJmNDIwLWRpc2NvLmR0cyBsaW5lIDE0Mwo+Pj4+PiAy
IGFkZCBtb3JlIGRlc2NyaXB0aW9uIGZvciBsM2dkMjAgaW4gY29tbWl0IG1lc3NhZ2UKPj4+Pj4K
Pj4+Pj4gVjE6Cj4+Pj4+IDEgZW5hYmxlIHNwaTUgY29udHJvbGxlciBvbiBzdG0zMmY0MjktZGlz
Y28gKGR0cykKPj4+Pj4gMiBhZGQgc3BpNSBwaW5tYXAgZm9yIHN0bTMyZjQyOS1kaXNjbyAgKGR0
cykKPj4+Pj4gMyBhZGQgU1BJX1NJTVBMRVhfUlgsIFNQSV8zV0lSRV9SWCBzdXBwb3J0IGZvciBz
dG0zMmY0Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IGRpbGxvbiBtaW4gKDgpOgo+Pj4+PiAgICAgIEFSTTog
ZHRzOiBzdG0zMjogQWRkIGRtYSBjb25maWcgZm9yIHNwaTUKPj4+Pj4gICAgICBBUk06IGR0czog
c3RtMzI6IEFkZCBwaW4gbWFwIGZvciBsdGRjICYgc3BpNSBvbiBzdG0zMmY0MjktZGlzY28gYm9h
cmQKPj4+Pj4gICAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBsdGRjIGJpbmRpbmcgd2l0aCBp
bGk5MzQxLCBneXJvIGwzZ2QyMCBvbgo+Pj4+PiAgICAgICAgc3RtMzI0MjktZGlzY28gYm9hcmQK
Pj4+Pj4gICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IEFkZCBpbGl0ZWsgaWxpOTM0
MSBwYW5lbCBiaW5kaW5ncwo+Pj4+PiAgICAgIGNsazogc3RtMzI6IEZpeCBzdG0zMmY0MjkncyBs
dGRjIGRyaXZlciBoYW5nIGluIHNldCBjbG9jayByYXRlLAo+Pj4+PiAgICAgICAgZml4IGR1cGxp
Y2F0ZWQgbHRkYyBjbG9jayByZWdpc3RlciB0byAnY2xrX2NvcmUnIGNhc2UgbHRkYydzIGNsb2Nr
Cj4+Pj4+ICAgICAgICAgIHR1cm4gb2ZmIGJ5IGNsa19kaXNhYmxlX3VudXNlZCgpCj4+Pj4+ICAg
ICAgZHJtL3BhbmVsOiBBZGQgaWxpdGVrIGlsaTkzNDEgcGFuZWwgZHJpdmVyCj4+Pj4+ICAgICAg
c3BpOiBzdG0zMjogQWRkICdTUElfU0lNUExFWF9SWCcsICdTUElfM1dJUkVfUlgnIHN1cHBvcnQg
Zm9yIHN0bTMyZjQKPj4+Pj4gICAgICBzcGk6IGZsYWdzICdTUElfQ09OVFJPTExFUl9NVVNUX1JY
JyBhbmQgJ1NQSV9DT05UUk9MTEVSX01VU1RfVFgnIGNhbid0Cj4+Pj4+ICAgICAgICBiZSAgICAg
Y29leGl0IHdpdGggJ1NQSV8zV0lSRScgbW9kZQo+Pj4+Pgo+Pj4+PiAgICAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEueWFtbCAgICAgfCAgIDY5ICsrCj4+Pj4+ICAg
ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaSAgICAgICAgICAgICB8ICAg
NjcgKwo+Pj4+PiAgICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LWRpc2NvLmR0cyAgICAg
ICAgICAgICAgfCAgIDQ4ICsKPj4+Pj4gICAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5k
dHNpICAgICAgICAgICAgICAgICAgIHwgICAgMyArCj4+Pj4+ICAgICBkcml2ZXJzL2Nsay9jbGst
c3RtMzJmNC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKy0KPj4+Pj4gICAgIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAxMiAr
Cj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDEgKwo+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRl
ay1pbGk5MzQxLmMgICAgICAgfCAxMzAxICsrKysrKysrKysrKysrKysrKysrCj4+Pj4+ICAgICBk
cml2ZXJzL3NwaS9zcGktc3RtMzIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTkg
Ky0KPj4+Pj4gICAgIGRyaXZlcnMvc3BpL3NwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMyArLQo+Pj4+PiAgICAgMTAgZmlsZXMgY2hhbmdlZCwgMTUyMSBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pj4+PiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQx
LnlhbWwKPj4+Pj4gICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtaWxpdGVrLWlsaTkzNDEuYwo+Pj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
