Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9938177750
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 14:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231689E3F;
	Tue,  3 Mar 2020 13:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2789E3F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:38:40 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id n27so2381033vsa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 05:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o+VD8E80WVLhV1UG/W/79I95zQkxcn6a7J8ds5NOMKk=;
 b=Radjq3/hlJFgG6RVzpNuNaRoY1LRBrios1p4H9QTru3S60gR5P2oGk9ADtjyGVBe5t
 qCmYkRlCIxX6ZIrToFihU4PJFqLi7HMad9ZBprgpX89jAykigpXWAgFH/fVywgIClp0i
 pgfjQNOTpzhJYerz0v/e54nBAxKa9ha5XJ+5SWBZtMnpMepK9h6bvfZKOTNvWNm1+lfC
 +KLZgwKmm/EBrUUAtnxjBiemMnNE9Ng4huisDcAFi60Y9gT0GObs7f54qmN6Jg4ARSVf
 OMKW+FvqPmzlCRbyN/Nj3CJEEqvaRcVlHedrOJozUi7JzGCfAbgXGWO/vpPXfIPBXx9w
 As1A==
X-Gm-Message-State: ANhLgQ1nTHdtuXJzB23rxEGeq4nHKV0it4/UCAbeOaC6y0SCPrx64VDO
 aq5XD+3iriuHtmqUojzZAqf1rg3AFDgA+W47QbU=
X-Google-Smtp-Source: ADFU+vtea+/vD6x9TdKNrEXJrb6YtR5FnDbd1eaUimYuSYV8P10g6WTIEev6xn6SNqaSMKcT7qovIozuIqr8FK552ko=
X-Received: by 2002:a67:f412:: with SMTP id p18mr2382569vsn.207.1583242719598; 
 Tue, 03 Mar 2020 05:38:39 -0800 (PST)
MIME-Version: 1.0
References: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
 <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
 <BYAPR02MB5382500BD847244DC731B454BCE40@BYAPR02MB5382.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB5382500BD847244DC731B454BCE40@BYAPR02MB5382.namprd02.prod.outlook.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 3 Mar 2020 08:38:28 -0500
Message-ID: <CAKb7UvgGAmuHC=CGGcZ9PV6Qxn=cEwBTuB10GqBT1GfbR0UvHA@mail.gmail.com>
Subject: Re: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
To: Devarsh Thakkar <DEVARSHT@xilinx.com>
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
Cc: Ranganathan Sk <rsk@xilinx.com>, Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Rohit Visavalia <RVISAVAL@xilinx.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJldHR5IHN1cmUgdGhlIGN1cnJlbnQgY29kZSBpcyByaWdodC4gSWYgdGhlIEdBTU1BX0xVVCBw
cm9wZXJ0eSBjYW4ndApiZSBzZXQsIGl0IHRyaWVzIHRvIHNldCBnYW1tYSB0aGUgb2xkLWZhc2hp
b25lZCB3YXkuCgpPbiBUdWUsIE1hciAzLCAyMDIwIGF0IDg6MTIgQU0gRGV2YXJzaCBUaGFra2Fy
IDxERVZBUlNIVEB4aWxpbnguY29tPiB3cm90ZToKPgo+IEhpIFJvaGl0LAo+Cj4gVGhpcyBtYWtl
cyBzZW5zZSB0byBtZSBhcyBnYW1tYSB3YXMgaW1wbGVtZW50ZWQgYXMgb3B0aW9uYWwgcHJvcGVy
dHkuCj4gUmV2aWV3ZWQtQnk6ICJEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2gudGhha2thckB4aWxp
bnguY29tPiIKPgo+IEBlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbSwgQGltaXJraW5AYWx1bS5t
aXQuZWR1LCBAVmlsbGUgU3lyasOkbMOkLCBDb3VsZCB5b3UgcGxlYXNlIGFjayBhbmQgaGVscCBt
ZXJnZSB0aGlzIHBhdGNoIGlmIGl0IGFsc28gbG9vayBnb29kIHRvIHlvdSA/Cj4KPiBSZWdhcmRz
LAo+IERldmFyc2gKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJv
aGl0IFZpc2F2YWxpYQo+ID4gU2VudDogMjcgRmVicnVhcnkgMjAyMCAwMDo0MAo+ID4gVG86IFJv
aGl0IFZpc2F2YWxpYSA8UlZJU0FWQUxAeGlsaW54LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7Cj4gPiBpbWlya2luQGFsdW0ubWl0LmVkdTsgZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20KPiA+IENjOiBIeXVuIEt3b24gPGh5dW5rQHhpbGlueC5jb20+OyBSYW5nYW5hdGhh
biBTayA8cnNrQHhpbGlueC5jb20+OyBEaGF2YWwKPiA+IFJhamVzaGJoYWkgU2hhaCA8ZHNoYWhA
eGlsaW54LmNvbT47IFZhcnVua3VtYXIgQWxsYWdhZGFwYQo+ID4gPFZBUlVOS1VNQHhpbGlueC5j
b20+OyBEZXZhcnNoIFRoYWtrYXIgPERFVkFSU0hUQHhpbGlueC5jb20+Cj4gPiBTdWJqZWN0OiBS
RTogW1BBVENIIGxpYmRybV0gbW9kZXRlc3Q6IGNhbGwgZHJtTW9kZUNydGNTZXRHYW1tYSgpIG9u
bHkgaWYKPiA+IGFkZF9wcm9wZXJ0eV9vcHRpb25hbCByZXR1cm5zIHRydWUKPiA+Cj4gPiBHZW50
bGUgcmVtaW5kZXIuCj4gPgo+ID4gKyBJbGlhIE1pcmtpbiwgK0VtaWwgVmVsaWtvdi4KPiA+Cj4g
PiBUaGFua3MgJiBSZWdhcmRzLAo+ID4gUm9oaXQKPiA+Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4gPiA+IEZyb206IFJvaGl0IFZpc2F2YWxpYSBbbWFpbHRvOnJvaGl0LnZpc2F2
YWxpYUB4aWxpbnguY29tXQo+ID4gPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNSwgMjAyMCAz
OjA4IFBNCj4gPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IENj
OiBIeXVuIEt3b24gPGh5dW5rQHhpbGlueC5jb20+OyBSYW5nYW5hdGhhbiBTayA8cnNrQHhpbGlu
eC5jb20+Owo+ID4gPiBEaGF2YWwgUmFqZXNoYmhhaSBTaGFoIDxkc2hhaEB4aWxpbnguY29tPjsg
VmFydW5rdW1hciBBbGxhZ2FkYXBhCj4gPiA+IDxWQVJVTktVTUB4aWxpbnguY29tPjsgRGV2YXJz
aCBUaGFra2FyIDxERVZBUlNIVEB4aWxpbnguY29tPjsgUm9oaXQKPiA+ID4gVmlzYXZhbGlhIDxS
VklTQVZBTEB4aWxpbnguY29tPgo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggbGliZHJtXSBtb2RldGVz
dDogY2FsbCBkcm1Nb2RlQ3J0Y1NldEdhbW1hKCkgb25seSBpZgo+ID4gPiBhZGRfcHJvcGVydHlf
b3B0aW9uYWwgcmV0dXJucyB0cnVlCj4gPiA+Cj4gPiA+IGdhbW1hIGlzIGEgb3B0aW9uYWwgcHJv
cGVydHkgdGhlbiBhbHNvIGl0IHByaW50cyBlcnJvciBtZXNzYWdlLCBzbyBzZXQKPiA+ID4gZ2Ft
bWEgb25seSBpZiBhZGRfcHJvcGVydHlfb3B0aW9uYWwoKSByZXR1cm5zIHRydWUuCj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJvaGl0IFZpc2F2YWxpYSA8cm9oaXQudmlzYXZhbGlhQHhpbGlu
eC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDIgKy0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMKPiA+ID4gaW5kZXggYjkwN2FiMy4uMzc5YjllYSAxMDA2NDQKPiA+
ID4gLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwo+ID4gPiArKysgYi90ZXN0cy9tb2Rl
dGVzdC9tb2RldGVzdC5jCj4gPiA+IEBAIC0xMTM4LDcgKzExMzgsNyBAQCBzdGF0aWMgdm9pZCBz
ZXRfZ2FtbWEoc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiB1bnNpZ25lZCBjcnRjX2lkLCB1bnNp
Z25lZCBmb3VyY2MpCj4gPiA+Cj4gPiA+ICAgICBhZGRfcHJvcGVydHlfb3B0aW9uYWwoZGV2LCBj
cnRjX2lkLCAiREVHQU1NQV9MVVQiLCAwKTsKPiA+ID4gICAgIGFkZF9wcm9wZXJ0eV9vcHRpb25h
bChkZXYsIGNydGNfaWQsICJDVE0iLCAwKTsKPiA+ID4gLSAgIGlmICghYWRkX3Byb3BlcnR5X29w
dGlvbmFsKGRldiwgY3J0Y19pZCwgIkdBTU1BX0xVVCIsIGJsb2JfaWQpKSB7Cj4gPiA+ICsgICBp
ZiAoYWRkX3Byb3BlcnR5X29wdGlvbmFsKGRldiwgY3J0Y19pZCwgIkdBTU1BX0xVVCIsIGJsb2Jf
aWQpKSB7Cj4gPiA+ICAgICAgICAgICAgIHVpbnQxNl90IHJbMjU2XSwgZ1syNTZdLCBiWzI1Nl07
Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCAyNTY7IGkrKykgewo+ID4g
PiAtLQo+ID4gPiAyLjcuNAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
