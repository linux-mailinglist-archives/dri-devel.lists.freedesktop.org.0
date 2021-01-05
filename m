Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285A2EB1A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93C96E072;
	Tue,  5 Jan 2021 17:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BCF6E072;
 Tue,  5 Jan 2021 17:43:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d26so36933615wrb.12;
 Tue, 05 Jan 2021 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wjwOLmhj+xEBMawy/YbEyEBud/PyuENSGJe8w9Q/w8w=;
 b=lQw20GP51nkGoF3WYCzdqokac6V7w/h4HybpWDY0ihMaxHjh2oKVp6E5pjAJ/LxT1/
 RqcYNDOLs1O16Ukrl2VYU0b4oO/50tJKXjUAxD5nx7vYgf4aiY5jUwwMNcRlHJ7eD1Iu
 gStWl5uu8RdLCUvopyhcO9i7M/bgRyG8efZ4CHDsqq911o0su/NE3xylJlwHiBJtb2uG
 5E53W5HNrdIqJlDr8gQNAFXct1HftkOu0THkyGupCJCCNspeW6Ny4aH+0GoyJCSMIJ9I
 D4JcjKuSNP9dYoUy8NsDRm+ylkNREymChNGpvFV2fC/+h8xo8H8MvDeBeefcVQM8p/MO
 bKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wjwOLmhj+xEBMawy/YbEyEBud/PyuENSGJe8w9Q/w8w=;
 b=R2kR9cFp6wGpUZhqcCHOV8xa5lpH7yMewEF862RHoiLMrLsx94j1WasxS3FaRviee5
 GdnlzefXlaZum4/G3PCTTpDbed4b7UhwbU1MAO+Wkdu5o4LesoYPRrCYWcAsbGyyCDU/
 wCrKiufwClk4npKG416B+K0ZQ3bAK8oWKDhKu9yDp6PEYMItKEDNqln/FGnDnY5L9NnB
 qT0QCZRPDAQMuh86PMaUGw8X9btNNlPSiUAuCM5Ed7Kh3giUiEAm6ueUXTSOdtvbvHPL
 W0+S14XoZJ+Nx87nYfjFlxbF7vRU1HJ6uqEr9RNoLY1jwixhtZ7WrDuzv9hBVsnOtXgy
 X6Hg==
X-Gm-Message-State: AOAM531EblyOv7SARiu6IpJ61/smWFSljkl5rZCvSZFth652IsT8peOk
 8mjyDGQ4x9Sd4mr5xcCVu/R0dwqCt5g=
X-Google-Smtp-Source: ABdhPJwJ/MUQKlLbFaTFkNVz7ByMjvFjYaUERQj1mY1aHWCgsYLf2CNkqFbyB/dI4yG4e5FpuWDxAw==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr679320wrm.1.1609868635827;
 Tue, 05 Jan 2021 09:43:55 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f9sm632899wrw.81.2021.01.05.09.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 09:43:55 -0800 (PST)
Subject: Re: [PATCH 4/4] PCI: add a REBAR size quirk for Sapphire RX 5600 XT
 Pulse.
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <20210105134404.1545-1-christian.koenig@amd.com>
 <20210105134404.1545-5-christian.koenig@amd.com>
 <CAKb7UvhUXKTVp9bXmbkU4VR8WQVZ16LNvk8QKkqiOUTKC8DVQg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <21a04206-c198-f358-d7ca-b0f04f5b7a2f@gmail.com>
Date: Tue, 5 Jan 2021 18:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvhUXKTVp9bXmbkU4VR8WQVZ16LNvk8QKkqiOUTKC8DVQg@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Bjorn Helgaas <bhelgaas@google.com>, devspam@moreofthesa.me.uk,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDEuMjEgdW0gMTc6MTEgc2NocmllYiBJbGlhIE1pcmtpbjoKPiBPbiBUdWUsIEphbiA1
LCAyMDIxIGF0IDg6NDQgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE90aGVyd2lzZSB0aGUgQ1BVIGNhbid0IGZ1bGx5IGFj
Y2VzcyB0aGUgQkFSLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvcGNpL3BjaS5jIHwgOSAr
KysrKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNpL3Bj
aS5jCj4+IGluZGV4IDE2MjE2MTg2YjUxYy4uYjY2ZTQ3MDNjMjE0IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3BjaS9wY2kuYwo+PiArKysgYi9kcml2ZXJzL3BjaS9wY2kuYwo+PiBAQCAtMzU3Nyw3
ICszNTc3LDE0IEBAIHUzMiBwY2lfcmViYXJfZ2V0X3Bvc3NpYmxlX3NpemVzKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCBpbnQgYmFyKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pgo+PiAg
ICAgICAgICBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgcG9zICsgUENJX1JFQkFSX0NBUCwg
JmNhcCk7Cj4+IC0gICAgICAgcmV0dXJuIChjYXAgJiBQQ0lfUkVCQVJfQ0FQX1NJWkVTKSA+PiA0
Owo+PiArICAgICAgIGNhcCA9IChjYXAgJiBQQ0lfUkVCQVJfQ0FQX1NJWkVTKSA+PiA0Owo+PiAr
Cj4+ICsgICAgICAgLyogU2FwcGhpcmUgUlggNTYwMCBYVCBQdWxzZSBoYXMgYW4gaW52YWxpZCBj
YXAgZHdvcmQgZm9yIEJBUiAwICovCj4+ICsgICAgICAgaWYgKHBkZXYtPnZlbmRvciA9PSBQQ0lf
VkVORE9SX0lEX0FUSSAmJiBwZGV2LT5kZXZpY2UgPT0gMHg3MzFmICYmCj4+ICsgICAgICAgICAg
IGJhciA9PSAwICYmIGNhcCA9PSAweDcwMCkKPj4gKyAgICAgICAgICAgICAgIGNhcCA9PSAweDdm
MDA7Cj4gUGVyaGFwcyB5b3UgbWVhbnQgY2FwID0gMHg3ZjAwPwoKVXBzLCBpbmRlZWQhIFRoYW5r
cyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuCgpDaHJpc3RpYW4uCgo+Cj4+ICsKPj4gKyAgICAgICBy
ZXR1cm4gY2FwOwo+PiAgIH0KPj4gICBFWFBPUlRfU1lNQk9MKHBjaV9yZWJhcl9nZXRfcG9zc2li
bGVfc2l6ZXMpOwo+Pgo+PiAtLQo+PiAyLjI1LjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
