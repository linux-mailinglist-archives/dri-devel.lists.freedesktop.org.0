Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EE71289
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69436E02A;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4923D89F45
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 00:30:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h28so27967294lfj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ydn5aXtbjPIthQYkb8DxoEn6a0yqGKXsQnxBhhcpdZQ=;
 b=PJtWqy+CQbOh024BFzp7IynqVPW0nO8FjmksB0xMat3czVtMIquZfihqx4z9hW4ozb
 XAuoOYYr5bHaNtQ+VlPwbyS3CI7E4nd/FtNEMe3MtitJf3rng6utwxzirpaaaApKpqnW
 zpZRiqXyECDwwOffObj1kZQIkus0pMDGfSmgvx43XYE42hdrPIy6pl5X3SHQ93xRJJ2h
 9Nb+LxT1hiSrwMPkfHryY5Q2SZfedH+nQGF/hzyKLpjTY0SXDQHyBM5h1hBrGJEn05p0
 sLJ5GrWH0rcPxKyuJSTu2hWcOaXcOcn165oaVVb68iMiqRdpK9ienXBxPdGiwboiIZh3
 JwmQ==
X-Gm-Message-State: APjAAAWlwSqIpWD3xVe8udTVn1HmpUt7OSTmixG4Srg9whgHaBxxnAzx
 SqhZ2c4p0NYwiAqZ6PgQCkY=
X-Google-Smtp-Source: APXvYqxmsDUOvMm9RFs8rcYOlKF/8VpQPPWJKSzE41Iv1hLPzW7DNrnvEdDNJfjW6mv1WwHX4ehs2g==
X-Received: by 2002:a19:7f17:: with SMTP id a23mr35997598lfd.49.1563841806644; 
 Mon, 22 Jul 2019 17:30:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id e26sm7804856ljl.33.2019.07.22.17.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 17:30:05 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
To: Viswanath L <viswanathl@nvidia.com>, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
Date: Tue, 23 Jul 2019 03:30:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ydn5aXtbjPIthQYkb8DxoEn6a0yqGKXsQnxBhhcpdZQ=;
 b=C3qJWuJWplSYB8ByJ1dwwDffH+KZUkfbYP8PHNyRm7cS/J1Lir7t1sFAkd07DEZqco
 08WCgeHqWzSwGYLlx/e60/hNdrUMI3hGElgtiiCFrs4PpjekwDHCfq6ylyJJ1FWzkP3Q
 GEsZC6UYDteoP9+Pvc5RQB2YVkHLHgpi1MbQs7RwDjENUD+pVX6QrWtfhlscMQaMNWqn
 clSawOJRK912XFD7BG6itU8Vfe5Nf/QqCdSDKv2ag3i7cjsGLXq6vue3FRNnYG1YnC45
 a8+8SQzOd9C/UbVtMUQ3rkSV8qXQGpCuJGzhk1OVXSfnLTwLAK9MN3kf2nrx4wRe+QQE
 yjwQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMDcuMjAxOSAxMjoyNywgVmlzd2FuYXRoIEwg0L/QuNGI0LXRgjoKPiBIRE1JIHBsdWdvdXQg
Y2FsbHMgcnVudGltZSBzdXNwZW5kLCB3aGljaCBjbGVhcnMgaW50ZXJydXB0IHJlZ2lzdGVycwo+
IGFuZCBjYXVzZXMgYXVkaW8gZnVuY3Rpb25hbGl0eSB0byBicmVhayBvbiBzdWJzZXF1ZW50IHBs
dWdpbjsgc2V0dGluZwo+IGludGVycnVwdCByZWdpc3RlcnMgaW4gc29yX2F1ZGlvX3ByZXBhcmUo
KSBzb2x2ZXMgdGhlIGlzc3VlCgpIZWxsbyBWaXN3YW5hdGgsCgpBIGRvdCBzaG91bGQgYmUgaW4g
dGhlIGVuZCBvZiBzZW50ZW5jZSwgcGxlYXNlLiBBbmQgc2hvdWxkIGJlIGJldHRlciB0bwpzL3Bs
dWdpbi9wbHVnLWluLyBpbiB0aGUgY29tbWl0J3MgbWVzc2FnZS90aXRsZSBiZWNhdXNlICdwbHVn
aW4nIHNvdW5kcwphcyBhIG5vdW4uCgpQbGVhc2UgZG9uJ3QgdmVyc2lvbiBwYXRjaCBhcyB2MiBp
ZiB2MSB3YXNuJ3QgZXZlciBzZW50IG91dC4KCllvdSBzaG91bGQgYWRkIGEgc3RhYmxlIHRhZyBo
ZXJlIHRvIGdldCBwYXRjaCBiYWNrcG9ydGVkIGludG8gc3RhYmxlCmtlcm5lbCB2ZXJzaW9uczoK
CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogVmlzd2FuYXRo
IEwgPHZpc3dhbmF0aGxAbnZpZGlhLmNvbT4KClRoZSBrZXJuZWwgdXBzdHJlYW1pbmcgcnVsZXMg
cmVxdWlyZSBhIGZ1bGwgbmFtZS4gSSdtIHByZXR0eSBzdXJlIHRoYXQgTAppc24ndCB5b3VycyBz
dXJuYW1lLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgMTggKysrKysr
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+IGluZGV4IDViZTVhMDguLjA0NzBjZmUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL3Nvci5jCj4gQEAgLTIxNjQsNiArMjE2NCwxNSBAQCBzdGF0aWMgdm9pZCB0ZWdy
YV9zb3JfYXVkaW9fcHJlcGFyZShzdHJ1Y3QgdGVncmFfc29yICpzb3IpCj4gIAo+ICAJdmFsdWUg
PSBTT1JfQVVESU9fSERBX1BSRVNFTlNFX0VMRFYgfCBTT1JfQVVESU9fSERBX1BSRVNFTlNFX1BE
Owo+ICAJdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfQVVESU9fSERBX1BSRVNFTlNF
KTsKPiArCj4gKwkvKgo+ICsJICogRW5hYmxlIGFuZCB1bm1hc2sgdGhlIEhEQSBjb2RlYyBTQ1JB
VENIMCByZWdpc3RlciBpbnRlcnJ1cHQuIFRoaXMKPiArCSAqIGlzIHVzZWQgZm9yIGludGVyb3Bl
cmFiaWxpdHkgYmV0d2VlbiB0aGUgSERBIGNvZGVjIGRyaXZlciBhbmQgdGhlCj4gKwkgKiBIRE1J
L0RQIGRyaXZlci4KPiArCSAqLwo+ICsJdmFsdWUgPSBTT1JfSU5UX0NPREVDX1NDUkFUQ0gxIHwg
U09SX0lOVF9DT0RFQ19TQ1JBVENIMDsKPiArCXRlZ3JhX3Nvcl93cml0ZWwoc29yLCB2YWx1ZSwg
U09SX0lOVF9FTkFCTEUpOwo+ICsJdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfSU5U
X01BU0spOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCB0ZWdyYV9zb3JfYXVkaW9fdW5wcmVwYXJl
KHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKPiBAQCAtMjkxMywxNSArMjkyMiw2IEBAIHN0YXRpYyBp
bnQgdGVncmFfc29yX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKPiAgCWlmIChl
cnIgPCAwKQo+ICAJCXJldHVybiBlcnI7Cj4gIAo+IC0JLyoKPiAtCSAqIEVuYWJsZSBhbmQgdW5t
YXNrIHRoZSBIREEgY29kZWMgU0NSQVRDSDAgcmVnaXN0ZXIgaW50ZXJydXB0LiBUaGlzCj4gLQkg
KiBpcyB1c2VkIGZvciBpbnRlcm9wZXJhYmlsaXR5IGJldHdlZW4gdGhlIEhEQSBjb2RlYyBkcml2
ZXIgYW5kIHRoZQo+IC0JICogSERNSS9EUCBkcml2ZXIuCj4gLQkgKi8KPiAtCXZhbHVlID0gU09S
X0lOVF9DT0RFQ19TQ1JBVENIMSB8IFNPUl9JTlRfQ09ERUNfU0NSQVRDSDA7Cj4gLQl0ZWdyYV9z
b3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9JTlRfRU5BQkxFKTsKPiAtCXRlZ3JhX3Nvcl93cml0
ZWwoc29yLCB2YWx1ZSwgU09SX0lOVF9NQVNLKTsKPiAtCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
