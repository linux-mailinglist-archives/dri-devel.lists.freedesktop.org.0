Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041A2744B7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4226E897;
	Tue, 22 Sep 2020 14:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504A86E897
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:51:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s205so14367073lja.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bzR1gxnRoZXjib0y+EllAgb8353tQk04gCemc3kID8w=;
 b=Zy8iW9TQcugkIzEGW/pU5DvFHSWArgwWW5vg1vSaanKjEpSMvnoljwAIo9Pu44WJKy
 OIoRVAgmFjK8qGjrEHgenNyFUqGf1IQROkUhyLmm3Ba7ddEv7hz2PRAEyYSTDjzNt+xG
 tu5RLsuel0ENBLwXk8A2yFHVAavL0BH7T6JiXwgzxMFhkJMVYquQc18lQhmbwjH8Awcb
 rH0cnwkrxpxui9pgGiz9pGkG10OF1SSpzfMzB5zrz4MEfaetf4yi+GJv/dKacSGIf0GF
 9RK9n80GHWdYuBN6iooSVgsSHbrifpli/ZWXsBIvpUTxGWvDhxU86W5gnQtoK5Iyvg+K
 VEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bzR1gxnRoZXjib0y+EllAgb8353tQk04gCemc3kID8w=;
 b=l68NRqi163hOYukq+LKMc2j0aqkGrpO8qpgZZVuYDLLE+g+QGvhjDJbr228LxoCQPP
 L455TB09C4TEnZIwduhMhuoclZ1y/PLAkjKrbjtIKFlIDKP6DDAkWcxtvFMLOl7ulkPM
 /CqAyRLDjmxqs0RdvcrO4MNOKq52P0Wd+63sXLE7uje9VBX5kUkmK8wsZv6sgPBANPRX
 pcFczDBMHUnaqGTlSedhKN0AgYPg/ZrFShqT9cLq5uLI98MlyCSX9zAifHKF6u96WR7H
 MjwIOtEPezOmFt8dgHNt54WT+O/4tN+XW5uzLASQyskl54iBCBuGFaVPc6GKMxX65Sjf
 O3Mw==
X-Gm-Message-State: AOAM533nGNwkCo5u3dQqQ02H5aYf8lm4jq40L3mfA3oVjeunBoxR1dMe
 hU4CaNv8M1eobhuLfa80wuLgcsaowhaZNMpOpWoFtw==
X-Google-Smtp-Source: ABdhPJzKH8OQ0ibiB5TcLvCcwuehtiNBqqIIuvG+ZJlWITOsxvhm5s/+BLFL6uh/wql70FfMyu1bYxOEWOl2C3HREcI=
X-Received: by 2002:a05:651c:552:: with SMTP id
 q18mr1591731ljp.248.1600786315624; 
 Tue, 22 Sep 2020 07:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
 <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
In-Reply-To: <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 22 Sep 2020 20:21:42 +0530
Message-ID: <CAO_48GHVUnHm38nPSc3zYU7ZoFmZDTZdc7Du5pyrVbz6ytwgEA@mail.gmail.com>
Subject: Re: [PATCH -next] dma-buf: heaps: Remove unused variable ret
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Zou Wei <zou_wei@huawei.com>, Laura Abbott <labbott@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gWm91LAoKT24gVHVlLCAyMiBTZXAgMjAyMCBhdCAxODoxMiwgQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDIyLjA5LjIwIHVtIDA5
OjUzIHNjaHJpZWIgWm91IFdlaToKPiA+IFRoaXMgcGF0Y2ggZml4ZXMgYmVsb3cgd2FybmluZ3Mg
cmVwb3J0ZWQgYnkgY29jY2ljaGVjawo+ID4KPiA+IC4vZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hl
YXAtaGVscGVycy5jOjIwMjo1LTg6IFVubmVlZGVkIHZhcmlhYmxlOiAicmV0Ii4gUmV0dXJuICIw
IiBvbiBsaW5lIDIxNQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVh
d2VpLmNvbT4KPgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4KPiBHb2luZyB0byBwaWNrIHRoaXMgdXAgZm9yIGRybS1taXNjLW5leHQuClRo
YW5rcyBDaHJpc3RpYW4hCkZ3aXcsIGZlZWwgZnJlZSB0byBhZGQgbXkKQWNrZWQtYnk6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4KPiA+IC0tLQo+ID4gICBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgfCAzICstLQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9oZWFwLWhlbHBlcnMuYwo+ID4gaW5kZXggZDA2OTZjZi4uNzk2OTUxMCAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYwo+ID4gKysrIGIvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jCj4gPiBAQCAtMTk5LDcgKzE5OSw2IEBAIHN0
YXRpYyBpbnQgZG1hX2hlYXBfZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBoZWFwX2hlbHBlcl9idWZmZXIgKmJ1
ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKPiA+ICAgICAgIHN0cnVjdCBkbWFfaGVhcHNfYXR0YWNobWVu
dCAqYTsKPiA+IC0gICAgIGludCByZXQgPSAwOwo+ID4KPiA+ICAgICAgIG11dGV4X2xvY2soJmJ1
ZmZlci0+bG9jayk7Cj4gPgo+ID4gQEAgLTIxMiw3ICsyMTEsNyBAQCBzdGF0aWMgaW50IGRtYV9o
ZWFwX2RtYV9idWZfYmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+ID4g
ICAgICAgfQo+ID4gICAgICAgbXV0ZXhfdW5sb2NrKCZidWZmZXItPmxvY2spOwo+ID4KPiA+IC0g
ICAgIHJldHVybiByZXQ7Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICAgfQo+ID4KPiA+ICAgc3Rh
dGljIGludCBkbWFfaGVhcF9kbWFfYnVmX2VuZF9jcHVfYWNjZXNzKHN0cnVjdCBkbWFfYnVmICpk
bWFidWYsCj4KCkJlc3QsClN1bWl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
