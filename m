Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6710399D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D166E43B;
	Wed, 20 Nov 2019 12:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD26E430
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:10:06 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-aN9Far5OPAa-1shjLOwMcg-1; Wed, 20 Nov 2019 07:10:03 -0500
Received: by mail-qt1-f198.google.com with SMTP id x50so16955628qth.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 04:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7p4rYZMTKBgx0gRU2Y/8e1TMHUDBS8YuAIk55PkbbCM=;
 b=so9tTFUgqwInW3us/dJJObJ+oBiU2S1wcgJBGaikLiGT/eAa5lnnoyMWyiWQ0eTx09
 7kjAFPbXIs2VelBkQRgFJ48yWDXlwmeGoRMEUC6p2bcNH/kadce4LcBL7iPxW4pU5yVJ
 NkeQSJRCEa17RfZELUAA0DxfmtkARkBtdeUv/CMvTnbxXE4pwiD6nhUXeN/mSciC9mjq
 Ynff/5+5UiTH8WIx8PpXDpPEU9iF3dhFP70m9PqEXiGeztQzvvNtkShBN4Lz3YsZn78X
 dSXj80NBVsHm8RN5rM18wsb22jZLGU5X4jIOL6D6AsKd4JkbR2Mm5w7BrWk3mLGXt6KH
 0FIQ==
X-Gm-Message-State: APjAAAWgQQmZSKl/DpgCMKCafCA3Z2nitiU34xBfIXGSGk4+S7wXtG4V
 G4Aspyb0SGyz+JJWlcQplBtIyoZoRLjvRXP9FnJnbVsD2FXMY8g8uwYHM+TqI0sOiBZm24Whvmb
 01Ht6R4qOs6CTz76c7n4VuOpKlVwZfT2QSCMANP4Wgcee
X-Received: by 2002:a37:9083:: with SMTP id s125mr2035557qkd.192.1574251802834; 
 Wed, 20 Nov 2019 04:10:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4S4Yg7VICuKWth27RQHwQbnKmUWBvPlof4TRp3+1St7VECDM0n728MYoDSOHL10176AueXActPrjMWKfP+xo=
X-Received: by 2002:a37:9083:: with SMTP id s125mr2035532qkd.192.1574251802589; 
 Wed, 20 Nov 2019 04:10:02 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
 <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
In-Reply-To: <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 13:09:51 +0100
Message-ID: <CACO55tupFbq0T1DcR+C+YxtPR=csPBQhwVXz_SHWT5F8bRK8JA@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: aN9Far5OPAa-1shjLOwMcg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574251805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knFBJ+jIledi9b7Ia4deKRuiHotpqtnvRJzVLFu8J74=;
 b=QNjwz0v0+sKtLSrSCsRENWr/NExXeoaWie5AGnPYEWgCLQwCQb+Gvr7bPoouRQzwHgsw7N
 LZKuqcvrgtBjyeqPik+yK4+Ctw/jF1QPtyekxFaC0sYAPygrcHTkNedIjZslihNR3NE9sR
 n6OrU+nciibRt43ZsCmj0Ka1UyGxmTw=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowNiBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDEyOjQ4IFBNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEyOjIyIFBN
IE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMTo1MjoyMkFNICswMTAw
LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5
IGF0IDExOjE4IEFNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0Bp
bnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+Cj4gW2N1dF0KPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IE9oLCBzbyBkb2VzIGl0IGxvb2sgbGlrZSB3ZSBhcmUgdHJ5aW5nIHRvIHdvcmsgYXJvdW5k
IEFNTCB0aGF0IHRyaWVkCj4gPiA+ID4gPiB0byB3b3JrIGFyb3VuZCBzb21lIHByb2JsZW1hdGlj
IGJlaGF2aW9yIGluIExpbnV4IGF0IG9uZSBwb2ludD8KPiA+ID4gPgo+ID4gPiA+IFllcywgaXQg
bG9va3MgbGlrZSBzbyBpZiBJIHJlYWQgdGhlIEFTTCByaWdodC4KPiA+ID4KPiA+ID4gT0ssIHNv
IHRoYXQgd291bGQgY2FsbCBmb3IgYSBETUktYmFzZWQgcXVpcmsgYXMgdGhlIHJlYWwgY2F1c2Ug
Zm9yIHRoZQo+ID4gPiBpc3N1ZSBzZWVtcyB0byBiZSB0aGUgQU1MIGluIHF1ZXN0aW9uLCB3aGlj
aCBtZWFucyBhIGZpcm13YXJlIHByb2JsZW0uCj4gPiA+Cj4gPgo+ID4gQW5kIEkgZGlzYWdyZWUg
YXMgdGhpcyBpcyBhIGxpbnV4IHNwZWNpZmljIHdvcmthcm91bmQgYW5kIHdpbmRvd3MgZ29lcwo+
ID4gdGhhdCBwYXRoIGFuZCBzdWNjZWVkcy4gVGhpcyBmaXJtd2FyZSBiYXNlZCB3b3JrYXJvdW5k
IHdhcyBhZGRlZCwKPiA+IGJlY2F1c2UgaXQgYnJva2Ugb24gTGludXguCj4KPiBBcHBhcmVudGx5
IHNvIGF0IHRoZSB0aW1lIGl0IHdhcyBhZGRlZCwgYnV0IHdvdWxkIGl0IHN0aWxsIGJyZWFrIGFm
dGVyCj4gdGhlIGtlcm5lbCBjaGFuZ2VzIG1hZGUgc2luY2UgdGhlbj8KPgo+IE1vcmVvdmVyLCBo
YXMgaXQgbm90IGJlY29tZSBoYXJtZnVsIG5vdz8gIElPVywgd291bGRuJ3QgaXQgd29yayBhZnRl
cgo+IHJlbW92aW5nIHRoZSAiTGludXggd29ya2Fyb3VuZCIgZnJvbSB0aGUgQU1MPwo+Cj4gVGhl
IG9ubHkgd2F5IHRvIHZlcmlmeSB0aGF0IEkgY2FuIHNlZSB3b3VsZCBiZSB0byBydW4gdGhlIHN5
c3RlbSB3aXRoCj4gY3VzdG9tIEFDUEkgdGFibGVzIHdpdGhvdXQgdGhlICJMaW51eCB3b3JrYXJv
dW5kIiBpbiB0aGUgQU1MIGluCj4gcXVlc3Rpb24uCj4KCnRoZSB3b3JrYXJvdW5kIGlzIG5vdCBl
bmFibGVkIGJ5IGRlZmF1bHQsIGJlY2F1c2UgaXQgaGFzIHRvIGJlCmV4cGxpY2l0bHkgZW5hYmxl
ZCBieSB0aGUgdXNlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
