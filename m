Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687212280A4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F9C6E2B1;
	Tue, 21 Jul 2020 13:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACE56E184
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 11:54:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LBqjc9003474; Tue, 21 Jul 2020 13:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xNrr1r61piExo9Kz7DbvrPtsnAcD5qX24XmH5JBqS0c=;
 b=w2KGdHlczl4xzw9NscNrOKGJxvV0PbaEjONM3oUdazggf33Xoh2UjI305YKL0i1JTdNB
 yFrc+nmM0xKmBKnh4ajALQZUGiJ0ysGLfoZri96As9+PnFYibbP+z3fYE9MPVrHNUQDr
 vefIJ94jPuIeGiTzsfyV4BjYHMLYs5eol2+pHbEFvKUua0vbRgYv13kf50/S3dBi8NW/
 p55Drejqhy9K3RjfYeDWZ4yF9W0epSBIUlq/opU5Xf83x1jX86iEsLXfVwik/QF3t2ri
 Bo8G+CmF9cpAKYbCAopLYaKRRxN20w/yH5orvP/oz3mB94o4QumIoFXRL7PHzlKMPHh6 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6uwpev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 13:54:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F16010002A;
 Tue, 21 Jul 2020 13:54:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D2782B728A;
 Tue, 21 Jul 2020 13:54:41 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 13:54:40 +0200
Subject: Re: [PATCH v5 0/8] Enable ili9341 and l3gd20 on stm32f429-disco
To: dillon min <dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
 <198ad79c-ab12-55f0-814f-afc454a7e8ef@st.com>
 <CAL9mu0L3ZF5+nh2ENzxnu0f6AAh1ygoWx1bEkS3WkJt8TN7C7Q@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d7986a59-1337-ca33-fed0-0b6af458dbbb@st.com>
Date: Tue, 21 Jul 2020 13:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0L3ZF5+nh2ENzxnu0f6AAh1ygoWx1bEkS3WkJt8TN7C7Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_05:2020-07-21,
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

CgpPbiA3LzIxLzIwIDEyOjM5IFBNLCBkaWxsb24gbWluIHdyb3RlOgo+IEhpIEFsZXhhbmRyZSwK
PiAKPiBPbiBUdWUsIEp1bCAyMSwgMjAyMCBhdCA1OjE5IFBNIEFsZXhhbmRyZSBUb3JndWUKPiA8
YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBEaWxsb24KPj4KPj4gT24g
NS8yNS8yMCA1OjQwIEFNLCBkaWxsb24ubWluZmVpQGdtYWlsLmNvbSB3cm90ZToKPj4+IEZyb206
IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+Pj4KPj4+IFY1J3MgdXBkYXRl
IGJhc2VkIG9uIE1hcmsgQnJvd24ncyBzdWdnZXN0aW9uLCB1c2UgJ1NQSV9NQVNURVJfTVVTVF9S
WCcKPj4+IGZvciBTUElfU0lNUExFWF9SWCBtb2RlIG9uIHN0bTMyIHNwaSBjb250cm9sbGVyLgo+
Pj4KPj4+IFY1Ogo+Pj4gMSBpbnN0ZWFkIG9mIGFkZCBzZW5kIGR1bW15IGRhdGEgb3V0IHVuZGVy
IFNJTVBMRVhfUlggbW9kZSwKPj4+ICAgICAgYWRkIGZsYWdzICdTUElfQ09OVFJPTExFUl9NVVNU
X1RYJyBmb3Igc3RtMzIgc3BpIGRyaXZlcgo+Pj4gMiBieXBhc3MgJ1NQSV9DT05UUk9MTEVSX01V
U1RfVFgnIGFuZCAnU1BJX0NPTlRST0xMRVJfTVVTVF9SWCcgdW5kZXIKPj4+ICdTUElfM1dJUkUn
IG1vZGUKPj4+Cj4+Cj4+IENvbmNlcm5pbmcgRFQgcGF0Y2hlcywgdGhleSBsb29rIGdvb2RzIGZv
ciBtZS4gSG93ZXZlciBJJ2xsIG1lcmdlIHRoZW0KPj4gd2hlbiBkcml2ZXJzIHBhcnRzIHdpbGwg
YmUgbWVyZ2VkLgo+Pgo+PiByZWdhcmRzCj4+IEFsZXgKPiBUaGlzIHBhdGNoc2V0IHN0YXR1cyBp
cyA6Cj4gZHRzOgo+ICAgICAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgZG1hIGNvbmZpZyBmb3Igc3Bp
NQo+ICAgICAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgcGluIG1hcCBmb3IgbHRkYyAmIHNwaTUgb24g
c3RtMzJmNDI5LWRpc2NvIGJvYXJkCj4gICAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBsdGRj
IGJpbmRpbmcgd2l0aCBpbGk5MzQxLCBneXJvIGwzZ2QyMCBvbgo+ICAgICAgICBzdG0zMjQyOS1k
aXNjbyBib2FyZAo+IAo+IHBhbmVsLWJpbmRpbmdzOiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmfv
vIwgbmVlZCBtb3JlIHJldmlld2luZyB0byBtZXJnZQo+ICAgICAgZHQtYmluZGluZ3M6IGRpc3Bs
YXk6IHBhbmVsOiBBZGQgaWxpdGVrIGlsaTkzNDEgcGFuZWwgYmluZGluZ3MKPiAKPiBjbGs6IEFj
a2VkLWJ5OiBTdGVwaGVuIEJveWQgLCBuZWVkIG1vcmUgcmV2aWV3aW5nIHRvIG1lcmdlCj4gICAg
ICBjbGs6IHN0bTMyOiBGaXggc3RtMzJmNDI5J3MgbHRkYyBkcml2ZXIgaGFuZyBpbiBzZXQgY2xv
Y2sgcmF0ZSwKPiAgICAgICAgZml4IGR1cGxpY2F0ZWQgbHRkYyBjbG9jayByZWdpc3RlciB0byAn
Y2xrX2NvcmUnIGNhc2UgbHRkYydzIGNsb2NrCj4gICAgICAgICAgdHVybiBvZmYgYnkgY2xrX2Rp
c2FibGVfdW51c2VkKCkKPiAKPiBkcm0tcGFuZWw6ICBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVp
aiAuIG5lZWQgbW9yZSByZXZpZXdpbmcgdG8gbWVyZ2UKPiAgICAgIGRybS9wYW5lbDogQWRkIGls
aXRlayBpbGk5MzQxIHBhbmVsIGRyaXZlcgo+IAo+IHNwaS1kcml2ZXI6IEFja2VkLWJ5OiBNYXJr
IEJyb3duIO+8jG1lcmdlZCBpbnRvIG1haW5saW5lCj4gICAgICBzcGk6IHN0bTMyOiBBZGQgJ1NQ
SV9TSU1QTEVYX1JYJywgJ1NQSV8zV0lSRV9SWCcgc3VwcG9ydCBmb3Igc3RtMzJmNAo+ICAgICAg
c3BpOiBmbGFncyAnU1BJX0NPTlRST0xMRVJfTVVTVF9SWCcgYW5kICdTUElfQ09OVFJPTExFUl9N
VVNUX1RYJyBjYW4ndAo+ICAgICAgICBiZWNvZXhpdCB3aXRoICdTUElfM1dJUkUnIG1vZGUKPiAK
PiBGb3IgaWxpOTM0MSBkcml2ZXJzLCBpdCBzZWVtcyB0byBuZWVkIG1vcmUgdGltZSB0byByZXZp
ZXcsIG9yIG1pZ2h0IGJlIGRyb3BwZWQuCj4gc2luY2UgdGhlIGRybSBtYWludGFpbmVyIG1pZ2h0
IGNyZWF0ZSBhIG5ldyBpbnRlcmZhY2UgdG8gc3VwcG9ydAo+IERQSSxEQkksRFNJIGluIG9uZSBk
cml2ZXIuCj4gQ3VycmVudGx5IGl0J3MgdW5kZXIgZGlzY3Vzc2lvbi4gSSB3aWxsIHJld29yayB0
aGUgaWxpOTM0MSBkcml2ZXIgYWZ0ZXIgdGhhdC4KPiAKPiBCdXQsIHdlIGNhbiB1c2UgdGhlIGV4
aXN0aW5nICJkcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MzQxLmMiIGRyaXZlciB0byBzdXBwb3J0
Cj4gaWxpOTM0MSBvbiBzdG0zMmY0MjktZGlzY28gYm9hcmQgb25seSB1c2luZyB0aGUgc3BpIGJ1
cy4gZXhjZXB0IHRoZQo+IGRpc3BsYXkgcmVmcmVzaCBwZXJmb3JtYW5jZSBpcyBub3QgYXMgZ29v
ZCBhcyB0aGUgbHRkYyBpbnRlcmZhY2UuCj4gCj4gSSBjYW4gc3VibWl0IGEgbmV3IHBhdGNoIGp1
c3Qgd2l0aCBkdHMgY2hhbmdlZCB0aGlzIHdlZWsgZm9yIGl0LCBpZiB5b3UgbmVlZC4KPgoKClRo
YW5rcyBmb3IgdGhpcyBzdGF0dXMuIEknbSBjbG9zZSB0byBzZW5kIG15IFBSIGZvciB2NS45LiBU
aGVyZSBpcyBubyAKbmVlZHMgdG8gaGF2ZSBhbiBpbnRlcm1lZGlhdGUgdmVyc2lvbiAoRXhjZXB0
IHlvdSBhYnNvbHV0ZWx5IHdhbnQgaXQpLgoKVGhhbmtzCmFsZXgKCj4gVGhhbmtzLAo+IERpbGxv
bi4KPj4KPj4KPj4KPj4+IFY0Ogo+Pj4gQWNjb3JkaW5nIHRvIGFsZXhhbmRyZSB0b3JndWUncyBz
dWdnZXN0aW9uLCBjb21iaW5lIGlsaTkzNDEgYW5kCj4+PiBsM2dkMjAncyBtb2RpZmljYXRpb24g
b24gc3RtMzJmNDI5LWRpc2NvIGJvYXJkIHRvIG9uZSBwYXRjaHNldC4KPj4+Cj4+PiBDaGFuZ2Vz
Ogo+Pj4KPj4+IGlsaTkzNDE6Cj4+Pgo+Pj4gMSB1cGRhdGUgaWxpOTM0MSBwYW5lbCBkcml2ZXIg
YWNjb3JkaW5nIHRvIExpbnVzJ3Mgc3VnZ2VzdGlvbgo+Pj4gMiBkcm9wIFYxJ3MgTm8uNSBwYXRj
aCwgc3VtYml0IG5ldyBjaGFuZ2VzIGZvciBjbGstc3RtMzJmNAo+Pj4gMyBtZXJnZSBsM2dkMjAn
cyBjaGFuZ2UgdG8gdGhpcyBwYXRjaHNldAo+Pj4KPj4+IFYzOgo+Pj4gMSBtZXJnZSBvcmlnaW5h
bCB0aW55L2lsaTkzNDEuYyBkcml2ZXIgdG8gcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYwo+
Pj4gICAgIHRvIHN1cHBvcnQgc2VyaWFsIHNwaSAmIHBhcmFsbGVsIHJnYiBpbnRlcmZhY2UgaW4g
b25lIGRyaXZlci4KPj4+IDIgdXBkYXRlIGlsaXRlayxpbGk5MzQxLnlhbWwgZHRzIGJpbmRpbmcg
ZG9jdW1lbnRhdGlvbi4KPj4+IDMgdXBkYXRlIHN0bTMyZjQyOS1kaXNjbyBkdHMgYmluZGluZwo+
Pj4KPj4+IFYyOgo+Pj4gMSB2ZXJpZnkgaWxpdGVrLGlsaTkzNDEueWFtbCB3aXRoIG1ha2UgTz0u
Li9saW51eC1zdG0zMgo+Pj4gICAgIGR0X2JpbmRpbmdfY2hlY2sKPj4+ICAgICBEVF9TQ0hFTUFf
RklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvCj4+
PiAgICAgaWxpdGVrLGlsaTkzNDEueWFtbAo+Pj4KPj4+IFYxOgo+Pj4gMSBhZGQgaWxpOTM0MSBk
cm0gcGFuZWwgZHJpdmVyCj4+PiAyIGFkZCBsdGRjLCBzcGk1IGNvbnRyb2xsZXIgZm9yIHN0bTMy
ZjQyOS1kaXNjbwo+Pj4gMyBhZGQgbHRkYywgc3BpNSBwaW4gbWFwIGZvciBzdG0zMmY0MjktZGlz
Y28KPj4+IDQgYWRkIGRvY3MgYWJvdXQgaWxpOTM0MQo+Pj4gNSBmaXggbHRkYyBkcml2ZXIgbG9h
ZGluZyBoYW5nIGluIGNsayBzZXQgcmF0ZSBidWcKPj4+Cj4+Pgo+Pj4gTDNnZDIwOgo+Pj4gVjM6
Cj4+PiAxIG1lcmdlIHN0bTMyZjQyOS1kaXNjbyBkdGJzIGJpbmRpbmcgd2l0aCBpbGk5MzQxIHBh
cnQKPj4+Cj4+PiBWMjoKPj4+IDEgaW5zZXJ0IGJsYW5rIGxpbmUgYXQgc3RtMzJmNDIwLWRpc2Nv
LmR0cyBsaW5lIDE0Mwo+Pj4gMiBhZGQgbW9yZSBkZXNjcmlwdGlvbiBmb3IgbDNnZDIwIGluIGNv
bW1pdCBtZXNzYWdlCj4+Pgo+Pj4gVjE6Cj4+PiAxIGVuYWJsZSBzcGk1IGNvbnRyb2xsZXIgb24g
c3RtMzJmNDI5LWRpc2NvIChkdHMpCj4+PiAyIGFkZCBzcGk1IHBpbm1hcCBmb3Igc3RtMzJmNDI5
LWRpc2NvICAoZHRzKQo+Pj4gMyBhZGQgU1BJX1NJTVBMRVhfUlgsIFNQSV8zV0lSRV9SWCBzdXBw
b3J0IGZvciBzdG0zMmY0Cj4+Pgo+Pj4KPj4+IGRpbGxvbiBtaW4gKDgpOgo+Pj4gICAgIEFSTTog
ZHRzOiBzdG0zMjogQWRkIGRtYSBjb25maWcgZm9yIHNwaTUKPj4+ICAgICBBUk06IGR0czogc3Rt
MzI6IEFkZCBwaW4gbWFwIGZvciBsdGRjICYgc3BpNSBvbiBzdG0zMmY0MjktZGlzY28gYm9hcmQK
Pj4+ICAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBsdGRjIGJpbmRpbmcgd2l0aCBpbGk5MzQx
LCBneXJvIGwzZ2QyMCBvbgo+Pj4gICAgICAgc3RtMzI0MjktZGlzY28gYm9hcmQKPj4+ICAgICBk
dC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IEFkZCBpbGl0ZWsgaWxpOTM0MSBwYW5lbCBiaW5k
aW5ncwo+Pj4gICAgIGNsazogc3RtMzI6IEZpeCBzdG0zMmY0MjkncyBsdGRjIGRyaXZlciBoYW5n
IGluIHNldCBjbG9jayByYXRlLAo+Pj4gICAgICAgZml4IGR1cGxpY2F0ZWQgbHRkYyBjbG9jayBy
ZWdpc3RlciB0byAnY2xrX2NvcmUnIGNhc2UgbHRkYydzIGNsb2NrCj4+PiAgICAgICAgIHR1cm4g
b2ZmIGJ5IGNsa19kaXNhYmxlX3VudXNlZCgpCj4+PiAgICAgZHJtL3BhbmVsOiBBZGQgaWxpdGVr
IGlsaTkzNDEgcGFuZWwgZHJpdmVyCj4+PiAgICAgc3BpOiBzdG0zMjogQWRkICdTUElfU0lNUExF
WF9SWCcsICdTUElfM1dJUkVfUlgnIHN1cHBvcnQgZm9yIHN0bTMyZjQKPj4+ICAgICBzcGk6IGZs
YWdzICdTUElfQ09OVFJPTExFUl9NVVNUX1JYJyBhbmQgJ1NQSV9DT05UUk9MTEVSX01VU1RfVFgn
IGNhbid0Cj4+PiAgICAgICBiZSAgICAgY29leGl0IHdpdGggJ1NQSV8zV0lSRScgbW9kZQo+Pj4K
Pj4+ICAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnlhbWwgICAg
IHwgICA2OSArKwo+Pj4gICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kg
ICAgICAgICAgICAgfCAgIDY3ICsKPj4+ICAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS1k
aXNjby5kdHMgICAgICAgICAgICAgIHwgICA0OCArCj4+PiAgICBhcmNoL2FybS9ib290L2R0cy9z
dG0zMmY0MjkuZHRzaSAgICAgICAgICAgICAgICAgICB8ICAgIDMgKwo+Pj4gICAgZHJpdmVycy9j
bGsvY2xrLXN0bTMyZjQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICstCj4+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAg
MTIgKwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgfCAgICAxICsKPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWst
aWxpOTM0MS5jICAgICAgIHwgMTMwMSArKysrKysrKysrKysrKysrKysrKwo+Pj4gICAgZHJpdmVy
cy9zcGkvc3BpLXN0bTMyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE5ICstCj4+
PiAgICBkcml2ZXJzL3NwaS9zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDMgKy0KPj4+ICAgIDEwIGZpbGVzIGNoYW5nZWQsIDE1MjEgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS55YW1sCj4+PiAgICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5
MzQxLmMKPj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
