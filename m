Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FF85BE2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30C46E79D;
	Thu,  8 Aug 2019 07:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F9F6E2F6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 06:40:42 +0000 (UTC)
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hvc6L-0003JQ-7N
 for dri-devel@lists.freedesktop.org; Thu, 08 Aug 2019 06:40:41 +0000
Received: by mail-pl1-f198.google.com with SMTP id ci3so12342216plb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 23:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=l5rHDYLgnHvJXY+ZnRDc5GLGTswz9I9fXq6PUolc/fA=;
 b=NtB74QVm+RaI0uWULyH2WWCIB9w7/85LiQstmiAQY2spxfW7H5+WwYbJGzr/O8tjUe
 xHzUYbLXZ9+7+cUK97/TmWxV461oggayJ8h5Opux1emdkKTUQCzp2BhoLaHsEQZVZiWi
 UDDhL2wGdzHMepKUQF1n0qYe0vicE8SMIlZg4pdoNqqm6HGTFQNzNXwEiEYtTZB/CDwh
 0c/m3TFybjp/PXqt2ygK6JUQh4MIbTXHyOC9QepE4qxxdx1diJBeNxtj2LDFhQngRTTe
 F+Lk5JydvsrHQJq+z3gfKsH1IMZokr5CY356r8mpSf+Et+31+/KguAWMrSmcvc3NWORR
 9HpQ==
X-Gm-Message-State: APjAAAUwLoWpkfEIdoX9+n4IWNNsLvv5rrlBE7SrzGy8tdczmu2frNSf
 T1ICzCza+Ytwydh63NGVDoW10qfjgZz1tBNnnbg/j1B80/J+Zny3wp8TtH4eYeI13HHTjjv+IjA
 f1WetI5Z/MG/TQhsld0PghZffFUVBUW4yzQ0pQ4w/sGedcw==
X-Received: by 2002:a63:5d54:: with SMTP id o20mr11397000pgm.413.1565246439462; 
 Wed, 07 Aug 2019 23:40:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCC/9Sa5BPRZy+RR5FexWvctk+jCAEtO3eVujnO8PsCr5So5Y7KoFCZ0L6y07X3R/2s7tBdg==
X-Received: by 2002:a63:5d54:: with SMTP id o20mr11396964pgm.413.1565246439050; 
 Wed, 07 Aug 2019 23:40:39 -0700 (PDT)
Received: from 2001-b011-380f-37d3-00e0-0f28-6109-9f39.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-00e0-0f28-6109-9f39.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:e0:f28:6109:9f39])
 by smtp.gmail.com with ESMTPSA id z68sm85843578pgz.88.2019.08.07.23.40.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 23:40:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <MN2PR12MB3309680845257BC66644133CECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
Date: Thu, 8 Aug 2019 14:40:35 +0800
Message-Id: <94CAE10C-1C2D-4A62-A26B-971A8EEE277A@canonical.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
 <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
 <MN2PR12MB3309680845257BC66644133CECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
To: "Huang, Ray" <Ray.Huang@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YXQgMTQ6MjksIEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPiB3cm90ZToKCj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZl
bmdAY2Fub25pY2FsLmNvbT4KPj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAwOCwgMjAxOSAxOjQ1
IEFNCj4+IFRvOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT4KPj4gQ2M6IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFu
Cj4+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykKPj4g
PERhdmlkMS5aaG91QGFtZC5jb20+OyBhbWQtZ2Z4IGxpc3QgPGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPjsKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTEtNTCA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47Cj4+IEFudGhvbnkgV29uZyA8YW50aG9ueS53b25n
QGNhbm9uaWNhbC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbUmVncmVzc2lvbl0gImRybS9hbWRncHU6
IGVuYWJsZSBnZnhvZmYgYWdhaW4gb24gcmF2ZW4gc2VyaWVzCj4+ICh2MikiCj4+Cj4+IEhpIFJh
eSwKPj4KPj4gYXQgMDA6MDMsIEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPiB3cm90ZToK
Pj4KPj4+IE1heSBJIGtub3cgdGhlIGFsbCBmaXJtd2FyZSB2ZXJzaW9uIGluIHlvdXIgc3lzdGVt
Pwo+Cj4gU2VlbXMgdG8gdGhlIGlzc3VlIHdlIGVuY291bnRlcmVkIHdpdGggSU9NTVUgZW5hYmxl
ZC4gQ291bGQgeW91IHBsZWFzZSAgCj4gZGlzYWJsZSBpb21tdSBpbiBTQklPUyBvciBHUlVCPwoK
WWVzLCAiYW1kX2lvbW11PW9mZiIgY2FuIHdvcmthcm91bmQgdGhlIGlzc3VlLgoKS2FpLUhlbmcK
Cj4KPiBUaGFua3MsCj4gUmF5Cj4KPj4gIyBjYXQgYW1kZ3B1X2Zpcm13YXJlX2luZm8KPj4gVkNF
IGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMAo+PiBVVkQg
ZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAwCj4+IE1DIGZl
YXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMAo+PiBNRSBmZWF0
dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDk5Cj4+IFBGUCBmZWF0
dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMGFlCj4+IENFIGZlYXR1
cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwNGQKPj4gUkxDIGZlYXR1
cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDIxMwo+PiBSTEMgU1JMQyBm
ZWF0dXJlIHZlcnNpb246IDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDEKPj4gUkxDIFNS
TEcgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAxCj4+IFJM
QyBTUkxTIGZlYXR1cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMQo+
PiBNRUMgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDE4Ygo+
PiBNRUMyIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAxOGIK
Pj4gU09TIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMAo+
PiBBU0QgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMWFkNGQ0Cj4+
IFRBIFhHTUkgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAw
Cj4+IFRBIFJBUyBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAw
MDAKPj4gU01DIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMWU0
NAo+PiBTRE1BMCBmZWF0dXJlIHZlcnNpb246IDQxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAw
MGE5Cj4+IFZDTiBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDExMDkw
MWMKPj4gRE1DVSBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAw
MDAKPj4gVkJJT1MgdmVyc2lvbjogMTEzLVJBVkVOLTEwMwo+Pgo+PiBLYWktSGVuZwo+Pgo+Pj4g
VGhhbmtzLAo+Pj4gUmF5Cj4+Pgo+Pj4gRnJvbTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVu
Z0BjYW5vbmljYWwuY29tPgo+Pj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgNywgMjAxOSA4OjUw
IFBNCj4+PiBUbzogSHVhbmcsIFJheQo+Pj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlcjsgS29lbmln
LCBDaHJpc3RpYW47IFpob3UsIERhdmlkKENodW5NaW5nKTsgYW1kLQo+PiBnZngKPj4+IGxpc3Q7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExLTUw7IEFudGhvbnkgV29uZwo+Pj4g
U3ViamVjdDogW1JlZ3Jlc3Npb25dICJkcm0vYW1kZ3B1OiBlbmFibGUgZ2Z4b2ZmIGFnYWluIG9u
IHJhdmVuIHNlcmllcwo+Pj4gKHYyKSIKPj4+Cj4+PiBIaSwKPj4+Cj4+PiBBZnRlciBjb21taXQg
MDA1NDQwMDY2ZjkyICgiZHJtL2FtZGdwdTogZW5hYmxlIGdmeG9mZiBhZ2FpbiBvbiByYXZlbgo+
PiBzZXJpZXMKPj4+ICh2MinigJ0pLCBicm93c2VycyBvbiBSYXZlbiBSaWRnZSBzeXN0ZW1zIGNh
dXNlIHNlcmlvdXMgY29ycnVwdGlvbiBsaWtlICAKPj4+IHRoaXM6Cj4+PiBodHRwczovL2xhdW5j
aHBhZGxpYnJhcmlhbi5uZXQvNDM2MzE5NzcyL1NjcmVlbnNob3QlMjBmcm9tJTIwMjAxOS0KPj4g
MDgtMDclMjAwNC0yMC0zNC5wbmcKPj4+IEZpcm13YXJlcyBmb3IgUmF2ZW4gUmlkZ2UgaXMgdXAt
dG8tZGF0ZS4KPj4+Cj4+PiBLYWktSGVuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
