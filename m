Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BE8EE61
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6886E422;
	Thu, 15 Aug 2019 14:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B776E422;
 Thu, 15 Aug 2019 14:37:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so1474722wmp.3;
 Thu, 15 Aug 2019 07:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JPQ51ux9FIpcBSeRyi+l+v24f1Z1qLlUHJqhkNZGZbI=;
 b=na8GyrZHCzd+S9TVbSoyHUq/Rkvlap+hADQglffVJlOiDlztJqyrsUT56TEjHt0twD
 yDuxaG8dMQJDwzpSQeOL25OazcOLgWBD7kt323sxLPCfq5WNu0ILlIo857FP9nnRVQN5
 aqdGDXzrTDgLp5ntsGeRXO+zKJj3AOi9+tq9Jz90RF+NpZh40TdyDt35lU2kh/mLKg12
 OFelG3A4P+MZh6OTMky6e/N/Qfh3RPMtJysGsw7dDC6SYH9Ktz5TW59EZE1uEoGnT3Up
 Z5GpWzU1COufRFNfBvc7XuTh8E7h/39FVgPMmHEb9vKF56NjaYh5V6DTfsjBoXQC0FS3
 ETyw==
X-Gm-Message-State: APjAAAXZpWaZZddppzU/NzKL1FCucvhk88DmDGht+tLFuJ5NAttskks1
 kgb5SAG8xJ9MrtIGdAqGjZ1jCc0GW6o+Quw1WayI/A7K
X-Google-Smtp-Source: APXvYqzk5hmmCfQL2ZVsJ4ebPcL/pgxAQ1FKmKW3rsIE8Vek+CCGrUwG+yxiTrreuqAg8XloqspNVNWuV8kv5ECT8fQ=
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr3077889wmd.141.1565879837306; 
 Thu, 15 Aug 2019 07:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
In-Reply-To: <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 10:37:05 -0400
Message-ID: <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JPQ51ux9FIpcBSeRyi+l+v24f1Z1qLlUHJqhkNZGZbI=;
 b=IBTtv4/Z5fL7OlNtqvr0o6XLgpRtPHAJZKUU7TuLy8fMgtOMqKEE9Qt0aK5JOTVTBy
 0bBTv8jzN78r1wq6nfmfl7IIXsbxPPm0E6B8tgwkyjiZyoMK9Zxo5iCSq741dVIGVQzN
 SvEZoHciKmSHxvxGdNzXOtoIq56U0D/rJKIJUC0Cs/t1K+EUuDbZfx4XzmjRErSQ0Krl
 4GbkaQxkS0ChXuzKKc+UGC1+DUP+SieNzV46TVJGMQrs9xHotbhbzVnDKgF05q8wTxrA
 ww54jeQ24Sc1jnP1OCaK3eBLvbIuTc1edo5eRgloz4NQyFHTced8rBciVi9XbOqiwH+z
 h6Hw==
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
Cc: Mario.Limonciello@dell.com, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MjUgQU0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoyMCBQTSA8TWFy
aW8uTGltb25jaWVsbG9AZGVsbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gPiBUaGVyZSBhcmUgZGVm
aW5pdGVseSBnb2luZyB0byBiZSByZWdyZXNzaW9ucyBvbiBtYWNoaW5lcyBpbiB0aGUgZmllbGQg
d2l0aCB0aGUKPiA+ID4gPiBpbiB0cmVlIGRyaXZlcnMgYnkgcmV2ZXJ0aW5nIHRoaXMuICBJIHRo
aW5rIHdlIHNob3VsZCBoYXZlIGFuIGFuc3dlciBmb3IgYWxsIG9mCj4gPiA+IHRob3NlCj4gPiA+
ID4gYmVmb3JlIHRoaXMgcmV2ZXJ0IGlzIGFjY2VwdGVkLgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJk
aW5nIHN5c3RlbXMgd2l0aCBJbnRlbCtOVklESUEsIHdlJ2xsIGhhdmUgdG8gd29yayB3aXRoIHBh
cnRuZXJzIHRvCj4gPiA+IGNvbGxlY3QKPiA+ID4gPiBzb21lIGluZm9ybWF0aW9uIG9uIHRoZSBp
bXBhY3Qgb2YgcmV2ZXJ0aW5nIHRoaXMuCj4gPiA+ID4KPiA+ID4gPiBXaGVuIHRoaXMgaXMgdXNl
ZCBvbiBhIHN5c3RlbSB3aXRoIEludGVsK0FNRCB0aGUgQVNMIGNvbmZpZ3VyZXMgQU1EIEdQVSB0
bwo+ID4gPiB1c2UKPiA+ID4gPiAiSHlicmlkIEdyYXBoaWNzIiB3aGVuIG9uIFdpbmRvd3MgYW5k
ICJQb3dlciBFeHByZXNzIiBhbmQgIlN3aXRjaGFibGUKPiA+ID4gR3JhcGhpY3MiCj4gPiA+ID4g
d2hlbiBvbiBMaW51eC4KPiA+ID4KPiA+ID4gYW5kIHdoYXQncyBleGFjdGx5IHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAo+ID4gPiBpc3N1ZSBoZXJl
Pwo+ID4KPiA+IERQL0hETUkgaXMgbm90IGRldGVjdGVkIHVubGVzcyBwbHVnZ2VkIGluIGF0IGJv
b3R1cC4gIEl0J3MgZHVlIHRvIG1pc3NpbmcgSFBECj4gPiBldmVudHMuCj4gPgo+Cj4gYWZhaWsg
THl1ZGUgd2FzIHdvcmtpbmcgb24gZml4aW5nIGFsbCB0aGF0LCBhdCBsZWFzdCBmb3Igc29tZSBk
cml2ZXJzLgo+IElmIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZywgd2Ugc3RpbGwgc2hvdWxkIGZp
eCB0aGUgZHJpdmVycywgbm90Cj4gYWRkaW5nIEFDUEkgd29ya2Fyb3VuZHMuCj4KPiBBbGV4OiBk
byB5b3Uga25vdyBpZiB0aGVyZSBhcmUgcmVtYWluaW5nIGlzc3VlcyByZWdhcmRpbmcgdGhhdCB3
aXRoIGFtZGdwdT8KClRoZXJlIHdhcyBhbiBpc3N1ZSB3aXRoIGhwZCBldmVudHMgbm90IG1ha2lu
ZyBpdCB0byB0aGUgYXVkaW8gc2lkZQp3aGVuIHRoaW5ncyB3ZXJlIHBvd2VyZWQgZG93biB0aGF0
IHdhcyBmaXhlZCB3aXRoIHRoaXMgcGF0Y2ggc2V0OgpodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMzE2NzkzLwpUaG9zZSBwYXRjaGVzIGRlcGVuZGVkIG9uIGEgYnVuY2gg
b2YgYWxzYSBjaGFuZ2VzIGFzIHdlbGwgd2hpY2ggbWF5CmhhdmUgbm90IGJlZW4gYXZhaWxhYmxl
IGluIHRoZSBkaXN0cm8gdXNlZCBmb3IgYSBwYXJ0aWN1bGFyIE9FTQpwcm9ncmFtLgoKPgo+ID4g
Pgo+ID4gPiBXZSBhbHJlYWR5IGhhdmUgdGhlIFBSSU1FIG9mZmxvYWRpbmcgaW4gcGxhY2UgYW5k
IGlmIHRoYXQncyBub3QKPiA+ID4gZW5vdWdoLCB3ZSBzaG91bGQgd29yayBvbiBleHRlbmRpbmcg
aXQsIG5vdCBhZGRpbmcgc29tZSBBQ1BJIGJhc2VkCj4gPiA+IHdvcmthcm91bmRzLCBiZWNhdXNl
IHRoYXQncyBleGFjdGx5IGhvdyB0aGF0IGxvb2tzIGxpa2UuCj4gPiA+Cj4gPiA+IEFsc28sIHdh
cyB0aGlzIGRpc2N1c3NlZCB3aXRoIGFueWJvZHkgaW52b2x2ZWQgaW4gdGhlIGRybSBzdWJzeXN0
ZW0/Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJIGZlZWwgd2UgbmVlZCBhIGtub2IgYW5kL29yIERN
SSBkZXRlY3Rpb24gdG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRoYXQgdGhlIEFTTAo+ID4gPiA+IG5v
cm1hbGx5IHBlcmZvcm1zLgo+ID4gPgo+ID4gPiBXaHkgZG8gd2UgaGF2ZSB0byBkbyB0aGF0IG9u
IGEgZmlybXdhcmUgbGV2ZWwgYXQgYWxsPwo+ID4KPiA+IEZvbGtzIGZyb20gQU1EIEdyYXBoaWNz
IHRlYW0gcmVjb21tZW5kZWQgdGhpcyBhcHByb2FjaC4gIEZyb20gdGhlaXIgcGVyc3BlY3RpdmUK
PiA+IGl0J3Mgbm90IGEgd29ya2Fyb3VuZC4gIFRoZXkgdmlldyB0aGlzIGFzIGEgZGlmZmVyZW50
IGFyY2hpdGVjdHVyZSBmb3IgQU1EIGdyYXBoaWNzIGRyaXZlciBvbgo+ID4gV2luZG93cyBhbmQg
QU1EIGdyYXBoaWNzIHcvIGFtZGdwdSBkcml2ZXIuICBUaGV5IGhhdmUgZGlmZmVyZW50IEFTTCBw
YXRocyB1c2VkIGZvcgo+ID4gZWFjaC4KPgo+IEBhbGV4OiBpcyB0aGlzIHRydWU/CgpJJ20gbm90
IGZhbWlsaWFyIHdpdGggdGhpcyBwYXRjaGVzIGluIHBhcnRpY3VsYXIsIGJ1dCBJIGtub3cgd2Un
dmUKZG9uZSB0aGluZ3Mgd2l0aCBPRU0gcHJvZ3JhbXMgdG8gc3VwcG9ydCBMaW51eCBvbiBwbGF0
Zm9ybXMgd2hlcmUKTGludXggc3VwcG9ydCBpcyBsYWNraW5nIGZvciBpbiBuZXcgZmVhdHVyZXMg
Zm9yIHRoZSB0YXJnZXQgZGlzdHJvcy4KRS5nLiwgd2hlbiB0aGUgZmlyc3QgaHlicmlkIGdyYXBo
aWNzIGxhcHRvcHMgd2VyZSBjb21pbmcgb3V0LCBMaW51eApkaWRuJ3Qgc3VwcG9ydCBpdCB0b28g
d2VsbCBvciBhdCBhbGwgZGVwZW5kaW5nIG9uIHRoZSB0aW1pbmcsIHNvIHRoZQpiaW9zIGV4cG9z
ZWQgcG93ZXIgZXhwcmVzcyB3aGljaCB3YXMgd29ya2luZyB3ZWxsIGF0IHRoZSB0aW1lIGlmIHRo
ZQpPUyB0b2xkIEFDUEkgaXQgd2FzIExpbnV4LgoKQWxleApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
