Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5E1A6BA6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 19:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B46E0F1;
	Mon, 13 Apr 2020 17:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02C26E0E1;
 Mon, 13 Apr 2020 17:49:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o81so4494945wmo.2;
 Mon, 13 Apr 2020 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WT8RpNA0P+GqDuq/DyS+L+6ZT/1lo/cn+dTgGXIpD78=;
 b=DI6aEomb/BXc6SfxFnQlVQo+tmkqg4/JH7mWJ02QKEPDvVT8si2J4K4iWaa8HrbiVG
 AZ5zKrauwCZn+UxinpmGQAfBZ9SOrGjeQyyE3Qy6S6KvRkfk40OAGaPAN6AjBnxuPYia
 cT2/yVvotVuHyE75pEhV0UCtwv8K2DyCW53di/ECstDUURwguj3SUe3ny68EFDU83u/O
 ol6cA3MklZSvAn4pVYrmi+udUBX2kiHcZjjdyQgXcUxm93UvQTdxo7YqGfRelanItcFy
 AqeroG+vhFOGIQ5xC6O6wCRrCuoNr755h7qlzOSVcivex3rCGETVc0Gwmf05JjsPAszS
 Xlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WT8RpNA0P+GqDuq/DyS+L+6ZT/1lo/cn+dTgGXIpD78=;
 b=lcgq49fJ7PcoC8BFY7r+MOBvvUEfjmpEfme1312x8AggEZWZZcDSS3rYgrShq3oVV8
 u8g33qEfeg5634AGqf91UwSNufNFX7nf8TmMUrEpIe3MZjY48cXr1ILRHB8WYlSvvLCU
 KgfOt1mtDo1RwJO3T3uaGcrxX5FOoi1pTUhsYCHjziy6JtnUzwKNewpIJxdPg2uLQbai
 tvuCZiCk6fhBHNs24dzt3QcKFmOph41sHIoKhXweLYLjdcmBvV8bNLwbxVQ7VI06CRd0
 KRW+yjwdwGv4yBdOCUE8H6dc7V2joW/4DkovOm/rt5WFsCPA4javACjanowJRVuoksAn
 ao/w==
X-Gm-Message-State: AGi0PuY4NJnNn5JgQw+LB8K5EWmnqLT/q7OkGeBb48cLejIgpdhoeUKv
 lwBzsS2RX9D4mQyAids67DsNAS1UZniExaVvSuA=
X-Google-Smtp-Source: APiQypKijTsqeDp9flz+rvwjuFRJgzih5dOlUl923r/R/fXsWD/UuRvPQiIx6fhd+c8ClPZAGmtIGgB3/u4XfRPLJdc=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr19974588wmb.56.1586800149445; 
 Mon, 13 Apr 2020 10:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <f4eaf0ca-6cd6-c224-9205-bf64ca533ff5@molgen.mpg.de>
 <dcc4851e-0ab5-683a-2cf2-687d64a3c9da@molgen.mpg.de>
In-Reply-To: <dcc4851e-0ab5-683a-2cf2-687d64a3c9da@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 13:48:58 -0400
Message-ID: <CADnq5_OXdpEebFY3+kyQb-WEw0Rb6cqoOFKGqgxaigU5hean1g@mail.gmail.com>
Subject: Re: [regression 5.7-rc1] System does not power off, just halts
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, X86 ML <x86@kernel.org>,
 Huang Rui <ray.huang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Prike Liang <Prike.Liang@amd.com>, regressions@leemhuis.info,
 "for 3.8" <stable@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mengbing Wang <Mengbing.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgMTo0NyBQTSBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xn
ZW4ubXBnLmRlPiB3cm90ZToKPgo+IERlYXIgUHJpa2UsIGRlYXIgQWxleCwgZGVhciBMaW51eCBm
b2xrcywKPgo+Cj4gQW0gMTMuMDQuMjAgdW0gMTA6NDQgc2NocmllYiBQYXVsIE1lbnplbDoKPgo+
ID4gQSByZWdyZXNzaW9uIGJldHdlZW4gY2F1c2VzIGEgc3lzdGVtIHdpdGggdGhlIEFNRCBib2Fy
ZCBNU0kgQjM1ME0gTU9SVEFSCj4gPiAoTVMtN0EzNykgd2l0aCBhbiBBTUQgUnl6ZW4gMyAyMjAw
RyBub3QgdG8gcG93ZXIgb2ZmIGFueSBtb3JlIGJ1dCBqdXN0Cj4gPiB0byBoYWx0Lgo+ID4KPiA+
IFRoZSByZWdyZXNzaW9uIGlzIGludHJvZHVjZWQgaW4gOWViZTU0MjJhZDZjLi5iMDMyMjI3YzYy
OTMuIEkgYW0gaW4gdGhlCj4gPiBwcm9jZXNzIHRvIGJpc2VjdCB0aGlzLCBidXQgbWF5YmUgc29t
ZWJvZHkgYWxyZWFkeSBoYXMgYW4gaWRlYS4KPgo+IEkgZm91bmQgdGhlIEVhc3RlciBlZ2c6Cj4K
PiA+IGNvbW1pdCA0ODdlY2ExMWEzMjFlZjMzYmNmNGNhNWFkYjNjMGM0OTU0ZGIxYjU4Cj4gPiBB
dXRob3I6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgo+ID4gRGF0ZTogICBUdWUg
QXByIDcgMjA6MjE6MjYgMjAyMCArMDgwMAo+ID4KPiA+ICAgICBkcm0vYW1kZ3B1OiBmaXggZ2Z4
IGhhbmcgZHVyaW5nIHN1c3BlbmQgd2l0aCB2aWRlbyBwbGF5YmFjayAodjIpCj4gPgo+ID4gICAg
IFRoZSBzeXN0ZW0gd2lsbCBiZSBoYW5nIHVwIGR1cmluZyBTMyBzdXNwZW5kIGJlY2F1c2Ugb2Yg
U01VIGlzIHBlbmRpbmcKPiA+ICAgICBmb3IgR0Mgbm90IHJlc3Bvc2UgdGhlIHJlZ2lzdGVyIENQ
X0hRRF9BQ1RJVkUgYWNjZXNzIHJlcXVlc3QuVGhpcyBpc3N1ZQo+ID4gICAgIHJvb3QgY2F1c2Ug
b2YgYWNjZXNzaW5nIHRoZSBHQyByZWdpc3RlciB1bmRlciBlbnRlciBHRlggQ0dHUEcgYW5kIGNh
bgo+ID4gICAgIGJlIGZpeGVkIGJ5IGRpc2FibGUgR0ZYIENHUEcgYmVmb3JlIHBlcmZvcm0gc3Vz
cGVuZC4KPiA+Cj4gPiAgICAgdjI6IFVzZSBkaXNhYmxlIHRoZSBHRlggQ0dQRyBpbnN0ZWFkIG9m
IFJMQyBzYWZlIG1vZGUgZ3VhcmQuCj4gPgo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgo+ID4gICAgIFRlc3RlZC1ieTogTWVuZ2JpbmcgV2Fu
ZyA8TWVuZ2JpbmcuV2FuZ0BhbWQuY29tPgo+ID4gICAgIFJldmlld2VkLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+ICAgICBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+Cj4gSXQgcmV2ZXJ0cyBjbGVhbmx5IG9uIHRvcCBvZiA1LjctcmMxLCBhbmQgdGhpcyBm
aXhlcyB0aGUgaXNzdWUuCj4KPiBHcmVnLCBwbGVhc2UgZG8gbm90IGFwcGx5IHRoaXMgdG8gdGhl
IHN0YWJsZSBzZXJpZXMuIFRoZSBjb21taXQgbWVzc2FnZQo+IGRvZXNu4oCZdCBldmVuIHJlZmVy
ZW5jZSBhIGlzc3VlL2J1ZyByZXBvcnQsIGFuZCBkb2VzbuKAmXQgZ2l2ZSBhIGRldGFpbGVkCj4g
cHJvYmxlbSBkZXNjcmlwdGlvbi4gV2hhdCBzeXN0ZW0gaXMgaXQ/Cj4KPiBEYXZlLCBBbGV4LCBo
b3cgdG8gcHJvY2VlZD8gUmV2ZXJ0PyBJIGNyZWF0ZWQgaXNzdWUgMTA5NCBbMV0uCgpBbHJlYWR5
IGZpeGVkOgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzYxMTk1LwoK
QWxleAoKPgo+Cj4gS2luZCByZWdhcmRzLAo+Cj4gUGF1bAo+Cj4KPiBbMV06IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzEwOTQKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
