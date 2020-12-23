Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C72E1B30
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BC06E8FB;
	Wed, 23 Dec 2020 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E376E8C6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 05:57:19 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id b5so2609938pjk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 21:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=lJW5Pmu0e9Bh/oQqoiiF+Gb9g3MgQRYVOM3hqkPUzNs=;
 b=W5YJc6EiiWk23cUCGsgoEZThjaHKBFlEG4O2cgRcXu+x5+1ODHw6d3bAyttpAh4Npy
 yhDhQA4+L+oz4wy8QflysfNhX4OfzqA0qNs/SHpKza5WXKgrPbKjAZqXsxt3M6+5uj5+
 VPzhmEJIKzlbozEEPWm1XL8KIXiyyOKO2HmVu9XxWuzA1/dlfxbwhMlk6o4r2lNa/tYB
 koUJs3PACOOeP10gRbtLplfNUPU/AAwjZHrgwyo0byxhHtSGWR9eYNFuLyVygLLz+QCX
 6yGQiSn1spMfKd1SRklgKWo8kYn0YWbHteDUGgx/252nlqC2vuCSM8Grhs1IDDtLRYP5
 ah0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lJW5Pmu0e9Bh/oQqoiiF+Gb9g3MgQRYVOM3hqkPUzNs=;
 b=jy9Gg1Pgv0wlC0p7Y81M13a64tjgTDfFmKMEpviv197I1yVYb1Z0bmiD1Lzg3/ZQsH
 /yAKNkAPqhCgzW7eYbhiJc1lHxLh5SD4Qx/c5i9+EPq7rIu3D5rk92lmGzCUUEoMWAqi
 5dm77UHxG5Pt5mS3SJ9EC7sm1lDcqi8NJsSwKy8omOpokxt+udRjm7x978ejCA83FzRw
 iU6tt/91kxG1FH/lQv+4rH6jCnx6OTeaRf1dUx3cGjGHXoc7eZ0wKEPiwwFlAzIs13zH
 WDrJfrnoxkbUiLFHjcUo6IzMYI1zii3ZT+pim2GGVKJtsz8Qku34HFJGv9iXvYELf/AS
 6DCA==
X-Gm-Message-State: AOAM533T+OLvoUGkyjjDC6UbTjOmhORIK2SXK8berFOf9XC2EW8h3LdI
 40bpzYvXmOVeXC+637Gi2s5McWiGwBYbzA==
X-Google-Smtp-Source: ABdhPJwsLgoGssujAxswnWOsu8NXhLnCPjFpMxnGOCgLNcgnd+pdiKB2jV1BoCNGdPUko3cGZpeLtQ==
X-Received: by 2002:a17:90a:cb84:: with SMTP id
 a4mr25789987pju.50.1608703038680; 
 Tue, 22 Dec 2020 21:57:18 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id w7sm22839140pgr.48.2020.12.22.21.57.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 21:57:17 -0800 (PST)
Date: Wed, 23 Dec 2020 11:27:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjItMTItMjAsIDIyOjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjIuMTIuMjAyMCAy
MjoyMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gPj4+ICsJaWYgKElTX0VSUihvcHAp
KSB7Cj4gPj4+ICsJCWRldl9lcnIoJmdlbnBkLT5kZXYsICJmYWlsZWQgdG8gZmluZCBPUFAgZm9y
IGxldmVsICV1OiAlcGVcbiIsCj4gPj4+ICsJCQlsZXZlbCwgb3BwKTsKPiA+Pj4gKwkJcmV0dXJu
IFBUUl9FUlIob3BwKTsKPiA+Pj4gKwl9Cj4gPj4+ICsKPiA+Pj4gKwllcnIgPSBkZXZfcG1fb3Bw
X3NldF92b2x0YWdlKCZnZW5wZC0+ZGV2LCBvcHApOwo+ID4+IElJVUMsIHlvdSBpbXBsZW1lbnRl
ZCB0aGlzIGNhbGxiYWNrIGJlY2F1c2UgeW91IHdhbnQgdG8gdXNlIHRoZSB2b2x0YWdlIHRyaXBs
ZXQKPiA+PiBwcmVzZW50IGluIHRoZSBPUFAgdGFibGUgPwo+ID4+Cj4gPj4gQW5kIHNvIHlvdSBh
cmUgc2V0dGluZyB0aGUgcmVndWxhdG9yICgicG93ZXIiKSBsYXRlciBpbiB0aGlzIHBhdGNoID8K
PiA+IHllcwo+ID4gCj4gPj4gSSBhbSBub3QgaW4gZmF2b3Igb2YgaW1wbGVtZW50aW5nIHRoaXMg
cm91dGluZSwgYXMgaXQganVzdCBhZGRzIGEgd3JhcHBlciBhYm92ZQo+ID4+IHRoZSByZWd1bGF0
b3IgQVBJLiBXaGF0IHlvdSBzaG91bGQgYmUgZG9pbmcgcmF0aGVyIGlzIGdldCB0aGUgcmVndWxh
dG9yIGJ5Cj4gPj4geW91cnNlbGYgaGVyZSAoaW5zdGVhZCBvZiBkZXBlbmRpbmcgb24gdGhlIE9Q
UCBjb3JlKS4gQW5kIHRoZW4geW91IGNhbiBkbwo+ID4+IGRldl9wbV9vcHBfZ2V0X3ZvbHRhZ2Uo
KSBoZXJlIGFuZCBzZXQgdGhlIHZvbHRhZ2UgeW91cnNlbGYuIFlvdSBtYXkgd2FudCB0bwo+ID4+
IGltcGxlbWVudCBhIHZlcnNpb24gc3VwcG9ydGluZyB0cmlwbGV0IGhlcmUgdGhvdWdoIGZvciB0
aGUgc2FtZS4KPiA+Pgo+ID4+IEFuZCB5b3Ugd29uJ3QgcmVxdWlyZSB0aGUgc3luYyB2ZXJzaW9u
IG9mIHRoZSBBUEkgYXMgd2VsbCB0aGVuLgo+ID4+Cj4gPiBUaGF0J3Mgd2hhdCBJIGluaXRpYWxs
eSBkaWQgZm9yIHRoaXMgZHJpdmVyLiBJIGRvbid0IG1pbmQgdG8gcmV2ZXJ0IGJhY2sKPiA+IHRv
IHRoZSBpbml0aWFsIHZhcmlhbnQgaW4gdjMsIGl0IGFwcGVhcmVkIHRvIG1lIHRoYXQgaXQgd2ls
bCBiZSBuaWNlcgo+ID4gYW5kIGNsZWFuZXIgdG8gaGF2ZSBPUFAgQVBJIG1hbmFnaW5nIGV2ZXJ5
dGhpbmcgaGVyZS4KPiAKPiBJIGZvcmdvdCBvbmUgaW1wb3J0YW50IGRldGFpbCAod2h5IHRoZSBp
bml0aWFsIHZhcmlhbnQgd2Fzbid0IGdvb2QpLi4KPiBPUFAgZW50cmllcyB0aGF0IGhhdmUgdW5z
dXBwb3J0YWJsZSB2b2x0YWdlcyBzaG91bGQgYmUgZmlsdGVyZWQgb3V0IGFuZAo+IE9QUCBjb3Jl
IHBlcmZvcm1zIHRoZSBmaWx0ZXJpbmcgb25seSBpZiByZWd1bGF0b3IgaXMgYXNzaWduZWQgdG8g
dGhlIE9QUAo+IHRhYmxlLgo+IAo+IElmIHJlZ3VsYXRvciBpcyBhc3NpZ25lZCB0byB0aGUgT1BQ
IHRhYmxlLCB0aGVuIHdlIG5lZWQgdG8gdXNlIE9QUCBBUEkKPiBmb3IgZHJpdmluZyB0aGUgcmVn
dWxhdG9yLCBoZW5jZSB0aGF0J3Mgd2h5IEkgYWRkZWQKPiBkZXZfcG1fb3BwX3N5bmNfcmVndWxh
dG9ycygpIGFuZCBkZXZfcG1fb3BwX3NldF92b2x0YWdlKCkuCj4gCj4gUGVyaGFwcyBpdCBzaG91
bGQgYmUgcG9zc2libGUgdG8gYWRkIGRldl9wbV9vcHBfZ2V0X3JlZ3VsYXRvcigpIHRoYXQKCldo
YXQncyB3cm9uZyB3aXRoIGdldHRpbmcgdGhlIHJlZ3VsYXRvciBpbiB0aGUgZHJpdmVyIGFzIHdl
bGwgPyBBcGFydCBmcm9tIHRoZQpPUFAgY29yZSA/Cgo+IHdpbGwgcmV0dXJuIHRoZSBPUFAgdGFi
bGUgcmVndWxhdG9yIGluIG9yZGVyIHRvIGFsbG93IGRyaXZlciB0byB1c2UgdGhlCj4gcmVndWxh
dG9yIGRpcmVjdGx5LiBCdXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBhIG11Y2ggYmV0
dGVyCj4gb3B0aW9uIHRoYW4gdGhlIG9wcF9zeW5jX3JlZ3VsYXRvcnMoKSBhbmQgb3BwX3NldF92
b2x0YWdlKCkgQVBJcy4KCnNldF92b2x0YWdlKCkgaXMgc3RpbGwgZmluZSBhcyB0aGVyZSBpcyBz
b21lIGRhdGEgdGhhdCB0aGUgT1BQIGNvcmUgaGFzLCBidXQKc3luY19yZWd1bGF0b3IoKSBoYXMg
bm90aGluZyB0byBkbyB3aXRoIE9QUCBjb3JlLgoKQW5kIHRoaXMgbWF5IGxlYWQgdG8gbW9yZSB3
cmFwcGVyIGhlbHBlcnMgaW4gdGhlIE9QUCBjb3JlLCB3aGljaCBJIGFtIGFmcmFpZCBvZi4KQW5k
IHNvIGV2ZW4gaWYgaXQgaXMgbm90IHRoZSBiZXN0LCBJIHdvdWxkIGxpa2UgdGhlIE9QUCBjb3Jl
IHRvIHByb3ZpZGUgdGhlIGRhdGEKYW5kIG5vdCBnZXQgaW50byB0aGlzLiBPZmNvdXJzZSB0aGVy
ZSBpcyBhbiBleGNlcHRpb24gdG8gdGhpcywgb3BwX3NldF9yYXRlLgoKLS0gCnZpcmVzaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
