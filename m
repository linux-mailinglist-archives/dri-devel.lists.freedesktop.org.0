Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B3AA7B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 17:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207426E122;
	Thu,  5 Sep 2019 15:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14166E114
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 15:51:35 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5224A2D6A25
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 15:51:35 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id q5so3737692iof.19
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NNe3ddKXkBveWMhw4c4f5b+wfxe2iykrAWeST0j0z4c=;
 b=GuIpweEdbVLgd6E9jeo5IRw3bl9uk2kLH2uqUxKWvvrYj74od72tZsPhGZqmDr2alm
 Bnsr7iAoi5Y39K1F9G1ReAs6n8s3P2cQ2eImWY9KVXprMFJit5Cl/U09nfQzTyywhNyF
 SXmfFYG+VXzz5zIquNQ974wtR5uuQIyZl2COUsGlwwxWqTNJ8fRWu6tWO0DsJtbYO0A1
 ezz3ubo75yXW5wMyW1hW9CvJjujIgHXYIjuHs6j333OjH4o0poNAXvp4332/Jjvw4sSg
 OxUsfcmg+wOnZc21YpSiGQf4iRfSddBKV0xx8vvtLy1VEzTOKEFplpoL9749kk2/XBZ9
 gZ7A==
X-Gm-Message-State: APjAAAUeoNcvPWy5V6I4EVvysNXCwh9mT0ph0lU1+PFe6uKEFQIlrLO8
 +tkl6ILjvfo0zvpqvTY2ZOwIdGYUaPlotJmLvTf44Qkj7HyG4Deot7uF0gXv1eAb+23831rCvSY
 yKqcovJbqQYFE8sLLbIk0ZtZWsyj88S0gMyLhI3bS+SCh
X-Received: by 2002:a5d:9750:: with SMTP id c16mr5160593ioo.260.1567698694750; 
 Thu, 05 Sep 2019 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziasJ9/F0fMtMAUdtQGxy5l/8SPZ81bDf6U0dhJV+tEsL0k25gm7aG+PD5J9cfxqlr1KkEZZquBbi9oi2tLXY=
X-Received: by 2002:a5d:9750:: with SMTP id c16mr5160555ioo.260.1567698694470; 
 Thu, 05 Sep 2019 08:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <2215840.qs0dBhReda@kreacher>
In-Reply-To: <2215840.qs0dBhReda@kreacher>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 5 Sep 2019 17:51:23 +0200
Message-ID: <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
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
Cc: Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aXMgdGhlcmUgYW55IHVwZGF0ZSBvbiB0aGUgdGVzdGluZyB3aXRoIG15IHBhdGNoZXM/IE9uIHRo
ZSBoYXJkd2FyZSBJCmhhZCBhY2Nlc3MgdG8gdGhvc2UgcGF0Y2hlcyBoZWxwZWQsIGJ1dCBJIGNh
bid0IGtub3cgaWYgaXQgYWxzbyBoZWxwZWQKb24gdGhlIGhhcmR3YXJlIGZvciB3aGljaCB0aG9z
ZSB3b3JrYXJvdW5kcyB3aGVyZSBhY3R1YWxseSBhZGRlZC4KCk9uIE1vbiwgQXVnIDE5LCAyMDE5
IGF0IDExOjUyIEFNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3eXNvY2tpLm5ldD4gd3JvdGU6
Cj4KPiBPbiBUaHVyc2RheSwgQXVndXN0IDE1LCAyMDE5IDEyOjQ3OjM1IEFNIENFU1QgRGF2ZSBB
aXJsaWUgd3JvdGU6Cj4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0IDA3OjMxLCBLYXJvbCBIZXJi
c3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgMjg1ODZhNTFlZWE2NjZkNTUzMWJjYWVmMmY2OGU0YWJiZDg3MjQyYy4KPiA+ID4KPiA+
ID4gVGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFN
RCBfZG9lc18gc3VwcG9ydCBpdCBhbmQKPiA+ID4gaXQgd29ya3Mgd2l0aCBOb3V2ZWF1IGFzIHdl
bGwuCj4gPiA+Cj4gPiA+IEFsc28gd2hhdCB3YXMgdGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJl
PyBObyByZWZlcmVuY2VzIHRvIGFueSBidWdzIGFuZCBub3QKPiA+ID4gZXZlbiBleHBsYWluaW5n
IGFueSBpc3N1ZSBhdCBhbGwgaXNuJ3QgdGhlIHdheSB3ZSBkbyB0aGluZ3MuCj4gPiA+Cj4gPiA+
IEFuZCBldmVuIGlmIGl0IG1lYW5zIGEgbXV4ZWQgZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8g
bWFrZSBpdCB3b3JrIGluc2lkZSB0aGUKPiA+ID4gZHJpdmVyLCBub3QgYWRkaW5nIHNvbWUgaGFj
a3kgd29ya2Fyb3VuZCB0aHJvdWdoIEFDUEkgdHJpY2tzLgo+ID4gPgo+ID4gPiBBbmQgd2hhdCBv
dXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRvIG5vdCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25l
IGJpdCBhbnl3YXkuCj4gPiA+Cj4gPgo+ID4gSSB0aGluayB0aGUgcmV2ZXJ0cyBzaG91bGQgYmUg
bWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRoZSBvcmlnaW5hbAo+ID4gcGF0Y2hlcyB3ZW50
IGluIHZpYSB0aGVyZSwgYW5kIHdlIHNob3VsZCBnZXQgdGhlbSBpbiBhc2FwLgo+ID4KPiA+IEFj
a2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIF9PU0kgc3Ry
aW5ncyBhcmUgdG8gYmUgZHJvcHBlZCB3aGVuIGFsbCBvZiB0aGUgbmVlZGVkIHN1cHBvcnQgaXMg
dGhlcmUgaW4KPiBkcml2ZXJzLCBzbyB0aGV5IHNob3VsZCBnbyBhd2F5IGFsb25nIHdpdGggdGhl
IHJlcXVpc2l0ZSBkcml2ZXIgY2hhbmdlcy4KPgoKdGhhdCBnb2VzIGJlc2lkZSB0aGUgcG9pbnQu
IGZpcm13YXJlIGxldmVsIHdvcmthcm91bmRzIGZvciBHUFUgZHJpdmVyCmlzc3VlcyB3ZXJlIHB1
c2hlZCB3aXRob3V0IGNvbnN1bHRpbmcgd2l0aCB1cHN0cmVhbSBHUFUgZGV2ZWxvcGVycy4KVGhh
dCdzIHNvbWV0aGluZyB3aGljaCBzaG91bGRuJ3QgaGF2ZSBoYXBwZW5lZCBpbiB0aGUgZmlyc3Qg
cGxhY2UuIEFuZAp5ZXMsIEkgYW0gcGVyc29uYWxseSBhbm5veWVkIGJ5IHRoZSBmYWN0LCB0aGF0
IHBlb3BsZSBrbm93IGFib3V0Cmlzc3VlcywgYnV0IGluc3RlYWQgb2YgY29udGFjdGluZyB0aGUg
cHJvcGVyIHBlcnNvbnMgYW5kIHdvcmtpbmcgb24gYQpwcm9wZXIgZml4LCB3ZSBlbmQgdXAgd2l0
aCBzdHVwaWQgZmlybXdhcmUgbGV2ZWwgd29ya2Fyb3VuZHMuIEkgY2FuJ3QKc2VlIHdoeSB3ZSBl
dmVyIHdvdWxkIGhhdmUgd2FudGVkIHN1Y2ggd29ya2Fyb3VuZHMgaW4gdGhlIGZpcnN0IHBsYWNl
LgoKQW5kIEkgd291bGQgYmUgbXVjaCBoYXBwaWVyIGlmIHRoZSBuZXh0IHRpbWUgc29tZXRoaW5n
IGxpa2UgdGhhdCBjb21lcwp1cCwgdGhhdCB0aGUgZHJtIG1haWxpbmcgbGlzdCB3aWxsIGJlIGNv
bnRhY3RlZCBhcyB3ZWxsIG9yIHNvbWVib2R5Cmludm9sdmVkLgoKV2UgY291bGQgaGF2ZSBhbHNv
IGp1c3QgZGlzYWJsZSB0aGUgZmVhdHVyZSBpbnNpZGUgdGhlIGRyaXZlciAoYW5kCnByb2JhYmx5
IHdlIHNob3VsZCBoYXZlIGRvbmUgdGhhdCBhIGxvbmcgdGltZSBhZ28sIHNvIHRoYXQgaXMKZXNz
ZW50aWFsbHkgb3VyIGZhdWx0LCBidXQgc3RpbGwuLi4uKQoKPiBJJ20gYWxsIGZvciBkcm9wcGlu
ZyB0aGVuIHdoZW4gdGhhdCdzIHRoZSBjYXNlLCBzbyBwbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCBB
Q0tzCj4gZnJvbSBtZSB0byB0aGUgcGF0Y2hlcyBpbiBxdWVzdGlvbiBhdCB0aGF0IHBvaW50Lgo+
Cj4gQ2hlZXJzLAo+IFJhZmFlbAo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
