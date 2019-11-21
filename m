Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F610513A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698CC6EE0A;
	Thu, 21 Nov 2019 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F7F6EDFD;
 Thu, 21 Nov 2019 11:15:29 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w24so2568028otk.6;
 Thu, 21 Nov 2019 03:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCewYooV+wiYd+qKmkInWmYxEycSQ/tK4iDINkYLKq0=;
 b=bek0R09wYIUZutS3JrfF97gRzLVPoTuCKS7KT9gd8uBQanKdvRadBYJ48ly3BZqVJJ
 48eH3ijiQEPh0wds1lBn88jqMzceN6GXggEVw4gcaIIs6lXrQ1nrJw7R1orfLAUfOdsb
 yL7X+BkyMOBoqRtR0xODKO8dOT3QWWRItxf7c/+3+t1pAAuGqNAk0hTD3VVu4nWKre8x
 Zi/zjUMo3+3A0kyuUM/DwJVoiK0poRU4tGHPxgcX+0gBUvfVpCy5ibYAhowPA+X7HNrL
 kX8+TwU5FSVfvOzMuZ0MY8PfZ1y8qeDVgaCkal6AMCL8zyE8gf3HEih7kr4MyDkt7G/M
 kZCQ==
X-Gm-Message-State: APjAAAVfWqXBjS6pl4Eu1LESsuUjmCUIBCR/lynJxfo5poyxCOdp8jo2
 v8/VfYtb10VB9a1u6iNxekcWrg2nX8+dfsQ7PjU=
X-Google-Smtp-Source: APXvYqymu1X3taIp7ZHn3jCvSH8EncZqLXVON5RdTitSF73mMmwZJae2IleRxn3eTQT06sDVVMHzvup3ELT0BPmIqco=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr5729479otn.167.1574334929135; 
 Thu, 21 Nov 2019 03:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
 <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
In-Reply-To: <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 12:15:17 +0100
Message-ID: <CAJZ5v0j515o9miy65MQkRURkw5bkFZxsva5pcgFW6Zfi+DE10Q@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDggUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEyOjAzIFBN
IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
VGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MTQgQU0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53
ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAy
MDE5IGF0IDEwOjM2OjMxUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gPiB3aXRo
IHRoZSBicmFuY2ggYW5kIHBhdGNoIGFwcGxpZWQ6Cj4gPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1
YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC8wM2M0YzgxNDFiMGZhMjkyZDc4MWJhZGZhMTg2
NDc5ZS9yYXcvNWM2MjY0MGFmYmM1N2Q2ZTY5ZWE5MjRjMzM4YmQyODM2ZTc3MGQwMi9naXN0Zmls
ZTEudHh0Cj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgdGVzdGluZy4gVG9vIGJhZCBpdCBkaWQgbm90
IGhlbHAgOiggSSBzdXBwb3NlIHRoZXJlIGlzIG5vCj4gPiA+IGNoYW5nZSBpZiB5b3UgaW5jcmVh
c2UgdGhlIGRlbGF5IHRvIHNheSAxcz8KPiA+Cj4gPiBXZWxsLCBsb29rIGF0IHRoZSBvcmlnaW5h
bCBwYXRjaCBpbiB0aGlzIHRocmVhZC4KPiA+Cj4gPiBXaGF0IGl0IGRvZXMgaXMgdG8gcHJldmVu
dCB0aGUgZGV2aWNlIChHUFUgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UpCj4gPiBmcm9tIGdvaW5n
IGludG8gYSBQQ0kgbG93LXBvd2VyIHN0YXRlIGJlZm9yZSBpbnZva2luZyBBTUwgdG8gcG93ZXIg
aXQKPiA+IGRvd24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBhdGNoIEFG
QUlDUyksIHNvIHdoeSB3b3VsZAo+ID4gdGhhdCBoYXZlIGFueXRoaW5nIHRvIGRvIHdpdGggdGhl
IGRlbGF5cz8KPiA+Cj4gPiBUaGUgb25seSByZWFzb24gd291bGQgYmUgdGhlIEFNTCBydW5uaW5n
IHRvbyBlYXJseSwgYnV0IHRoYXQgZG9lc24ndAo+ID4gc2VlbSBsaWtlbHkuICBJTU8gbW9yZSBs
aWtlbHkgaXMgdGhhdCB0aGUgQU1MIGRvZXMgc29tZXRoaW5nIHdoaWNoCj4gPiBjYW5ub3QgYmUg
ZG9uZSB0byBhIGRldmljZSBpbiBhIFBDSSBsb3ctcG93ZXIgc3RhdGUuCj4KPiBCVFcsIEknbSB3
b25kZXJpbmcgaWYgYW55b25lIGhhcyB0cmllZCB0byBza2lwIHRoZSBBTUwgaW5zdGVhZCBvZgo+
IHNraXBwaW5nIHRoZSBQQ0kgUE0gaW4gdGhpcyBjYXNlIChhcyBvZiA1LjQtcmMgdGhhdCB3b3Vs
ZCBiZSBhIHNpbWlsYXIKPiBwYXRjaCB0byBza2lwIHRoZSBpbnZvY2F0aW9ucyBvZgo+IF9fcGNp
X3N0YXJ0L2NvbXBsZXRlX3Bvd2VyX3RyYW5zaXRpb24oKSBpbiBwY2lfc2V0X3Bvd2VyX3N0YXRl
KCkgZm9yCj4gdGhlIGFmZmVjdGVkIGRldmljZSkuCgpNb3ZpbmcgdGhlIGRldi0+YnJva2VuX252
X3J1bnBtIHRlc3QgaW50bwpwY2lfcGxhdGZvcm1fcG93ZXJfdHJhbnNpdGlvbigpIChhbHNvIGZv
ciB0cmFuc2l0aW9ucyBpbnRvIEQwKSB3b3VsZApiZSBzdWZmaWNpZW50IGZvciB0aGF0IHRlc3Qg
aWYgSSdtIG5vdCBtaXN0YWtlbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
