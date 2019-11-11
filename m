Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E231F7775
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 16:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E53892FB;
	Mon, 11 Nov 2019 15:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF935892FB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 15:15:06 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-sfpcs2lwOAapTvb_mmFkpw-1; Mon, 11 Nov 2019 10:15:04 -0500
Received: by mail-wr1-f71.google.com with SMTP id m17so10068320wrb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 07:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rnVuRzkKQwI5RMsf7QnxcTrP9nnfoCzN/dajmGhgfms=;
 b=Mh4N0hAMiNwwieopCr0JATnHJSLomggyy48Rp9whivVH9evwFTkUOCuzE8E0VLizl+
 oIVMZn74oO3fO3OdULJ6Y4uC2DXOT0UfGeSAMuBsdvKqd0oIPskGyFA2xan7w9MJ3pI7
 2XsHG45Hqdera/Qz0Luc70DVo/mTVnRxSLUvB/WfWMaLRz/IrA8uok3dmqHSsaQA+yWM
 qwVnDuhCx0VfEkCS0HmGCd6sKGRDrgFrj32YhGFbB/ProOETnkuwG93m6lGZ4Aln17pP
 RXPngzaW2g/DE4lHnyew7h4VERmz1VB8/isGYGe95q5RzBiwBB/0w/vIFEXeGCaAvIzp
 V7jg==
X-Gm-Message-State: APjAAAULfmBbudy/KpH8Ahp4W6POC6ndlDlqTrsbOOiGUvIklHED1pvx
 5uFU1fclOm+e2gmcdvtNFwTZgR74/dgP5m+RiSMjdz56I9H0i6Dc78TvouOzHKCzH5q9xvt2EOq
 ClrW9ymf7NgrF09L/htq3BBQnMcN+
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr20956787wrv.347.1573485301793; 
 Mon, 11 Nov 2019 07:15:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/xHLht/dC5auO/Hn1I/KsDFYL2RMtPadd52kVt3Hk8dK0L5RCpdNe2PiSedBUFEaFzhOx9A==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr20956764wrv.347.1573485301555; 
 Mon, 11 Nov 2019 07:15:01 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id f13sm15509567wrq.96.2019.11.11.07.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 07:15:00 -0800 (PST)
Subject: Re: [PATCH] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes
 matching a video= argument
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191110184055.3979-1-hdegoede@redhat.com>
 <CAKMK7uEnpH3e+B_4Z5oMTDyJMe=aETUm0C_a7U9mOLPWyVVOew@mail.gmail.com>
 <18aaecf8-d7f6-55b1-be05-7eb767abc30d@redhat.com>
 <20191111141103.GN1208@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b2ac2130-d3e1-a5ed-ba3a-7bfb9c6e654e@redhat.com>
Date: Mon, 11 Nov 2019 16:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111141103.GN1208@intel.com>
Content-Language: en-US
X-MC-Unique: sfpcs2lwOAapTvb_mmFkpw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573485305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwSWobeCvSNh/OThZAhqxgsPJjYxzvj0R/w0qk4JRRk=;
 b=bV53Bd/U8l2L9G/o75cBZBzVFY2W66edC+T8dC6rCvhHGsmbjT56ILGj1r1gXFsRwFEKfY
 qgqhSPcGHFFIb0MaDryNHljkzRl83r9m0OigvEZWt3tMj5sIkIu86aCPHPDFLoEDKwIZuR
 dfumwG2HNlPd/6nLBt/e5Qxkj0+6d/4=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS0xMS0yMDE5IDE1OjExLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gTW9u
LCBOb3YgMTEsIDIwMTkgYXQgMTA6NTA6NDJBTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDExLTExLTIwMTkgMTA6MjUsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+
PiBPbiBTdW4sIE5vdiAxMCwgMjAxOSBhdCA3OjQxIFBNIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gZHJtX2hlbHBlcl9wcm9iZV9hZGRfY21kbGlu
ZV9tb2RlKCkgcHJlZmVycyB1c2luZyBhIHByb2JlZCBtb2RlIG1hdGNoaW5nCj4+Pj4gYSB2aWRl
bz0gYXJndW1lbnQgb3ZlciBjYWxjdWxhdGluZyBvdXIgb3duIHRpbWluZ3MgZm9yIHRoZSB1c2Vy
IHNwZWNpZmllZAo+Pj4+IG1vZGUgdXNpbmcgQ1ZUIG9yIEdURi4KPj4+Pgo+Pj4+IEJ1dCB1c2Vy
c3BhY2UgY29kZSB3aGljaCBpcyBhdXRvLWNvbmZpZ3VyaW5nIHRoZSBtb2RlIG1heSB3YW50IHRv
IGtub3cgdGhhdAo+Pj4+IHRoZSB1c2VyIGhhcyBzcGVjaWZpZWQgdGhhdCBtb2RlIG9uIHRoZSBr
ZXJuZWwgY29tbWFuZGxpbmUgc28gdGhhdCBpdCBjYW4KPj4+PiBwaWNrIHRoYXQgbW9kZSBvdmVy
IHRoZSBtb2RlIHdoaWNoIGlzIG1hcmtlZCBhcyBEUk1fTU9ERV9UWVBFX1BSRUZFUlJFRC4KPj4+
Pgo+Pj4+IFRoaXMgY29tbWl0IHNldHMgdGhlIERSTV9NT0RFX1RZUEVfVVNFUkRFRiBmbGFnIG9u
IHRoZSBtYXRjaGluZyBtb2RlLCBqdXN0Cj4+Pj4gYXMgd2Ugd291bGQgZG8gb24gdGhlIHVzZXIt
c3BlY2lmaWVkIG1vZGUgd2hlbiBubyBtYXRjaGluZyBwcm9iZWQgbW9kZSBpcwo+Pj4+IGZvdW5k
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0
LmNvbT4KPj4+Cj4+PiBXaWxsIGV4aXN0aW5nIHVzZXJzcGFjZSBkdHJ0IGhlcmUgd2l0aCB0aGlz
PyBTb21lIGxpbmtzIHRvIHBvcHVsYXIKPj4+IG9uZXMgd291bGQgYmUgZ29vZCAoc2luY2UgZXNz
ZW50aWFsbHkgdGhpcyBpcyB1YXBpIGZpbmUgdHVuaW5nIHdlIG5lZWQKPj4+IHRoYXQgYW55d2F5
KS4gV2l0aCB0aGF0IHdpbGwgZ2V0IG15IGFjay4KPj4KPj4gQSB2YWxpZCBxdWVzdGlvbiwgSSd2
ZSBnb25lIG92ZXIgd2hhdCBJIGNvbnNpZGVyIHRoZSBtYWpvciB1c2Vyc3BhY2Uga21zIHVzZXJz
Ogo+PiAtWG9yZyB4c2VydmVyIG1vZGVzZXR0aW5nIGRyaXZlciBkb2VzIG5vdCBjaGVjayBmb3Ig
dGhpczoKPj4gICAgW2hhbnNAc2hhbGVtIHhzZXJ2ZXJdJCBhY2sgRFJNX01PREVfVFlQRV8gaHcv
eGZyZWU4Ni9kcml2ZXJzL21vZGVzZXR0aW5nLwo+PiAgICBody94ZnJlZTg2L2RyaXZlcnMvbW9k
ZXNldHRpbmcvZHJtbW9kZV9kaXNwbGF5LmMKPj4gICAgMTMyMTogICAgaWYgKGttb2RlLT50eXBl
ICYgRFJNX01PREVfVFlQRV9EUklWRVIpCj4+ICAgIDEzMjM6ICAgIGlmIChrbW9kZS0+dHlwZSAm
IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEKQo+PiAtT3RoZXIgWG9yZyBkcml2ZXJzOgo+PiAgICBb
aGFuc0BzaGFsZW0gZHJpdmVyXSQgbHMgLWQgeGY4Ni12aWRlby0qCj4+ICAgIHhmODYtdmlkZW8t
YW1kZ3B1ICB4Zjg2LXZpZGVvLWludGVsICAgICAgICB4Zjg2LXZpZGVvLXF4bAo+PiAgICB4Zjg2
LXZpZGVvLWFybXNvYyAgeGY4Ni12aWRlby1tb2Rlc2V0dGluZyAgeGY4Ni12aWRlby1zaXN1c2IK
Pj4gICAgeGY4Ni12aWRlby1hdGkgICAgIHhmODYtdmlkZW8tbm91dmVhdSAgICAgIHhmODYtdmlk
ZW8tdm13YXJlCj4+ICAgIHhmODYtdmlkZW8tZHVtbXkgICB4Zjg2LXZpZGVvLW9tYXAgICAgICAg
ICB4Zjg2LXZpZGVvLXZvb2Rvbwo+PiAgICB4Zjg2LXZpZGVvLWdlb2RlICAgeGY4Ni12aWRlby1v
cGVudGVncmEKPj4gICAgVGhlc2UgYWxsIG9ubHkgZG8gdGhlIHNhbWUgY2hlY2tzIGFzIHRoZSBY
b3JnIG1vZGVzZXR0aW5nIGRyaXZlcgo+PiAtbXV0dGVyOgo+PiAgICBbaGFuc0BzaGFsZW0gbXV0
dGVyXSQgYWNrIERSTV9NT0RFX1RZUEVfCj4+ICAgIHNyYy9iYWNrZW5kcy9uYXRpdmUvbWV0YS1v
dXRwdXQta21zLmMKPj4gICAgMjYxOiAgICAgIGlmIChkcm1fbW9kZS0+dHlwZSAmIERSTV9NT0RF
X1RZUEVfUFJFRkVSUkVEKQo+Pgo+PiBTbyBpdCBzZWVtcyBub3RoaW5nICh0aGF0IEkgY2FuIHF1
aWNrbHkgZmluZCkgaW4gdXNlcnNwYWNlIGlzIHVzaW5nIHRoaXMgYXRtLgo+Pgo+PiBUaGUgcmVh
c29uIEkgd3JvdGUgdGhpcyBwYXRjaCBpcyBiZWNhdXNlIGFib3V0IGEgeWVhciBhZ28gcGx5bW91
dGggdXNlZCB0bwo+PiBmdWxseSByZWx5IG9uIHRoZSBrZXJuZWwgdG8gc2V0dXAgdGhlIG1vZGVz
IG9uIG1vbml0b3JzIGFuZCB3b3VsZCBzaW1wbHkKPj4gaW5oZXJpdCB0aGUgbW9kZXMgc2V0dXAg
YnkgdGhlIGtlcm5lbC4gQmFzaWNhbGx5IHBseW1vdXRoIHdhcyByZWx5aW5nIG9uCj4+IGZiY29u
IHRvIGxvYWQgZmlyc3QgYW5kIHNldHVwIG1vZGVzLgo+Pgo+PiBEZWZlcnJlZCBmYmNvbiB0YWtl
b3ZlciAoZm9yIGZsaWNrZXJmcmVlKSBtZWFucyB0aGF0IHRoaXMgaXMgbm8gbG9uZ2VyCj4+IGhh
cHBlbmluZy4gU28gbm93IHBseW1vdXRoIHBpY2tzIGEgbW9kZSBpdHNlbGYuIFdoZW4gSSBzdWJt
aXR0ZWQgdGhlCj4+IHBseW1vdXRoIGNoYW5nZSBmb3IgcGx5bW91dGggdG8gcGljayBhIG1vZGUg
aXRzZWxmIHRoZSBwbHltb3V0aCBtYWludGFpbmVyCj4+IChSYXkgU3Ryb2RlKSB3YXMgYWZyYWlk
IHRoYXQgd291bGQgYnJlYWsgcGx5bW91dGggaG9ub3JpbmcgdmlkZW89IGFyZ3VtZW50cy4KPj4g
U28gY3VycmVudGx5IHBseW1vdXRoIHN0aWxsIHJlbGllcyBvbiB0aGUga2VybmVsIHRvIGRvIHRo
ZSBtb2RlIHNldHVwIGlmCj4+IGEgdmlkZW89IGFyZ3VtZW50IGlzIHByZXNlbnQgb24gdGhlIGtl
cm5lbCBjb21tYW5kbGluZS4KPiAKPiBXaHkgY2FuJ3QgcGx5bW91dGgganVzdCBrZWVwIHVzaW5n
IHRoZSBjdXJyZW50IG1vZGUgaWYgdGhlIGNydGMgaXMKPiBhbHJlYWR5IGFjdGl2ZSBhbmQgb3Ro
ZXJ3aXNlIHBpY2sgYSBtb2RlIGl0c2VsZj8KCldlbGwgZm9yIG9uZSB0aGUgZmlybXdhcmUgbWF5
IGhhdmUgc2V0dXAgYW4gb3V0cHV0IHdpdGggYSBub24KbmF0aXZlIG1vZGUgYmVjYXVzZSBpdCBh
bHdheXMgdXNlcyBlLmcgMTAyNHg3NjgsIHdlIHJlYWxseSB3YW50IHRvCnN3aXRjaCB0byB0aGUg
cHJlZmVycmVkIG1vZGUgaW4gdGhhdCBjYXNlLgoKV2UgY291bGQgb25seSBwaWNrIHRoZSBjdXJy
ZW50IG1vZGUgaWYgdGhlIGNydGMgaXMgYWxyZWFkeSBhY3RpdmUKd2hlbiB2aWRlbz0gaXMgcHJl
c2VudCBvbiB0aGUga2VybmVsIGNtZGxpbmUgaW4gYW4gYXR0ZW1wdCB0bwpob25vciB2aWRlbz0g
YXJndW1lbnRzLCBidXQgdGhhdCB3aWxsIG9ubHkgd29yayBpZiBmYmNvbiBoYXMKYWxyZWFkeSBz
ZXR1cCB0aGUgbW9kZXMgYWNjb3JkaW5nIHRvIHRoZSB2aWRlbz0gYXJndW1lbnRzIGFuZCB3aXRo
CmZsaWNrZXJmcmVlIGJvb3Qgd2UgZGVmZXIgbG9hZGluZyBmYmNvbiB1bnRpbCB0aGVyZSBhcmUg
a2VybmVsIGFyZSBpbml0cmQKZXJyb3JzIHRvIHNob3cuIFNvIGluIG9yZGVyIHRvIGhvbm9yIHZp
ZGVvPSBpbiBhIGZsaWNrZXJmcmVlIHNldHVwCnBseW1vdXRoIG5lZWRzIHRvIHBpY2sgdGhlIHJl
cXVlc3RlZCBtb2RlIGl0c2VsZi4gQWN0dWFsbHkga25vd2luZyB3aGljaAptb2RlIGlzIHJlcXVl
c3RlZCBtYWtlcyB0aGlzIGEgbG90IGVhc2llci4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
