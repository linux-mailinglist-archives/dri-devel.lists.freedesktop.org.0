Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54B18B9E7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 16:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0A6EA1E;
	Thu, 19 Mar 2020 15:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10646EA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584630112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjd3BdwXCiWk7zYewtDE482lopkRmWvJ99ckqqzO5UA=;
 b=TQy5IrSI8m2BgGdlt6ybdYnek8JVGH1s/p/XuEqw+/VqjGqXvIue5M6RaEcJFLU0bk53f1
 zQlnfiHMRU3+BzVbqYNYfsIbZmc6FhMkShn647i0mBTdWuAhLue6tGcUUnlSUTy3dzWDsP
 Bjh3h4HwsnI4sN9U+vVJdjIFfXfM5sw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-q9RX2S1HN5mYpi1gmeVtEA-1; Thu, 19 Mar 2020 11:01:49 -0400
X-MC-Unique: q9RX2S1HN5mYpi1gmeVtEA-1
Received: by mail-wm1-f71.google.com with SMTP id m4so1070541wme.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VLouOVsCVZoyKaLaWOqp2ndrYXWjscW1Bdt/53VmydA=;
 b=Wa3JCzgbVjHaIveOUREs7uo1IB5y6s0oOh57++ZpmIQb8ZV1Z8Cfj7O5hFp4NYmk/u
 XcM781IiBFZzqEv1cYOLks+qRKGb322yOGbRLMK1fswr3/gGHiPpFu1vOAR55/D6TUFk
 Rfszd7yPc0ocrMV3EB9H1DiIHEjGrkfWChZ0MNR1JZnzziiyYuR3TTLnDgLcKmNG3IGQ
 JSgnw6jCpOU0nChXY4ZkvVkRkzJ7cBDjPBBamvc3PJgrlqM1swYv0YWzZGfb2hmhsT4H
 XVrUrVZlBR9gu9XFTHWm1qf2rh2G8IjlCO8XezuG8GcEVDzgWT/A3bG++zJl2Q/keBx4
 e1fw==
X-Gm-Message-State: ANhLgQ0fdTDpnwjX7siY3bQnDTYiuL0US2p4uoqJEJHdZ7fSPakrgqrS
 +0fZ7gZ1Uv8p/uFPzlK0Aamg4+YRoTIiOIrqcvpSFsffrgrp3qXYy5/kJ3nz+KXc5ER1OSQ52cd
 eq/xKNSG2v5vZ8Vp0qr+aw2hS40pH
X-Received: by 2002:a1c:ab54:: with SMTP id u81mr4029888wme.166.1584630108185; 
 Thu, 19 Mar 2020 08:01:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDxL1yFW9gH/Gn11jjQzZfvSq/PV2iPMarAYpYqlMk8Lro/fzQTh8XYN86CgMKhEMkva2w0A==
X-Received: by 2002:a1c:ab54:: with SMTP id u81mr4029863wme.166.1584630107931; 
 Thu, 19 Mar 2020 08:01:47 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id q8sm3976823wrc.8.2020.03.19.08.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 08:01:47 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
 <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
 <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
 <20200319145440.51773af8@eldfell.localdomain>
 <c7a98456-d4fc-e4d2-640f-d70a35619445@daenzer.net>
 <20200319164802.1ef342dd@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <40228587-2288-bc9a-45a4-519dd9f8fe2e@redhat.com>
Date: Thu, 19 Mar 2020 16:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319164802.1ef342dd@eldfell.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzE5LzIwIDM6NDggUE0sIFBla2thIFBhYWxhbmVuIHdyb3RlOgo+IE9uIFRodSwg
MTkgTWFyIDIwMjAgMTQ6NTE6NDEgKzAxMDAKPiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56
ZXIubmV0PiB3cm90ZToKPiAKPj4gLS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQo+
PiBIYXNoOiBTSEExCj4+Cj4+IE9uIDIwMjAtMDMtMTkgMTo1NCBwLm0uLCBQZWtrYSBQYWFsYW5l
biB3cm90ZToKPj4+IE9uIFRodSwgMTkgTWFyIDIwMjAgMTI6NTI6MTQgKzAxMDAgSGFucyBkZSBH
b2VkZQo+Pj4gPGhkZWdvZWRlQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+IE9uIDMvMTkvMjAgMTI6
MzUgUE0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4+PiBPbiAyMDIwLTAzLTE4IDQ6MjIgcC5t
LiwgU2ltb24gU2VyIHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMy8xOC8yMCAzOjM4IFBNLCBT
aW1vbiBTZXIgd3JvdGU6Cj4+Pj4+Pj4+ICAgCj4+Pj4+Pj4+PiAxKSBMZXR0aW5nIHRoZSBWTS12
aWV3ZXIgd2luZG93LXN5c3RlbSBkcmF3IHRoZSBjdXJzb3IKPj4+Pj4+Pj4+IGFzIGl0IG5vcm1h
bGx5IHdvdWxkIGRyYXcgaXQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdoeSBpcyB0aGlzIGltcG9ydGFu
dD8gQ2FuJ3QgdGhlIFZNIHZpZXdlciBoaWRlIHRoZQo+Pj4+Pj4+PiBjdXJzb3IgYW5kIHVzZSBh
IHN1Yi1zdXJmYWNlIHRvIG1hbnVhbGx5IGRyYXcgdGhlIGN1cnNvcgo+Pj4+Pj4+PiBwbGFuZSBj
b25maWd1cmVkIGJ5IHRoZSBndWVzdD8KPj4+Pj4+Pgo+Pj4+Pj4+IEJlY2F1c2UgdGhlbiBtb3Zp
bmcgdGhlIGN1cnNvciBhcyBzZWVuIGJ5IHRoZSB1c2VyIHJlcXVpcmVzCj4+Pj4+Pj4gYSByb3Vu
ZCB0cmlwIHRocm91Z2ggdGhlIFZNIGFuZCB0aGF0IGFkZHMgbGF0ZW5jeSwgZXNwLgo+Pj4+Pj4+
IHdoZW4gdGhlIFZNIHZpZXdlciBpcyB2aWV3aW5nIGEgVk0gd2hpY2ggaXMgcnVubmluZwo+Pj4+
Pj4+IHNvbWV3aGVyZSBlbHNlIG92ZXIgdGhlIG5ldHdvcmsuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIHZp
ZGVvIG91dHB1dCBoYXMgbGF0ZW5jeSBhbnl3YXkuCj4+Pj4+Cj4+Pj4+IFNvdW5kcyBsaWtlIHlv
dSd2ZSBuZXZlciB0cmllZCB0aGUgdHdvIGRpZmZlcmVudCBtb2Rlcwo+Pj4+PiB5b3Vyc2VsZj8g
OikgSU1FIGl0IG1ha2VzIGEgYmlnIGRpZmZlcmVuY2UgZXZlbiB3aXRoIGEgbG9jYWwKPj4+Pj4g
Vk0uIEV2ZW4gdmVyeSBsaXR0bGUgbGF0ZW5jeSBjYW4gbWFrZSB0aGUgY3Vyc29yIGZlZWwgYXdr
d2FyZCwKPj4+Pj4gbGlrZSBpdCdzIGJlaW5nIGhlbGQgYmFjayBieSBhIHJ1YmJlciBiYW5kIG9y
IHNvbWV0aGluZy4KPj4+Pgo+Pj4+IFJpZ2h0IG5vdCB0byBtZW50aW9uIHRoYXQgdGhlIGxhdGVu
Y3kgbWF5IGJlIHZhcmlhYmxlLCBzbyB0aGUKPj4+PiBjdXJzb3IgbW92ZXMgaW4gYSBqaXR0ZXJ5
IGZhc2hpb24gaW5zdGVhZCBvZiBoYXZpbmcgaXQgbW92ZQo+Pj4+IHNtb290aGx5IG1hdGNoaW5n
IHRoZSBzbW9vdGggd2F5IGEgdXNlciBub3JtYWxseSBtb3ZlcyB0aGUKPj4+PiBtb3VzZS4KPj4+
Pgo+Pj4+IFRoaXMgdG90YWxseSB3cmVja3MgaGFuZC1leWUgY29vcmRpbmF0aW9uIGFuZCBpcyBq
dXN0IHBsYWluCj4+Pj4gYXdlZnVsbC4KPj4+Cj4+PiBJIGhhdmUgZXhwZXJpZW5jZWQgaXQsIGFu
ZCB3aGlsZSBpdCBpcyBwYWluZnVsLCBJIHByZWZlciB0aGF0IHBhaW4KPj4+IG92ZXIgdGhlIHBh
aW4gb2YgYWNjaWRlbnRhbGx5IGNsaWNraW5nIHNvbWV0aGluZyB0aGF0IHdhcyBub3QKPj4+IHRy
YW5zbWl0dGVkIHRvIHRoZSByZW1vdGUgZGlzcGxheSB5ZXQuCj4+Cj4+IFVubGVzcyB5b3UgbWVh
biBjbGlja2luZyBzb21ldGhpbmcgd2hpbGUgdGhlIGN1cnNvciBpcyBtb3ZpbmcsIG5vdAo+PiBz
dXJlIGhvdyBzZWFtbGVzcyB2cyBub3QgYWZmZWN0cyB0aGlzLCBzaW5jZSB0aGUgZGVsYXkgb2Yg
c29tZXRoaW5nCj4+IGFwcGVhcmluZyBvbiB0aGUgcmVtb3RlIGRpc3BsYXkgc2hvdWxkIGJlIHRo
ZSBzYW1lIGluIGJvdGggY2FzZXM/Cj4gCj4gSG93IGRvIHlvdSBrbm93IGlmIHRoZSBjdXJzb3Ig
aXMgc3RpbGwgbW92aW5nIG9yIG5vdCwgaWYgeW91IGRvbid0IHNlZQo+IHRoZSByZWFsIGN1cnNv
ciBidXQgb25seSB0aGUgZmFrZSBjdXJzb3I/Cj4gCj4gSSBtb3ZlIHRoZSBtb3VzZSwgdGhlbiBp
dCB0YWtlcyAwLjEgLSAxMCBzZWNvbmRzIGZvciB0aGUgcmVhbCBjdXJzb3IKPiB0byByZWFjaCB3
aGVyZSBJIG1vdmVkIGl0LiBPbmx5IGFmdGVyIHRoYXQgSSBzZWUgd2hhdCB0aGUgbW90aW9uCj4g
Y2F1c2VkLiBUaGVuIEkgY2FuIGRvIHRoZSBuZXh0IHRoaW5nLgo+IAo+IFRoZSBtb3VzZSBtb3Rp
b24gLyBjdXJzb3IgcmVzcG9uc2UgZ2l2ZXMgbWUgY29udGludW91cyBmZWVkYmFjaywgc28KPiB0
aGF0IEkgZG9uJ3QgcnVuIHRvbyBmYXIgYWhlYWQgb2YgdGhlIHJlbW90ZSBlbmQuCj4gCj4+PiBU
aGVyZWZvcmUgSSB0aGluayB0aGUgYmVzdCB1c2VyIGV4cGVyaWVuY2UgaXMgdG8gdXNlIGJvdGgg
dHlwZXMgb2YKPj4+IGN1cnNvciBhdCB0aGUgc2FtZSB0aW1lOiB0aGUgcmVtb3RlIGRlc2t0b3Ag
b3IgVk0gdmlld2VyIHBhaW50cwo+Pj4gdGhlIGxvY2FsIGN1cnNvciBhcyBhbiBhaWQsIGxpa2Ug
YSBwaGFudG9tLCBhbmQgdGhlIGN1cnNvciBmcm9tCj4+PiBpbnNpZGUgdGhlIFZNIGlzIGFsc28g
dmlzaWJsZSB3aXRoIHRoZSBsYXRlbmN5IGl0IG5hdHVyYWxseSBoYXMuCj4+PiBUaGF0IG1lYW5z
IEkgY291bGQgYWN0dWFsbHkgc2VlIHRoYXQgdGhlIHNjcmVlbiBoYXMgY2F1Z2h0IHVwIHdpdGgK
Pj4+IG15IG1vdGlvbnMgYmVmb3JlIEkgY2xpY2sgc29tZXRoaW5nLgo+Pgo+PiBJJ2QgZXhwZWN0
IHRoYXQgdG8gcmVzdWx0IGluICJkdXBsaWNhdGUgY3Vyc29yIiBidWcgcmVwb3J0cyDigJQgSSdk
Cj4+IGNlcnRhaW5seSBjb25zaWRlciBpdCBhIGJ1ZyB3aXRoIG15IHVzZXIgaGF0IG9uLgo+IAo+
IFRoZSBwb2ludCBpcyB0byBtYWtlIHRoZSBwaGFudG9tIGN1cnNvciBsb29rIGxpa2UgYSBwaGFu
dG9tIGN1cnNvciwgc28KPiBpdCBjYW5ub3QgYmUgbWlzdGFrZW4gYXMgdGhlIHJlYWwgY3Vyc29y
LiBJdCBkb2Vzbid0IGV2ZW4gbmVlZCB0byB1c2UKPiB0aGUgc2FtZSBjdXJzb3IgaW1hZ2UgYXMg
dGhlIHJlYWwgY3Vyc29yLCBpdCBjb3VsZCBiZSBqdXN0IGEKPiB0cmFuc2x1Y2VudCBzcG90LgoK
SSB0aGluayB5b3UgYXJlIHRyeWluZyB0byBmaXggYSBub24gZXhpc3RpbmcgcHJvYmxlbSBoZXJl
LCBhY2NlcHQKZm9yIHNheSBhIGdhbWUgb2Ygd2hhY2sgYSBtb2RlLCB0aGUgdGFyZ2V0IHdoaWNo
IHRoZSB1c2VyIGlzIHRyeWluZwp0byBoaXQgaXMgdHlwaWNhbGx5IHN0YXRpYyBhbmQgdGhlIFZN
IHdpbGwgcmVjZWl2ZSBhbmQgcHJvY2VzcyB0aGUKY29vcmRpbmF0ZXMgd2hlcmUgdGhlIHVzZXIg
c3RvcHMgdGhlIG1vdGlvbiwgYmVmb3JlIGl0IHdpbGwgcmVjZWl2ZQphbmQgcHJvY2VzcyB0aGUg
Y2xpY2suIFNvIHVubGVzcyBzYXkgYW4gaWNvbiBvbiBhIHRvb2xiYXIgZm9yIHNvbWUKcmVhc29u
IGlzIGEgbW92aW5nIHRhcmdldCB0aGVyZSBpcyBubyBwcm9ibGVtIGhlcmUuCgpSZWdhcmRzLAoK
SGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
