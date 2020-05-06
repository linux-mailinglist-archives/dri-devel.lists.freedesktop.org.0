Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5F1C6CCB
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 11:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F636E83E;
	Wed,  6 May 2020 09:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7706E83E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:25:11 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id e8so1067487ilm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7uahQmSxdI2EmZVJYKZ999kiWm6qZxnju9s2c7tRn4c=;
 b=khgwHDGiPg28N1qXFoBDyqI2mD9do5F0SoX2enTs+7olNicAhaBDk1/9Pz0SSOIwgY
 HSKIOkQQW6r1nxbz1oXuRy6oy+O5g6l4//eKigImkz8H/PytajuQBseH5AW2oJtTXpv5
 em0utB/mxP3tD6sABwwMt5FpKHUWCCHTMRERB3Zs9lENhMAN8GDjLTixeKFar1bEVGEz
 bYi6Bv4PCFuE380X5P8tfAHzIWQ/tGoy1oZFzXPGnZ/2baKFIhQ1FFpa9H1evQFU1Psx
 69kSAfUkBood3vy+x3EEJ2pkYMzVuU4wNGm8GWkB92s22wf+CKsJX0+Go4KEqKfI/gJl
 yhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7uahQmSxdI2EmZVJYKZ999kiWm6qZxnju9s2c7tRn4c=;
 b=GXx7eYo7YSDsVBLUd7MMGkq4W1uzj1pKzJSR9JqJFIFKQODezZzTesxgFNw1CxXDHm
 hx5Ofs0QC7xiBuRm26nKzgXT/3W2O21EPF9lSARHZlV0R1ggyad+01d1Butyd3FHdyNi
 1Em8izGzdup4IqryQuh7MWpXxMFc5+aLu2Ux+UkFyDfgFjEhPwI9GKFjFDQAZlo/lHjj
 8bjfMqBwJ2FgNq4nOAD/URdhZxTUxPUdfTTo/iAx687InxCnIskQnLKio3MVaXujrqJg
 aQY5w1u8Psiwcl027DdVetvTmcJb66WLyQyFhp9+CfcTenDYflDaMaIsceXjYKsr0YGX
 zdyA==
X-Gm-Message-State: AGi0PuZ8NisAcT3Q5nLo8UFxYlrM5LLBJHyC/mJd5d3EoG8eCyqkGdrS
 BzwV8chpiD/fZnHT5xToE1cnuxSwnkYRwNz5oLRIZDPFLDE=
X-Google-Smtp-Source: APiQypK9V8LOUAo2p2JRfwvNZ/Ch0LEigP8QEa1zOIQ8/08dWPYXBlRxmJJ6LrpnJJjKAbWb3rbv2s99Eqdq2hkvXD0=
X-Received: by 2002:a92:d484:: with SMTP id p4mr7560321ilg.307.1588757111202; 
 Wed, 06 May 2020 02:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
 <20200506074457.GK6112@intel.com>
 <CAJwc6Kum2SrGixZyJzAWjC71pxO8zkBJ7MBfdVhxZOFvWyw4RQ@mail.gmail.com>
 <20200506091840.GP6112@intel.com>
In-Reply-To: <20200506091840.GP6112@intel.com>
From: Artem Mygaiev <joculator@gmail.com>
Date: Wed, 6 May 2020 12:25:00 +0300
Message-ID: <CAJwc6Kvg3o2S3tYOoUqfCrg9eagErtStRkgQAASwm0uFPhVxew@mail.gmail.com>
Subject: Re: Question about sRGB framebuffer support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMjoxOCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDA2LCAyMDIwIGF0
IDEyOjA0OjIyUE0gKzAzMDAsIEFydGVtIE15Z2FpZXYgd3JvdGU6Cj4gPiBIZWxsbyBWaWxsZQo+
ID4KPiA+IE9uIFdlZCwgTWF5IDYsIDIwMjAgYXQgMTA6NDUgQU0gVmlsbGUgU3lyasOkbMOkCj4g
PiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBU
dWUsIE1heSAwNSwgMjAyMCBhdCAwMToyNDoxNlBNICswMzAwLCBBcnRlbSBNeWdhaWV2IHdyb3Rl
Ogo+ID4gPiA+IEhlbGxvIGFsbAo+ID4gPiA+Cj4gPiA+ID4gSSBhbSBjdXJyZW50bHkgd29ya2lu
ZyBvbiBEUk0vS01TIGRyaXZlciBmb3IgRnJlc2NvIExvZ2ljIEZMMjAwMCBVU0IgZGlzcGxheQo+
ID4gPiA+IGNvbnRyb2xsZXIgWzFdLiBJIGhhdmUgYWxyZWFkeSBpbXBsZW1lbnRlZCBhIFBPQyBk
cml2ZXIgWzJdIHdoaWNoIGlzIHdvcmtpbmcgZm9yCj4gPiA+ID4gbWUsIGFsdGhvdWdoIHRoZXJl
IGFyZSBzdGlsbCBwbGVudHkgb2YgdGhpbmdzIHRvIGltcHJvdmUgb3IgZml4LCBvZiBjb3Vyc2Uu
Cj4gPiA+ID4KPiA+ID4gPiBTbyBmYXIgSSBoYXZlIG9uZSB0aGluZyB0aGF0IEkgc29tZWhvdyBj
YW5ub3QgZmluZCBpbiBEUk0vS01TIGRvY3VtZW50YXRpb24gb3IKPiA+ID4gPiBleGlzdGluZyBk
cml2ZXJzOiBob3cgdG8gdGVsbCB0aGUgc3lzdGVtIHRoYXQgSFcgZXhwZWN0cyBzUkdCIChpLmUu
IG5vbi1saW5lYXIpCj4gPiA+ID4gY29sb3IgZW5jb2RpbmcgaW4gZnJhbWVidWZmZXJzPyBUaGlz
IGlzIGEgSFcgbGltaXRhdGlvbiB0aGF0IEkgY2Fubm90IGluZmx1ZW5jZQo+ID4gPiA+IGJ5IGNv
bmZpZ3VyYXRpb24uCj4gPiA+Cj4gPiA+IERvZXMgaXQgZG8gc29tZXRoaW5nIHRvIHByb2Nlc3Mg
dGhlIGRhdGEgdGhhdCByZXF1aXJlcyBsaW5lYXJpemF0aW9uCj4gPiA+IG9yIHdoeSBkb2VzIGl0
IGNhcmUgYWJvdXQgdGhlIGdhbW1hIGFwcGxpZWQgdG8gdGhlIGRhdGE/IEluIGEgdHlwaWNhbAo+
ID4gPiB1c2UgY2FzZSB0aGUgZGF0YSBpcyBqdXN0IHBhc3NlZCB0aHJvdWdoIHVubGVzcyB0aGUg
dXNlciBhc2tzIG90aGVyd2lzZSwKPiA+ID4gc28gaXQgZG9lc24ndCBtYXR0ZXIgbXVjaCB3aGF0
IGdhbW1hIHdhcyB1c2VkLiBUaG91Z2ggbW9zdCBkaXNwbGF5cwo+ID4gPiBwcm9iYWJseSBleHBl
Y3Qgc29tZXRoaW5nIHJlc2VtYmxpbmcgc1JHQiBnYW1tYSBieSBkZWZhdWx0LCBzbyB0aGF0J3MK
PiA+ID4gcHJlc3VtYWJseSB3aGF0IG1vc3QgdGhpbmdzIGdlbmVyYXRlLCBhbmQgaW1hZ2VzL3Zp
ZGVvcy9ldGMuIHByZXR0eQo+ID4gPiBtdWNoIGFsd2F5cyBoYXZlIGdhbW1hIGFscmVhZHkgYXBw
bGllZCB3aGVuIHRoZXkgYXJlIHByb2R1Y2VkLgo+ID4gPgo+ID4KPiA+IFVuZm9ydHVuYXRlbHkg
dGhlIEhXIHdhcyBkZXNpZ25lZCBpbiBhIHdheSB0aGF0IHdoZW4gaXQgaXMgY29uZmlndXJlZCB0
byAyNC1iaXQKPiA+IFJHQjg4OCBpdCBleHBlY3RzIHNSR0IgYW5kIGFwcGxpZXMgZGVnYW1tYSBh
dXRvbWF0aWNhbGx5LiBJdCBpcyBub3QgcG9zc2libGUgdG8KPiA+IGRpc2FibGUgdGhpcywgSSd2
ZSBhc2tlZCB2ZW5kb3IgYW5kIHRoZXkgY29uZmlybWVkIHRoaXMgWzFdLgo+Cj4gU28gaXQgYWx3
YXlzIGRvZXMgZGVnYW1tYStnYW1tYSBmb3Igbm8gcmVhbCByZWFzb24/IFRoYXQgc2hvdWxkbid0
Cj4gcmVhbGx5IG1hdHRlciAoYXBhcnQgZnJvbSBwb3RlbnRpYWxseSBsb3Npbmcgc29tZSBwcmVj
aXNpb24gaW4gdGhvc2UKPiBjb252ZXJzaW9ucykuCj4KCkl0IGFsd2F5cyBkb2VzIG9ubHkgZGVn
YW1tYSAoc1JHQiAtPiBsaW5lYXIpLCBzbyBpZiB5b3Ugc3VwcGx5IGxpbmVhciBSR0IgaXQKd2ls
bCB0b3RhbGx5IGNvcnJ1cHQgcGljdHVyZSBjb2xvcnMsIGUuZy4gdGhpcyBpcyBob3cga21zY3Vi
ZSBsb29rcyBsaWtlOgpodHRwczovL2dpdGh1Yi5jb20va2xvZ2cvZmwyMDAwX2RybS9pc3N1ZXMv
MTUKCj4gPgo+ID4gVGhlIG9ubHkgd29ya2Fyb3VuZCBJIGNvdWxkIGltcGxlbWVudCBub3cgaXMg
dG8gc3dpdGNoIGl0IHRvIDE2LWJpdCBSR0I1NjUgYW5kCj4gPiBwZXJmb3JtIGZyYW1lYnVmZmVy
IGNvbnZlcnNpb25zIGluIGRyaXZlciwgc2ltaWxhciB0byB3aGF0Cj4gPiBybV9mYl94cmdiODg4
OF90b19yZ2I1NjUoKSBhbGlrZSBoZWxwZXJzIGRvOyBidXQgaXQgd291bGQgYmUgc3RpbGwgZ3Jl
YXQgdG8KPiA+IHVuZGVyc3RhbmQgd2hldGhlciBpdCBpcyBwb3NzaWJsZSB0byBzdXBwb3J0IHNS
R0IuCj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9GcmVzY29Mb2dpYy9GTDIwMDAvaXNz
dWVzLzQyCj4gPgo+ID4gPiA+Cj4gPiA+ID4gQW55IHBvaW50ZXJzIGFyZSBncmVhdGx5IGFwcHJl
Y2lhdGVkLgo+ID4gPiA+Cj4gPiA+ID4gWzFdIHd3dy5mcmVzY29sb2dpYy5jb20vcHJvZHVjdC9z
aW5nbGUvZmwyMDAwCj4gPiA+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9rbG9nZy9mbDIwMDBf
ZHJtCj4gPiA+ID4KPiA+ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+ID4gIC0tIEFydGVtCj4gPiA+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4g
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IFZpbGxlIFN5cmrDpGzDpAo+ID4g
PiBJbnRlbAo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IEFydGVtIE15Z2FpZXYKPgo+IC0tCj4g
VmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKCkJlc3QgcmVnYXJkcywKQXJ0ZW0gTXlnYWlldgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
