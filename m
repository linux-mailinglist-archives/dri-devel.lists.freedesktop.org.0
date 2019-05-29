Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B82FB08
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3D6E31A;
	Thu, 30 May 2019 11:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4426E0F1;
 Wed, 29 May 2019 14:41:44 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id a186so4278258itg.0;
 Wed, 29 May 2019 07:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J07LSTl0M3xW1XshAcWkk9rLC9WTA+EH6ULXPA37iqk=;
 b=Iw8rZYN+E7PkKWxwzpKOzm8HNHaYy2WpwuSSQvyF4x7+QXKfVS4SIcu5xm2ReTB744
 65Zn0ISO8rSrFxZXbvVlinn7md+jCsSq0cGpimK4uBrjzNzKyS3l6CumU6ViivJvVn6w
 9GmbEoFXg/eLXKMxahVhBVOAF+Vt6/vJs8wOxi19/X4y86cGWH04tQj/T62vnKUK98Yu
 Ovxb3cg4LgbnH1BYHch9EB0K+X1ICTuBp2RlR4XXtwHMKFo95xQWpOkSVykx7s2q5tAJ
 HbH4Jdz/U7YbC38jvmV9gnY5EZD8nNBm5+yDyjae1F5fegGL6DRliOD7fOG240iydQoW
 dT/g==
X-Gm-Message-State: APjAAAXh6wKCBN7ShA3xBWQVvk63w/98lJZUDWf3QoDGJ2RNwLdkj3gT
 q9VGwYuQ0pR+zjOeNR9dXi+zCrrw7scORQJ24I1dj/hs
X-Google-Smtp-Source: APXvYqzs+2J8SnpsfE3xG53pI8tGtORcQMfKKmIXEBVL3aa4oBo7esvYoo9NmakBbTl0Ua4eVY4gDa+wsgZGH8kAUyc=
X-Received: by 2002:a02:c608:: with SMTP id i8mr30213998jan.19.1559140904254; 
 Wed, 29 May 2019 07:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
 <20190529024648.GA13436@basecamp>
 <CAOCk7NpC93ACr4jFm7SBOKSvFJSDhq2byX6BAYPX29BuYEkWnQ@mail.gmail.com>
 <20190529102822.GA15027@basecamp>
In-Reply-To: <20190529102822.GA15027@basecamp>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 29 May 2019 08:41:31 -0600
Message-ID: <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display
 support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J07LSTl0M3xW1XshAcWkk9rLC9WTA+EH6ULXPA37iqk=;
 b=esghtRAq0hclbHFappu5DChe6+pq4ipeNj55WOzrABUNqF9nRNLrYudPtI7ZASnuwZ
 4Ocyod9xt7P7DBNYz9mCrWOcFOSkzOxB7lXGEwwfDeLuOgruY23PB1ppagr1p67uSmga
 tHXfg0lljzrnJfOXJEe2gIZbiRGXq8sbOJcnOcPnou/gvnMaQf84bXTtZDQ5nVxSEEHV
 mYROmsJD5XHP7mN8DRhzmHRFycf1/9+/Lq4PUn8MaRcGIXCHLi1ge2W7InoXzIOs/6qV
 R7S78VfFmeVi/CdRhVPNFT1bA7n5xKsMV5g4jHF8/1LSmjvpQOqBTOWSrQ0XoTOq8n2H
 4WPg==
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgNDoyOCBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwODo1Mzo0OVBN
IC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA4
OjQ2IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6NDI6MTlQTSAtMDYwMCwgSmVmZnJleSBI
dWdvIHdyb3RlOgo+ID4gPiA+ID4gPiBEbyB5b3Uga25vdyBpZiB0aGUgbmV4dXMgNSBoYXMgYSB2
aWRlbyBvciBjb21tYW5kIG1vZGUgcGFuZWw/ICBUaGVyZQo+ID4gPiA+ID4gPiBpcyBzb21lIGds
aXRjaHluZXNzIHdpdGggdmJsYW5rcyBhbmQgY29tbWFuZCBtb2RlIHBhbmVscy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBJdHMgaW4gY29tbWFuZCBtb2RlLiBJIGtub3cgdGhpcyBiZWNhdXNlIEkgc2Vl
IHR3byAncHAgZG9uZSB0aW1lIG91dCcKPiA+ID4gPiA+IG1lc3NhZ2VzLCBldmVuIG9uIDQuMTcu
IEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBwaW5nIHBvbmcgY29kZSBpcwo+ID4gPiA+
ID4gb25seSBhcHBsaWNhYmxlIGZvciBjb21tYW5kIG1vZGUgcGFuZWxzLgo+ID4gPiA+Cj4gPiA+
ID4gQWN0dWFsbHksIHRoZSBwaW5nIHBvbmcgZWxlbWVudCBleGlzdHMgaW4gYm90aCBtb2Rlcywg
YnV0ICdwcCBkb25lCj4gPiA+ID4gdGltZSBvdXQnIGlzIGEgZ29vZCBpbmRpY2F0b3IgdGhhdCBp
dCBpcyBjb21tYW5kIG1vZGUuCj4gPiA+ID4KPiA+ID4gPiBBcmUgeW91IGFsc28gc2VlaW5nIHZi
bGFuayB0aW1lb3V0cz8KPiA+ID4KPiA+ID4gWWVzLCBoZXJlJ3MgYSBzbmlwcGV0IG9mIHRoZSBm
aXJzdCBvbmUuCj4gPiA+Cj4gPiA+IFsgICAgMi41NTYwMTRdIFdBUk5JTkc6IENQVTogMCBQSUQ6
IDUgYXQgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM6MTQyOSBkcm1fYXRvbWlj
X2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzLnBhcnQuMSsweDI4OC8weDI5MAo+ID4gPiBbICAgIDIu
NTU2MDIwXSBbQ1JUQzo0OTpjcnRjLTBdIHZibGFuayB3YWl0IHRpbWVkIG91dAo+ID4gPiBbICAg
IDIuNTU2MDIzXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+ID4gWyAgICAyLjU1NjAzNF0gQ1BVOiAw
IFBJRDogNSBDb21tOiBrd29ya2VyLzA6MCBOb3QgdGFpbnRlZCA1LjIuMC1yYzEtMDAxNzgtZzcy
YzNjMWZkNWY4Ni1kaXJ0eSAjNDI2Cj4gPiA+IFsgICAgMi41NTYwMzhdIEhhcmR3YXJlIG5hbWU6
IEdlbmVyaWMgRFQgYmFzZWQgc3lzdGVtCj4gPiA+IFsgICAgMi41NTYwNTZdIFdvcmtxdWV1ZTog
ZXZlbnRzIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYwo+ID4gPiAuLi4KPiA+ID4KPiA+ID4gPiBE
byB5b3UgaGF2ZSBidXN5Ym94Pwo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHlvdSBydW4gLQo+ID4gPiA+
IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDYxNAo+ID4gPiA+IHN1ZG8gYnVzeWJveCBkZXZt
ZW0gMHhGRDkwMDcxNAo+ID4gPiA+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDgxNAo+ID4g
PiA+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDkxNAo+ID4gPiA+IHN1ZG8gYnVzeWJveCBk
ZXZtZW0gMHhGRDkwMEExNAo+ID4gPgo+ID4gPiAjIGJ1c3lib3ggZGV2bWVtIDB4RkQ5MDA2MTQK
PiA+ID4gMHgwMDAyMDAyMAo+ID4KPiA+IE9rLCBzbyBDVExfMCBwYXRoLCBjb21tYW5kIG1vZGUs
IHBpbmcgcG9uZyAwLCB3aXRoIHRoZSBvdXRwdXQgZ29pbmcgdG8gRFNJIDEuCj4gPgo+ID4gTmV4
dCBvbmUgcGxlYXNlOgo+ID4KPiA+IGJ1c3lib3ggZGV2bWVtIDB4RkQ5MTJEMzAKPgo+IEl0J3Mg
MHgwMDAwMDAwMCBvbiBtYWlubGluZSBhbmQgNC4xNy4gSSB1c2VkIHRoZSBmb2xsb3dpbmcgc2Ny
aXB0IHRvCj4gZHVtcCB0aGUgZW50aXJlIG1kcDUgbWVtb3J5IHJlZ2lvbiBhbmQgYXR0YWNoZWQg
dGhlIGR1bXAgZnJvbSA0LjE3IGFuZAo+IDUuMnJjMS4KPgoKb2ssIDAgbWVhbnMgYXV0b3JlZnJl
c2ggaXMgbm90IG9uLiAgV2hpY2ggaXMgZmluZS4gIE15IG5leHQgZ3Vlc3MKd291bGQgYmUgdGhl
IHZibGFuayBjb2RlIGNoZWNraW5nIHRoZSBoYXJkd2FyZSB2YmxhbmsgY291bnRlciwgd2hpY2gK
ZG9lc24ndCBleGlzdC4KSW4gdmlkZW8gbW9kZSwgdGhlcmUgaXMgYSBmcmFtZSBjb3VudGVyIHdo
aWNoIGluY3JlbWVudHMsIHdoaWNoIGNhbiBiZQp1c2VkIGFzIHRoZSB2YmxhbmsgY291bnRlci4g
IFVuZm9ydHVuYXRlbHksIHRoYXQgaGFyZHdhcmUgaXNuJ3QgYWN0aXZlCmluIGNvbW1hbmQgbW9k
ZSwgYW5kIHRoZXJlIGlzbid0IGFuIGVxdWl2YWxlbnQuCgpTbywgdGhlIHZibGFuayBjb2RlIGlz
IGdvaW5nIHRvIHJlYWQgdGhlIHJlZ2lzdGVyLCBhbmQgbG9vayBmb3IgYW4KdXBkYXRlLCB3aGlj
aCB3aWxsIG5ldmVyIGhhcHBlbiwgdGh1cyBpdCB3aWxsIHRpbWVvdXQuICBUaGVyZSBpcyBhCmJh
Y2t1cCBwYXRoIHdoaWNoIHVzZXMgdGltZXN0YW1wcyAobm8gaGFyZHdhcmUpLCB3aGljaCB5b3Ug
Y2FuCmFjdGl2YXRlIHdpdGggYSBxdWljayBoYWNrIC0gbWFrZSBtYXhfdmJsYW5rX2NvdW50ID0g
MCBhdCB0aGUKZm9sbG93aW5nIGxpbmUKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jI0w3
NTMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
