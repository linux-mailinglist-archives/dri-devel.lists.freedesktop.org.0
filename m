Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E133C314CBA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6B86EAB8;
	Tue,  9 Feb 2021 10:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41DDD6EAB8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 63C242A6045;
 Tue,  9 Feb 2021 11:17:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id htsldlxXTApi; Tue,  9 Feb 2021 11:17:18 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 051832A6042;
 Tue,  9 Feb 2021 11:17:18 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1l9Q57-001xau-Be; Tue, 09 Feb 2021 11:17:17 +0100
Subject: Re: Fw: [Bug 211587] New: X: page allocation failure: order:8,
 mode:0x190dc2(GFP_HIGHUSER|__GFP_NORETRY|__GFP_ZERO|__GFP_NOMEMALLOC),
 nodemask=(null),cpuset=/,mems_allowed=0
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210208140832.2be5ad2f5aacced3dda1d18a@linux-foundation.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <31a2757d-95c6-b4ef-8f0c-3254acafc619@daenzer.net>
Date: Tue, 9 Feb 2021 11:17:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208140832.2be5ad2f5aacced3dda1d18a@linux-foundation.org>
Content-Language: en-CA
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0wOCAxMTowOCBwLm0uLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IEknbSBub3Qg
c3VyZSB3aG8gdGhpcyBiZWxvbmdzIHRvLi4uCj4gCj4gQmVnaW4gZm9yd2FyZGVkIG1lc3NhZ2U6
Cj4gCj4gRGF0ZTogU2F0LCAwNiBGZWIgMjAyMSAwMTo0OTo1MSArMDAwMAo+IEZyb206IGJ1Z3pp
bGxhLWRhZW1vbkBidWd6aWxsYS5rZXJuZWwub3JnCj4gVG86IGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmcKPiBTdWJqZWN0OiBbQnVnIDIxMTU4N10gTmV3OiBYOiBwYWdlIGFsbG9jYXRpb24gZmFp
bHVyZTogb3JkZXI6OCwgbW9kZToweDE5MGRjMihHRlBfSElHSFVTRVJ8X19HRlBfTk9SRVRSWXxf
X0dGUF9aRVJPfF9fR0ZQX05PTUVNQUxMT0MpLCBub2RlbWFzaz0obnVsbCksY3B1c2V0PS8sbWVt
c19hbGxvd2VkPTAKPiAKPiAKPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxMTU4Nwo+IAo+ICAgICAgICAgICAgICBCdWcgSUQ6IDIxMTU4Nwo+ICAgICAgICAg
ICAgIFN1bW1hcnk6IFg6IHBhZ2UgYWxsb2NhdGlvbiBmYWlsdXJlOiBvcmRlcjo4LAo+ICAgICAg
ICAgICAgICAgICAgICAgIG1vZGU6MHgxOTBkYzIoR0ZQX0hJR0hVU0VSfF9fR0ZQX05PUkVUUll8
X19HRlBfWkVST3xfXwo+ICAgICAgICAgICAgICAgICAgICAgIEdGUF9OT01FTUFMTE9DKSwKPiAg
ICAgICAgICAgICAgICAgICAgICBub2RlbWFzaz0obnVsbCksY3B1c2V0PS8sbWVtc19hbGxvd2Vk
PTAKCkZpeGVkIGluIHY1LjExLXJjNyBieSAyYjFiM2U1NDRmNjUgImRybS90dG06IFVzZSBfX0dG
UF9OT1dBUk4gZm9yIGh1Z2UgCnBhZ2VzIGluIHR0bV9wb29sX2FsbG9jX3BhZ2UiLgoKCi0tIApF
YXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0
cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAg
ICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
