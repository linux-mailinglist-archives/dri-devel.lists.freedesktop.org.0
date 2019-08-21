Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270C9731F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DA6E91E;
	Wed, 21 Aug 2019 07:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF686E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 07:13:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z11so959766wrt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 00:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0wJkb8pVe8d9YxnMKhtFvwVNyzhHysdsOlvVVZ4ZbNw=;
 b=Zy3C3DryPc+nOXyYejjxDNAra+WvYHwc/ZPcaTSf3/h1AtF4SXHso9vS5n5hLVOLky
 Tf60UDw0N3SqnlY6M/1lGYr32TfCZIVNf513ZhWz3DhXxUrM7iw1b9bQaeRRussmHxPS
 dAimiE6PS8zHYlsKvm+ki5CeCZbDgYVd/+WylQhAqyE4hUCrHdd8YH7ENSjCdO3WzWF6
 uWILjyvwJAGUSW7dAtVx5BvH/Fpebt9G/uzU4uohbZTB8kfjGGrpYYQuMFTo1YJNjsgE
 /shZbiG9BfgLPr1Gm2rFri4gjtM9TkLW702kUq5++42oDsNdMgdRDm9g7EtySzGvXoSB
 oPxQ==
X-Gm-Message-State: APjAAAVhO23IGiqaaiBXxulyHuM8e/rMpXNz/oUeYulalhL8j1bP11HR
 lBQ6/jWQAbubp179VYvjNbuD0A==
X-Google-Smtp-Source: APXvYqwFFJik1iFafIKfu0BvGp54Ye3GQlCkroen7Fy00pX/7sbnIdk0TATnec2z1ROUS6qqu8HWzQ==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr37676642wrm.83.1566371620586; 
 Wed, 21 Aug 2019 00:13:40 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z1sm27581936wrp.51.2019.08.21.00.13.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 00:13:40 -0700 (PDT)
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190820195959.6126-1-robh@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bbfe4e3b-9e75-0447-544e-a0f8f6a19f20@baylibre.com>
Date: Wed, 21 Aug 2019 09:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820195959.6126-1-robh@kernel.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0wJkb8pVe8d9YxnMKhtFvwVNyzhHysdsOlvVVZ4ZbNw=;
 b=xmpcf/9rnngZepnPB3E8+LA3qVd3YoawaOZYF2zXXKVMqvotUN6YQHR5z7E6Zxwh0D
 e1BS+SzOCbJ496qdvCm6bggGul24V41RGsA25GBqbPD4QXdmN75WxcbaaE+ov7wiiXWW
 eoqqNB/p7BwLiH+yXPals/BktP3uxVAc8g9YyVBKqr/eFpTV1HAT6sWzi2iPB1zf91Gi
 9Gmv5kXr5iAnpfuwA95ksddwOS3HFr33nYKIirX/yP+kSug4wTy+9aWvLztZveSCKE4E
 8XouN3n2u7WwyGik7YSlQ88s/Bfm2yaQ3Dn19Qvo8hhyfsFuQfg6Sv0ZfJAUXYE79ahF
 PIIw==
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
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMC8wOC8yMDE5IDIxOjU5LCBSb2IgSGVycmluZyB3cm90ZToKPiBUaGlzIHNlcmll
cyBjb252ZXJ0cyB0aGUgdmFyaW91cyBBcm0gTWFsaSBHUFUgYmluZGluZ3MgdG8gdXNlIHRoZSBE
VAo+IHNjaGVtYSBmb3JtYXQuCj4gCj4gVGhlIE1pZGdhcmQgYW5kIEJpZnJvc3QgYmluZGluZ3Mg
Z2VuZXJhdGUgd2FybmluZ3Mgb24gJ2ludGVycnVwdC1uYW1lcycKPiBiZWNhdXNlIHRoZXJlJ3Mg
YWxsIGRpZmZlcmVudCBvcmRlcmluZy4gVGhlIFV0Z2FyZCBiaW5kaW5nIGdlbmVyYXRlcyAKPiB3
YXJuaW5ncyBvbiBSb2NrY2hpcCBwbGF0Zm9ybXMgYmVjYXVzZSAnY2xvY2stbmFtZXMnIG9yZGVy
IGlzIHJldmVyc2VkLgoKRXhjZXB0IHRoZSBmYWN0IGNsb2NrcyBzaG91bGQgYmUgcmVxdWlyZWQg
b24gYWxsIGFtbG9naWMgYmluZGluZ3MsClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CkknbGwgc2VuZCBhIGZpeHVwIHBhdGNoIHRvIGVuZm9yY2Ug
Y2xvY2tzLgoKVGhhbmtzLApOZWlsCgo+IAo+IFJvYgo+IAo+IFJvYiBIZXJyaW5nICgzKToKPiAg
IGR0LWJpbmRpbmdzOiBDb252ZXJ0IEFybSBNYWxpIE1pZGdhcmQgR1BVIHRvIERUIHNjaGVtYQo+
ICAgZHQtYmluZGluZ3M6IENvbnZlcnQgQXJtIE1hbGkgQmlmcm9zdCBHUFUgdG8gRFQgc2NoZW1h
Cj4gICBkdC1iaW5kaW5nczogQ29udmVydCBBcm0gTWFsaSBVdGdhcmQgR1BVIHRvIERUIHNjaGVt
YQo+IAo+ICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0ICAgICAgICAgfCAg
OTIgLS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QueWFtbCAg
ICAgICAgfCAxMTUgKysrKysrKysrKysrCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlk
Z2FyZC50eHQgICAgICAgICB8IDExOSAtLS0tLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9ncHUv
YXJtLG1hbGktbWlkZ2FyZC55YW1sICAgICAgICB8IDE2NSArKysrKysrKysrKysrKysrKwo+ICAu
Li4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQgICAgICAgICAgfCAxMjkgLS0tLS0t
LS0tLS0tLS0KPiAgLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQueWFtbCAgICAgICAg
IHwgMTY2ICsrKysrKysrKysrKysrKysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDQ0NiBpbnNlcnRp
b25zKCspLCAzNDAgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLWJpZnJvc3QudHh0Cj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxt
YWxpLWJpZnJvc3QueWFtbAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRn
YXJkLnlhbWwKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQueWFtbAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
