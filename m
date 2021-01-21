Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B42FEC8B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 15:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A468E6E8F8;
	Thu, 21 Jan 2021 14:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42B8A6E8FA;
 Thu, 21 Jan 2021 14:02:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D145E11D4;
 Thu, 21 Jan 2021 06:02:13 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA3373F68F;
 Thu, 21 Jan 2021 06:02:11 -0800 (PST)
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v3)
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20210120200959.163533-1-luben.tuikov@amd.com>
 <20210120200959.163533-2-luben.tuikov@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6d9e3d9d-e513-b2f0-9447-243c40e218cb@arm.com>
Date: Thu, 21 Jan 2021 14:02:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120200959.163533-2-luben.tuikov@amd.com>
Content-Language: en-GB
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
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDEvMjAyMSAyMDowOSwgTHViZW4gVHVpa292IHdyb3RlOgo+IFRoaXMgcGF0Y2ggZG9l
cyBub3QgY2hhbmdlIGN1cnJlbnQgYmVoYXZpb3VyLgo+IAo+IFRoZSBkcml2ZXIncyBqb2IgdGlt
ZW91dCBoYW5kbGVyIG5vdyByZXR1cm5zCj4gc3RhdHVzIGluZGljYXRpbmcgYmFjayB0byB0aGUg
RFJNIGxheWVyIHdoZXRoZXIKPiB0aGUgZGV2aWNlIChHUFUpIGlzIG5vIGxvbmdlciBhdmFpbGFi
bGUsIHN1Y2ggYXMKPiBhZnRlciBpdCdzIGJlZW4gdW5wbHVnZ2VkLCBvciB3aGV0aGVyIGFsbCBp
cwo+IG5vcm1hbCwgaS5lLiBjdXJyZW50IGJlaGF2aW91ci4KPiAKPiBBbGwgZHJpdmVycyB3aGlj
aCBtYWtlIHVzZSBvZiB0aGUKPiBkcm1fc2NoZWRfYmFja2VuZF9vcHMnIC50aW1lZG91dF9qb2Io
KSBjYWxsYmFjawo+IGhhdmUgYmVlbiBhY2NvcmRpbmdseSByZW5hbWVkIGFuZCByZXR1cm4gdGhl
Cj4gd291bGQndmUtYmVlbiBkZWZhdWx0IHZhbHVlIG9mCj4gRFJNX0dQVV9TQ0hFRF9TVEFUX05P
TUlOQUwgdG8gcmVzdGFydCB0aGUgdGFzaydzCj4gdGltZW91dCB0aW1lci0tdGhpcyBpcyB0aGUg
b2xkIGJlaGF2aW91ciwgYW5kIGlzCj4gcHJlc2VydmVkIGJ5IHRoaXMgcGF0Y2guCj4gCj4gdjI6
IFVzZSBlbnVtIGFzIHRoZSBzdGF0dXMgb2YgYSBkcml2ZXIncyBqb2IKPiAgICAgIHRpbWVvdXQg
Y2FsbGJhY2sgbWV0aG9kLgo+IAo+IHYzOiBSZXR1cm4gc2NoZWR1bGVyL2RldmljZSBpbmZvcm1h
dGlvbiwgcmF0aGVyCj4gICAgICB0aGFuIHRhc2sgaW5mb3JtYXRpb24uCj4gCj4gQ2M6IEFsZXhh
bmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+IENjOiBBbmRyZXkgR3Jv
ZHpvdnNreSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KPiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51az4KPiBD
YzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KPiBDYzog
UWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4g
Q2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBSb3Nl
bnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBFcmljIEFuaG9s
dCA8ZXJpY0BhbmhvbHQubmV0Pgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBh
bWQuY29tPgoKQWNrZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
