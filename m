Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D078E52736
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 10:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44E6E0A6;
	Tue, 25 Jun 2019 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C046E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 08:55:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so15686084wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 01:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+PEbZrcWsg/sfdRRqnH3yNiO1c5IQdDweuvUj+RdlY=;
 b=Uu5Bty5HFg9F3N0MK4DCY2akqlqpb/WrD7INoBmkCj5rMHupApoZrfPrAlagOKa2lS
 XTo7l0otZfjUMilzt5icoBJDJ50UG4+1ljsxRiJsDSAAWyPXN14gQnzkWuybIjtudWWC
 rI59qhoFmsTP62hoGtDOZRYL7HmrIip6jLgrdjIACA4plDqNrS1DrAOBjgixQAeBYx3t
 LrYQB5ksBM/qCYUTQQwpBMahfl7vMrHx3dBTNZFho8Bf4jMt82GMQ8UpvTwR6Hp7raB2
 v2ejOyi5Ary16cwzXtVkxZCTjIEwQsHOjRvSV5KlqroHSJej2NrZIgQHjl6mK1RdC8jR
 pG6g==
X-Gm-Message-State: APjAAAVZJWKYmeb2yxzgjTjr+4F41KlcIiLEhurRH/V3h6tbrRyu+MP7
 j/N37WcG5A4yHVNq/Zt+H8i7SA==
X-Google-Smtp-Source: APXvYqxFEeOqm4oLNY5l5ka6WBRsFT3+qsMRNi25s2VSLy6UfyHaCehvfuHvOlO6Kx6fFOy37zXAJA==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr105800458wrj.66.1561452936808; 
 Tue, 25 Jun 2019 01:55:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o6sm2163440wmc.15.2019.06.25.01.55.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 01:55:35 -0700 (PDT)
Date: Tue, 25 Jun 2019 09:55:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Brian Dodge <bdodge09@gmail.com>
Subject: Re: [PATCH 1/2]    dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190625085534.xf2ullyju3ewbgik@holly.lan>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+PEbZrcWsg/sfdRRqnH3yNiO1c5IQdDweuvUj+RdlY=;
 b=LpOvY4Y/Xp6kcxkeGGWl5Ga1uyDShUmNT0B0vb1XysMnFJ8OiNfztz6lJTuywUtAEp
 6RzYY+Cv1oy9edc0yZA05NhSucLvFXJHHr2JCpjV/0jMROnNLwQHwHdCDuoHrjaw937d
 CAYam5pvNQ131EpeGwGBFcU/a3P9F4w45uH15cjQ4R1P2OwSbesnRRNenYNhTOPm6/ly
 l7LHmB9FEwGB3uwEoH5HSaVIWjUowBs9NVKAEFrYwsMsG0itq++y6gNCbQo6u5gxop0E
 PHGu9LmJn8d6vw6buFXektsMC7UorgoL7C+ZRa4rYxkft6MpRruLR7POuz59WAvo1glo
 nAAQ==
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
Cc: devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, pbacon@psemi.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6MDU6MjhBTSAtMDQwMCwgQnJpYW4gRG9kZ2Ugd3Jv
dGU6Cj4gICAgIFRoZSB2ZW5kb3ItcHJlZml4ZXMudHh0IGZpbGUgcHJvcGVybHkgcmVmZXJzIHRv
IEFyY3RpY1NhbmQKPiAgICAgYXMgYXJjdGljIGJ1dCB0aGUgZHJpdmVyIGJpbmRpbmdzIGltcHJv
cGVybHkgYWJicmV2aWF0ZWQgdGhlCj4gICAgIHByZWZpeCB0byBhcmMuIFRoaXMgd2FzIGEgbWlz
dGFrZSBpbiB0aGUgb3JpZ2luYWwgcGF0Y2gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBEb2Rn
ZSA8YmRvZGdlMDlAZ21haWwuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGln
aHQvYXJjeGNubl9ibC50eHQgICAgICAgICB8IDI0ICsrKysrKysrKysrKystLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGln
aHQvYXJjeGNubl9ibC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvYXJjeGNubl9ibC50eHQKPiBpbmRleCAyMzBhYmRlLi45Y2Y0YzQ0IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9hcmN4Y25uX2JsLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4dAo+IEBAIC0xLDggKzEsMTIgQEAKPiAtQmlu
ZGluZyBmb3IgQXJjdGljU2FuZCBhcmMyYzA2MDggTEVEIGRyaXZlcgo+ICtCaW5kaW5nIGZvciBB
cmN0aWNTYW5kIGFyYyBmYW1pbHkgTEVEIGRyaXZlcnMKPiAgCj4gIFJlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gLS0gY29tcGF0aWJsZToJCXNob3VsZCBiZSAiYXJjLGFyYzJjMDYwOCIKPiAtLSByZWc6
CQkJc2xhdmUgYWRkcmVzcwo+ICstIGNvbXBhdGlibGU6IG9uZSBvZgo+ICsJImFyY3RpYyxhcmMx
YzA2MDgiCj4gKwkiYXJjdGljLGFyYzJjMDYwOCIKPiArCSJhcmN0aWMsYXJjM2MwODQ1IgoKVGhp
cyBpcyBtb3JlIGEgcXVlc3Rpb24gZm9yIHRoZSBEVCBmb2xrcyB0aGFuIGZvciBCcmlhbiBidXQu
Li4KCkFGQUlDVCB0aGlzIHBhdGNoIGlzIGZpeGluZyB0aGUgYmluZGluZyBmb3IgdGhlIEFyY3Rp
Y1NhbmQgZGV2aWNlcyB0bwp1c2UgdGhlIGNvcnJlY3QgdmFsdWUgZnJvbSB2ZW5kb3ItcHJlZml4
ZXMueWFtbCBhbmQgaGFzIGJlZW4gcHJldmlvdXNseQpkaXNjdXNzZWQgaGVyZToKaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMTgvOS8yNS83MjYKCkN1cnJlbnRseSB0aGlzIHBhdGNoIHNlcmllcyBq
dXN0IHVwZGF0ZXMgdGhlIERUIGJpbmRpbmdzIGJ1dCB0aGUKaW1wbGVtZW50YXRpb24gYWxzbyBo
b25vdXJzIHRoZSBvbGQgdmFsdWVzIChzaW5jZSB0aGVyZSBpcyBhIENocm9tZWJvb2sKaW4gdGhl
IHdpbGQgdGhhdCB1c2VzIHRoZSBjdXJyZW50IGJpbmRpbmdzKS4KCkhlbmNlIEknbSBub3QgY2xl
YXIgd2hldGhlciB0aGUgYmluZGluZ3Mgc2hvdWxkIGRvY3VtZW50IHRoZSBkZXByZWNhdGVkCm9w
dGlvbnMgdG9vIChlLmcuIG1ha2UgaXQgZWFzaWVyIHRvIGZpbmQgdGhlIGJpbmRpbmdzIGRvYyB3
aXRoIGdpdCBncmVwCmFuZCBmcmllbmRzKS4KCgpEYW5pZWwuCgoKPiArCj4gKy0gcmVnOgkJc2xh
dmUgYWRkcmVzcwo+ICAKPiAgT3B0aW9uYWwgcHJvcGVydGllczoKPiAgLSBkZWZhdWx0LWJyaWdo
dG5lc3M6CWJyaWdodG5lc3MgdmFsdWUgb24gYm9vdCwgdmFsdWUgZnJvbTogMC00MDk1Cj4gQEAg
LTExLDE5ICsxNSwxOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAtIGxlZC1zb3VyY2VzOgkJ
TGlzdCBvZiBlbmFibGVkIGNoYW5uZWxzIGZyb20gMCB0byA1Lgo+ICAJCQlTZWUgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAo+ICAKPiAtLSBhcmMsbGVk
LWNvbmZpZy0wOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18wCj4gLS0gYXJjLGxl
ZC1jb25maWctMToJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMQo+IC0tIGFyYyxk
aW0tZnJlcToJCVBXTSBtb2RlIGZyZXF1ZW5jZSBzZXR0aW5nIChiaXRzIFszOjBdIHVzZWQpCj4g
LS0gYXJjLGNvbXAtY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBDT05GSUdfQ09NUAo+IC0t
IGFyYyxmaWx0ZXItY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBGSUxURVJfQ09ORklHCj4g
LS0gYXJjLHRyaW0tY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBJTUFYVFVORQo+ICstIGFy
Y3RpYyxsZWQtY29uZmlnLTA6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIElMRURfQ09ORklHXzAKPiAr
LSBhcmN0aWMsbGVkLWNvbmZpZy0xOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18x
Cj4gKy0gYXJjdGljLGRpbS1mcmVxOgkJUFdNIG1vZGUgZnJlcXVlbmNlIHNldHRpbmcgKGJpdHMg
WzM6MF0gdXNlZCkKPiArLSBhcmN0aWMsY29tcC1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IENPTkZJR19DT01QCj4gKy0gYXJjdGljLGZpbHRlci1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lz
dGVyIEZJTFRFUl9DT05GSUcKPiArLSBhcmN0aWMsdHJpbS1jb25maWc6CXNldHRpbmcgZm9yIHJl
Z2lzdGVyIElNQVhUVU5FCj4gIAo+ICBOb3RlOiBPcHRpb25hbCBwcm9wZXJ0aWVzIG5vdCBzcGVj
aWZpZWQgd2lsbCBkZWZhdWx0IHRvIHZhbHVlcyBpbiBJQyBFUFJPTQo+ICAKPiAgRXhhbXBsZToK
PiAgCj4gIGFyYzJjMDYwOEAzMCB7Cj4gLQljb21wYXRpYmxlID0gImFyYyxhcmMyYzA2MDgiOwo+
ICsJY29tcGF0aWJsZSA9ICJhcmN0aWMsYXJjMmMwNjA4IjsKPiAgCXJlZyA9IDwweDMwPjsKPiAg
CWRlZmF1bHQtYnJpZ2h0bmVzcyA9IDw1MDA+Owo+ICAJbGFiZWwgPSAibGNkLWJhY2tsaWdodCI7
Cj4gLS0gCj4gMi43LjQKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
