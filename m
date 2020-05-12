Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FB1CEEF8
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 10:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B926E862;
	Tue, 12 May 2020 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8C06E862
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589271517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnzPB5zEq6Q+Bz3YEkoV5c555kQN1HMRgPSqB7pA3X4=;
 b=G1lGzN57MvpOdA/HRcVL74rIRFD2wPFD5m9DUAi+84M2MgBg8u2L3hwR/DsyLSywrKVDi8
 5/my+kwFpw5Iv0TthdzDKdc1Q1GvOva0cUKlOGDvjmImdzlkDb783O7Ad1F4C29noWB/hB
 KpkezupllKpoSce/5kP6N+vsCCbVXpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-bKhRuoA3O2uUeC9gBXpa6Q-1; Tue, 12 May 2020 04:18:34 -0400
X-MC-Unique: bKhRuoA3O2uUeC9gBXpa6Q-1
Received: by mail-wm1-f72.google.com with SMTP id v23so5808048wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DnzPB5zEq6Q+Bz3YEkoV5c555kQN1HMRgPSqB7pA3X4=;
 b=tDKkleUJ5zUb/GexLs10S7k5Nx1kBDIbEWHjyAujndU/KEkN97eMfhnLWX6SVKoo57
 nj9/IgpkwT9jvt5U0cQ4QoayBMaDq7zcfX/bfp/AXP5kDXJLWPuBT4kn90b9P/2RzTaJ
 lwAuB1rMTU3dTQjdPqioCyODSjFIL5SLx6Ku9dv3NUwCoraKF5iWSncm2EB6bY6CJri3
 Mbcgt8vMoWpG64ZUpVN3sdoY+lN3mKNZDG6piB/MhU6LkglFNr7yiH0SWe2BBo7qWPxr
 giNZCi0USHXDa8GLK7mdJF81vhf7/dOtPp2E8AH0qcCiDkXRGCGbMoo/AcfhMLOVno8p
 WqGA==
X-Gm-Message-State: AGi0Puaxxoay2PgHHDmuR8yobUN1XP8tS3wekfHzlIRo5DrSKfKEccEE
 MI7dqUSWsZSvT08vO4E+8y/s2+bOVx0L63w4FE6K0Su7GkNNopNN/YJVXH3CHRpSnC9Ld+NS4uG
 9e0J6sU+cZXXgcc8t6Hzm41gwZeHY
X-Received: by 2002:a1c:df46:: with SMTP id w67mr27735239wmg.130.1589271513048; 
 Tue, 12 May 2020 01:18:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJF4wBve9n9uZacTtwfX7zCVOI/GMXojkXgOnhuM/O8dysRkqt0KD6/l1FeNtCTiR5TYRHmIA==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr27735223wmg.130.1589271512814; 
 Tue, 12 May 2020 01:18:32 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id p8sm21163321wre.11.2020.05.12.01.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 01:18:32 -0700 (PDT)
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
To: Rajat Jain <rajatja@google.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
Date: Tue, 12 May 2020 10:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
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
 Jared Dominguez <jaredz@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA1LzExLzIwIDk6NTUgUE0sIFJhamF0IEphaW4gd3JvdGU6Cj4gSGkgSGFucywKPiAK
PiBPbiBNb24sIE1heSAxMSwgMjAyMCBhdCAxMDo0NyBBTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tIDxtYWlsdG86aGRlZ29lZGVAcmVkaGF0LmNvbT4+IHdyb3RlOgo+IAo+ICAg
ICBIaSBBbGwsCj4gCj4gICAgIFRoaXMgUkZDIHRha2VzIFJhamF0J3MgZWFybGllciBwYXRjaCBm
b3IgYWRkaW5nIHByaXZhY3ktc2NyZWVuIHByb3BlcnRpZXMKPiAgICAgaW5mcmEgdG8gZHJtX2Nv
bm5lY3Rvci5jIGFuZCB0aGVuIGFkZHMgdGhlIHJlc3VsdHMgb2YgdGhlIGRpc2N1c3Npb24gZnJv
bQo+ICAgICB0aGUgIlJGQzogRHJtLWNvbm5lY3RvciBwcm9wZXJ0aWVzIG1hbmFnZWQgYnkgYW5v
dGhlciBkcml2ZXIgLyBwcml2YWN5Cj4gICAgIHNjcmVlbiBzdXBwb3J0IiBtYWlsIHRocmVhZCBv
biB0b3AsIGhlbmNlIHRoZSB2Mi4KPiAKPiAKPiBUaGFuayB5b3Ugc28gbXVjaCBmb3IgZG9pbmcg
dGhpcy4gSSB3YXMgZm9sbG93aW5nIHRoZSBzYWlkIGRpc2N1c3Npb24gYW5kIGV2ZW50dWFsbHkg
aXQgYmVjYW1lIHF1aXRlIGNvbXBsZXggZm9yIG1lIHRvIHVuZGVyc3RhbmQgYW5kIGZvbGxvdyA6
LSkKCkkgaG9wZSB0aGUgbmV3IGRvYyB0ZXh0IG1ha2VzIHRoaW5ncyBjbGVhciBhZ2Fpbj8KCgo+
ICAgICBUaGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgaGVyZSBpcyBiaWcga2VybmVsLWRvYyBjb21t
ZW50IHdoaWNoIGdldHMgYWRkZWQgaW4KPiAgICAgdGhlIGZpcnN0IHBhdGNoLWNodW5rIG1vZGlm
eWluZyBkcm1fY29ubmVjdG9yLmMsIHRoaXMgc3VtbWFyaXplcywgb3IgYXQKPiAgICAgbGVhc3Qg
dHJpZXMgdG8gc3VtbWFyaXplLCB0aGUgY29uY2x1c2lvbnMgb2Ygb3VyIHByZXZpb3VzIGRpc2N1
c3Npb24gb24KPiAgICAgdGhlIHVzZXJzcGFjZSBBUEkgYW5kIGxheXMgZG93biB0aGUgZ3JvdW5k
IHJ1bGVzIGZvciBob3cgdGhlIDIgbmV3Cj4gICAgICJwcml2YWN5LXNjcmVlbiBzdy1zdGF0ZSIg
YW5kwqAgInByaXZhY3ktc2NyZWVuIGh3LXN0YXRlIiBwcm9wZXJ0aWVzIGFyZQo+ICAgICB0byBi
ZSB1c2VkIGJvdGggZnJvbSB0aGUgZHJpdmVyIHNpZGUgYXMgd2VsbCBhcyBmcm9tIHRoZSB1c2Vy
c3BhY2Ugc2lkZS4KPiAKPiAgICAgT3RoZXIgdGhlbiB0aGF0IHRoaXMgbW9kaWZpZXMgUmFqYXQn
cyBwYXRjaCB0byBhZGQgMiBwcm9wZXJ0aWVzIGluc3RlYWQKPiAgICAgb2Ygb25lLCB3aXRob3V0
IG11Y2ggb3RoZXIgY2hhbmdlcy4KPiAKPiAgICAgUmFqYXQsIHBlcmhhcHMgeW91IGNhbiBkbyBh
IG5ldyB2ZXJzaW9uIG9mIHlvdXIgcGF0Y2gtc2V0IGludGVncmF0aW9uIC8KPiAgICAgdXNpbmcg
dGhpcyB2ZXJzaW9uIG9mIHRoZSBwcm9wZXJ0aWVzIGFuZCB0aGVuIGlmIGV2ZXJ5b25lIGlzIG9r
IHdpdGgKPiAgICAgdGhlIHByb3Bvc2VkIHVzZXJzcGFjZSBBUEkgSmFuaSBjYW4gaG9wZWZ1bGx5
IG1lcmdlIHRoZSB3aG9sZSBzZXQKPiAgICAgdGhyb3VnaCB0aGUgaTkxNSB0cmVlIHNvbWV0aW1l
IGR1cmluZyB0aGUgNS45IGN5Y2xlLgo+IAo+IAo+IFNHVE0uIEkgaGF2ZSBhY3R1YWxseSBtb3Zl
ZCB0byB3b3JraW5nIG9uIHNvbWV0aGluZyBlbHNlIG5vdywgc28gSSB3aWxsIG1vc3QgbGlrZWx5
IHdhaXQgZm9yIHRoaXMgcGF0Y2ggdG8gZ2V0IG1lcmdlZCwgYmVmb3JlIHJlYmFzaW5nIG15IG90
aGVyIC8gcmVtYWluaW5nIHBhdGNoZXMgb24gdG9wIG9mIHRoYXQuCgpXZSBoYXZlIHRoZSBydWxl
IHRoYXQgY29kZSBsaWtlIHRoaXMgd2lsbCBub3QgYmUgbWVyZ2VkIHVudGlsIGl0IGhhcyBhdCBs
ZWFzdApvbmUgaW4ga2VybmVsIHVzZXIuIEkgcGxhbiB0byBldmVudHVhbGx5IHVzZSB0aGlzIHRv
bywgYnV0IHRoYXQgaXMgc3RpbGwKYSB3aGlsZSBhd2F5IGFzIEkgZmlyc3QgbmVlZCB0byB3cml0
ZSBhIGxjZHNoYWRvdyBzdWJzeXN0ZW0gd2hpY2ggdGhlCnRoaW5rcGFkX2FjcGkgY29kZSBjYW4g
dGhlbiB1c2UgdG8gcmVnaXN0ZXIgYSBsY2RzaGFkb3cgZGV2aWNlOyBhbmQgd2hlbgp0aGF0IGFs
bCBpcyBpbiBwbGFjZSwgdGhlbiBJIGNhbiBob29rIGl0IHVwIG9uIHRoZSBkcm0gY29kZS4KClNv
IHNpbmNlIEphbmkgc2FpZCB5b3VyIHBhdGNoLXNldCB3YXMgbW9yZSBvciBsZXNzIHJlYWR5IEkg
dGhpbmsgaXQgd291bGQKYmUgYmVzdCBpZiB5b3UgYWRkIG15IHZlcnNpb24gb2YgdGhpcyB0byB5
b3VyIHBhdGNoLXNldCBhbmQgdGhlbiBwb3N0CmEgbmV3IHZlcnNpb24gb2YgeW91ciBwYXRjaC1z
ZXQuIEJ1dCBmaXJzdCBsZXQgbWUgZG8gYSB2MyBhZGRyZXNzaW5nCnRoZSByZW1hcmtzIG9uIGRv
YyB0ZXh0LiBOb3RlIEkgd2lsbCB3YWl0IGEgYml0IGJlZm9yZSBzZW5kaW5nIG91dCB2Mwp0byBz
ZWUgaWYgSSBnZXQgbW9yZSBmZWVkYmFjay4KClJlZ2FyZHMsCgpIYW5zCgoKPiAKPiBUaGFua3Mg
JiBCZXN0IFJlZ2FyZHMsCj4gCj4gUmFqYXQKPiAKPiAgICAgVGhpcyBSRkMgdGFrZXMgUmFqYXQn
cyBlYXJsaWVyIHBhdGNoIGZvciBhZGRpbmcgcHJpdmFjeS1zY3JlZW4gcHJvcGVydGllcwo+ICAg
ICBpbmZyYSB0byBkcm1fY29ubmVjdG9yLmMgYW5kIHRoZW4gYWRkcyB0aGUgcmVzdWx0cyBvZiB0
aGUgZGlzY3Vzc2lvbiBmcm9tCj4gICAgIHRoZSAiUkZDOiBEcm0tY29ubmVjdG9yIHByb3BlcnRp
ZXMgbWFuYWdlZCBieSBhbm90aGVyIGRyaXZlciAvIHByaXZhY3kKPiAgICAgc2NyZWVuIHN1cHBv
cnQiIG1haWwgdGhyZWFkIG9uIHRvcCwgaGVuY2UgdGhlIHYyLgo+IAo+ICAgICBUaGUgbW9zdCBp
bXBvcnRhbnQgdGhpbmcgaGVyZSBpcyBiaWcga2VybmVsLWRvYyBjb21tZW50IHdoaWNoIGdldHMg
YWRkZWQgaW4KPiAgICAgdGhlIGZpcnN0IHBhdGNoLWNodW5rIG1vZGlmeWluZyBkcm1fY29ubmVj
dG9yLmMsIHRoaXMgc3VtbWFyaXplcywgb3IgYXQKPiAgICAgbGVhc3QgdHJpZXMgdG8gc3VtbWFy
aXplLCB0aGUgY29uY2x1c2lvbnMgb2Ygb3VyIHByZXZpb3VzIGRpc2N1c3Npb24gb24KPiAgICAg
dGhlIHVzZXJzcGFjZSBBUEkgYW5kIGxheXMgZG93biB0aGUgZ3JvdW5kIHJ1bGVzIGZvciBob3cg
dGhlIDIgbmV3Cj4gICAgICJwcml2YWN5LXNjcmVlbiBzdy1zdGF0ZSIgYW5kIMKgInByaXZhY3kt
c2NyZWVuIGh3LXN0YXRlIiBwcm9wZXJ0aWVzIGFyZQo+ICAgICB0byBiZSB1c2VkIGJvdGggZnJv
bSB0aGUgZHJpdmVyIHNpZGUgYXMgd2VsbCBhcyBmcm9tIHRoZSB1c2Vyc3BhY2Ugc2lkZS4KPiAK
PiAgICAgT3RoZXIgdGhlbiB0aGF0IHRoaXMgbW9kaWZpZXMgUmFqYXQncyBwYXRjaCB0byBhZGQg
MiBwcm9wZXJ0aWVzIGluc3RlYWQKPiAgICAgb2Ygb25lLCB3aXRob3V0IG11Y2ggb3RoZXIgY2hh
bmdlcy4KPiAKPiAgICAgUmFqYXQsIHBlcmhhcHMgeW91IGNhbiBkbyBhIG5ldyB2ZXJzaW9uIG9m
IHlvdXIgcGF0Y2gtc2V0IGludGVncmF0aW9uIC8KPiAgICAgdXNpbmcgdGhpcyB2ZXJzaW9uIG9m
IHRoZSBwcm9wZXJ0aWVzIGFuZCB0aGVuIGlmIGV2ZXJ5b25lIGlzIG9rIHdpdGgKPiAgICAgdGhl
IHByb3Bvc2VkIHVzZXJzcGFjZSBBUEkgSmFuaSBjYW4gaG9wZWZ1bGx5IG1lcmdlIHRoZSB3aG9s
ZSBzZXQKPiAgICAgdGhyb3VnaCB0aGUgaTkxNSB0cmVlIHNvbWV0aW1lIGR1cmluZyB0aGUgNS45
IGN5Y2xlLgo+IAo+ICAgICBSZWdhcmRzLAo+IAo+ICAgICBIYW5zCj4gCj4gICAgIHAucy4KPiAK
PiAgICAgSSBwbGFuIHRvIHN0YXJ0IHdvcmtpbmcgb24gdGhlIGxjZHNoYWRvdyBzdWJzeXN0ZW0g
bmV4dC4gQXMgZGlzY3Vzc2VkIHRoZQo+ICAgICBwbGFuIGZvciB0aGlzIHN1YnN5c3RlbSBpcyB0
byBhbGxvdyBkcml2ZXJzIG91dHNpZGUgb2YgdGhlIERSTSBzdWJzeXMsIHN1Y2gKPiAgICAgYXMg
Zm9yIGV4YW1wbGUgdGhlIHRoaW5rcGFkX2FjcGkgZHJpdmVyLCB0byByZWdpc3RlciBhIGxjZHNo
YWRvdyBkZXZpY2UsCj4gICAgIHdoaWNoIERSTSBkcml2ZXJzIGNhbiB0aGVuIGdldCBhIHJlZmVy
ZW5jZSB0byBhbmQgdXNlIHRvIGltcGxlbWVudCB0aGVzZQo+ICAgICBwcm9wZXJ0aWVzLgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
