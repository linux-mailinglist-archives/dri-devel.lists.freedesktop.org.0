Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90F2B3B01
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EBA89DEA;
	Mon, 16 Nov 2020 01:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752676E9A1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 17:42:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p12so17179741ljc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UVKCC93ChOuvLBPVNXzdjCLR1DncgSU1O2sv9PBzZK8=;
 b=q5EDuXURuPPC97beX3V4mv9fx74JwrX62zLJm1rDt1a+sWwxwm9Za//CQ5VL/nXjrQ
 F1ugiUrc/esQCDFKC5U2KoA6ZaEe/owvrZwUH7mf25fOxJ2YvnXFXC1xFThoEgEyFphu
 XPScDLPEiwTnKdO/9XxjUQTXzeoA/xM8oI2+jnfOSM0/xoRUQ9JdWDtomEJfnZ6EHfMA
 nJddJ9WZtVDRL7mWu19HOoCmf0b4YWsTPYtlkNcdwGUfu85PN4CMjKIsX3ct6YQa3Z4O
 bugIeCkPH9olbamWMqIQz1oLScq7TVl2OsKUr9I7A+ybQ7i4uc28VOzdHeIfKis3Tm4G
 nYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UVKCC93ChOuvLBPVNXzdjCLR1DncgSU1O2sv9PBzZK8=;
 b=lZdEUDHOHLMznald2EQ+I59p49x2kaPtW9dooZ+0S9txNkPtU/DcQAgjo2dbs4FuR/
 Aoueg2cTvhlxipxXZ/giCNeewlCC2oy2nLnG8VC4adJp9WCvvT+f37UzIRX2wBqPi3tf
 U731KDGgpCdHbXgSsxsQzNONmgaWdn9lpzj2XNkcH5pqgzJPzUK6xj+0hg/6SkIy7+pV
 +Bvj0YvuvX1JpYN6TJ9Lj+JF+AoGGxkkN2uxC6JTEBGrPUv90XpOvXq2MW073pcBpjDH
 8K4M8DF5jQ7unxUzDloHmWNxmJsE7olsZGyS1gp7o00LLyHg5/Whs23h0KUQgME5BS+l
 Wzxg==
X-Gm-Message-State: AOAM53307pJ06IvBf+xM7u/T+KOE1FL3r+1dY9BZpYW9eXRP/VJY4+Tv
 CzhO6uuVj+8T8yGvuclJDNGE93rRM5Y=
X-Google-Smtp-Source: ABdhPJyuQnfbXszJA+lutL0HEjR/H3Jr59VD1SbTiWXoWfrL+aJ7fZRGwBGxq4z49RBxglbs8TZqWw==
X-Received: by 2002:a2e:8553:: with SMTP id u19mr4934146ljj.85.1605462131879; 
 Sun, 15 Nov 2020 09:42:11 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id q4sm2442852ljh.38.2020.11.15.09.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 09:42:11 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
 <20201112200123.GF4742@sirena.org.uk>
 <ce9e2d9f-917e-fb8a-7323-f3bf1a367e9d@gmail.com>
 <20201113142937.GB4828@sirena.org.uk>
 <7f066805-97d9-088f-e89d-a554fe478574@gmail.com>
 <20201113161550.GC4828@sirena.org.uk>
 <3beaa12b-4a50-a3b6-fc43-ebb5ce7a8db7@gmail.com>
 <20201113172859.GF4828@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <74cfc6a9-3f59-d679-14b7-51102a6f11b3@gmail.com>
Date: Sun, 15 Nov 2020 20:42:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113172859.GF4828@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTEuMjAyMCAyMDoyOCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIEZyaSwgTm92IDEz
LCAyMDIwIGF0IDA4OjEzOjQ5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTMu
MTEuMjAyMCAxOToxNSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4gTXkgcG9pbnQgaGVy
ZSBpcyB0aGF0IHRoZSBkcml2ZXIgc2hvdWxkbid0IGJlIGNoZWNraW5nIGZvciBhIGR1bW15Cj4+
PiByZWd1bGF0b3IsIHRoZSBkcml2ZXIgc2hvdWxkIGJlIGNoZWNraW5nIHRoZSBmZWF0dXJlcyB0
aGF0IGFyZSBwcm92aWRlZAo+Pj4gdG8gaXQgYnkgdGhlIHJlZ3VsYXRvciBhbmQgaGFuZGxpbmcg
dGhvc2UuCj4gCj4+IEkgdW5kZXJzdGFuZCB5b3VycyBwb2ludCwgYnV0IHRoZW4gd2UgbmVlZCBk
dW1teSByZWd1bGF0b3IgdG8gcHJvdmlkZQo+PiBhbGwgdGhlIGZlYXR1cmVzLCBhbmQgY3VycmVu
dGx5IGl0IGRvZXMgdGhlIG9wcG9zaXRlLgo+IAo+IEFzIGNvdWxkIGFueSBvdGhlciByZWd1bGF0
b3I/CgpZZXMKCj4+PiBJdCBkb2Vzbid0IG1hdHRlciBpZiB0aGlzIGlzCj4+PiBhIGR1bW15IHJl
Z3VsYXRvciBvciBhbiBhY3R1YWwgcmVndWxhdG9yIHdpdGggbGltaXRlZCBmZWF0dXJlcywgdGhl
Cj4+PiBlZmZlY3QgaXMgdGhlIHNhbWUgYW5kIHRoZSBoYW5kbGluZyBzaG91bGQgYmUgdGhlIHNh
bWUuICBJZiB0aGUgZHJpdmVyCj4+PiBpcyBkb2luZyBhbnl0aGluZyB0byBoYW5kbGUgZHVtbXkg
cmVndWxhdG9ycyBleHBsaWNpdGx5IGFzIGR1bW15Cj4+PiByZWd1bGF0b3JzIGl0IGlzIGRvaW5n
IGl0IHdyb25nLgo+IAo+PiBJdCBtYXR0ZXJzIGJlY2F1c2UgZHVtbXkgcmVndWxhdG9yIGVycm9y
cyBvdXQgYWxsIGNoZWNrcyBhbmQgY2hhbmdlcwo+PiBvdGhlciB0aGFuIGVuYWJsZS9kaXNhYmxl
LCBpbnN0ZWFkIG9mIGFjY2VwdGluZyB0aGVtLiBJZiB3ZSBjb3VsZCBhZGQgYW4KPj4gb3B0aW9u
IGZvciBkdW1teSByZWd1bGF0b3IgdG8gc3VjY2VlZCBhbGwgdGhlIGNoZWNrcyBhbmQgYWNjZXB0
IGFsbCB0aGUKPj4gdmFsdWVzLCB0aGVuIGl0IGNvdWxkIGJlY29tZSBtb3JlIHVzYWJsZS4KPiAK
PiBJJ20gYSBiaXQgY29uZnVzZWQgaGVyZSBUQkggLSBJJ20gbm90IHN1cmUgSSBzZWUgYSBzdWJz
dGFudGlhbAo+IGRpZmZlcmVuY2UgYmV0d2VlbiBhIGNvbnN1bWVyIGRldGVjdGluZyB0aGF0IGl0
IGNhbid0IHNldCBhbnkgdm9sdGFnZXMKPiBhdCBhbGwgYW5kIHRoZSBoYW5kbGluZyBmb3IgYW4g
b3B0aW9uYWwgcmVndWxhdG9yLiAgRWl0aGVyIHdheSBpZiBpdCdzCj4gZ29pbmcgdG8gY2Fycnkg
b24gYW5kIGFzc3VtZSB0aGF0IHdoYXRldmVyIHZvbHRhZ2UgaXMgdGhlcmUgd29ya3MgZm9yCj4g
ZXZlcnl0aGluZyBpdCBib2lscyBkb3duIHRvIHNldHRpbmcgYSBmbGFnIHNheWluZyB0byBza2lw
IHRoZSBzZXQKPiB2b2x0YWdlIG9wZXJhdGlvbi4gIEkgdGhpbmsgeW91IGFyZSB0b28gZm9jdXNl
ZCBvbiB0aGUgc3BlY2lmaWMKPiBpbXBsZW1lbnRhdGlvbiB5b3UgY3VycmVudGx5IGhhdmUgaGVy
ZS4KPiAKPiBXZSBvYnZpb3VzbHkgY2FuJ3QganVzdCBhY2NlcHQgdm9sdGFnZSBjaGFuZ2Ugb3Bl
cmF0aW9ucyB3aGVuIHdlJ3ZlIG5vCj4gaWRlYSB3aGF0IHRoZSBjdXJyZW50IHZvbHRhZ2Ugb2Yg
dGhlIGRldmljZSBpcy4KPiAKPj4+IFRvIHJlcGVhdCB5b3Ugc2hvdWxkICpvbmx5KiBiZSB1c2lu
ZyByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgaW4gdGhlCj4+PiBjYXNlIHdoZXJlIHRoZSBzdXBw
bHkgbWF5IGJlIHBoeXNpY2FsbHkgYWJzZW50IHdoaWNoIGlzIG5vdCB0aGUgY2FzZQo+Pj4gaGVy
ZS4KPj4KPj4gQWxyaWdodCwgYnV0IHRoZW4gd2UgZWl0aGVyIG5lZWQgdG8gaW1wcm92ZSByZWd1
bGF0b3IgY29yZSB0byBtYWtlIGR1bW15Cj4+IHJlZ3VsYXRvciBhIGJpdCBtb3JlIHVzYWJsZSwg
b3IgY29udGludWUgdG8gd29yayBhcm91bmQgaXQgaW4gZHJpdmVycy4KPj4gV2hhdCBzaG91bGQg
d2UgZG8/Cj4gCj4gQXMgSSBrZWVwIHNheWluZyB0aGUgY29uc3VtZXIgZHJpdmVyIHNob3VsZCBi
ZSBlbnVtZXJhdGluZyB0aGUgdm9sdGFnZXMKPiBpdCBjYW4gc2V0LCBpZiBpdCBjYW4ndCBmaW5k
IGFueSBhbmQgd2FudHMgdG8gY29udGludWUgdGhlbiBpdCBjYW4ganVzdAo+IHNraXAgc2V0dGlu
ZyB2b2x0YWdlcyBsYXRlciBvbi4gIElmIG9ubHkgc29tZSBhcmUgdW5hdmFpbGFibGUgdGhlbiBp
dAo+IHByb2JhYmx5IHdhbnRzIHRvIGVsaW1pbmF0ZSB0aG9zZSBzcGVjaWZpYyBPUFBzIGluc3Rl
YWQuCgpJJ20gc2VlaW5nIGEgZHVtbXkgcmVndWxhdG9yIGFzIGEgaGVscGVyIGZvciBjb25zdW1l
ciBkcml2ZXJzIHdoaWNoCnJlbW92ZXMgYnVyZGVuIG9mIGhhbmRsaW5nIGFuIGFic2VudCAob3B0
aW9uYWwpIHJlZ3VsYXRvci4gSXMgdGhpcyBhCmNvcnJlY3QgdW5kZXJzdGFuZGluZyBvZiBhIGR1
bW15IHJlZ3VsYXRvcj8KCk9sZGVyIERUQnMgZG9uJ3QgaGF2ZSBhIHJlZ3VsYXRvciBhbmQgd2Ug
d2FudCB0byBrZWVwIHRoZW0gd29ya2luZy4gVGhpcwppcyBlcXVhbCB0byBhIHBoeXNpY2FsbHkg
YWJzZW50IHJlZ3VsYXRvciBhbmQgaW4gdGhpcyBjYXNlIGl0J3MgYW4Kb3B0aW9uYWwgcmVndWxh
dG9yLCBJTU8uCgpDb25zdW1lciBkcml2ZXJzIGRlZmluaXRlbHkgc2hvdWxkIGNoZWNrIHZvbHRh
Z2VzLCBidXQgdGhpcyBzaG91bGQgYmUKZG9uZSBvbmx5IGZvciBhIHBoeXNpY2FsIHJlZ3VsYXRv
ci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
