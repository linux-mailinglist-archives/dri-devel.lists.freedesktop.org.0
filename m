Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EE556B8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C006E20D;
	Tue, 25 Jun 2019 18:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954126E20C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:04:06 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w7so13239911oic.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 11:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+ZhBSNWMG71/hoVLbHT+wkJMxkbtm8D8gJnUatkLjU=;
 b=B31M8QlXf6iqYZ/qeyLpzjGF10TtuKOAew+JWXE3B+/bGLA7nYz88IybcdwHJur5n9
 hlik1vu/WrKwbyJPGEiIFxCLYjwbVk45iSQUM6os0WH473TAJVrZAxSjaPod8PdAaYhb
 1szhWYVwhYDr0bAU9ELj/Bbz4gLqLwqisTtJ5QSQi8M7YTxB7+3hEy5dm5EaQpxpE6SF
 8K5bFuPxhVqE6BrLKDIGzZ7yrodAilrRZ5ZcBwbI+55jeEjw6MC7O6Oqm7zDXu2esh96
 TQt5oHzNMhEAK8c0+rbE749ih8GKurf4zy3C7coGOkB3wOwh9+uWyLG/kNxn2jhZgDOs
 UKtg==
X-Gm-Message-State: APjAAAU7DOfslSd5vys/VD7lOgXj4+xggdHwk1IYr84/ox5kz4N57jrk
 BCfHhAcl5Lugv+htGUedXMh1YGRgr/iIqsJZAsaHPQ==
X-Google-Smtp-Source: APXvYqz6T9TVXWGjVm88Qsyic/J7sZ8rY/3bbGIhMBzOCJnst1XOiiw6CA8iBdJBDNkwj6/NRoOe4+QnfOGQ8i6wx08=
X-Received: by 2002:aca:d60c:: with SMTP id n12mr15532591oig.105.1561485845899; 
 Tue, 25 Jun 2019 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de> <20190625150053.GJ11400@dhcp22.suse.cz>
In-Reply-To: <20190625150053.GJ11400@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Jun 2019 11:03:53 -0700
Message-ID: <CAPcyv4j1e5dbBHnc+wmtsNUyFbMK_98WxHNwuD_Vxo4dX9Ce=Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v+ZhBSNWMG71/hoVLbHT+wkJMxkbtm8D8gJnUatkLjU=;
 b=JxNg8q13dPoy4++bWTLKe91YyHwlNjFnbzSb9Om/uZZjmzDhnDweJK+SXVAHxvQJR0
 312VGhMneNMNXAmSV6hMRZIzT4bIOEkHXQoVC3M4u9DoF+fAlTSvPDyjEiVH1eTZKAv6
 dp2nCpruoX6QC/iIKdTTjv2kOKKIAnLDyxY0m5z6y8S0clG2ID2Kd3dCyQI6rh541kFT
 eDdVfoEDrUI7YN4BuqjchbcpiBzhNte5u19MgaVZHdA1NCRepz4PjjVsuhg3X5n+bs85
 X+HfBTjHRFVQoAtJFMiji2LpwQIjXK1seUAZDPl9j1P4iwnhlcEX3jRF05VVFomoae2Q
 6U5g==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgODowMSBBTSBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSAyNS0wNi0xOSAwOToyMzoxNywgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCAxMToyNDo0OEFNIC0wNzAw
LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IEkgYXNrZWQgZm9yIHRoaXMgc2ltcGx5IGJlY2F1
c2UgaXQgd2FzIG5vdCBleHBvcnRlZCBoaXN0b3JpY2FsbHkuIEluCj4gPiA+IGdlbmVyYWwgSSB3
YW50IHRvIGVzdGFibGlzaCBleHBsaWNpdCBleHBvcnQtdHlwZSBjcml0ZXJpYSBzbyB0aGUKPiA+
ID4gY29tbXVuaXR5IGNhbiBzcGVuZCBsZXNzIHRpbWUgZGViYXRpbmcgd2hlbiB0byB1c2UgRVhQ
T1JUX1NZTUJPTF9HUEwKPiA+ID4gWzFdLgo+ID4gPgo+ID4gPiBUaGUgdGhvdWdodCBpbiB0aGlz
IGluc3RhbmNlIGlzIHRoYXQgaXQgaXMgbm90IGhpc3RvcmljYWxseSBleHBvcnRlZAo+ID4gPiB0
byBtb2R1bGVzIGFuZCBpdCBpcyBzYWZlciBmcm9tIGEgbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmUg
dG8gc3RhcnQKPiA+ID4gd2l0aCBHUEwtb25seSBmb3IgbmV3IHN5bWJvbHMgaW4gY2FzZSB3ZSBk
b24ndCB3YW50IHRvIG1haW50YWluIHRoYXQKPiA+ID4gaW50ZXJmYWNlIGxvbmctdGVybSBmb3Ig
b3V0LW9mLXRyZWUgbW9kdWxlcy4KPiA+ID4KPiA+ID4gWWVzLCB3ZSBhbHdheXMgcmVzZXJ2ZSB0
aGUgcmlnaHQgdG8gcmVtb3ZlIC8gY2hhbmdlIGludGVyZmFjZXMKPiA+ID4gcmVnYXJkbGVzcyBv
ZiB0aGUgZXhwb3J0IHR5cGUsIGJ1dCBoaXN0b3J5IGhhcyBzaG93biB0aGF0IGV4dGVybmFsCj4g
PiA+IHByZXNzdXJlIHRvIGtlZXAgYW4gaW50ZXJmYWNlIHN0YWJsZSAoY29udHJhcnkgdG8KPiA+
ID4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1hcGktbm9uc2Vuc2UucnN0KSB0ZW5kcyB0
byBiZSBsZXNzIGZvcgo+ID4gPiBHUEwtb25seSBleHBvcnRzLgo+ID4KPiA+IEZ1bGx5IGFncmVl
ZC4gIEluIHRoZSBlbmQgdGhlIGRlY2lzaW9uIGlzIHdpdGggdGhlIE1NIG1haW50YWluZXJzLAo+
ID4gdGhvdWdoLCBhbHRob3VnaCBJJ2QgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaW4gdGhpcyBzZXJp
ZXMuCj4KPiBJIGFtIHNvcnJ5IGJ1dCBJIGFtIG5vdCByZWFsbHkgY29udmluY2VkIGJ5IHRoZSBh
Ym92ZSByZWFzb25pbmcgd3J0LiB0bwo+IHRoZSBhbGxvY2F0b3IgQVBJIGFuZCBpdCBoYXMgYmVl
biBhIHN1YmplY3Qgb2YgbWFueSBjaGFuZ2VzIG92ZXIgdGltZS4gSQo+IGRvIG5vdCByZW1lbWJl
ciBhIHNpbmdsZSBjYXNlIHdoZXJlIHdlIHdvdWxkIGJlIGJlbmRpbmcgdGhlIGFsbG9jYXRvcgo+
IEFQSSBiZWNhdXNlIG9mIGV4dGVybmFsIG1vZHVsZXMgYW5kIEkgYW0gcHJldHR5IHN1cmUgd2Ug
d2lsbCBwdXNoIGJhY2sKPiBoZWF2aWx5IGlmIHRoYXQgd2FzIHRoZSBjYXNlIGluIHRoZSBmdXR1
cmUuCgpUaGlzIHNlZW1zIHRvIHNheSB0aGF0IHlvdSBoYXZlIG5vIGRpcmVjdCBleHBlcmllbmNl
IG9mIGRlYWxpbmcgd2l0aApjaGFuZ2luZyBzeW1ib2xzIHRoYXQgdGhhdCBhIHByb21pbmVudCBv
dXQtb2YtdHJlZSBtb2R1bGUgbmVlZHM/IEdQVQpkcml2ZXJzIGFuZCB0aGUgY29yZS1tbSBhcmUg
b24gYSBwYXRoIHRvIGluY3JlYXNlIHRoZWlyIGNvb3BlcmF0aW9uIG9uCm1lbW9yeSBtYW5hZ2Vt
ZW50IG1lY2hhbmlzbXMgb3ZlciB0aW1lLCBhbmQgc3ltYm9sIGV4cG9ydCBjaGFuZ2VzIGZvcgpv
dXQtb2YtdHJlZSBHUFUgZHJpdmVycyBoYXZlIGJlZW4gYSBzaWduaWZpY2FudCBzb3VyY2Ugb2Yg
ZnJpY3Rpb24gaW4KdGhlIHBhc3QuCgo+IFNvIGluIHRoaXMgcGFydGljdWxhciBjYXNlIEkgd291
bGQgZ28gd2l0aCBjb25zaXN0ZW5jeSBhbmQgZXhwb3J0IHRoZQo+IHNhbWUgd2F5IHdlIGRvIHdp
dGggb3RoZXIgZnVuY3Rpb25zLiBBbHNvIHdlIGRvIG5vdCB3YW50IHBlb3BsZSB0bwo+IHJlaW52
ZW50IHRoaXMgQVBJIGFuZCBzY3JldyB0aGF0IGxpa2Ugd2UgaGF2ZSBzZWVuIGluIG90aGVyIGNh
c2VzIHdoZW4KPiBleHRlcm5hbCBtb2R1bGVzIHRyeSByZWltcGxlbWVudCBjb3JlIGZ1bmN0aW9u
YWxpdHkgdGhlbXNlbHZlcy4KCkNvbnNpc3RlbmN5IGlzIGEgd2VhayBhcmd1bWVudCB3aGVuIHRo
ZSBjb3N0IHRvIHRoZSB1cHN0cmVhbSBjb21tdW5pdHkKaXMgbmVnbGlnaWJsZS4gSWYgdGhlIHNh
bWUgZnVuY3Rpb25hbGl0eSB3YXMgYXZhaWxhYmxlIHZpYSBhbm90aGVyIC8KYWxyZWFkeSBleHBv
cnRlZCBpbnRlcmZhY2UgKnRoYXQqIHdvdWxkIGJlIGFuIGFyZ3VtZW50IHRvIG1haW50YWluIHRo
ZQpleGlzdGluZyBleHBvcnQgcG9saWN5LiAiQ29uc2lzdGVuY3kiIGluIGFuZCBvZiBpdHNlbGYg
aXMgbm90IGEKcHJlY2VkZW50IHdlIGNhbiB1c2UgbW9yZSB3aWRlbHkgaW4gZGVmYXVsdCBleHBv
cnQtdHlwZSBkZWNpc2lvbnMuCgpFZmZlY3RpdmVseSBJJ20gYXJndWluZyBFWFBPUlRfU1lNQk9M
X0dQTCBieSBkZWZhdWx0IHdpdGggYSBsYXRlcgpkZWNpc2lvbiB0byBkcm9wIHRoZSBfR1BMLiBT
aW1pbGFyIHRvIGhvdyB3ZSBhcmUgY2FyZWZ1bCB0byBtYXJrIHN5c2ZzCmludGVyZmFjZXMgaW4g
RG9jdW1lbnRhdGlvbi9BQkkvIHRoYXQgd2UgYXJlIG5vdCBmdWxseSBjb21taXR0ZWQgdG8KbWFp
bnRhaW5pbmcgb3ZlciB0aW1lLCBvciBhcmUgb3RoZXJ3aXNlIHNvIG5ldyB0aGF0IHRoZXJlIGlz
IG5vdCB5ZXQgYQpnb29kIHJlYWQgb24gd2hldGhlciB0aGV5IGNhbiBiZSBtYWRlIHBlcm1hbmVu
dC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
