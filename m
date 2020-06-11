Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4219A1F8287
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151A46E3A0;
	Sat, 13 Jun 2020 10:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4026E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 11:27:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z9so6438402ljh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6mOcf9ZGxPDgSVNgmAnnXwaYZSHaObyKh3HOSAxgHnE=;
 b=OSMwMV0xxxnYiWt/GmJIR6BTDA/fFzxhD9xcJ7S6k5gjCKaRkcHqny1h2aQXPlaSZN
 7S3QSS0WaYO1zNIvj9lCG4zO9UhmOtTdBY8vycTUOKcAvIcr5GExw1MusXua7m1rLG5y
 XYDePxsuM86TC2ZR/wZ811Sz9hy2wS7HD5lkGIujIXcJMjE8QT3KEheis9MFmmDNx6aL
 xxtfVKPZsr5ggc6+PBCBhJldMxA87BJp24u3C3DOnsV+Zg1f8PHXSV5dWJVmPzTB1em6
 wd0xylgdwvJvsAt6zztbAQRRG9SO/pIK7AOjSV1gMPsb8K7NtmfQqaGBPRdDNR6edkV3
 aM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6mOcf9ZGxPDgSVNgmAnnXwaYZSHaObyKh3HOSAxgHnE=;
 b=LDNDL+ZYC5Hph+17d+ejjKvg4EbLnorHpZizFf6BOV6F1bvLtOi1jq8BuMzHSfFPKj
 7/inwEFPbDGa4WUCWYKV9Cvrn+LYpW3btY5HzjCusnJrHW2ZrTWdlN4VttQGJgalVGWE
 bjf7lTh53atTZXhViP9FSjK2PoTrJ6w/lyLiAFQKmC4hgJrqC1cLhRbC4nlEQKiKqUXm
 s97f0sYjCxkW3CM9xwB0uDTe43ZzWfLcikFawmLlY+Lk7oFTHUGVVUqonL6oayPbCxVb
 2nIjuT5Xc2JANYPY8RHsAEHQd1Ki6nSaOTsvH3EbENSX/dAEF7bHeSGM4Hq9r68rG4mt
 PqBw==
X-Gm-Message-State: AOAM530tkb+i0Qh8KXOSKVHehkvBOL4DdnYNxCaGzkx5V9js28FIoRBJ
 2pj6jUKTyh1UELh4pW1Z9rc=
X-Google-Smtp-Source: ABdhPJxae9xtcIrlbVyBA7jQxQTe90UwgE4VJSSx0Fcf/X94sIB27L8KEIYpC44xzgP5sWlebhg+nA==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr4127615ljj.106.1591874867184; 
 Thu, 11 Jun 2020 04:27:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id c20sm729143lfb.33.2020.06.11.04.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 04:27:46 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To: Daniel Stone <daniel@fooishbar.org>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
 <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
 <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e4dfca3-3f0f-0094-47eb-f267243ae7d1@gmail.com>
Date: Thu, 11 Jun 2020 14:27:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDYuMjAyMCAxMToxNywgRGFuaWVsIFN0b25lINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIFRodSwgMTEgSnVuIDIwMjAgYXQgMDg6NTQsIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IDEwLjA2LjIwMjAgMTQ6MzAsIFRoaWVycnkgUmVkaW5nINC/
0LjRiNC10YI6Cj4+PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
Pj4gQXMgb2YgY29tbWl0IDRkYzU1NTI1YjA5NSAoImRybTogcGxhbmU6IFZlcmlmeSB0aGF0IG5v
IG9yIGFsbCBwbGFuZXMKPj4+IGhhdmUgYSB6cG9zIHByb3BlcnR5IikgYSB3YXJuaW5nIGlzIGVt
aXR0ZWQgaWYgdGhlcmUncyBhIG1peCBvZiBwbGFuZXMKPj4+IHdpdGggYW5kIHdpdGhvdXQgYSB6
cG9zIHByb3BlcnR5Lgo+Pgo+PiBXaGF0IHByb2JsZW0gZG9lcyBpdCBzb2x2ZT8KPiAKPiBXZWxs
LCBpdCBmaXhlcyB0aGUgV0FSTl9PTiwgd2hpY2ggYXNzZXJ0cyB0aGF0IGVpdGhlciBubyBwbGFu
ZXMgaGF2ZQo+IHRoZSB6cG9zIHByb3BlcnR5IGF0dGFjaGVkLCBvciBhbGwgcGxhbmVzIGhhdmUg
dGhlIHpwb3MgcHJvcGVydHkKPiBhdHRhY2hlZC4gV2hlbiBvbmx5IF9zb21lXyBwbGFuZXMgaGF2
ZSB0aGUgcHJvcGVydHksIHRoZSBwcm9wZXJ0eSBpcwo+IHByZXR0eSBtdWNoIHVzZWxlc3M6IHpw
b3MgZXhpc3RzIHRvIGd1YXJhbnRlZSB0byB1c2Vyc3BhY2UgdGhlCj4gcmVsYXRpdmUgb3JkZXJp
bmcgYmV0d2VlbiBwbGFuZXMsIGRlZmluZWQgYnkgdGhlIHZhbHVlIG9mIHRoZQo+IHByb3BlcnR5
LiBJZiBub3QgYWxsIHBsYW5lcyBoYXZlIHRoZSBwcm9wZXJ0eSwgdGhlbiB1c2Vyc3BhY2UgY2Fu
bm90Cj4gcmVhc29uIGFib3V0IHRoZSBvcmRlcmluZywgc2luY2Ugc29tZSBvZiB0aGUgcGxhbmVz
IGhhdmUgdW5kZWZpbmVkCj4gb3JkZXJpbmcuCgpIZWxsbyBEYW5pZWwsCgpTbyBpdCdzIGEga2Vy
bmVsIHdhcm5pbmcsIHRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24hIEknbSBydW5uaW5n
Cm9ubHkgb2xkZXIgVGVncmFzIHRoYXQgaGF2ZSBhIGJsYWNrLW4td2hpdGUgY3Vyc29yIHBsYW5l
LCBidXQgdGhpcyBpcwpub3Qgc3VwcG9ydGVkIGJ5IHRoZSB1cHN0cmVhbSBrZXJuZWwuIE5vIHdv
bmRlciB0aGF0IEkgaGF2ZW4ndCBzZWVuIHRoZQp3YXJuaW5nLCB0aGlzIG1hZGUgbWUgY3VyaW91
cyB3aGF0IHRoaXMgcGF0Y2ggaXMgYWJvdXQgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
