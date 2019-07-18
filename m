Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03C6E183
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB36E59B;
	Fri, 19 Jul 2019 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D6E6E366
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 09:06:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x1so12798917wrr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 02:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=n2yp6XHp48dTmkm7Q/x0FxeAN23xYuIiD85gvT6RpkM=;
 b=gZfupedbbOHLju4s3GINNc9jfoPTQX6V4x+w6ox3s8+GZESPIiIHB1dcXcK+tPielr
 zBVyuRKSCvvkUVSDQwAwbFcIahhVzi0tkiEGvemI7WMN/FE2qhaXDztpSW6AJHvcj4PM
 Hi+Htp6DU8t6OIs6f4iyoCGqRWNEchPoWjHI6ytxwTVBPv2vap1VobkbqW9B+qnbMx7e
 cFOZrvTjWookmvXacRZ86eo3vhopIs5ONpmRWtTYCpqKXqJb69PwD6I7uRhO8E93Izz6
 u5qoEhXVxca6E4/uRZWhkuVlwRsV1CbwjAlx3/hv0dUvy/I5aTkzUueu0jEYmG6Q8I6o
 SqDw==
X-Gm-Message-State: APjAAAVSKgCTTaNDeuz3WCJ6B7zt7TnkCZcUXukjfoybBjBOa7VFyors
 IDW86b1Ll1AXvZYKbpjqZK2e3yfk
X-Google-Smtp-Source: APXvYqx/sGoSAzhd/UZsM9S1pdMoimxZSKHJu1I+4IWFr94X5mqXZbd9lfyfAEcn/1a7Wlu23j6kZQ==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr19921853wrm.322.1563440776121; 
 Thu, 18 Jul 2019 02:06:16 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id s15sm12328750wrw.21.2019.07.18.02.06.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 02:06:15 -0700 (PDT)
Message-ID: <8f0c2d7780430d40dd1e17a82484d236eae3f981.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Date: Thu, 18 Jul 2019 11:06:14 +0200
In-Reply-To: <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
 <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=n2yp6XHp48dTmkm7Q/x0FxeAN23xYuIiD85gvT6RpkM=;
 b=SRG1vIXllkZnB5JCQkgBoveeggcsDssdbIbZIUKRoU2P2mvUXFlJOckORUfYRG2KEc
 BiRRpHRt52X+V54pEHge19CVxCaaT6XG1gpiBs/BIRcG1YC1zQGbZEAJIG0At3XoGTIf
 c4mB2vIrQHnVMiGoLNcbvP2YQmeKm3KPai1yEaHtFaKX6I7wNQIuTn6c9gnKAT/lmd5/
 TnRQPklsRSM3S397HFdcQIbze1S/RNvu4eqAuOxSLMihCbAt7pai1P4fUH6Sv3JfRAnJ
 L79kpMxLDIaRv8/5/WMaJqF2oXBVDFnIzhJZI07q2eWxm0z++ANd8b8jwHd0sHlytEGB
 qp2w==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IFRoYW5rcyBNYXJlaywgSSBkaWRuJ3Qga25vdyBhYm91dCB0aGF0IG9wdGlvbi4KPiA+IFRy
aWVkIGl0LCBoZXJlIGlzIHRoZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy85U0FB
YmJBQQo+ID4gCj4gPiBJJ20gbm90IHF1aXRlIHN1cmUgaG93IHRvIGludGVycHJldCB0aGUgbnVt
YmVycywgdGhleSBhcmUKPiA+IGluY29uc2lzdGVudAo+ID4gd2l0aCB0aGUgcmVzdWx0cyBmcm9t
IGJvdGggcGNpZV9idyBhbmQgYW1kZ3B1LmJlbmNobWFyaywgZm9yCj4gPiBleGFtcGxlCj4gPiBH
VFQtPlZSQU0gYXQgYSAxMjggS0IgaXMgYXJvdW5kIDE0MDAgTUIvcyAoSSBhc3N1bWUgdGhhdCBp
cwo+ID4gbWVnYWJ5dGVzIC8KPiA+IHNlYywgcmlnaHQ/KS4KPiAKPiBCYXNlZCBvbiB0aGUgU0RN
QSByZXN1bHRzLCB5b3UgaGF2ZSAyLjQgR0Ivcy4gRm9yIDEyOEtCLCBpdCdzIDIuMgo+IEdCL3Mg
Zm9yIEdUVC0+VlJBTSBjb3BpZXMuCj4gCgpJbiB0aGUgbWVhbnRpbWUgSSBoYWQgYSBjaGF0IHdp
dGggTWljaGVsIG9uIElSQyBhbmQgaGUgc3VnZ2VzdGVkIHRoYXQKbWF5YmUgYW1kZ3B1LmJlbmNo
bWFyaz0zIGdpdmVzIGxvd2VyIHJlc3VsdHMgYmVjYXVzZSBpdCB1c2VzIGEgbGVzcwp0aGFuIG9w
dGltYWwgd2F5IHRvIGRvIHRoZSBiZW5jaG1hcmsuCgpMb29raW5nIGF0IHRoZSByZXN1bHRzIGZy
b20gdGhlIG1lc2EgYmVuY2htYXJrIGEgYml0IG1vcmUgY2xvc2VseSwgSQpzZWUgdGhhdCB0aGUg
U0RNQSBjYW4gZG86ClZSQU0tPkdUVDogMzA4NyBNQi9zID0gMjQgR2JpdC9zZWMKR1RULT5WUkFN
OiAyNDMzIE1CL3MgPSAxOSBHYml0L3NlYwoKU28gb24gUG9sYXJpcyBhdCBsZWFzdCwgdGhlIFNE
TUEgaXMgdGhlIGZhc3Rlc3QsIGFuZCB0aGUgb3RoZXIgdHJhbnNmZXIKbWV0aG9kcyBjYW4ndCBt
YXRjaCBpdC4gSSBhbHNvIGRpZCB0aGUgc2FtZSB0ZXN0IG9uIE5hdmksIHdoZXJlIGl0J3MKZGlm
ZmVyZW50OiBhbGwgb3RoZXIgdHJhbnNmZXIgbWV0aG9kcyBhcmUgbXVjaCBjbG9zZXIgdG8gdGhl
IFNETUEsIGJ1dAp0aGUgbWF4IHNwZWVkIGlzIHN0aWxsIGFyb3VuZCAyMC0yNCBHYml0IC8gc2Vj
LgoKSSBzdGlsbCBoYXZlIGEgZmV3IHF1ZXN0aW9uczoKCjEuIFdoeSBpcyB0aGUgR1RULT5WUkFN
IGNvcHkgc28gbXVjaCBzbG93ZXIgdGhhbiB0aGUgVlJBTS0+R1RUIGNvcHk/CgoyLiBXaHkgaXMg
dGhlIGJ1cyBsaW1pdGVkIHRvIDI0IEdiaXQvc2VjPyBJIHdvdWxkIGV4cGVjdCB0aGUKVGh1bmRl
cmJvbHQgcG9ydCB0byBnaXZlIG1lIGF0IGxlYXN0IDMyIEdiaXQvc2VjIGZvciBQQ0llIHRyYWZm
aWMuCk1pa2EsIGRvIHlvdSBtYXliZSBoYXZlIGFuIGV4cGxhbmF0aW9uPwoKVGhhbmtzICYgYmVz
dCByZWdhcmRzLApUaW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
