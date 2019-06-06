Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A970637E81
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 22:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B50489804;
	Thu,  6 Jun 2019 20:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556D89804
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 20:19:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m15so3245483ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 13:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/03xw2tp9NftYo6y3lqGwgx/5/L6jpHZDgrcUrW11Ls=;
 b=eCQbmYV41pENXdvjZjtDzsTtb21W5CFrbw63hbrnFjbShCW2Yqr9cLs6CaYac+sEAx
 uYpVNn8mmLXmVQcoRR0W6HDbY9MN6udmRipNho+3X6ZFFhkf5s1G4mJkx0FbrKRBqTYr
 VJIavcPRcrtPHNGKGGYYbxDprpGWHIG0PE+5JgHVwzkOK+cq1Ut5pUYo2WP+2Qg6lN1h
 94mKTXgkACuHrqyEa2UBUxCCqc6FRzbJbqeLwc7kIFHV3acYZXgfR0nUylG0zdqqrPzK
 4bVEGA9AaQwFd8vifnzMy3X5NNHGoMLfJFEBpWNaTO8DzNurENLMH9z7V05qSDxh97wo
 uPYw==
X-Gm-Message-State: APjAAAVh//n8PGYTintap7PzOD+8CqRCOX+0voiGT0gsObpc9GLL/Nok
 f0olgcqqFirQgIi754qht0AtVg==
X-Google-Smtp-Source: APXvYqzgZWw8o0bIGbPew+V04P4R1bupPBNRB+zTHJIX2UUIcycbT6+JsRt9BBlOQc6u4j5RWpUJqg==
X-Received: by 2002:a2e:880d:: with SMTP id x13mr25825603ljh.72.1559852348590; 
 Thu, 06 Jun 2019 13:19:08 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.115])
 by smtp.gmail.com with ESMTPSA id 20sm14917ljf.21.2019.06.06.13.19.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 13:19:07 -0700 (PDT)
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-2-jacopo+renesas@jmondi.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0c04c0b6-1fbf-fba3-ca40-c4a999ed6a17@cogentembedded.com>
Date: Thu, 6 Jun 2019 23:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
Content-Language: en-MW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/03xw2tp9NftYo6y3lqGwgx/5/L6jpHZDgrcUrW11Ls=;
 b=C6mOGcHiaVmH85p7U7iwG8/iC0iR06aNXeaSXUH7HDVESCO6hX0YzCVBmJA28M9jLH
 N1Y4rCIH84mshtTrWvh6iej7PDWJ4yGcF1AsMZZTx7xJduPJlljsmkHLmSjP9zG/Xp5R
 GqL9GlKj295vqo4NA6kAIDYMZBpcfXuV4amDihjRcFPLDzzgLItUJ6XybX2mxHRXSg6z
 vzPERSHRCGtH35IpNxF6Q6cZt9KaVrLrKBB1mN6GmVNOxnlujaJ7NdUo89Zw1nw3EOW7
 awkyxiiCs6BI4goeDyxJoQOQQAI5NXiwkDyfeNV5iJo35vWKPfXFyZxgXT+1RVTOoNvp
 fUtw==
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDYvMjAxOSAwNToyMiBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOgoKPiBBZGQgZGV2aWNl
IHRyZWUgYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFJlbmVzYXMgUi1DYXIgRGlzcGxh
eQo+IFVuaXQgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUuCj4gCj4gQ01NIGlzIHRoZSBpbWFnZSBl
bmhhbmNlbWVudCBtb2R1bGUgYXZhaWxhYmxlIG9uIGVhY2ggUi1DYXIgRFUgdmlkZW8KPiBjaGFu
bmVsIG9uIEdlbjIgYW5kIEdlbjMgU29DcyAoVjNIIGFuZCBWM00gZXhjbHVkZWQpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAt
LS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0ICAgICAgICAgIHwgMjUg
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnR4dAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kOGQzY2Y5Y2UyY2UKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVu
ZXNhcyxjbW0udHh0Cj4gQEAgLTAsMCArMSwyNSBAQAo+ICsqIFJlbmVzYXMgUi1DYXIgQ29sb3Ig
TWFuYWdlbWVudCBNb2R1bGUgKENNTSkKPiArCj4gK1JlbmVzYXMgUi1DYXIgaW1hZ2UgZW5oYW5j
ZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0byBSLUNhciBEVSB2aWRlbyBjaGFubmVscy4KPiArCj4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKyAtIGNvbXBhdGlibGU6IHNoYWxsIGJlIG9uZSBvZjoK
PiArICAgLSAicmVuZXNhcyxjbW0tZ2VuMyIKPiArICAgLSAicmVuZXNhcyxjbW0tZ2VuMiIKPiAr
Cj4gKyAtIHJlZzogdGhlIGFkZHJlc3MgYmFzZSBhbmQgbGVuZ3RoIG9mIHRoZSBtZW1vcnkgYXJl
YSB3aGVyZSBDTU0gY29udHJvbAo+ICsgICByZWdpc3RlcnMgYXJlIG1hcHBlZCB0by4KPiArCj4g
KyAtIGNsb2NrczogcGhhbmRsZSBhbmQgY2xvY2stc3BlY2lmaWVyIHBhaXIgdG8gdGhlIENNTSBm
dW5jdGlvbmFsIGNsb2NrCj4gKyAgIHN1cHBsaWVyLgo+ICsKPiArRXhhbXBsZToKPiArLS0tLS0t
LS0KPiArCj4gKwljbW0wOiBjbW1AZmVhNDAwMDAgewo+ICsJCWNvbXBhdGlibGUgPSAicmVuZXNh
cyxjbW0iOwoKICAgRG9zZW50JyBtYXRjaCB0aGUgZGVzY3JpcHRpb24gYWJvdmUuCgo+ICsJCXJl
ZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2Mg
UjhBNzc5Nl9QRF9BTFdBWVNfT04+Owo+ICsJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzExPjsK
PiArCQlyZXNldHMgPSA8JmNwZyA3MTE+Owo+ICsJfTsKPiAKCk1CUiwgU2VyZ2VpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
