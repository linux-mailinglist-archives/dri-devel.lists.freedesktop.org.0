Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7D144D53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407B86F423;
	Wed, 22 Jan 2020 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9B6ED75
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 16:00:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so3509993wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ytwKdiKDkBrq5dWN34mZGZBl7UpibNepadICMkoJFGA=;
 b=A3g8phgaxu7x2jJLxOOrTVVNprEJJJPK5vGTb65L/lIrSnqdZod0XDVtme4mjiZWmB
 tbew2hAP3T/tHd19LKPUnuHOwrZhT0zt/NvwCaVQrx9VhHjbFJOK9+CKbCksBbq4sy/7
 1eOvdE6fyAYUUJfR6BjXc3TKC6jRXwx4dawndZh3kksTjoT+G7KX7yyuwfjEMc3z+6xn
 uUPo3msBSjzJ6zx4QL3Kg0YBK7HGBW67OG7ymS7ZOZ+CBl0D9gOmIxJ/im5KvK6tEDN0
 5xgt0RFB6O5JTrS1WJOljBYb3636Iy35GI1N22oQwN0sydZmNcXUeL03g/Uogpxhj9c8
 zbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ytwKdiKDkBrq5dWN34mZGZBl7UpibNepadICMkoJFGA=;
 b=LdTYDttVngu6GduogmxqKBfCWhHu7kaLWRBc8hQ9geNlr8mjKzQRDsCy0Zkbx+2P/L
 2xsl2bIneazlyJ5Gh6bdgCGVEhy80gX5y9v0td/I3/n+QNUVsU6C87AKNA5I9ymXTy/6
 55hlsW0Bmgez/2MOOtbX7PoEaP5YsRgTlV71jP021RQJVBrCI0UrnZKGkaMeWydn+BQH
 gh56VE2u97g8LRRpdQFdZGfUEDrhgsMaQpsHwm0Va0G5oNREeqCLTxIpkFzmrJyig4Oo
 V4aXXXhfX2Xyg8ZM+nCzrXyMi9W+GFdVpY79+XOFNgTjo7Gb30M1IEivTNJtkeIY8Wne
 IbTg==
X-Gm-Message-State: APjAAAU4CFWlSVHapao2DbaGNRemrRPi1t7RwVu0nXvBMH11e3lY5wmu
 er1/wiRO0kG0d03JMgU1tYw=
X-Google-Smtp-Source: APXvYqw/5uPfelRwAOPcMQ/7ch5/ttpQTTV4/ZW3Orj4e+6tsxvKNnOwkfDYFwEyTwz4cepmMWDCIg==
X-Received: by 2002:a1c:3c89:: with SMTP id j131mr5150540wma.34.1579622436737; 
 Tue, 21 Jan 2020 08:00:36 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id u1sm4335276wmc.5.2020.01.21.08.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:00:36 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
 <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
 <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <633202b7-31cb-a2ff-9461-631652cd94c0@gmail.com>
Date: Tue, 21 Jan 2020 17:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 dafna3@gmail.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, kernel@collabora.com, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxLzIxLzIwIDQ6MjYgUE0sIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6Cj4gCj4gCj4g
T24gMjEuMDEuMjAgMTY6MTEsIEpvaGFuIEpvbmtlciB3cm90ZToKPj4gSGkgRGFmbmEsCj4+Cj4+
Cj4+Pgo+Pj4KPj4+IE9uIDIxLjAxLjIwIDE1OjAzLCBSb2IgSGVycmluZyB3cm90ZToKPj4+PiBP
biBUdWUsIEphbiAyMSwgMjAyMCBhdCA2OjM1IEFNIERhZm5hIEhpcnNjaGZlbGQKPj4+PiA8ZGFm
bmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gY29udmVydCB0
aGUgYmluZGluZyBmaWxlIHJvY2tjaGlwLWRybS50eHQgdG8geWFtbCBmb3JtYXQuCj4+Pj4+IFRo
aXMgd2FzIHRlc3RlZCBhbmQgdmVyaWZpZWQgd2l0aDoKPj4+Pj4gbWFrZSBkdF9iaW5kaW5nX2No
ZWNrCj4+Pj4+IERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC1kcm0ueWFtbAo+Pj4+Pgo+Pj4+Cj4+Pj4gQWxz
bywgbWFrZSBzdXJlIGp1c3QgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgcGFzc2VzIGFzIHRoYXQg
Y2hlY2tzIHRoZQo+Pj4+IGV4YW1wbGUgYWdhaW5zdCBhbGwgc2NoZW1hcy4KPj4+Cj4+PiBCdXQg
dGhpcyBhbHNvIGNoZWNrcyB0aGUgb3RoZXIgc2NoZW1hcyBpbiBnZW5lcmFsLCBhbmQgd2hlbiBy
dW5uaW5nIGl0LAo+Pj4gaXQgZmFpbHMgYmVjYXVzZSBvZiBidWdzIGluIG90aGVyIHNjaGVtYXMu
Cj4+Cj4+Cj4+PiBGb3IgZXhhbXBsZSB3aXRoIGFybT1BUk0gSSBnZXQ6Cj4+Cj4+IFVzZToKPj4K
Pj4gIyBlbmFibGUgUm9ja2NoaXAgYXJtIGluIG1lbnVjb25maWcKPj4gbWFrZSBBUkNIPWFybSBt
ZW51Y29uZmlnCj4+Cj4+IG1ha2UgQVJDSD1hcm0gZHRfYmluZGluZ19jaGVjawo+PiBEVF9TQ0hF
TUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvcm9ja2NoaXAtZHJtLnlhbWwKPj4KPj4KPj4gYW5kIG5vdDoKPj4gYXJtPUFSTQo+Pgo+IHll
cywgc29ycnksIHRoaXMgaXMgd2hhdCBJIGRpZC4gV2hlbiBydW5uaW5nIHdpdGggdGhlIERUX1ND
SEVNQV9GSUxFUwo+IHNldCB0aGVuIGl0IHBhc3NlcyBib3RoIG9uIEFSTSBhbmQgQVJNNjQKPiBi
dXQgd2hlbiB0aGlzIHZhcmlhYmxlIGlzIG5vdCBzZXQgSSBnZXQgdGhlIGFib3ZlIGVycm9yLgoK
IyBmb3IgSW50ZWwgdXNlOgptYWtlIGR0YnNfY2hlY2sKRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWRybS55
YW1sCgoKIyBmb3IgUm9ja2NoaXAgdXNlOgptYWtlIEFSQ0g9YXJtIGR0YnNfY2hlY2sKRFRfU0NI
RU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tj
aGlwL3JvY2tjaGlwLWRybS55YW1sCgptYWtlIEFSQ0g9YXJtNjQgZHRic19jaGVjawpEVF9TQ0hF
TUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvcm9ja2NoaXAtZHJtLnlhbWwKCkFsc28gY2hhbmdlOgoKZXhhbXBsZToKICBSZWR1Y2Ugc29t
ZSBzcGFjZXMgaGVyZS4KCkFsc28gcmVtb3ZlICJ8IiBmcm9tIGRlc2NyaXB0aW9uLgoKU2VlOgpk
ZXNjcmlwdGlvbjogfAogIEEgbW9yZSBkZXRhaWxlZCBtdWx0aS1saW5lIGRlc2NyaXB0aW9uIG9m
IHRoZSBiaW5kaW5nLgoKICBEZXRhaWxzIGFib3V0IHRoZSBoYXJkd2FyZSBkZXZpY2UgYW5kIGFu
eSBsaW5rcyB0byBkYXRhc2hlZXRzIGNhbiBnbyBoZXJlLgoKICBMaXRlcmFsIGJsb2NrcyBhcmUg
bWFya2VkIHdpdGggdGhlICd8JyBhdCB0aGUgYmVnaW5uaW5nLiBUaGUgZW5kIGlzCm1hcmtlZCBi
eQogIGluZGVudGF0aW9uIGxlc3MgdGhhbiB0aGUgZmlyc3QgbGluZSBvZiB0aGUgbGl0ZXJhbCBi
bG9jay4gTGluZXMgYWxzbwpjYW5ub3QKICBiZWdpbiB3aXRoIGEgdGFiIGNoYXJhY3Rlci4KCj4g
Cj4gRGFmbmEKPiAKPj4KPj4+Cj4+PiDCoMKgwqAgRFRDwqDCoMKgwqAKPj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9xY29tLGdjYy5leGFtcGxlLmR0LnlhbWwKPj4+
IEVycm9yOgo+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Fjb20s
Z2NjLmV4YW1wbGUuZHRzOjExMS4yOC0yOQo+Pj4gc3ludGF4IGVycm9yCj4+PiBGQVRBTCBFUlJP
UjogVW5hYmxlIHRvIHBhcnNlIGlucHV0IHRyZWUKPj4+Cj4+PiBEYWZuYQo+Pj4KPj4+Pgo+Pj4+
PiBtYWtlIGR0YnNfY2hlY2sKPj4+Pj4gRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWRybS55YW1sCj4+Pj4+
Cj4+Pj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
