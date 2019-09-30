Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666EC253F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 18:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11F76E4A1;
	Mon, 30 Sep 2019 16:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452496E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:36:25 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B577685362
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:36:24 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id o11so31186669iop.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 09:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n6TZwGZ6BwH01Gtc+GZbV82I7jDbXiJPW011pcYuI0Q=;
 b=TXoCbXQOHt2jHDRGtam/CgMZZ/WvQ88ECrzdZxjcuF8QhW7U0UIw8fU3Mh64MAG7/k
 pwsercood6yX4TRTrPIeY8zyF71Ksx5nz0Iv1IlUfwByhCE6EvrfaIukDUx3MDmMkVoQ
 jyvKpeaCZjFfsE1ppcppMzIt/x/MlufWgWAImhmqGVV4PSx0kxfsW8khcu476aeV6ZXd
 JRG9IU7q+CfNG+OYwZSSeMlUg0CqvL41MDCuUG8P8MLK0gorZtDDNdr3R0hQe35+Fdms
 egZkakZuT/jaLwx70CfodlJkI50MmQGky9i3i48vVyvIQJTs5XI74aWK9kbuHynzQ2br
 VV1w==
X-Gm-Message-State: APjAAAX1X/McFo2osA2qg47krwRvyBo7Y3F8JQ9Nd+lH0VrxPzIrtKY/
 bdjext/rFzLagHU+PveVGLNJGrltUkxIfTXlneXfBZxdlxLoeP1vRxwCgoUKrx8hX1zrgQfOjW2
 Tc5WIXeZ1cqgPvEx6njvHirCYUMI37Do+s/WrTz4vlKne
X-Received: by 2002:a6b:3804:: with SMTP id f4mr7902610ioa.166.1569861384038; 
 Mon, 30 Sep 2019 09:36:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTi7C+3z1z5gBDBQSyyub19LVPhCynfHDYm5iNSEA04yROLKW+AsLuHu877bWM07L3lw3ItDdT4w5mzyKMATY=
X-Received: by 2002:a6b:3804:: with SMTP id f4mr7902576ioa.166.1569861383788; 
 Mon, 30 Sep 2019 09:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
 <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
 <20190930163001.GX2714@lahna.fi.intel.com>
In-Reply-To: <20190930163001.GX2714@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 30 Sep 2019 18:36:12 +0200
Message-ID: <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@linux.intel.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNjozMCBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMDY6MDU6MTRQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gc3RpbGwgaGFwcGVu
cyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2ltcGx5IGdldHMgc2h1dCBk
b3duLgo+ID4KPiA+IGRtZXNnIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gaHR0cHM6Ly9naXN0Lmdp
dGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC80MGViMDkxYzdiN2IzM2VmOTkzNTI1ZGU2
NjBmMWEzYi9yYXcvMjM4MGUzMWY1NjZlOTNlNWJhN2M4N2VmNTQ1NDIwOTY1ZDRjNDkyYy9naXN0
ZmlsZTEudHh0Cj4KPiBMb29raW5nIHlvdXIgZG1lc2c6Cj4KPiBTZXAgMzAgMTc6MjQ6Mjcga2Vy
bmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0IgdmVyc2lvbiA0LjEKPiBTZXAgMzAg
MTc6MjQ6Mjcga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBNTTogdXNpbmcgQ09Q
WSBmb3IgYnVmZmVyIGNvcGllcwo+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IFtkcm1dIEluaXRp
YWxpemVkIG5vdXZlYXUgMS4zLjEgMjAxMjA4MDEgZm9yIDAwMDA6MDE6MDAuMCBvbiBtaW5vciAx
Cj4KPiBJIHdvdWxkIGFzc3VtZSBpdCBydW50aW1lIHN1c3BlbmRzIGhlcmUuIFRoZW4gaXQgd2Fr
ZXMgdXAgYmVjYXVzZSBvZiBQQ0kKPiBhY2Nlc3MgZnJvbSB1c2Vyc3BhY2U6Cj4KPiBTZXAgMzAg
MTc6MjQ6NDIga2VybmVsOiBwY2lfcmF3X3NldF9wb3dlcl9zdGF0ZTogNTYgY2FsbGJhY2tzIHN1
cHByZXNzZWQKPgo+IGFuZCBmb3Igc29tZSByZWFzb24gaXQgZG9lcyBub3QgZ2V0IHJlc3VtZWQg
cHJvcGVybHkuIFRoZXJlIGFyZSBhbHNvIGZldwo+IHdhcm5pbmdzIGZyb20gQUNQSSB0aGF0IG1p
Z2h0IGJlIHJlbGV2YW50Ogo+Cj4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogQUNQSSBXYXJuaW5n
OiBcX1NCLlBDSTAuR0ZYMC5fRFNNOiBBcmd1bWVudCAjNCB0eXBlIG1pc21hdGNoIC0gRm91bmQg
W0J1ZmZlcl0sIEFDUEkgcmVxdWlyZXMgW1BhY2thZ2VdICgyMDE5MDUwOS9uc2FyZ3VtZW50cy01
OSkKPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBBQ1BJIFdhcm5pbmc6IFxfU0IuUENJMC5QRUcw
LlBFR1AuX0RTTTogQXJndW1lbnQgIzQgdHlwZSBtaXNtYXRjaCAtIEZvdW5kIFtCdWZmZXJdLCBB
Q1BJIHJlcXVpcmVzIFtQYWNrYWdlXSAoMjAxOTA1MDkvbnNhcmd1bWVudHMtNTkpCj4KCmFmYWlr
IHRoaXMgaXMgdGhlIGNhc2UgZm9yIGVzc2VudGlhbGx5IGV2ZXJ5IGxhcHRvcCBvdXQgdGhlcmUu
Cgo+IFRoaXMgc2VlbXMgdG8gYmUgRGVsbCBYUFMgOTU2MCB3aGljaCBJIHRoaW5rIGhhcyBiZWVu
IGFyb3VuZCBzb21lIHRpbWUKPiBhbHJlYWR5IHNvIEkgd29uZGVyIHdoeSB3ZSBvbmx5IHNlZSBp
c3N1ZXMgbm93LiBIYXMgaXQgZXZlciB3b3JrZWQgZm9yCj4geW91IG9yIG1heWJlIHRoZXJlIGlz
IGEgcmVncmVzc2lvbiB0aGF0IGNhdXNlcyBpdCB0byBoYXBwZW4gbm93PwoKb2gsIGl0J3MgYnJv
a2VuIHNpbmNlIGZvcmV2ZXIsIHdlIGp1c3QgdHJpZWQgdG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24K
ZnJvbSBOdmlkaWEgaWYgdGhleSBrbm93IHdoYXQgdGhpcyBpcyBhbGwgYWJvdXQsIGJ1dCB3ZSBn
b3Qgbm90aGluZwp1c2VmdWwuCgpXZSB3ZXJlIGFsc28gaG9waW5nIHRvIGZpbmQgYSByZWxpYWJs
ZSBmaXggb3Igd29ya2Fyb3VuZCB3ZSBjb3VsZCBoYXZlCmluc2lkZSBub3V2ZWF1IHRvIGZpeCB0
aGF0IGFzIEkgdGhpbmsgbm91dmVhdSBpcyB0aGUgb25seSBkcml2ZXIKYWN0dWFsbHkgaGl0IGJ5
IHRoaXMgaXNzdWUsIGJ1dCBub3RoaW5nIHR1cm5lZCBvdXQgdG8gYmUgcmVsaWFibGUKZW5vdWdo
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
