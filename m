Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28F27E2EE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FDA89B95;
	Wed, 30 Sep 2020 07:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4F889CF8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:47:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3595513wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gTw8+Yfq2M+lgL6uz8tiJpeY2ZADAkzaEJEhPKyRCFI=;
 b=IkT8QLC85j8yoqCUXeesrjQjdwYyMXKI+9pHr+gD194jy/JPlP7IULJjQBms6RfAcn
 ngOpiL8YKxttlae/eW+ZSYsuN6fw22wjzPlxYz4CDVZQDW6jOe/fUpkTpZ06RqkrezNR
 tZkf3oRsdTOWnYGJBVtyhGGF97Yrg4fEfY5ZIcZb811ljQIAJX1+o0YjTeWIaW1PBXE+
 VLRgbDqUx1NexRNOfcMr8YML02icMyBzioqMZjt4FsQUuZccI2vjISzfstZ8Ll3CZL0X
 uw2lFh1dlc98GFEzdezIO+4ogmKGDBjmkzMVNoNFeVIQxDwrMa1bVwb3S3R4Q7QIhlWk
 BKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gTw8+Yfq2M+lgL6uz8tiJpeY2ZADAkzaEJEhPKyRCFI=;
 b=JfPVXEupq4Kt9GpeLI0CpKgoJuwgGiqCWa6k8/oleEcJOXiFUfgYzkMDxJYyOJSE6v
 1HEPQLof8eEgjSp6rhwWKSKHJ7MeWrTNgDijS3uJyect0M9WNbfx3d4A7JcbZRY2pzP7
 JxWbILDuVJaYN+uyvcBrQFtMCBXKo/f4DXJeH0n5s34wnuIQDQak8uQoFQY589mshnfs
 sB/Y27zIZ23Gx0cWoiRJnlCy+OK+NO3bIHrqFvaVOk03STnA5Qv0a8Tpkops7YUzSssx
 hZLjZOjQJ/dTtVOtgvohkPmI+++nUTi2e5apwY65HFaiYFoKN5amVd+K/bSVEQZUOz5O
 jgyw==
X-Gm-Message-State: AOAM530chozJESUANaHLe5YYS1Wtd1jQA4NXRrIdKt6x26aaS+JRtB/y
 00WGyX9ZcTp8gI9hu5Rk8SZbkFjhDVL85u7r7RQ=
X-Google-Smtp-Source: ABdhPJwgE/V6GpmwpxCPRvRtwn4tPlyvUYF/SJiKYjaeXSNi83XanhC/KGLo6HVBvseR3RSGee42R6EPnZDFrupv9vs=
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr2888405wmh.166.1601365668191; 
 Tue, 29 Sep 2020 00:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
 <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
 <20200928081726.hkh3rzbfr6m7jszt@gilmour.lan>
 <CAL_JsqLUT9gBiVgSdcHM86vNLR_1MxEZ+x9MDBaFGdv2j9EtvA@mail.gmail.com>
 <CAFPSGXYbdeZuVKQWnU6kiPzn3zgm224O2uDkr-uuLBUUjufGsA@mail.gmail.com>
In-Reply-To: <CAFPSGXYbdeZuVKQWnU6kiPzn3zgm224O2uDkr-uuLBUUjufGsA@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 29 Sep 2020 15:47:12 +0800
Message-ID: <CAAfSe-uncUhsN_MFWe2KiaWjBwmdyrXOSp32O3sTvbgwTJ+VRQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Kevin Tang <kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOSBTZXAgMjAyMCBhdCAxNDozNSwgS2V2aW4gVGFuZyA8a2V2aW4zLnRhbmdAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPiBDb21wb25lbnQgZnJhbWV3b3JrIGluY2x1ZGUg
bWFzdGVyIGFuZCBjb21wb25lbnQsIGhlcmUgaXMgbWFzdGVyIHN1Ym5vZGUuCj4gSXQgc2VlbXMg
dGhhdCBldmVyeW9uZSBlbHNlIGRvZXMgaXQsIHdoeSBub3QgbWU/Cj4KPiBZb3VyIGNvbW1lbnRz
IG9uIHY2Ogo+ICJXZSBnZW5lcmFsbHkgdHJ5IHRvIGF2b2lkIHRoaXMgdmlydHVhbCBub2RlIGFz
IGl0IGRvZXNuJ3QgcmVwcmVzZW50Cj4gYW55IGgvdy4gQ2FuJ3QgeW91IGJpbmQgdGhlIGRyaXZl
ciB0byB0aGUgRFBVIGRpcmVjdGx5PyIKPgo+IEknbSBzb3JyeSwgbWF5YmUgaXMgbXkgY2FyZWxl
c3MsIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYW5kIGhvdyB0byBkbyBpdAoKRGV2aWNl
dHJlZSBpcyB1c2VkIHRvIGRlc2NyaWJlIGhhcmR3YXJlIHJhdGhlciB0aGFuIHZpcnR1YWwgdGhp
bmdzCmxpa2UgInNwcmQsZGlzcGxheS1zdWJzeXN0ZW0iIHdoaWNoIGlzIG5vdCBhIHJlYWwgZGV2
aWNlLgpUaGF0J3Mgd2hhdCBJIHVuZGVyc3RhbmQgZm9yIFJvYidzIGNvbW1lbnRzIGhlcmUuCgpD
aHVueWFuCgo+Cj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4g5LqOMjAyMOW5tDnm
nIgyOeaXpeWRqOS6jCDkuIrljYgxMjoyOOWGmemBk++8mgo+Cj4gPgo+ID4gT24gTW9uLCBTZXAg
MjgsIDIwMjAgYXQgMzoxNyBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEhpIQo+ID4gPgo+ID4gPiBPbiBNb24sIFNlcCAyOCwgMjAyMCBhdCAw
MjoyNzozNVBNICswODAwLCBLZXZpbiBUYW5nIHdyb3RlOgo+ID4gPiA+IEZyb206IEtldmluIFRh
bmcgPGtldmluLnRhbmdAdW5pc29jLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoZSBVbmlzb2MgRFJN
IG1hc3RlciBkZXZpY2UgaXMgYSB2aXJ0dWFsIGRldmljZSBuZWVkZWQgdG8gbGlzdCBhbGwKPiA+
ID4gPiBEUFUgZGV2aWNlcyBvciBvdGhlciBkaXNwbGF5IGludGVyZmFjZSBub2RlcyB0aGF0IGNv
bXByaXNlIHRoZQo+ID4gPiA+IGdyYXBoaWNzIHN1YnN5c3RlbQo+ID4gPiA+Cj4gPiA+ID4gUkZD
IHY3Ogo+ID4gPiA+ICAgLSBGaXggRFRDIHVuaXQgbmFtZSB3YXJuaW5ncwo+ID4gPiA+ICAgLSBG
aXggdGhlIHByb2JsZW0gb2YgbWFpbnRhaW5lcnMKPiA+ID4gPgo+ID4gPiA+IENjOiBPcnNvbiBa
aGFpIDxvcnNvbnpoYWlAZ21haWwuY29tPgo+ID4gPiA+IENjOiBDaHVueWFuIFpoYW5nIDx6aGFu
Zy5seXJhQGdtYWlsLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZp
bi50YW5nQHVuaXNvYy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kaXNwbGF5L3NwcmQv
c3ByZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1sICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvc3ByZC9zcHJkLGRpc3BsYXktc3Vic3lzdGVtLnlhbWwKPiA+ID4gPgo+ID4gPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zcHJkL3Nw
cmQsZGlzcGxheS1zdWJzeXN0ZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1sCj4gPiA+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwLi45NDg3YTM5Cj4gPiA+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1sCj4gPiA+ID4gQEAg
LTAsMCArMSwzOSBAQAo+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gKy0tLQo+
ID4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvc3ByZC9z
cHJkLGRpc3BsYXktc3Vic3lzdGVtLnlhbWwjCj4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gPiA+ICsKPiA+ID4gPiArdGl0
bGU6IFVuaXNvYyBEUk0gbWFzdGVyIGRldmljZQo+ID4gPiA+ICsKPiA+ID4gPiArbWFpbnRhaW5l
cnM6Cj4gPiA+ID4gKyAgLSBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+Cj4gPiA+
ID4gKwo+ID4gPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gPiA+ICsgIFRoZSBVbmlzb2MgRFJNIG1h
c3RlciBkZXZpY2UgaXMgYSB2aXJ0dWFsIGRldmljZSBuZWVkZWQgdG8gbGlzdCBhbGwKPiA+ID4g
PiArICBEUFUgZGV2aWNlcyBvciBvdGhlciBkaXNwbGF5IGludGVyZmFjZSBub2RlcyB0aGF0IGNv
bXByaXNlIHRoZQo+ID4gPiA+ICsgIGdyYXBoaWNzIHN1YnN5c3RlbS4KPiA+ID4gPiArCj4gPiA+
ID4gK3Byb3BlcnRpZXM6Cj4gPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gPiArICAgIGNvbnN0
OiBzcHJkLGRpc3BsYXktc3Vic3lzdGVtCj4gPiA+ID4gKwo+ID4gPiA+ICsgIHBvcnRzOgo+ID4g
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1h
cnJheQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiA+ID4gKyAgICAgIFNob3VsZCBjb250
YWluIGEgbGlzdCBvZiBwaGFuZGxlcyBwb2ludGluZyB0byBkaXNwbGF5IGludGVyZmFjZSBwb3J0
Cj4gPiA+ID4gKyAgICAgIG9mIERQVSBkZXZpY2VzLgo+ID4gPgo+ID4gPiBHZW5lcmFsbHkgc3Bl
YWtpbmcsIGRyaXZlci1zcGVjaWZpYyBwcm9wZXJ0aWVzIHNob3VsZCBiZSBwcmVmaXhlZCBieSB0
aGUKPiA+ID4gdmVuZG9yIG5hbWUgdG8gYXZvaWQgYW55IGNvbmZsaWN0IHdpdGggZ2VuZXJpYyBw
cm9wZXJ0aWVzIChsaWtlIHRoZQo+ID4gPiBPRi1HcmFwaCBwb3J0cyBzdWJub2RlIGluIHRoaXMg
Y2FzZSkKPiA+Cj4gPiBXZSB0cnkgdG8gYXZvaWQgdGhpcyB2aXJ0dWFsIG5vZGUgYWx0b2dldGhl
ciB3aGljaCBJIGNvbW1lbnRlZCBhYm91dAo+ID4gb24gdjYgd2hpY2ggd2FzIGlnbm9yZWQuCj4g
Pgo+ID4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
