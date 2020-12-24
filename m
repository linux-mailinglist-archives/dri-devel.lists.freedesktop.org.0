Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9002E2AD4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A758489BFF;
	Fri, 25 Dec 2020 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8722289B51
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 12:14:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h205so4371750lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 04:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8PDZgsN8e1S8iAJgIQWFmcr5fqcA+olCtue62G+IMw8=;
 b=TzwQmYoGBJneEduxVkHeih8tyjwayvE8Paw1EAbvJPYfRWwf5wl7gJpHoffaWPAqzA
 gkxltgA/7vOHWv9svpEcEc3IG2HxGpkghaYBf2XIMzsinMqbBtujP+Jw2pjyCRGMKs06
 ZiLF3z/136SRi41HS5B8JsCPEaANBUpc/yqLFNv+8dNU7lSqEnUdID+8+NdFN1+Au+iQ
 ZPbnoxblSmR/SdnhZOU7IzD7+ZrjASKOXESjqeA+j6UYLymmX8rArmcX3yOGAJeNGJT9
 Fp0+pe5erEjpIwmBUZmB2TzoQw+geHtOf8EFHq7qDATHcIOYEmmHR/WG0FDtfzNC1TqU
 27lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8PDZgsN8e1S8iAJgIQWFmcr5fqcA+olCtue62G+IMw8=;
 b=cmqPZIvvtWALnAYi5JKaDrqB2JGhwuMlLUhuG54F7ARs1L0UjMGqGOb2j5sMDnc0ox
 TFhfUWZGDM8zEnTLLpNyv+AL+3arxrcbaDKQ1ghrO3fkeWj4AGgQ9M1UR0wHbt7+2EoU
 ffeLXK7Mmy/oUD9dqG/IRFw1JbT/TW6DOug0vmljgBqtcLHaWZ7ISu9Bj744TdTe4S/S
 7zwd100W7/CTERyuTYbRdmRyqh0maF5NpyaXjCx81gkmZbI9uEweuBaHrRt7SAxYrx1J
 l2qdd8hf9NNXiGe5UoHW0Q0RYMQZM7kAaWsMGJMRX+DGp+TxrOPsaWm0Giv2agmWFsfo
 LNJQ==
X-Gm-Message-State: AOAM533z80j2unsR1dBY0gcesoJQ3Mj0F3sarxcgcX1fgaY1OReDyqCT
 os5bCgt4LKSl2U6yn0k3GAc=
X-Google-Smtp-Source: ABdhPJy0FtRlrX1oY3an/KZ/D2LqStJoY/x45Ai7s8zxNVRWUuDeJ92oqKSWsgI+TI+TTfP1kTILOg==
X-Received: by 2002:a19:4c06:: with SMTP id z6mr13550389lfa.284.1608812053002; 
 Thu, 24 Dec 2020 04:14:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id k20sm3898808ljc.61.2020.12.24.04.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 04:14:12 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
 <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
 <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a1e3c706-9a8a-00b2-6ccb-08b95ee0b45b@gmail.com>
Date: Thu, 24 Dec 2020 15:14:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

MjQuMTIuMjAyMCAwOTo1MSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjMtMTItMjAs
IDIzOjM3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIzLjEyLjIwMjAgMDg6NTcsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gV2hhdCdzIHdyb25nIHdpdGggZ2V0dGluZyB0aGUgcmVn
dWxhdG9yIGluIHRoZSBkcml2ZXIgYXMgd2VsbCA/IEFwYXJ0IGZyb20gdGhlCj4+PiBPUFAgY29y
ZSA/Cj4+Cj4+IFRoZSB2b2x0YWdlIHN5bmNpbmcgc2hvdWxkIGJlIGRvbmUgZm9yIGVhY2ggY29u
c3VtZXIgcmVndWxhdG9yCj4+IGluZGl2aWR1YWxseSBbMV0uCj4+Cj4+IFNlY29uZGx5LCByZWd1
bGF0b3IgY29yZSBkb2Vzbid0IHdvcmsgd2VsbCB0b2RheSBpZiB0aGUgc2FtZSByZWd1bGF0b3IK
Pj4gaXMgcmVxdWVzdGVkIG1vcmUgdGhhbiBvbmUgdGltZSBmb3IgdGhlIHNhbWUgZGV2aWNlLgo+
IAo+IEhtbS4uLgo+IAo+Pj4+IHdpbGwgcmV0dXJuIHRoZSBPUFAgdGFibGUgcmVndWxhdG9yIGlu
IG9yZGVyIHRvIGFsbG93IGRyaXZlciB0byB1c2UgdGhlCj4+Pj4gcmVndWxhdG9yIGRpcmVjdGx5
LiBCdXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBhIG11Y2ggYmV0dGVyCj4+Pj4gb3B0
aW9uIHRoYW4gdGhlIG9wcF9zeW5jX3JlZ3VsYXRvcnMoKSBhbmQgb3BwX3NldF92b2x0YWdlKCkg
QVBJcy4KPj4+Cj4+PiBzZXRfdm9sdGFnZSgpIGlzIHN0aWxsIGZpbmUgYXMgdGhlcmUgaXMgc29t
ZSBkYXRhIHRoYXQgdGhlIE9QUCBjb3JlIGhhcywgYnV0Cj4+PiBzeW5jX3JlZ3VsYXRvcigpIGhh
cyBub3RoaW5nIHRvIGRvIHdpdGggT1BQIGNvcmUuCj4+Pgo+Pj4gQW5kIHRoaXMgbWF5IGxlYWQg
dG8gbW9yZSB3cmFwcGVyIGhlbHBlcnMgaW4gdGhlIE9QUCBjb3JlLCB3aGljaCBJIGFtIGFmcmFp
ZCBvZi4KPj4+IEFuZCBzbyBldmVuIGlmIGl0IGlzIG5vdCB0aGUgYmVzdCwgSSB3b3VsZCBsaWtl
IHRoZSBPUFAgY29yZSB0byBwcm92aWRlIHRoZSBkYXRhCj4+PiBhbmQgbm90IGdldCBpbnRvIHRo
aXMuIE9mY291cnNlIHRoZXJlIGlzIGFuIGV4Y2VwdGlvbiB0byB0aGlzLCBvcHBfc2V0X3JhdGUu
Cj4+Pgo+Pgo+PiBUaGUgcmVndWxhdG9yX3N5bmNfdm9sdGFnZSgpIHNob3VsZCBiZSBpbnZva2Vk
IG9ubHkgaWYgdm9sdGFnZSB3YXMKPj4gY2hhbmdlZCBwcmV2aW91c2x5IFsxXS4KPj4KPj4gVGhl
IE9QUCBjb3JlIGFscmVhZHkgaGFzIHRoZSBpbmZvIGFib3V0IHdoZXRoZXIgdm9sdGFnZSB3YXMg
Y2hhbmdlZCBhbmQKPj4gaXQgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBsb2NraW5nIGZvciBib3Ro
IHNldF92b2x0YWdlKCkgYW5kCj4+IHN5bmNfcmVndWxhdG9yKCkuIFBlcmhhcHMgSSdsbCBuZWVk
IHRvIGR1cGxpY2F0ZSB0aGF0IGZ1bmN0aW9uYWxpdHkgaW4KPj4gdGhlIFBEIGRyaXZlciwgaW5z
dGVhZCBvZiBtYWtpbmcgaXQgYWxsIGdlbmVyaWMgYW5kIHJlLXVzYWJsZSBieSBvdGhlcgo+PiBk
cml2ZXJzLgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
MTAuMi9zb3VyY2UvZHJpdmVycy9yZWd1bGF0b3IvY29yZS5jI0w0MTA3Cj4gCj4gTGV0cyBkbyBp
dCBpbiB0aGUgT1BQIGNvcmUgYW5kIHNlZSB3aGVyZSB3ZSBnby4KPiAKCkFscmlnaHQsIHRoYW5r
IHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
