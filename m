Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F187310AF07
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 12:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5296E528;
	Wed, 27 Nov 2019 11:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218706E526
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 11:51:59 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-C4t1wTtcN8WzE3t1NhBqww-1; Wed, 27 Nov 2019 06:51:54 -0500
Received: by mail-qt1-f199.google.com with SMTP id g13so14571668qtq.16
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 03:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfYAUmGvWJZJSRiVsjUka5mWwDiEaeMITYpQOX7mwXY=;
 b=dkPykpZnnHUuRDtvR1sMTuEgacAjkIcZc5LRPexJmH9+7tjIjPG8m6lfxH3F5BIzVZ
 YD+fTWPhD8b24aO9zHNxyKypS4DZHzYzhdasPaw36+byQa4zIMGQMwCSzRXv4dYAv5Mt
 i+o+mjngJdUSnbBt91q/4LMI/MCpdANsl/rTYMFUFh01/q05A2QPW8CiYMvPTw0gIOY1
 5WiUkZ5Ms0Lb/x2WS03EsZbfMIiFVyXRrx/Ec7vCAUSPSxYOkRR95/J1ABsoFDXEh2or
 IgD8HoW4j7SoRzSH/Dxq1t18qWD8j88dKQUsJ40iBny86xEujz07uCMA4yocCm3BHy/j
 sA+A==
X-Gm-Message-State: APjAAAUDiQHwSKBAiKTxCoM5UvLnCK3660+6Y9OioEfJEduX1e1kO6/B
 rsACgRfDDGHld/qQRFl53kWP3YdwiMylbOzlLLDrhSYBA9+GYS9UDY/SmY+UtAkkn+oHnwwBZwx
 7m9zqbkcsF1zp3iCs5pnbMTUeuXMb60HRMP6kWrlBF+ft
X-Received: by 2002:a37:9083:: with SMTP id s125mr3828285qkd.192.1574855513971; 
 Wed, 27 Nov 2019 03:51:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZYMA+GCGq805VHWy/zJ5Esuj29dPvonXDjlfISqurrPh5cY/HxAxHE6xgDQ+gYrWiq10cFGm+kgXM2WTFJbE=
X-Received: by 2002:a37:9083:: with SMTP id s125mr3828257qkd.192.1574855513663; 
 Wed, 27 Nov 2019 03:51:53 -0800 (PST)
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
In-Reply-To: <20191127114856.GZ11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 27 Nov 2019 12:51:42 +0100
Message-ID: <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: C4t1wTtcN8WzE3t1NhBqww-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574855518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XhIGMtsi7KjLuMFks8eIn7a7OR+crqiPZAFOU/Qxss=;
 b=NtbC7q1/8VLDUM6dTDoUqMOHf0yXHvQN4Sq0apY2bQegfMS2SqdIz2D1H3MnuPte9sAiuT
 PAVvcsCFKkVuNRsSsQl29uusTzbjH4mClHEi08JTSTIUt/iINSFNJDFzJpsF0zK6LHHixZ
 ULSK9aYdulOHRu1OGw62c1Q5ItU0c5U=
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
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTI6NDkgUE0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDA2
OjEwOjM2UE0gLTA1MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiBIZXktdGhpcyBpcyBhbG1vc3Qg
Y2VydGFpbmx5IG5vdCB0aGUgcmlnaHQgcGxhY2UgaW4gdGhpcyB0aHJlYWQgdG8gcmVzcG9uZCwK
PiA+IGJ1dCB0aGlzIHRocmVhZCBoYXMgZ290dGVuIHNvIGRlZXAgZXZvbHV0aW9uIGNhbid0IHB1
c2ggdGhlIHN1YmplY3QgZnVydGhlciB0bwo+ID4gdGhlIHJpZ2h0LCBoZWguIFNvIEknbGwganVz
dCByZXNwb25kIGhlcmUuCj4KPiA6KQo+Cj4gPiBJJ3ZlIGJlZW4gZm9sbG93aW5nIHRoaXMgYW5k
IGhlbHBpbmcgb3V0IEthcm9sIHdpdGggdGVzdGluZyBoZXJlIGFuZCB0aGVyZS4KPiA+IFRoZXkg
aGFkIG1lIHRlc3QgQmpvcm4ncyBQQ0kgYnJhbmNoIG9uIHRoZSBYMSBFeHRyZW1lIDJuZCBnZW5l
cmF0aW9uLCB3aGljaAo+ID4gaGFzIGEgdHVyaW5nIEdQVSBhbmQgODA4NjoxOTAxIFBDSSBicmlk
Z2UuCj4gPgo+ID4gSSB3YXMgYWJvdXQgdG8gc2F5ICJ0aGUgcGF0Y2ggZml4ZWQgdGhpbmdzLCBo
b29yYXkhIiBidXQgaXQgc2VlbXMgdGhhdCBhZnRlcgo+ID4gdHJ5aW5nIHJ1bnRpbWUgc3VzcGVu
ZC9yZXN1bWUgYSBjb3VwbGUgdGltZXMgdGhpbmdzIGZhbGwgYXBhcnQgYWdhaW46Cj4KPiBZb3Ug
bWVhbiAkc3ViamVjdCBwYXRjaCwgbm8/Cj4KCm5vLCBJIHRvbGQgTHl1ZGUgdG8gdGVzdCB0aGUg
cGNpL3BtIGJyYW5jaCBhcyB0aGUgcnVucG0gZXJyb3JzIHdlIHNhdwpvbiB0aGF0IG1hY2hpbmUg
bG9va2VkIGRpZmZlcmVudC4gU29tZSBCQVIgZXJyb3IgdGhlIEdQVSByZXBvcnRlZAphZnRlciBp
dCBnb3QgcmVzdW1lZCwgc28gSSB3YXMgd29uZGVyaW5nIGlmIHRoZSBkZWxheXMgd2VyZSBoZWxw
aW5nCndpdGggdGhhdC4gQnV0IGFmdGVyIHNvbWUgY3ljbGVzIGl0IHN0aWxsIGNhdXNlZCB0aGUg
c2FtZSBpc3N1ZSwgdGhhdAp0aGUgR1BVIGRpc2FwcGVhcmVkLiBMYXRlciB0ZXN0aW5nIGFsc28g
c2hvd2VkIHRoYXQgbXkgcGF0Y2ggYWxzbwpkaWRuJ3Qgc2VlbSB0byBoZWxwIHdpdGggdGhpcyBl
cnJvciBzYWRseSA6LwoKPiA+IFsgIDY4Ni44ODMyNDddIG5vdXZlYXUgMDAwMDowMTowMC4wOiBE
Uk06IHN1c3BlbmRpbmcgb2JqZWN0IHRyZWUuLi4KPiA+IFsgIDc1Mi44NjY0ODRdIEFDUEkgRXJy
b3I6IEFib3J0aW5nIG1ldGhvZCBcX1NCLlBDSTAuUEVHMC5QRUdQLk5WUE8gZHVlIHRvIHByZXZp
b3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01MjkpCj4g
PiBbICA3NTIuODY2NTA4XSBBQ1BJIEVycm9yOiBBYm9ydGluZyBtZXRob2QgXF9TQi5QQ0kwLlBH
T04gZHVlIHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYv
cHNwYXJzZS01MjkpCj4gPiBbICA3NTIuODY2NTIxXSBBQ1BJIEVycm9yOiBBYm9ydGluZyBtZXRo
b2QgXF9TQi5QQ0kwLlBFRzAuUEcwMC5fT04gZHVlIHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxf
TE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJzZS01MjkpCj4KPiBUaGlzIGlzIHByb2JhYmx5
IHRoZSBjdWxwcml0LiBUaGUgc2FtZSBBTUwgY29kZSBmYWlscyB0byBwcm9wZXJseSB0dXJuCj4g
b24gdGhlIGRldmljZS4KPgo+IElzIGFjcGlkdW1wIGZyb20gdGhpcyBzeXN0ZW0gYXZhaWxhYmxl
IHNvbWV3aGVyZT8KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
