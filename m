Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B58EED1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D56E9DD;
	Thu, 15 Aug 2019 14:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878D36E9DD;
 Thu, 15 Aug 2019 14:59:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f72so1524550wmf.5;
 Thu, 15 Aug 2019 07:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mEoiihgfqWUe3ZoUXL4XK4SNuss4X3uooLaEcvpyGVE=;
 b=AAC/WqRgTrNo4JZZ/K1CorDo6LJ7vJjoZsyvARFXfsJTGQPF65fJcrKRseuRlbGdl7
 iM22cNlGASczQ+byt03Im1/qYQTrhmHaobZeMP7a78qOInvOxGAmOuZDnqtoCajWfZuy
 qVIeSlPO0L8JwnrQTAsofn2V2H+jbl3RqvZaVWAXa+UOEdaqBRsT79mOUweiecpOyBme
 HjFo7y8A53qbjzkkS6YBVMT33qgnhdcjx9DUD/R9Ps2jT4fj+Hz+0FFJSooLzXDYctV+
 Ftosa5vOGkLd2PIauav279IDgEMQ6HkaJqUnsmtfyRed7U2hgAqr6lU4865HVNuDCbhC
 ZcGw==
X-Gm-Message-State: APjAAAWHTv7gAywlDzopBs0nMKy7LnlUdpzxmsPi/Oz93e81Hatu5xaj
 om8OHc7BmHA7qkJUVdsGN15TgCN2MC8G12dmZ60=
X-Google-Smtp-Source: APXvYqzOJKvOEo4Aw/+I/NXXfXKxeMLMU/eP2LAGZSEPkkphZ36bVSOCsC64JbJOgeSpIbeS5NdJOb3hNAkOJ3fLIfc=
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr3280114wmh.67.1565881161065; 
 Thu, 15 Aug 2019 07:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
 <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
In-Reply-To: <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 10:59:09 -0400
Message-ID: <CADnq5_Oo4CMSx3Bi-41xXDCYKB9RRX33Gke9UyvAGZq1i+VOLA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mEoiihgfqWUe3ZoUXL4XK4SNuss4X3uooLaEcvpyGVE=;
 b=M7wMkduAfusSeOrXSO6pVR8ElCfcK2BWDzneYnMQryY5Y0rhUjuctKHFo8yuXhsAe1
 lONO2Kp+qR3j2K+fhCx4irZbZ1aN4T6Qx+MPtR/FBuTcz2C5K8RxKlGXITBASJq5rVr1
 ERl85HXAoFCfl5FZVh+h5nhkjkr9XHED98fJvOdJa/J5bqu/V3CHvvBv/B1AjNqTtqky
 q5ZT8ujNx/26Fw/zaCclLg5GrzK2Up/z+KD/Oi5vtSMCE5CxMShR/WzHCXWY5xnZRFKu
 ZUUKGL5DKQqyt6/eMC+R4mIzHyt8Jr5Lwr8WgQmi8C18XojrxgQTYx9SRmMPm0Ldi85J
 aKoQ==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MzcgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MjUgQU0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
QXVnIDE1LCAyMDE5IGF0IDQ6MjAgUE0gPE1hcmlvLkxpbW9uY2llbGxvQGRlbGwuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gPiA+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJlIHJlZ3Jl
c3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZCB3aXRoIHRoZQo+ID4gPiA+ID4gaW4gdHJl
ZSBkcml2ZXJzIGJ5IHJldmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbiBh
bnN3ZXIgZm9yIGFsbCBvZgo+ID4gPiA+IHRob3NlCj4gPiA+ID4gPiBiZWZvcmUgdGhpcyByZXZl
cnQgaXMgYWNjZXB0ZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVnYXJkaW5nIHN5c3RlbXMgd2l0
aCBJbnRlbCtOVklESUEsIHdlJ2xsIGhhdmUgdG8gd29yayB3aXRoIHBhcnRuZXJzIHRvCj4gPiA+
ID4gY29sbGVjdAo+ID4gPiA+ID4gc29tZSBpbmZvcm1hdGlvbiBvbiB0aGUgaW1wYWN0IG9mIHJl
dmVydGluZyB0aGlzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEg
c3lzdGVtIHdpdGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJlcyBBTUQgR1BVIHRvCj4gPiA+
ID4gdXNlCj4gPiA+ID4gPiAiSHlicmlkIEdyYXBoaWNzIiB3aGVuIG9uIFdpbmRvd3MgYW5kICJQ
b3dlciBFeHByZXNzIiBhbmQgIlN3aXRjaGFibGUKPiA+ID4gPiBHcmFwaGljcyIKPiA+ID4gPiA+
IHdoZW4gb24gTGludXguCj4gPiA+ID4KPiA+ID4gPiBhbmQgd2hhdCdzIGV4YWN0bHkgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aG9zZT8gQW5kIHdoYXQncyB0aGUgYWN0dWFsCj4gPiA+ID4gaXNz
dWUgaGVyZT8KPiA+ID4KPiA+ID4gRFAvSERNSSBpcyBub3QgZGV0ZWN0ZWQgdW5sZXNzIHBsdWdn
ZWQgaW4gYXQgYm9vdHVwLiAgSXQncyBkdWUgdG8gbWlzc2luZyBIUEQKPiA+ID4gZXZlbnRzLgo+
ID4gPgo+ID4KPiA+IGFmYWlrIEx5dWRlIHdhcyB3b3JraW5nIG9uIGZpeGluZyBhbGwgdGhhdCwg
YXQgbGVhc3QgZm9yIHNvbWUgZHJpdmVycy4KPiA+IElmIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9u
Zywgd2Ugc3RpbGwgc2hvdWxkIGZpeCB0aGUgZHJpdmVycywgbm90Cj4gPiBhZGRpbmcgQUNQSSB3
b3JrYXJvdW5kcy4KPiA+Cj4gPiBBbGV4OiBkbyB5b3Uga25vdyBpZiB0aGVyZSBhcmUgcmVtYWlu
aW5nIGlzc3VlcyByZWdhcmRpbmcgdGhhdCB3aXRoIGFtZGdwdT8KPgo+IFRoZXJlIHdhcyBhbiBp
c3N1ZSB3aXRoIGhwZCBldmVudHMgbm90IG1ha2luZyBpdCB0byB0aGUgYXVkaW8gc2lkZQo+IHdo
ZW4gdGhpbmdzIHdlcmUgcG93ZXJlZCBkb3duIHRoYXQgd2FzIGZpeGVkIHdpdGggdGhpcyBwYXRj
aCBzZXQ6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxNjc5My8K
PiBUaG9zZSBwYXRjaGVzIGRlcGVuZGVkIG9uIGEgYnVuY2ggb2YgYWxzYSBjaGFuZ2VzIGFzIHdl
bGwgd2hpY2ggbWF5Cj4gaGF2ZSBub3QgYmVlbiBhdmFpbGFibGUgaW4gdGhlIGRpc3RybyB1c2Vk
IGZvciBhIHBhcnRpY3VsYXIgT0VNCj4gcHJvZ3JhbS4KPgo+ID4KPiA+ID4gPgo+ID4gPiA+IFdl
IGFscmVhZHkgaGF2ZSB0aGUgUFJJTUUgb2ZmbG9hZGluZyBpbiBwbGFjZSBhbmQgaWYgdGhhdCdz
IG5vdAo+ID4gPiA+IGVub3VnaCwgd2Ugc2hvdWxkIHdvcmsgb24gZXh0ZW5kaW5nIGl0LCBub3Qg
YWRkaW5nIHNvbWUgQUNQSSBiYXNlZAo+ID4gPiA+IHdvcmthcm91bmRzLCBiZWNhdXNlIHRoYXQn
cyBleGFjdGx5IGhvdyB0aGF0IGxvb2tzIGxpa2UuCj4gPiA+ID4KPiA+ID4gPiBBbHNvLCB3YXMg
dGhpcyBkaXNjdXNzZWQgd2l0aCBhbnlib2R5IGludm9sdmVkIGluIHRoZSBkcm0gc3Vic3lzdGVt
Pwo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBmZWVsIHdlIG5lZWQgYSBrbm9iIGFuZC9v
ciBETUkgZGV0ZWN0aW9uIHRvIGFmZmVjdCB0aGUgY2hhbmdlcyB0aGF0IHRoZSBBU0wKPiA+ID4g
PiA+IG5vcm1hbGx5IHBlcmZvcm1zLgo+ID4gPiA+Cj4gPiA+ID4gV2h5IGRvIHdlIGhhdmUgdG8g
ZG8gdGhhdCBvbiBhIGZpcm13YXJlIGxldmVsIGF0IGFsbD8KPiA+ID4KPiA+ID4gRm9sa3MgZnJv
bSBBTUQgR3JhcGhpY3MgdGVhbSByZWNvbW1lbmRlZCB0aGlzIGFwcHJvYWNoLiAgRnJvbSB0aGVp
ciBwZXJzcGVjdGl2ZQo+ID4gPiBpdCdzIG5vdCBhIHdvcmthcm91bmQuICBUaGV5IHZpZXcgdGhp
cyBhcyBhIGRpZmZlcmVudCBhcmNoaXRlY3R1cmUgZm9yIEFNRCBncmFwaGljcyBkcml2ZXIgb24K
PiA+ID4gV2luZG93cyBhbmQgQU1EIGdyYXBoaWNzIHcvIGFtZGdwdSBkcml2ZXIuICBUaGV5IGhh
dmUgZGlmZmVyZW50IEFTTCBwYXRocyB1c2VkIGZvcgo+ID4gPiBlYWNoLgo+ID4KPiA+IEBhbGV4
OiBpcyB0aGlzIHRydWU/Cj4KPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBwYXRjaGVzIGlu
IHBhcnRpY3VsYXIsIGJ1dCBJIGtub3cgd2UndmUKPiBkb25lIHRoaW5ncyB3aXRoIE9FTSBwcm9n
cmFtcyB0byBzdXBwb3J0IExpbnV4IG9uIHBsYXRmb3JtcyB3aGVyZQo+IExpbnV4IHN1cHBvcnQg
aXMgbGFja2luZyBmb3IgaW4gbmV3IGZlYXR1cmVzIGZvciB0aGUgdGFyZ2V0IGRpc3Ryb3MuCj4g
RS5nLiwgd2hlbiB0aGUgZmlyc3QgaHlicmlkIGdyYXBoaWNzIGxhcHRvcHMgd2VyZSBjb21pbmcg
b3V0LCBMaW51eAo+IGRpZG4ndCBzdXBwb3J0IGl0IHRvbyB3ZWxsIG9yIGF0IGFsbCBkZXBlbmRp
bmcgb24gdGhlIHRpbWluZywgc28gdGhlCj4gYmlvcyBleHBvc2VkIHBvd2VyIGV4cHJlc3Mgd2hp
Y2ggd2FzIHdvcmtpbmcgd2VsbCBhdCB0aGUgdGltZSBpZiB0aGUKPiBPUyB0b2xkIEFDUEkgaXQg
d2FzIExpbnV4LgoKRldJVywgd2luZG93cyBkb2VzIHNvbWV0aGluZyBzaW1pbGFyLiAgSSBkb24n
dCB0aGluayB3aW5kb3dzIDcKc3VwcG9ydHMgaHlicmlkIGdyYXBoaWNzIGVpdGhlciBzbyBpZiB0
aGUgT1MgdGVsbHMgQUNQSSBpdCdzIHdpbmRvd3MKNywgaXQgZ2V0cyBwb3dlciBleHByZXNzIGlu
c3RlYWQgb2YgaHlicmlkIGdyYXBoaWNzIGFzIHdlbGwuICBBdCBsZWFzdApvbiBsYXB0b3BzIHRo
YXQgc3VwcG9ydCB3aW5kb3dzIDcgaW4gdGhlIGZpcnN0IHBsYWNlLgoKQWxleAoKPgo+IEFsZXgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
