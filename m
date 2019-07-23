Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13471F0A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BA36E351;
	Tue, 23 Jul 2019 18:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC889E1A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:47:02 +0000 (UTC)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hpsJw-0001OD-Oc
 for dri-devel@lists.freedesktop.org; Tue, 23 Jul 2019 10:47:00 +0000
Received: by mail-pl1-f199.google.com with SMTP id i33so21746226pld.15
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=+1ZfyZDf6zhgGOKyrkRHfKvtK/8KvoawhKmt5Z8WWJk=;
 b=bZHK7bBXdz37p41XgVCqQMhMeIfYzqjeSiMzmLKZlRV37QTQX+yM2wDxjzmC+kQP29
 MdVSW6tm5oOmzn/AY68bpCNh74tYIaMvjYdyDDQHCDImh9dqfnvusUY29/ZpxQuPYkhg
 XjZQ7R+btcZzVacF2bNw6cjoLMjTnB1ENSjSTAY75Sd9dqAu2VXWlzILPbHt96zDaBB9
 o2QvvhJ028bX+duX2zzFRQZ0Jm0MEtSDmfXx1NkbdLbw9iv8aXAYjeVcUwXFepTA06Mt
 n3hdLy1S9aLTJ2llAphN39M9Oh8xnPvpEPkM3nDtiSOGHWNyvWVcZrhUpHLjCJDQYaod
 dXsQ==
X-Gm-Message-State: APjAAAWQbnkczIZsIdgmtrEta9kqbwbwaxw0UZvNBlQPZdiaeWbnbnQt
 vQqN1XjeNV092SDB/u5E20V16PLhqJ9sLztPZfMrnxxbsAy6byE8LvCO3n8l6zrGrQL5hge66Vh
 wKSfGcXieyvTkQkpqwpzkrhTGipWNnm/eKZAbZ89H0ipAGQ==
X-Received: by 2002:a17:90a:2190:: with SMTP id
 q16mr79193394pjc.23.1563878818751; 
 Tue, 23 Jul 2019 03:46:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEF3QUDZrtO76UsHy0UcHVbGry3dpRiyomMWuc+Ul7tH1HfbAsXRvylUyKXOEt86kNKCtM8Q==
X-Received: by 2002:a17:90a:2190:: with SMTP id
 q16mr79193372pjc.23.1563878818430; 
 Tue, 23 Jul 2019 03:46:58 -0700 (PDT)
Received: from 2001-b011-380f-3c20-9d3c-ccd5-c106-ac9d.dynamic-ip6.hinet.net
 (2001-b011-380f-3c20-9d3c-ccd5-c106-ac9d.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c20:9d3c:ccd5:c106:ac9d])
 by smtp.gmail.com with ESMTPSA id 143sm59648977pgc.6.2019.07.23.03.46.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 03:46:57 -0700 (PDT)
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: OLED panel brightness support
Message-Id: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
Date: Tue, 23 Jul 2019 18:46:55 +0800
To: dri-devel@lists.freedesktop.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
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
Cc: Anthony Wong <anthony.wong@canonical.com>,
 Mario Limonciello <mario.limonciello@dell.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpDdXJyZW50bHksIE9MRUQgcGFuZWwgYnJpZ2h0bmVzcyBbMV0gaXMgbm90IHN1cHBvcnRl
ZC4KV2UgaGF2ZSBhIHNpbWlsYXIgRGVsbCBzeXN0ZW0gdGhhdCBhbHNvIGFmZmVjdCBieSBsYWNr
IG9mIE9MRUQgYnJpZ2h0bmVzcyAgCnN1cHBvcnQuCgpJ4oCZdmUgaW52ZXN0aWdhdGVkIGJvdGgg
a2VybmVsIGFuZCB1c2VyIHNwYWNlIGJ1dCBJIGhhdmVu4oCZdCBmb3VuZCBhIGdvb2QgIApnZW5l
cmFsIHNvbHV0aW9uIHlldC4KRGVsbCBzeXN0ZW1zIHVzZSBFRElEIGRlc2NyaXB0b3IgNCBhcyBE
ZWxsIHNwZWNpZmljIGRlc2NyaXB0b3IsIHdoaWNoICAKcmVwb3J0cyBpdHMgcGFuZWwgdHlwZSBh
bmQgd2UgY2FuIGtub3cgaXTigJlzIGFuIE9MRUQgcGFuZWwgb3Igbm90LgoKTXkgaW5pdGlhbCB0
aG91Z2h0IGlzIHRvIGFkZCBhIG5ldyBhdHRyaWJ1dGUg4oCcb2xlZCIgaW4gZHJtX3N5c2ZzLmMg
WzJdIHRvICAKbGV0IHVzZXJzcGFjZSBsaWtlIGNsdXR0ZXIgWzNdIHRvIGNvbnRyb2wgdGhlIGJy
aWdodG5lc3MuCkhvd2V2ZXIgb3RoZXIgREVzIG1heSBuZWVkIHRvIGltcGxlbWVudCB0aGVpciBv
d24gT0xFRCBicmlnaHRuZXNzIHN1cHBvcnQgIAp3aGljaCBpc27igJl0IGlkZWFsLgoKU28gSeKA
mWQgbGlrZSB0byBrbm93IGlmIHRoZXJl4oCZcyBhbnkgZ29vZCB3YXkgdG8gc3VwcG9ydCBPTEVE
IGJyaWdodG5lc3MgaW4gIApnb29kIG9sZCBiYWNrbGlnaHQgc3lzZnMsIHRvIGxldCB1c2Vyc3Bh
Y2Uga2VlcCB0byB0aGUgY3VycmVudCBpbnRlcmZhY2UuCgpbMV0gaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9OTc4ODMKWzJdIGh0dHBzOi8vcGFzdGViaW4udWJ1
bnR1LmNvbS9wL1FZclJCcHBWVDkvClszXSAgCmh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9N
RS9jbHV0dGVyL2Jsb2IvbWFzdGVyL2NsdXR0ZXIvY2x1dHRlci1icmlnaHRuZXNzLWNvbnRyYXN0
LWVmZmVjdC5jI0w1NTkKCkthaS1IZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
