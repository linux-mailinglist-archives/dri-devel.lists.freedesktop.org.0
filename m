Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE989C0AF2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924116E1D5;
	Fri, 27 Sep 2019 18:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FB86E1CD;
 Fri, 27 Sep 2019 18:20:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so6524839wmi.3;
 Fri, 27 Sep 2019 11:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0EYL4Y9+sNFSeoW58R9jcyu1CvfiVJtQtALYLXx6xD4=;
 b=NvPKCq/T+CBdioRAEJpYGv/UOp/xzyRvDWesQT/BIWYqVph22lBGLnVyJGhI9egHle
 hmb5PV9EPKFI7jFTY108Tuf/wulGo/+aZFBInWegG31Q3J8em4X7uaS9F1Alcu+DoY1B
 0rCrmw96Xbk1+3/vlmx3sAH4b7dWd8439SCo8WEHrnr4NJ/d8fLzF6KgglxcoukahmPD
 QQzie1cDkE1X5Rfnh3fvi5OQsZNdggX5dOu/pvuLttN+6grbGsK4MKv/cizxY0CaTmCo
 grfN0xezZOr2FkgcuQ84BQNsubUP36zIuKyHHlJwjdMUpc54GqIcDe7voi3lOJFmlAay
 /W6A==
X-Gm-Message-State: APjAAAUpyecvJYivuMz3Yc+Iq9fowNZ6/eH+j8yly8xPiVWeDc85C2eK
 MqnxGlpBSev6eSqJ3D4cwgBPmGEpuRaPbGAcrzw3N1AX
X-Google-Smtp-Source: APXvYqxbNsv8ooPy9g7nhDYI58MT/VTNMF5K0CZSZLdVNgCipNlhoOWNNoD3LF6M0DHB7twOwasADlSpWWUdLQYtn9g=
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr8120883wma.102.1569608452234; 
 Fri, 27 Sep 2019 11:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-4-lyude@redhat.com>
 <6129c0a5-9a8a-8a05-4dd9-db3204dcbfd8@amd.com>
In-Reply-To: <6129c0a5-9a8a-8a05-4dd9-db3204dcbfd8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 14:20:39 -0400
Message-ID: <CADnq5_PH=Znbo1NajL=OJFbOyEYFXX7xrQM-8hh7YXUhXpicrQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu/dm/mst: Use ->atomic_best_encoder
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0EYL4Y9+sNFSeoW58R9jcyu1CvfiVJtQtALYLXx6xD4=;
 b=YqBwG3/KisZl5EOeyV2VYWz4E6VKggj/6AvQoO+DEECgzYKcEuYjT5N8PCP880hR4I
 6LZLNJDkD/1QkAbNOTL7l/GrWPwwJ0OED+9mEB14XuZ6Q9lA25UkFmreWBZg3P5gRLtQ
 pKVRrEka+bgclmEFFpRKUOCKADx6jekTQny/eKaWR4D7aQaobptyOjDP/Ugu1ZcSVHJ7
 M9pz97LiNpUCKrO8NgB2dlXeBBUnxoI3eGRifpygHpo1WOAcpoJJ3laliPjCqBTeRjwl
 GD3+R0MLbQSoDw1gQ2hMwdc3QUEkb/leXy/zFyizNjNrCtgNbesYRdk7xsZs5Sf42DXa
 lGgA==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTo1NiBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA5LTI2IDY6NTEgcC5tLiwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IFdlIGFyZSBzdXBwb3NlZCB0byBiZSBhdG9taWMgYWZ0ZXIgYWxsLiBXZSdsbCBu
ZWVkIHRoaXMgaW4gYSBtb21lbnQgZm9yCj4gPiB0aGUgbmV4dCBjb21taXQuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPgo+IFJldmlld2VkLWJ5
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPgoKQXBwbGllZC4gIFRo
YW5rcyEKCkFsZXgKCj4gSGFycnkKPgo+ID4gLS0tCj4gPiAgLi4uL2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgIHwgMTAgKysrKystLS0tLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fbXN0X3R5cGVzLmMKPiA+IGluZGV4IGEzOThkZGQxZjMwNi4uZDkxMTNjZTBiZTA5IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fbXN0X3R5cGVzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCj4gPiBAQCAtMjQzLDE3ICsyNDMsMTcgQEAg
c3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCj4gPiAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHN0cnVj
dCBkcm1fZW5jb2RlciAqZG1fbXN0X2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQo+ID4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKgo+ID4gK2RtX21zdF9h
dG9taWNfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5l
Y3Rvcl9zdGF0ZSkKPiA+ICB7Cj4gPiAtICAgICBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
YW1kZ3B1X2RtX2Nvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsK
PiA+IC0KPiA+IC0gICAgIHJldHVybiAmYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+bXN0X2VuY29kZXIt
PmJhc2U7Cj4gPiArICAgICByZXR1cm4gJnRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9y
KS0+bXN0X2VuY29kZXItPmJhc2U7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzID0gewo+ID4gICAgICAgLmdldF9tb2RlcyA9IGRtX2RwX21zdF9nZXRfbW9kZXMsCj4gPiAg
ICAgICAubW9kZV92YWxpZCA9IGFtZGdwdV9kbV9jb25uZWN0b3JfbW9kZV92YWxpZCwKPiA+IC0g
ICAgIC5iZXN0X2VuY29kZXIgPSBkbV9tc3RfYmVzdF9lbmNvZGVyLAo+ID4gKyAgICAgLmF0b21p
Y19iZXN0X2VuY29kZXIgPSBkbV9tc3RfYXRvbWljX2Jlc3RfZW5jb2RlciwKPiA+ICB9Owo+ID4K
PiA+ICBzdGF0aWMgdm9pZCBhbWRncHVfZG1fZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
