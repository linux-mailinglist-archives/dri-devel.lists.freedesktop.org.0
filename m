Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA533116C27
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 12:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABFF89C46;
	Mon,  9 Dec 2019 11:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0BF89D73
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 11:17:26 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-UrGOOkm4MwOjwBuY8f0l4Q-1; Mon, 09 Dec 2019 06:17:22 -0500
Received: by mail-qt1-f199.google.com with SMTP id l4so10835001qte.18
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 03:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWTaEBFOGggC4ce4fgk8cEZpKpRsvl0bTsvJF/j06c4=;
 b=TEXMFUm4yf4RQY1mgdk4hAQnoyLtS/ekoO9xyHbsiTX/zJr7BQpd1eiqrDljvE5ZkS
 /Sk5cBcZF/dBCvbNaY3sMJTIz9BYgYmrZ70dMpcNXa795evXH+s2K9Q8gK09cUAddNc6
 s8AK/LGOWn4qs1uhKWcYdsfxwAbbAywl5hOYT0aKGEqL5sNsikxr37uT0J1CGVrCHiBG
 dQlXVbrB0kWhr3YBQbKn3pHEX2i8qd0F6nvf+oFxNRi4zaZ/OSGZ+WL6ZXRzIHSDMr1W
 RqTKTVAWcwDfzrrnp8SRJMCyFvq6n6kzxE4uzrxHMTy8GkfdtitAW6YcKHJI3GGOY4vr
 h7Fw==
X-Gm-Message-State: APjAAAXXiXWaz88XzxLx8c3rTX4xsjHgXU5ml5OqHJwpR5rp5ZJQXUVx
 8039PyvWZ5qja31QFMVOH+vnYe5tZ/eH/CKj2/8WABiXrB/ore1tNLGBALWDfvQymIAb7mv1mh6
 9X8IKMhTgkNnmd50B4QXKMshR2thplsJJVRVrxp1iCG2y
X-Received: by 2002:aed:2ae7:: with SMTP id t94mr24558835qtd.130.1575890242230; 
 Mon, 09 Dec 2019 03:17:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXGTAHVNmpg6Y/t9znqJomJSvKwVnFUd+47PosvATYXQKxa2ZeO+n3zSeHQjAU94Sh/b3qhJ7zCxvn9RMxJHI=
X-Received: by 2002:aed:2ae7:: with SMTP id t94mr24558808qtd.130.1575890241963; 
 Mon, 09 Dec 2019 03:17:21 -0800 (PST)
MIME-Version: 1.0
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
In-Reply-To: <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 9 Dec 2019 12:17:10 +0100
Message-ID: <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Lyude Paul <lyude@redhat.com>
X-MC-Unique: UrGOOkm4MwOjwBuY8f0l4Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575890245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gePB6fSq/rlJBPu1erNdnBIWumv6Nl4xKIQxuD48vdE=;
 b=FqAxmGcyTKc6+KRaedPn9IgiYn+EJPHb44puYyvAJKzGXYzgbHA+X8hZlWwQDeS5K89UVB
 xeeqXzCl8maQhqPvGIS8WwtLDBBqUuE7XMTt/Oll7TU9G0LR+AUJm3BkMqDJoFPPU6/70N
 kqPPFqn0Fx5GqX/UqqT4yhuJe6hWWXA=
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW55Ym9keSBhbnkgb3RoZXIgaWRlYXM/IEl0IHNlZW1zIHRoYXQgYm90aCBwYXRjaGVzIGRvbid0
IHJlYWxseSBmaXgKdGhlIGlzc3VlIGFuZCBJIGhhdmUgbm8gaWRlYSBsZWZ0IG9uIG15IHNpZGUg
dG8gdHJ5IG91dC4gVGhlIG9ubHkKdGhpbmcgbGVmdCBJIGNvdWxkIGRvIHRvIGZ1cnRoZXIgaW52
ZXN0aWdhdGUgd291bGQgYmUgdG8gcmV2ZXJzZQplbmdpbmVlciB0aGUgTnZpZGlhIGRyaXZlciBh
cyB0aGV5IHN1cHBvcnQgcnVucG0gb24gVHVyaW5nKyBHUFVzIG5vdywKYnV0IEkndmUgaGVhcmQg
dXNlcnMgaGF2aW5nIHNpbWlsYXIgaXNzdWVzIHRvIHRoZSBvbmUgTHl1ZGUgdG9sZCB1cwphYm91
dC4uLiBhbmQgSSBjb3VsZG4ndCB2ZXJpZnkgdGhhdCB0aGUgcGF0Y2hlcyBoZWxwIHRoZXJlIGVp
dGhlciBpbiBhCnJlbGlhYmxlIHdheS4KCk9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDg6NTUgUE0g
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMTktMTEt
MjcgYXQgMTI6NTEgKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDI3
LCAyMDE5IGF0IDEyOjQ5IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVyYmVyZ0Bp
bnRlbC5jb20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwNjoxMDozNlBN
IC0wNTAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gPiA+IEhleS10aGlzIGlzIGFsbW9zdCBjZXJ0
YWlubHkgbm90IHRoZSByaWdodCBwbGFjZSBpbiB0aGlzIHRocmVhZCB0bwo+ID4gPiA+IHJlc3Bv
bmQsCj4gPiA+ID4gYnV0IHRoaXMgdGhyZWFkIGhhcyBnb3R0ZW4gc28gZGVlcCBldm9sdXRpb24g
Y2FuJ3QgcHVzaCB0aGUgc3ViamVjdAo+ID4gPiA+IGZ1cnRoZXIgdG8KPiA+ID4gPiB0aGUgcmln
aHQsIGhlaC4gU28gSSdsbCBqdXN0IHJlc3BvbmQgaGVyZS4KPiA+ID4KPiA+ID4gOikKPiA+ID4K
PiA+ID4gPiBJJ3ZlIGJlZW4gZm9sbG93aW5nIHRoaXMgYW5kIGhlbHBpbmcgb3V0IEthcm9sIHdp
dGggdGVzdGluZyBoZXJlIGFuZAo+ID4gPiA+IHRoZXJlLgo+ID4gPiA+IFRoZXkgaGFkIG1lIHRl
c3QgQmpvcm4ncyBQQ0kgYnJhbmNoIG9uIHRoZSBYMSBFeHRyZW1lIDJuZCBnZW5lcmF0aW9uLAo+
ID4gPiA+IHdoaWNoCj4gPiA+ID4gaGFzIGEgdHVyaW5nIEdQVSBhbmQgODA4NjoxOTAxIFBDSSBi
cmlkZ2UuCj4gPiA+ID4KPiA+ID4gPiBJIHdhcyBhYm91dCB0byBzYXkgInRoZSBwYXRjaCBmaXhl
ZCB0aGluZ3MsIGhvb3JheSEiIGJ1dCBpdCBzZWVtcyB0aGF0Cj4gPiA+ID4gYWZ0ZXIKPiA+ID4g
PiB0cnlpbmcgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSBhIGNvdXBsZSB0aW1lcyB0aGluZ3MgZmFs
bCBhcGFydCBhZ2FpbjoKPiA+ID4KPiA+ID4gWW91IG1lYW4gJHN1YmplY3QgcGF0Y2gsIG5vPwo+
ID4gPgo+ID4KPiA+IG5vLCBJIHRvbGQgTHl1ZGUgdG8gdGVzdCB0aGUgcGNpL3BtIGJyYW5jaCBh
cyB0aGUgcnVucG0gZXJyb3JzIHdlIHNhdwo+ID4gb24gdGhhdCBtYWNoaW5lIGxvb2tlZCBkaWZm
ZXJlbnQuIFNvbWUgQkFSIGVycm9yIHRoZSBHUFUgcmVwb3J0ZWQKPiA+IGFmdGVyIGl0IGdvdCBy
ZXN1bWVkLCBzbyBJIHdhcyB3b25kZXJpbmcgaWYgdGhlIGRlbGF5cyB3ZXJlIGhlbHBpbmcKPiA+
IHdpdGggdGhhdC4gQnV0IGFmdGVyIHNvbWUgY3ljbGVzIGl0IHN0aWxsIGNhdXNlZCB0aGUgc2Ft
ZSBpc3N1ZSwgdGhhdAo+ID4gdGhlIEdQVSBkaXNhcHBlYXJlZC4gTGF0ZXIgdGVzdGluZyBhbHNv
IHNob3dlZCB0aGF0IG15IHBhdGNoIGFsc28KPiA+IGRpZG4ndCBzZWVtIHRvIGhlbHAgd2l0aCB0
aGlzIGVycm9yIHNhZGx5IDovCj4gPgo+ID4gPiA+IFsgIDY4Ni44ODMyNDddIG5vdXZlYXUgMDAw
MDowMTowMC4wOiBEUk06IHN1c3BlbmRpbmcgb2JqZWN0IHRyZWUuLi4KPiA+ID4gPiBbICA3NTIu
ODY2NDg0XSBBQ1BJIEVycm9yOiBBYm9ydGluZyBtZXRob2QgXF9TQi5QQ0kwLlBFRzAuUEVHUC5O
VlBPIGR1ZQo+ID4gPiA+IHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAo
MjAxOTA4MTYvcHNwYXJzZS01MjkpCj4gPiA+ID4gWyAgNzUyLjg2NjUwOF0gQUNQSSBFcnJvcjog
QWJvcnRpbmcgbWV0aG9kIFxfU0IuUENJMC5QR09OIGR1ZSB0bwo+ID4gPiA+IHByZXZpb3VzIGVy
cm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01MjkpCj4gPiA+ID4g
WyAgNzUyLjg2NjUyMV0gQUNQSSBFcnJvcjogQWJvcnRpbmcgbWV0aG9kIFxfU0IuUENJMC5QRUcw
LlBHMDAuX09OIGR1ZQo+ID4gPiA+IHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1F
T1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01MjkpCj4gPiA+Cj4gPiA+IFRoaXMgaXMgcHJvYmFibHkg
dGhlIGN1bHByaXQuIFRoZSBzYW1lIEFNTCBjb2RlIGZhaWxzIHRvIHByb3Blcmx5IHR1cm4KPiA+
ID4gb24gdGhlIGRldmljZS4KPiA+ID4KPiA+ID4gSXMgYWNwaWR1bXAgZnJvbSB0aGlzIHN5c3Rl
bSBhdmFpbGFibGUgc29tZXdoZXJlPwo+Cj4gQXR0YWNoZWQgaXQgdG8gdGhpcyBlbWFpbAo+Cj4g
PiA+Cj4gLS0KPiBDaGVlcnMsCj4gICAgICAgICBMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
