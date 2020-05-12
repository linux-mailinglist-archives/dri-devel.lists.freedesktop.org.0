Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F21CFA28
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 18:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52289A08;
	Tue, 12 May 2020 16:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E788891FA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589299763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9SySTNtRSQuuo4WUBzNwt0OfvRZ/azSByXiW4OL/gI=;
 b=eMN4AQedFkDABLyTDh24saRYkw0TZvZo1Rk0n7Fb5tzXn8Hr2Ll0e5wTozeb+ASb5lh8dq
 j0NRLRMU9Gp05dc3fHv2mh9yhEtZxbglcVhTD2QrYbyq5cUorIt0eOCxFftNnhqO73LHSX
 NwAK9ezdnMVRcTMbm/hBL+YonbGSFcQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-KpoEo7UAPJa3kK5fpVsIlQ-1; Tue, 12 May 2020 12:09:19 -0400
X-MC-Unique: KpoEo7UAPJa3kK5fpVsIlQ-1
Received: by mail-wr1-f72.google.com with SMTP id z8so7119594wrp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y9SySTNtRSQuuo4WUBzNwt0OfvRZ/azSByXiW4OL/gI=;
 b=bAEmkdccAiEHkNIiIv4XRgAUfdbPbnBbJxO12eGiAQqbLoF5Lc7LsBgf54ehFYc1nk
 XkuXF6RBL+TL9oFHkhAFIOKCNh3ykeRetDNS4ijTHe8LNew/ml1tyDce7BIyAQ4uTvin
 CkyHCrj4mBeIHr4zQU3QJhCdABPryJDPsvwSARQhLsBCn/UaOBQOE1Rr3Pykm56595gl
 WTVaOwq1hezMF3Tbe+CFg4+/8Hl93kwjuJFYOYDdqhxGx/aoqrCJRPdZxdOTdI9+/C/N
 NPKrkdax+hVDUGFYXxBzsJ8xAQappcFxw0jZEP2R1VVzEKjEEurrf/jHFnv/Rk6VrES7
 Q6kA==
X-Gm-Message-State: AGi0PuZ4fl9ipDwOzOE4ShEYeOiOucZjEHrwOfF3VsTTqGeIAhwSVYmu
 LuAGKfXj6VuUd077iJIjh3ABegGsPDjexJZtYRZpp/VNjuVl3B2CUpPNr8/lSWVJxoXKF40ER9m
 8E4/zMFDd4EUW06iDLj2I+IxEMILc
X-Received: by 2002:adf:fe87:: with SMTP id l7mr27248642wrr.360.1589299757691; 
 Tue, 12 May 2020 09:09:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJteUpo7qLxnPkx69jJ01T6Kz9BSZpRmAruflWDjChWKbjyQXDCarUWHYT9zbJfHcDTrhp43Q==
X-Received: by 2002:adf:fe87:: with SMTP id l7mr27248599wrr.360.1589299757287; 
 Tue, 12 May 2020 09:09:17 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id 17sm30946646wmo.2.2020.05.12.09.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 09:09:16 -0700 (PDT)
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
 <20200512172032.185de3d7@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
Date: Tue, 12 May 2020 18:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200512172032.185de3d7@eldfell.localdomain>
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA1LzEyLzIwIDQ6MjAgUE0sIFBla2thIFBhYWxhbmVuIHdyb3RlOgo+IE9uIFR1ZSwg
MTIgTWF5IDIwMjAgMTA6MTg6MzEgKzAyMDAKPiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPiB3cm90ZToKPiAKPj4gSGksCj4+Cj4+IE9uIDUvMTEvMjAgOTo1NSBQTSwgUmFqYXQg
SmFpbiB3cm90ZToKPj4+IEhpIEhhbnMsCj4+Pgo+Pj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQg
MTA6NDcgQU0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbSA8bWFpbHRvOmhkZWdv
ZWRlQHJlZGhhdC5jb20+PiB3cm90ZToKPj4+Cj4+PiAgICAgIEhpIEFsbCwKPj4+Cj4+PiAgICAg
IFRoaXMgUkZDIHRha2VzIFJhamF0J3MgZWFybGllciBwYXRjaCBmb3IgYWRkaW5nIHByaXZhY3kt
c2NyZWVuIHByb3BlcnRpZXMKPj4+ICAgICAgaW5mcmEgdG8gZHJtX2Nvbm5lY3Rvci5jIGFuZCB0
aGVuIGFkZHMgdGhlIHJlc3VsdHMgb2YgdGhlIGRpc2N1c3Npb24gZnJvbQo+Pj4gICAgICB0aGUg
IlJGQzogRHJtLWNvbm5lY3RvciBwcm9wZXJ0aWVzIG1hbmFnZWQgYnkgYW5vdGhlciBkcml2ZXIg
LyBwcml2YWN5Cj4+PiAgICAgIHNjcmVlbiBzdXBwb3J0IiBtYWlsIHRocmVhZCBvbiB0b3AsIGhl
bmNlIHRoZSB2Mi4KPj4+Cj4+Pgo+Pj4gVGhhbmsgeW91IHNvIG11Y2ggZm9yIGRvaW5nIHRoaXMu
IEkgd2FzIGZvbGxvd2luZyB0aGUgc2FpZCBkaXNjdXNzaW9uIGFuZCBldmVudHVhbGx5IGl0IGJl
Y2FtZSBxdWl0ZSBjb21wbGV4IGZvciBtZSB0byB1bmRlcnN0YW5kIGFuZCBmb2xsb3cgOi0pCj4+
Cj4+IEkgaG9wZSB0aGUgbmV3IGRvYyB0ZXh0IG1ha2VzIHRoaW5ncyBjbGVhciBhZ2Fpbj8KPj4K
Pj4KPj4+ICAgICAgVGhlIG1vc3QgaW1wb3J0YW50IHRoaW5nIGhlcmUgaXMgYmlnIGtlcm5lbC1k
b2MgY29tbWVudCB3aGljaCBnZXRzIGFkZGVkIGluCj4+PiAgICAgIHRoZSBmaXJzdCBwYXRjaC1j
aHVuayBtb2RpZnlpbmcgZHJtX2Nvbm5lY3Rvci5jLCB0aGlzIHN1bW1hcml6ZXMsIG9yIGF0Cj4+
PiAgICAgIGxlYXN0IHRyaWVzIHRvIHN1bW1hcml6ZSwgdGhlIGNvbmNsdXNpb25zIG9mIG91ciBw
cmV2aW91cyBkaXNjdXNzaW9uIG9uCj4+PiAgICAgIHRoZSB1c2Vyc3BhY2UgQVBJIGFuZCBsYXlz
IGRvd24gdGhlIGdyb3VuZCBydWxlcyBmb3IgaG93IHRoZSAyIG5ldwo+Pj4gICAgICAicHJpdmFj
eS1zY3JlZW4gc3ctc3RhdGUiIGFuZMKgICJwcml2YWN5LXNjcmVlbiBody1zdGF0ZSIgcHJvcGVy
dGllcyBhcmUKPj4+ICAgICAgdG8gYmUgdXNlZCBib3RoIGZyb20gdGhlIGRyaXZlciBzaWRlIGFz
IHdlbGwgYXMgZnJvbSB0aGUgdXNlcnNwYWNlIHNpZGUuCj4+Pgo+Pj4gICAgICBPdGhlciB0aGVu
IHRoYXQgdGhpcyBtb2RpZmllcyBSYWphdCdzIHBhdGNoIHRvIGFkZCAyIHByb3BlcnRpZXMgaW5z
dGVhZAo+Pj4gICAgICBvZiBvbmUsIHdpdGhvdXQgbXVjaCBvdGhlciBjaGFuZ2VzLgo+Pj4KPj4+
ICAgICAgUmFqYXQsIHBlcmhhcHMgeW91IGNhbiBkbyBhIG5ldyB2ZXJzaW9uIG9mIHlvdXIgcGF0
Y2gtc2V0IGludGVncmF0aW9uIC8KPj4+ICAgICAgdXNpbmcgdGhpcyB2ZXJzaW9uIG9mIHRoZSBw
cm9wZXJ0aWVzIGFuZCB0aGVuIGlmIGV2ZXJ5b25lIGlzIG9rIHdpdGgKPj4+ICAgICAgdGhlIHBy
b3Bvc2VkIHVzZXJzcGFjZSBBUEkgSmFuaSBjYW4gaG9wZWZ1bGx5IG1lcmdlIHRoZSB3aG9sZSBz
ZXQKPj4+ICAgICAgdGhyb3VnaCB0aGUgaTkxNSB0cmVlIHNvbWV0aW1lIGR1cmluZyB0aGUgNS45
IGN5Y2xlLgo+Pj4KPj4+Cj4+PiBTR1RNLiBJIGhhdmUgYWN0dWFsbHkgbW92ZWQgdG8gd29ya2lu
ZyBvbiBzb21ldGhpbmcgZWxzZSBub3csIHNvIEkgd2lsbCBtb3N0IGxpa2VseSB3YWl0IGZvciB0
aGlzIHBhdGNoIHRvIGdldCBtZXJnZWQsIGJlZm9yZSByZWJhc2luZyBteSBvdGhlciAvIHJlbWFp
bmluZyBwYXRjaGVzIG9uIHRvcCBvZiB0aGF0Lgo+Pgo+PiBXZSBoYXZlIHRoZSBydWxlIHRoYXQg
Y29kZSBsaWtlIHRoaXMgd2lsbCBub3QgYmUgbWVyZ2VkIHVudGlsIGl0IGhhcyBhdCBsZWFzdAo+
PiBvbmUgaW4ga2VybmVsIHVzZXIuIEkgcGxhbiB0byBldmVudHVhbGx5IHVzZSB0aGlzIHRvbywg
YnV0IHRoYXQgaXMgc3RpbGwKPj4gYSB3aGlsZSBhd2F5IGFzIEkgZmlyc3QgbmVlZCB0byB3cml0
ZSBhIGxjZHNoYWRvdyBzdWJzeXN0ZW0gd2hpY2ggdGhlCj4+IHRoaW5rcGFkX2FjcGkgY29kZSBj
YW4gdGhlbiB1c2UgdG8gcmVnaXN0ZXIgYSBsY2RzaGFkb3cgZGV2aWNlOyBhbmQgd2hlbgo+PiB0
aGF0IGFsbCBpcyBpbiBwbGFjZSwgdGhlbiBJIGNhbiBob29rIGl0IHVwIG9uIHRoZSBkcm0gY29k
ZS4KPiAKPiBIaSwKPiAKPiBJIGJlbGlldmUgdGhpcyBmYWxscyB1bmRlciAibmV3IFVBUEkiIHJ1
bGVzLCBiZWNhdXNlIHRoaXMgaXMgYWRkaW5nIG5ldwo+IEtNUyBwcm9wZXJ0aWVzLiBIZW5jZSBh
biBpbi1rZXJuZWwgdXNlciBpcyBub3QgZW5vdWdoOgo+IAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2dwdS9kcm0tdWFwaS5odG1sI29wZW4tc291cmNlLXVzZXJzcGFj
ZS1yZXF1aXJlbWVudHMKCkhtbSwgSSBiZWxpZXZlIHRoYXQgdGhhdCBtb3N0bHkgYXBwbGllcyB0
byBuZXcgRFJJIChpb2NsdCkgaW50ZXJmYWNlcyBmb3IKc3VibWl0dGluZyByZW5kZXJpbmcgY29t
bWFuZHMgdG8gbmV3IEdQVXMgYW5kIG90aGVyIGNvbXBsZXggbmV3IEFQSXMgYW5kCm5vdCBuZWNl
c3NhcmlseSB0byBpbnRyb2R1Y2luZyBuZXcgcHJvcGVydGllcy4gICAgQWxzbyBub3RlIHRoYXQg
YWxsCnByb3BlcnRpZXMgYXJlIGV4cG9ydGVkIHVuZGVyIFggdGhyb3VnaCBYcmFuZHIsIGF0IGxl
YXN0IHJlYWRpbmcgdGhlbSwKbm90IHN1cmUgYWJvdXQgc2V0dGluZyB0aGVtLgoKQW55d2F5cyBJ
IGRvIHBsYW4gdG8gd3JpdGUgc29tZSBtdXR0ZXIgY29kZSB0byB0ZXN0IG15IGxjZHNoYWRvdyBz
dWJzeXMgPC0+CkRSTSBkcml2ZXIgaW50ZWdyYXRpb24gd2hlbiB0aGF0IGlzIGFsbCBtb3JlIHRo
ZW4ganVzdCB2YXBvcndhcmUuIEJ1dCBJCndvdWxkIHByZWZlciBmb3IgUmFqYXQncyBzZXJpZXMg
dG8gbGFuZCBiZWZvcmUgdGhhdCBzbyB0aGF0IEkgY2FuIGJ1aWxkCm9uIHRvcCBvZiBpdC4KClJl
Z2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
