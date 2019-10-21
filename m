Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35693DE609
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5E289BF6;
	Mon, 21 Oct 2019 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BA989BD5;
 Mon, 21 Oct 2019 08:14:16 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a15so10320151oic.0;
 Mon, 21 Oct 2019 01:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJkx95UvleOcFFmvQVjJHb82ALHFn9Uyq35PUcIaw0Y=;
 b=dZ8nM+XxQqkWxxehObvvcRGZD4kBt4goThi895wr6RGbmohEfw7TuLJNk+t++a6HTm
 XRr2hBot+s/6kj9ExwrReoUgF+JyddJ7T9Rt8gtmqwd22qYSPe4yKmbvLD8TMmM3NGW8
 v0YcAS0PPOskarhB9Xi6hqDu0RIkvhWbNp8WpUThCcAegFLKVayz8wLETjn9Tr65ZVvR
 vIgdgp5R1F447nXUbd3R0fCOJ98wIU1/YG93tbZrHkFHsO/h2bgGgzksbGrWipoPMyrc
 hRe6pcEeOJkIreTlSTF0R0hiAq5acgXh1hwnQUZyq/BrJVpIrqbEq/teuFeSeCSL6AfQ
 B0Hw==
X-Gm-Message-State: APjAAAVwigQ8CW+5wvhwHIIBiajIIiAYaHVtd0CKFzfiO2oxKUrqVHna
 7u3tcKaVnb/iRlSws9TXRrAIRCM8js/KRev6ztU=
X-Google-Smtp-Source: APXvYqy7s2Z6Q62WqM2aVgLMAG9NJ5QBLTyvrrtZtDgW+H6a/y3PWHqqAtwOWxN5wsb6+PZXiYWc+MWNjHm4txISCwU=
X-Received: by 2002:aca:d405:: with SMTP id l5mr17085627oig.115.1571645655327; 
 Mon, 21 Oct 2019 01:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
 <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
In-Reply-To: <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 21 Oct 2019 10:14:03 +0200
Message-ID: <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Alex Hung <alex.hung@canonical.com>, Karol Herbst <kherbst@redhat.com>
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
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNDoxNCBBTSBBbGV4IEh1bmcgPGFsZXguaHVuZ0BjYW5v
bmljYWwuY29tPiB3cm90ZToKPgo+IFdlIGhhdmUgZG9uZSBzb21lIHRlc3RzIG9uIHRocmVlIG9m
IEludGVsICsgblZpZGlhIGNvbmZpZ3VyYXRpb24KPiBzeXN0ZW1zIHdpdGggT0VNIF9PU0kgc3Ry
aW5ncyByZW1vdmVkIC0gd2hpbGUgc29tZSBidWdzIGFyZSBzdGlsbAo+IG9ic2VydmVkLCBleC4g
b25lIG91dCBvZiB0aHJlZSBoYXMgc3VzcGVuZC9yZXN1bWUgaXNzdWVzLCBubyBzeXN0ZW0KPiBj
cmFzaGVzIHdlcmUgb2JzZXJ2ZWQgLSB0aGUgYmlnZ2VzdCBpc3N1ZSB0aGF0IHdvcnJpZXMgdXMu
Cj4KPiBUaGUgcG9zaXRpdmUgcmVzdWx0cyBnaXZlIHVzIGNvbmZpZGVudCB0byBhY2sgdGhlIHJl
bW92YWwgb2YgdGhlIE9FTQo+IF9PU0kgc3RyaW5ncy4gV2hpbGUgb3VyIHRlc3RzIHdlcmUgbm90
IGFibGUgdG8gY292ZXIgYWxsIHBvc3NpYmxlIEkrTgo+IHN5c3RlbXMsIHdlIGFyZSBzdXJlIHdl
IGNhbiBmaXggaXNzdWVzIGFsb25nIHRoZSB3YXkuIElmIHRoZXJlIGFyZW4ndAo+IHN5c3RlbXMg
dGhhdCBjYW5ub3QgYmUgZml4ZWQgd2l0aG91dCB0aGVzZSBPRU0gX09TSSBzdHJpbmdzLCB0aGVz
ZQo+IHN0cmluZ3Mgc2hvdWxkIHByb2JhYmx5IGVuYWJsZSB3aXRoIERNSSBxdWlya3MgKHBvc3Np
YmxlIGZ1dHVyZQo+IHBhdGNoZXMpIHNvIHRoZXkgd29uJ3QgYWZmZWN0IG90aGVycy4KPgo+IEFj
a2VkLWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgoKT0ssIHRoYW5rcyEK
CkkgY2FuIHF1ZXVlIHRoaXMgdXAgb3IgaWYgaXQncyBiZXR0ZXIgdG8gcm91dGUgaXQgdGhyb3Vn
aCB0aGUgRFJNCnRyZWUsIHBsZWFzZSBkbyB0aGF0IChhbmQgbGV0IG1lIGtub3cpLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
