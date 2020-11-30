Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88CA2C8EE4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 21:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C006E841;
	Mon, 30 Nov 2020 20:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E726E841
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:18:29 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C577420855
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606767509;
 bh=OYAwhBu5ywGPe4jP/b3ZBFwibZjhake7u5Wr/qL2fIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O9uFaNr4To7vJTf75zjkEL7XgHxwVqQRCftbAfCkIVP+QNsx891Ugysnp+257Te0m
 nuWpIHXPOO+K8kpEjh+4gT7tLzzjH9KZy8jgcODRTGPrjEiXjmx/n4gloJK2+bJRzV
 j7HKJb/r9PmQA8ABEBNPeeTJEchyhpX680ay9BTA=
Received: by mail-ej1-f44.google.com with SMTP id x16so17216997ejj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:18:28 -0800 (PST)
X-Gm-Message-State: AOAM532yvRjB7124826tgLdV/2Y5m1HHa/EKlI9S0nuwx9OY9QPWUvY+
 z7E6reJTJ4oMVoQD6WNsVgQNo2XwtUzuTnllxw==
X-Google-Smtp-Source: ABdhPJy2nXxet6XRLfUULbJdYRO0enUaj+Ze/fUrnLEhVqiYAL20KfJSmMjjwubTbni2mL1Ow39Nn3DY7hHQGlUA2Io=
X-Received: by 2002:a17:906:6713:: with SMTP id
 a19mr23950068ejp.468.1606767507250; 
 Mon, 30 Nov 2020 12:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-3-paul@crapouillou.net>
 <20201101122900.GB1269759@ravnborg.org> <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
 <CAL_JsqLSGMFibm8tVKqNe1SFBzXTU2=M2jZmpfrHeGUqS3foRg@mail.gmail.com>
 <1XJMKQ.YER47WG3D7R41@crapouillou.net>
In-Reply-To: <1XJMKQ.YER47WG3D7R41@crapouillou.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Nov 2020 13:18:15 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJDQMzHjtYa6ZCOxXW_U5nWrS+DhBj-w2myn-SkGB+KCA@mail.gmail.com>
Message-ID: <CAL_JsqJDQMzHjtYa6ZCOxXW_U5nWrS+DhBj-w2myn-SkGB+KCA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ABT Y030XX067A panel
 bindings
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMzAsIDIwMjAgYXQgMTI6MzkgUE0gUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gTGUgbHVuLiAzMCBub3YuIDIwMjAg
w6AgNzozMiwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4gYSDDqWNyaXQKPiA6Cj4g
PiBPbiBNb24sIE5vdiAyLCAyMDIwIGF0IDM6MTkgQU0gUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+Cj4gPiB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4KPiA+PiAgTGUgZGltLiAxIG5v
di4gMjAyMCDDoCAxMzoyOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiBhCj4gPj4g
w6ljcml0IDoKPiA+PiAgPiBPbiBTdW4sIE5vdiAwMSwgMjAyMCBhdCAwOTozMTo0OEFNICswMDAw
LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+ID4+ICA+PiAgVGhlIEFzaWEgQmV0dGVyIFRlY2hub2xv
Z3kgKEFCVCkgWTAzMFhYMDY3QSBwYW5lbCBpcyBhIDMuMCIKPiA+PiAzMjB4NDgwCj4gPj4gID4+
ICAyNC1iaXQgSVBTIExDRCBwYW5lbC4gSXRzIHBhcnRpY3VsYXJpdHkgaXMgdGhhdCBpdCBoYXMK
PiA+PiBub24tc3F1YXJlCj4gPj4gID4+IHBpeGVscwo+ID4+ICA+PiAgKGFzIGl0IGlzIDQ6MyBm
b3IgYSByZXNvbHV0aW9uIG9mIDMyMHg0ODApLCBhbmQgdGhhdCBpdAo+ID4+IHJlcXVpcmVzIG9k
ZAo+ID4+ICA+PiAgbGluZXMgdG8gYmUgc2VudCBhcyBSR0IgYW5kIGV2ZW4gbGluZXMgdG8gYmUg
c2VudCBhcyBHUkIgb24gaXRzCj4gPj4gID4+IDgtYml0Cj4gPj4gID4+ICBidXMuCj4gPj4gID4+
Cj4gPj4gID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91
Lm5ldD4KPiA+PiAgPj4gIC0tLQo+ID4+ICA+PiAgIC4uLi9kaXNwbGF5L3BhbmVsL2FidCx5MDMw
eHgwNjdhLnlhbWwgICAgICAgICB8IDU0Cj4gPj4gID4+ICsrKysrKysrKysrKysrKysrKysKPiA+
PiAgPj4gICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQo+ID4+ICA+PiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NAo+ID4+ICA+Pgo+ID4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdhLnlhbWwKPiA+PiAgPj4KPiA+PiAgPj4g
IGRpZmYgLS1naXQKPiA+PiAgPj4KPiA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdhLnlhbWwKPiA+PiAgPj4KPiA+PiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgw
NjdhLnlhbWwKPiA+PiAgPj4gIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gID4+ICBpbmRleCAw
MDAwMDAwMDAwMDAuLjY0MDdlOGJmNDVmYQo+ID4+ICA+PiAgLS0tIC9kZXYvbnVsbAo+ID4+ICA+
PiAgKysrCj4gPj4gID4+Cj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4MDY3YS55YW1sCj4gPj4gID4+ICBAQCAtMCwwICsxLDU0
IEBACj4gPj4gID4+ICArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNE
LTItQ2xhdXNlKQo+ID4+ICA+PiAgKyVZQU1MIDEuMgo+ID4+ICA+PiAgKy0tLQo+ID4+ICA+PiAg
KyRpZDoKPiA+PiAgPj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5l
bC9hYnQseTAzMHh4MDY3YS55YW1sIwo+ID4+ICA+PiAgKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4+ICA+PiAgKwo+ID4+ICA+PiAgK3Rp
dGxlOiBBc2lhIEJldHRlciBUZWNobm9sb2d5IDMuMCIgKDMyMHg0ODAgcGl4ZWxzKSAyNC1iaXQg
SVBTCj4gPj4gTENECj4gPj4gID4+IHBhbmVsCj4gPj4gID4+ICArCj4gPj4gID4+ICArZGVzY3Jp
cHRpb246IHwKPiA+PiAgPj4gICsgIFRoZSBwYW5lbCBtdXN0IG9iZXkgdGhlIHJ1bGVzIGZvciBh
IFNQSSBzbGF2ZSBkZXZpY2UgYXMKPiA+PiAgPj4gc3BlY2lmaWVkIGluCj4gPj4gID4+ICArICBz
cGkvc3BpLWNvbnRyb2xsZXIueWFtbAo+ID4+ICA+PiAgKwo+ID4+ICA+PiAgK21haW50YWluZXJz
Ogo+ID4+ICA+PiAgKyAgLSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiA+
PiAgPj4gICsKPiA+PiAgPj4gICthbGxPZjoKPiA+PiAgPj4gICsgIC0gJHJlZjogcGFuZWwtY29t
bW9uLnlhbWwjCj4gPj4gID4+ICArCj4gPj4gID4+ICArcHJvcGVydGllczoKPiA+PiAgPj4gICsg
IGNvbXBhdGlibGU6Cj4gPj4gID4+ICArICAgIGNvbnN0OiBhYnQseTAzMHh4MDY3YQo+ID4+ICA+
PiAgKwo+ID4+ICA+PiAgKyAgYmFja2xpZ2h0OiB0cnVlCj4gPj4gID4+ICArICBwb3J0OiB0cnVl
Cj4gPj4gID4+ICArICBwb3dlci1zdXBwbHk6IHRydWUKPiA+PiAgPj4gICsgIHJlZzogdHJ1ZQo+
ID4+ICA+PiAgKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiA+PiAgPgo+ID4+ICA+IFRoZSBiaW5kaW5n
IGlzIG1pc3Npbmc6Cj4gPj4gID4gcmVxdWlyZWQ6Cj4gPj4gID4gICAtIGNvbXBhdGlibGUKPiA+
PiAgPiAgIC0gcmVnCj4gPj4gID4gICAtIHBvd2VyLXN1cHBseQo+ID4+ICA+ICAgLSByZXNldC1n
cGlvcwo+ID4+ICA+ICAgLSAuLi4KPiA+PiAgPgo+ID4+ICA+IGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQo+ID4+ICA+Cj4gPj4gID4gU28gci1iIG9ubHkgd2l0aCB0aGVzZSBhZGRlZC4KPiA+
Pgo+ID4+ICBTdHVwaWQgbWlzdGFrZSwgc29ycnkgYWJvdXQgdGhhdC4KPiA+Pgo+ID4+ICBJJ2xs
IFYyLgo+ID4KPiA+IEkgZG9uJ3QgaGF2ZSBhbnkgVjIgaW4gbXkgaW5ib3gsIGJ1dCBsb29rcyBs
aWtlIGl0IGlzIGluIGxpbnV4LW5leHQKPiA+IG5vdzoKPgo+IFllcywgU2FtIHRvbGQgbWUgb24g
SVJDIEkgY291bGQgZml4IGl0IHdoaWxlIGFwcGx5aW5nIGFuZCBhdm9pZCB0aGUgVjIuCj4KPiA+
IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1iaW5kaW5ncy9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4MDY3YS5leGFtcGxlLmR0Lnlh
bWw6Cj4gPiBwYW5lbEAwOiAnc3BpLW1heC1mcmVxdWVuY3knIGRvZXMgbm90IG1hdGNoIGFueSBv
ZiB0aGUgcmVnZXhlczoKPiA+ICdwaW5jdHJsLVswLTldKycKPiA+ICBGcm9tIHNjaGVtYToKPiA+
IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1iaW5kaW5ncy9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hYnQseTAzMHh4MDY3YS55YW1sCj4KPiAibWFr
ZSBkdF9iaW5kaW5nX2NoZWNrCj4gRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FidCx5MDMweHgwNjdhLnlhbWwiCj4gZG9lc24n
dCBjb21wbGFpbiBoZXJlIDooCgpFdmVuIGlmIHlvdSBkbyAndG91Y2gKRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWJ0LHkwMzB4eDA2N2EueWFtbCcKb3Ig
ZG8gYSBjbGVhbiBidWlsZD8KCkkgY2FuJ3QgdGhpbmsgb2YgYW55IGtlcm5lbCBvciBkdC1zY2hl
bWEgY2hhbmdlcyB3aGljaCB3b3VsZCBleHBsYWluCnRoZSBkaWZmZXJlbmNlLiBUaGlzIGlzIHB1
cmVseSByZWxhdGVkIHRvICdhZGRpdGlvbmFsUHJvcGVydGllczoKZmFsc2UnLgoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
