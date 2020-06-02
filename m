Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B71EBE07
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244206E3E5;
	Tue,  2 Jun 2020 14:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713F6E077;
 Tue,  2 Jun 2020 14:21:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r9so3118406wmh.2;
 Tue, 02 Jun 2020 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4GBFKi4AE0Zui6AvlkZAGUYSPOB17V3NVuaNVtHxfg8=;
 b=iDu5SHMRXV9p8WONfSFl2dlTGUryo+ZFiH/JA8c+BGpC0QU91UUvpFSqaIUDjwglhJ
 +yHCvrxwjM2SKBwJwKYa1GbRuovooFIfzoTCF1yl2ITib0CXGS1Wo55BhIedjUGxf4vx
 RG3eMkMSlDO2j3hjTVY5//OWrK6qpsshclWS/Qv5yLsvOaeSolKJbGUB+khoj/r74KkQ
 I2vw01NGl+huCDwhWUg0CQZssrqjSa/WN+ITveeRJgNZRro0WURSoglT5zeA200cars1
 PrtMq6YXBy9H/+RDUKJTr9cn+1Nbv3AFR3KzoMoRCs+U2F21+pZUjx6mwCqDr0z0eaar
 KyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4GBFKi4AE0Zui6AvlkZAGUYSPOB17V3NVuaNVtHxfg8=;
 b=RXM97RPo8cG/b64yZ6f0MxpDfPyWzresvPGg7OxgsrpLu4sIe/5SYaeB/FR0LK5rTo
 JJTis0gFagAYa/o9cNCqKCkl3UeT+10604GbCR6wE7YoM5zP/PK9U6q5k5DNHYlg/13Q
 27CboEy9xGfg/VVYAq4efHZt99okgGm5HvfH8cV4yrm4WT4Sh3DBYAawF1NkrUo9Uj4g
 vevYA57gDMMypgaeksluJqKZYdEBYVdNVVoBVZydNIwFnLN70I6AumPAB+Nj8zVlrxsX
 z/U+ug3m5XrBwX1gzd0TsmqMbxe1EtVYuyNhLbPg1aMfeZ5VWyb152gjxr/I+fH23enI
 Kjzw==
X-Gm-Message-State: AOAM53286aL3Wmj/HVGs+ILSaDH0rE489bLALiFJIs1Ig0e1BQ2SV2bt
 hvYA4ovm1TxAgGQGZZ2wj+CLLuP8i29d1kyLG5U=
X-Google-Smtp-Source: ABdhPJwiSS2Ry+bKR7lnwZokdKyewXO4Wr3aDQ7TiyQVNw6HUV1RVyRn3Wt0zFxfu5fSXC17pT+RIs2BO9uqIhfNByE=
X-Received: by 2002:a05:600c:2201:: with SMTP id
 z1mr4316621wml.70.1591107684025; 
 Tue, 02 Jun 2020 07:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010E23E538@FMSMSX108.amr.corp.intel.com>
 <CAHp75Vfe5dQkOiFoAZx5b-NS1afiD-YC_w+5LcX8P1Hm0ASenA@mail.gmail.com>
In-Reply-To: <CAHp75Vfe5dQkOiFoAZx5b-NS1afiD-YC_w+5LcX8P1Hm0ASenA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jun 2020 10:21:12 -0400
Message-ID: <CADnq5_OO=gyo22ZrXp6pDtz2QZ2=LC429u_kkd0ZvX4=M3mBPw@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, "Stankiewicz,
 Piotr" <piotr.stankiewicz@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMiwgMjAyMCBhdCAxMDowMCBBTSBBbmR5IFNoZXZjaGVua28KPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMiwgMjAyMCBhdCA0OjM4
IFBNIFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPiB3cm90ZToKPiA+
ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YKPiA+ID5QaW90
ciBTdGFua2lld2ljego+ID4gPlNlbnQ6IFR1ZXNkYXksIEp1bmUgMiwgMjAyMCA1OjIxIEFNCj4g
PiA+VG86IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT47IENocmlzdGlh
biBLw7ZuaWcKPiA+ID48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgRGF2aWQgWmhvdSA8RGF2
aWQxLlpob3VAYW1kLmNvbT47IERhdmlkCj4gPiA+QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsg
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPkNjOiBTdGFua2lld2ljeiwgUGlv
dHIgPHBpb3RyLnN0YW5raWV3aWN6QGludGVsLmNvbT47IGRyaS0KPiA+ID5kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0KPiA+
ID5rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+U3ViamVjdDogW1BBVENIIDA3LzE1XSBkcm0v
YW1kZ3B1OiB1c2UgUENJX0lSUV9NU0lfVFlQRVMgd2hlcmUKPiA+ID5hcHByb3ByaWF0ZQo+Cj4g
Li4uCj4KPiA+ID4gICAgICAgICAgICAgICBpbnQgbnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChh
ZGV2LT5wZGV2KTsKPiA+ID4gICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4gPiA+
Cj4gPiA+LSAgICAgICAgICAgICAgaWYgKG52ZWMgPD0gMCkgewo+ID4gPisgICAgICAgICAgICAg
IGlmIChudmVjID4gMCkKPiA+ID4rICAgICAgICAgICAgICAgICAgICAgIGZsYWdzID0gUENJX0lS
UV9NU0lfVFlQRVM7Cj4gPiA+KyAgICAgICAgICAgICAgZWxzZQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgZmxhZ3MgPSBQQ0lfSVJRX01TSTsKPiA+ID4tICAgICAgICAgICAgICB9IGVsc2Ug
ewo+ID4gPi0gICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPSBQQ0lfSVJRX01TSSB8IFBDSV9J
UlFfTVNJWDsKPiA+ID4tICAgICAgICAgICAgICB9Cj4gPgo+ID4gTWlub3Igbml0Ogo+ID4KPiA+
IElzIGl0IHJlYWxseSBuZWNlc3NhcnkgdG8gc2V0IGRvIHRoaXMgY2hlY2s/ICBDYW4gZmxhZ3Mg
anVzdAo+ID4gYmUgc2V0Pwo+ID4KPiA+IEkuZS46Cj4gPiAgICAgICAgIGZsYWdzID0gUENJX0lS
UV9NU0lfVFlQRVM7Cj4gPgo+ID4gcGNpX2FsbG9jX2lycV92ZWN0b3IoKSB0cmllcyBzdHVmZiBp
biBvcmRlci4gIElmIE1TSVggaXMgbm90IGF2YWlsYWJsZSwKPiA+IGl0IHdpbGwgdHJ5IE1TSS4K
Pgo+IFRoYXQncyBhbHNvIHdoYXQgSSBwcm9wb3NlZCBlYXJsaWVyLiBCdXQgSSBzdWdnZXN0ZWQg
YXMgd2VsbCB0byB3YWl0Cj4gZm9yIEFNRCBwZW9wbGUgdG8gY29uZmlybSB0aGF0IG5laXRoZXIg
cGNpX21zaXhfdmVjX2NvdW50KCkgbm9yIGZsYWdzCj4gaXMgbmVlZGVkIGFuZCB3ZSBjYW4gZGly
ZWN0bHkgc3VwcGx5IE1TSV9UWVBFUyB0byB0aGUgYmVsb3cgY2FsbC4KPgoKSSB0aGluayBpdCB3
YXMgbGVmdG92ZXIgZnJvbSBkZWJ1Z2dpbmcgYW5kIGp1c3QgdG8gYmUgY2FyZWZ1bC4gIFdlIGhh
ZApzb21lIGlzc3VlcyB3aGVuIHdlIG9yaWdpbmFsbHkgZW5hYmxlZCBNU0ktWCBvbiBjZXJ0YWlu
IGJvYXJkcy4gIFRoZQpmaXggd2FzIHRvIGp1c3QgYWxsb2NhdGUgYSBzaW5nbGUgdmVjdG9yIChz
aW5jZSB0aGF0IGlzIGFsbCB3ZSB1c2UKYW55d2F5KSBhbmQgd2Ugd2VyZSB1c2luZyB0aGUgd3Jv
bmcgaXJxIChwZGV2LT5pcnEgdnMKcGNpX2lycV92ZWN0b3IocGRldiwgMCkpLiAgRm9yIHJlZmVy
ZW5jZSwgdGhlIG9yaWdpbmFsIHBhdGNoIHRvIGFkZApNU0ktWDoKCmNvbW1pdCBiZDY2MGY0ZjEx
MTE2MWY2MDM5MmRkMDI0MjRjM2EzZDIyNDBkYzJmCkF1dGhvcjogc2hhb3l1bmwgPHNoYW95dW4u
bGl1QGFtZC5jb20+CkRhdGU6ICAgVHVlIE9jdCAxIDE1OjUyOjMxIDIwMTkgLTA0MDAKCiAgICBk
cm0vYW1kZ3B1IDogZW5hYmxlIG1zaXggZm9yIGFtZGdwdSBkcml2ZXIKCiAgICBXZSBtaWdodCB1
c2VkIG91dCBvZiB0aGUgbXNpIHJlc291cmNlcyBpbiBzb21lIGNsb3VkIHByb2plY3QKICAgIHdo
aWNoIGhhdmUgYSBsb3QgZ3B1IGRldmljZXMoaW5jbHVkaW5nIFBGIGFuZCBWRiksIG1zaXggY2Fu
CiAgICBwcm92aWRlIGVub3VnaCByZXNvdXJjZXMgZnJvbSBzeXN0ZW0gbGV2ZWwgdmlldwoKICAg
IFNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQuY29tPgogICAgUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KICAgIFNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCkFuZCB0
aGUgZml4OgoKY29tbWl0IDhhNzQ1YzdmZjJkZGI4NTExZWY3NjBiNGQ5Y2I0Y2Y1NmExNWZjOGQK
QXV0aG9yOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkRhdGU6ICAg
VGh1IE9jdCAzIDEwOjM0OjMwIDIwMTkgLTA1MDAKCiAgICBkcm0vYW1kZ3B1OiBpbXByb3ZlIE1T
SS1YIGhhbmRsaW5nICh2MykKCiAgICBDaGVjayB0aGUgbnVtYmVyIG9mIHN1cHBvcnRlZCB2ZWN0
b3JzIGFuZCBmYWxsIGJhY2sgdG8gTVNJIGlmCiAgICB3ZSByZXR1cm4gb3IgZXJyb3Igb3IgMCBN
U0ktWCB2ZWN0b3JzLgoKICAgIHYyOiBvbmx5IGFsbG9jYXRlIG9uZSB2ZWN0b3IuICBXZSBjYW4n
dCBjdXJyZW50bHkgdXNlIG1vcmUgdGhhbgogICAgb25lIGFueXdheS4KCiAgICB2MzogaW5zdGFs
bCB0aGUgaXJxIG9uIHZlY3RvciAwLgoKICAgIFRlc3RlZC1ieTogVG9tIFN0IERlbmlzIDx0b20u
c3RkZW5pc0BhbWQuY29tPgogICAgUmV2aWV3ZWQtYnk6IFNoYW95dW4gbGl1ICA8c2hhb3l1bi5s
aXVAYW1kLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
