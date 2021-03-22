Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9D3451C5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E1D6E5AE;
	Mon, 22 Mar 2021 21:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC0E6E079
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 21:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616448491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14m01PcuzCoNayNzn6+wIkzawZge0KqmlJ/a9zKMMOY=;
 b=F7zC2G8QsTqWPJOkNYoevrfQcKORqGKshzLN/6xkXXbNsXErhSC/0zb4twy4Y0u5ubX3Wg
 OImPNfuaausLDBs/mLc8KHUCd2VEcOXyzdhto4gqTXU89aJm601wWp1sGBUOVHT3rF4LKz
 eV57uFGUPGgFp/S5KHnwysIjX9w3m/4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-oX2ICmLROQWq-KRtpysYZA-1; Mon, 22 Mar 2021 17:28:09 -0400
X-MC-Unique: oX2ICmLROQWq-KRtpysYZA-1
Received: by mail-ej1-f71.google.com with SMTP id h14so50247ejg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14m01PcuzCoNayNzn6+wIkzawZge0KqmlJ/a9zKMMOY=;
 b=NSw13HsEY4zgULM/aFWN4hwF+/6bbQcUXFWFgFmKOuOCYyOz8V7DBH5tjqtTFOGsJu
 48aV7ZPBQys2juyjrZZ+mYUQ3xFMeRe4QrnCyKch/LSk+H8jf9J9z9lpjYGMAkicGgD9
 gtpfLn6J5t63qltKe964tbYtKrkfiqme8NO28eJI9CCjj2WJWRQKf8YutrTNXolT0gtw
 ZQMbzDbrr5Zg5UUIm27UOQ5CCSS8jGbgkZMUCl89F367Jn4AtDH3cmNukJ+i4bHYU0Au
 nfE4idIDIvfIldWmZdyoajUQUGhb9M1jRH7csUmbIQhdi7KPnjnH4lcAAgieyNniZD4g
 wOFw==
X-Gm-Message-State: AOAM533GVfgoW/zNhCFDiZSxPTwK9d0Z08k4bWDt/AKHj1zD1hiIWC9W
 aWNhuNho19a9Y7UDeA6fALBZDWunuVey3LeetB8TYXfImdH+2txQ0tVw/Y6N+Tjdi/t3l4pX09c
 HbOWdEGC64hbdnzozSIB9LbNhUVNx/NX9TYWGqMxonMB+s/puNpSo+0RWTCkIvgoAyw4WQvk+L+
 7hLw21
X-Received: by 2002:a17:907:1b20:: with SMTP id
 mp32mr1670155ejc.495.1616448488075; 
 Mon, 22 Mar 2021 14:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVm8lLf2wXl77V1ZvbGq7gC1k+pKIsC4RSCtFtvxWE+eaSPJogtVzRDECxGWI5ZXow+eVoWw==
X-Received: by 2002:a17:907:1b20:: with SMTP id
 mp32mr1670140ejc.495.1616448487819; 
 Mon, 22 Mar 2021 14:28:07 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g20sm11737275edb.7.2021.03.22.14.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:28:07 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
Date: Mon, 22 Mar 2021 22:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFkFH2uAR+6mNONZ@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzLzIyLzIxIDk6NTkgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBNb24s
IE1hciAyMiwgMjAyMSBhdCAwNDo1MTo0N1BNIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4+
IE9uIEZyaSwgTWFyIDE5LCAyMDIxIGF0IDA0OjQ1OjMyUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUg
d3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAzLzEvMjEgNDo0MyBQTSwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPj4+PiBBZnRlciB0aGUgcmVjZW50bHkgYWRkZWQgY29tbWl0IGZlMGYxZTNiZmRmZSAo
ImRybS9pOTE1OiBTaHV0IGRvd24KPj4+PiBkaXNwbGF5cyBncmFjZWZ1bGx5IG9uIHJlYm9vdCIp
LCB0aGUgRFNJIHBhbmVsIG9uIGEgQ2hlcnJ5IFRyYWlsIGJhc2VkCj4+Pj4gUHJlZGlhIEJhc2lj
IHRhYmxldCB3b3VsZCBubyBsb25nZXIgcHJvcGVybHkgbGlnaHQgdXAgYWZ0ZXIgcmVib290Lgo+
Pj4+Cj4+Pj4gVGhlIGJhY2tsaWdodCBzdGlsbCB0dXJucyBiYWNrIG9uIGFmdGVyIHJlYm9vdCwg
YnV0IHRoZSBMQ0Qgc2hvd3MgYW4KPj4+PiBhbGwgYmxhY2sgZGlzcGxheS4gVGhlIGRpc3BsYXkg
aXMgYWxzbyBhbGwgYmxhY2sgZHVyaW5nIHRoZSB0aW1lIHRoYXQKPj4+PiBFRkkgLyB0aGUgR09Q
IGlzIG1hbmFnaW5nIGl0LCBzbyBlLmcuIHRoZSBncnViIG1lbnUgYWxzbyBpcyBub3QgdmlzaWJs
ZS4KPj4+Pgo+Pj4+IEluIHRoaXMgc2NlbmFyaW8gdGhlIHBhbmVsIGlzIGluaXRpYWxpemVkIHNv
IHRoYXQgaXQgYXBwZWFycyB0byBiZSB3b3JraW5nCj4+Pj4gYW5kIHRoZSBmYXN0Ym9vdCBjb2Rl
IHNraXBzIGRvaW5nIGEgbW9kZXNldC4gRm9yY2luZyBhIG1vZGVzZXQgYnkgZG9pbmcgYQo+Pj4+
IGNodnQgdG8gYSB0ZXh0LWNvbnNvbGUgb3ZlciBzc2ggZm9sbG93ZWQgYnkgZWNoby1pbmcgMSBh
bmQgdGhlbiAwIHRvCj4+Pj4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAvYmxhbmsgY2F1c2VzIHRo
ZSBwYW5lbCB0byB3b3JrIGFnYWluLgo+Pj4+Cj4+Pj4gQWRkIGEgUVVJUktfU0tJUF9TSFVURE9X
TiBxdWlyayB3aGljaCB0dXJucyBpOTE1X2RyaXZlcl9zaHV0ZG93bigpIGludG8KPj4+PiBhIG5v
LW9wIHdoZW4gc2V0OyBhbmQgc2V0IHRoaXMgb24gdmx2L2NodiBkZXZpY2VzIHdoZW4gYSBEU0kg
cGFuZWwgaXMKPj4+PiBkZXRlY3RlZCwgdG8gd29yayBhcm91bmQgdGhpcy4KPj4+Pgo+Pj4+IEFk
bWl0dGVkbHkgdGhpcyBpcyBhIGJpdCBvZiBhIGJpZyBoYW1tZXIsIGJ1dCB0aGVzZSBwbGF0Zm9y
bXMgaGF2ZSBiZWVuCj4+Pj4gYXJvdW5kIGZvciBxdWl0ZSBzb21lIHRpbWUgbm93IGFuZCB0aGV5
IGhhdmUgYWx3YXlzIHdvcmtlZCBmaW5lIHdpdGhvdXQKPj4+PiB0aGUgbmV3IGJlaGF2aW9yIHRv
IHNodXRkb3duIGV2ZXJ5dGhpbmcgb24gc2h1dGRvd24vcmVib290LiBUaGlzIGFwcHJvYWNoCj4+
Pj4gc2ltcGx5IGRpc2FibGVzIHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIG5ldyBzaHV0ZG93biBi
ZWhhdmlvciBpbiB0aGlzCj4+Pj4gc3BlY2lmaWMgY2FzZSB3aGVyZSBpdCBpcyBrbm93biB0byBj
YXVzZSBwcm9ibGVtcy4gV2hpY2ggaXMgYSBuaWNlIGFuZAo+Pj4+IHNpbXBsZSB3YXkgdG8gZGVh
bCB3aXRoIHRoaXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgo+Pj4KPj4+IFBpbmc/IFNpbmNlIHNlbmRpbmcgdGhpcyBwYXRjaCBJ
J3ZlIGJlZW4gc2VlaW5nIHRoZSBpc3N1ZSBhZGRyZXNzZWQgYnkKPj4+IHRoaXMgb24gdmFyaW91
ciBvdGhlciBDSFQgYmFzZWQgZGV2aWNlcyB0b28uCj4+Pgo+Pj4gU28gd2UgaGF2ZSB2YXJpb3Vz
IGRldmljZXMgc3VmZmVyaW5nIGZyb20gYSBibGFjayBzY3JlZW4gYWZ0ZXIgcmVib290Cj4+PiBu
b3cuIFRoaXMgaXMgcHJldHR5IHNlcmlvdXMgdXNhYmlsaXR5IHJlZ3Jlc3Npb24uCj4+Pgo+Pj4g
QXMgc3VjaCBpdCB3b3VsZCBiZSBnb29kIHRvIGdldCB0aGlzIHJldmlld2VkLCBvciBhbm90aGVy
IGZpeCBwcm9wb3NlZC4KPj4KPj4gRm9yIHRoZSBxdWlya3Mgd2UgdHJ5IHRvIGxpbWl0IHRoZW0g
dG8gdmVyeSBzcGVjaWZpYyB2ZW5kb3IgYW5kIG1vZGVsIGlkcywKPj4gc28gSSB3b25kZXIgaWYg
aXQgd291bGQgYmUgcG9zc2libGUgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gaW4gaGVyZSBpbnN0
ZWFkCj4+IHRvIGFsbCB0aGUgdmx2IHdpdGggZHNpLi4uCj4+Cj4+IE9yIGF2b2lkIHRoZSBxdWly
ayAiaW5mcmEiIGFuZCBza2lwIHRvIGFsbCB2bHYgd2l0aCBhY3RpdmUgZHNpPyEKPj4KPj4gSmFu
aT8KPj4gVmlsbGU/Cj4gCj4gV2UgbmVlZCB0byBmaWd1cmUgb3V0IHdoeSB0aGUgcGFuZWwgZG9l
c24ndCBzdGFydCB1cCBhZ2Fpbi4KCk5vdGUgaXQgaXMgdGhlIEdPUCB3aGljaCBmYWlscyB0byBs
aWdodCBpdCB1cCBhZ2Fpbi4gSSB0aGluayB3ZSB0dXJuIHNvbWV0aGluZwpvZmYsIHdoaWNoIGFm
dGVyIGEgcG93ZXItb24tcmVzZXQgaXMgb24sIHNvIHRoZSBHT1AgZXhwZWN0cyBpdCB0byBiZSBv
bi4KCj4gSWYgaXQgaGFzCj4gcHJvYmxlbXMgd2l0aCB0aGlzIHRoZW4gc3VyZWx5IGl0IGFsc28g
ZmFpbHMgaWYgd2UganVzdCBoYXBwZW4gdG8gcmVib290Cj4gd2l0aCB0aGUgcGFuZWwgYWxyZWFk
eSBvZmY/CgpJIHdvdWxkIGFzc3VtZSBzbywgeWVzLCBidXQgdGhhdCBvbmx5IGhhcHBlbnMgb24g
c2F5IGEgInJlYm9vdCAtLWZvcmNlIgpvdmVyIHNzaCwgd2hpbGUgdGhlIHNjcmVlbiBpcyBvZmYu
IFdoaWNoIGFyZSByYXRoZXIgZXhjZXB0aW9uYWwgY2lyY3Vtc3RhbmNlcy4KCldoZXJlIGFzIGp1
c3QgYSByZWd1bGFyIHJlYm9vdCBpcyBxdWl0ZSBub3JtYWwgYW5kIG5vdyByZXN1bHRzIGluIGEg
YmxhY2sKc2NyZWVuLiBBbmQgcmVjb3Zlcnkgb2YgdGhpcyBjb25kaXRpb24gYnkgYSBub3JtYWwg
dXNlciBpbnZvbHZlcyBhCnBvd2VyLWN5Y2xlIGJ5IHByZXNzaW5nIHRoZSBwb3dlci1idXR0b24g
Zm9yIDEwIHNlY29uZHMgKHRoZXNlIGFyZSB0YWJsZXRzCnNvIHRoZSBmb3JjZS1wb3dlci1vZmYg
dGltZSBpcyBxdWl0ZSBsb25nKSwgd2hpY2ggbW9zdCB1c2VycyBkb24ndCBldmVuIGtub3cKdGhl
eSBjYW4gZG8uLi4KCj4gT2ggYSBtb2Rlc2V0IGZpeGVzIGl0PyBUaGVuIEkgZ3Vlc3MgaXQncyBq
dXN0IGZhc3Rib290IGZhaWwgZHVlIHRvIERTSQo+IGNvZGUgYmVpbmcgY3JhcD8KClRoaXMgaXMg
bm90IGEgZmFzdGJvb3QgaXNzdWUsIGlmIEkgbWFrZSB0aGUgZ3J1YiBtZW51IHNob3cgZXZlcnkg
Ym9vdCwKdGhlIGdydWItbWVudSBpcyBhbHNvIGFsbCBibGFjaywgYXMgdGhlIEdPUCBmYWlscyB0
byBwcm9wZXJseSBpbml0aWFsaXplCnRoZSBwYW5lbCB3aGVuIHRoaXMgaGFwcGVucyBmYXN0Ym9v
dCBqdXN0IGluaGVyaXRzIHRoaXMgY29uZGl0aW9uLgoKQXNzdW1pbmcgdGhhdCB3ZSB3YW50IHRv
IGhhdmUgdGhlIEVGSSBnZngvY29uc29sZSB3b3JrIG9uIHJlYm9vdAooZm9yIHNheSB0aGUgZ3J1
YiBtZW51KSwgdGhlbiBkaXNhYmxpbmcgZmFzdGJvb3QgaXMgbm90IGdvaW5nIHRvIGhlbHAuCgpB
bHNvIG5vdGUgdGhhdCB0aGUgV2luZG93cyBib290LXNwbGFzaCB3aXRoIHRoZSBjaXJjbGluZyBk
b3RzIHVzZXMgdGhlCmVmaWZiLCBzbyByZWJvb3RpbmcgaW50byBXaW5kb3dzIGFsc28gbGVhZHMg
dG8gYSBibGFja3NjcmVlbiBhdCBsZWFzdAp1bnRpbCBXaW5kb3dzIGhhcyBib290ZWQgYWxsIHRo
ZSB3YXkuIE5vdGUgSSBoYXZlIG5vdCB0cmllZCBXaW5kb3dzLApzbyBJIGRvbid0IGtub3cgaWYg
V2luZG93cyB3aWxsIHJlY292ZXIgZnJvbSB0aGUgYmxhY2sgc2NyZWVuIG9uY2UKaXRzIGdmeCBk
cml2ZXIgbG9hZHMsIG9yIGlmIGl0IHN0YXlzIGJsYWNrIHRoZW4gdG9vLgoKPiBJZiBubyBvbmUg
aXMgd2lsbGluZyB0byBmaXggaXQgdGhlbiBJIGd1ZXNzIHdlIGp1c3QKPiBuZWVkIHRvIGRpc2Fi
bGUgZmFzdGJvb3QgZm9yIERTSSBzb21laG93LgoKU2VlIGFib3ZlLCB0aGlzIGlzIGEgR09QIGlz
c3VlLCBzbyB0aGVyZSBpcyBub3RoaW5nIGZvciB1cyB0byBmaXgsCndoYXQgd2UgbmVlZCB0byBk
byBpcyBzdG9wIGxlYXZpbmcgdGhlIGh3IGluIGEgc3RhdGUgd2hpY2ggdGhlIEdPUApjYW5ub3Qg
ZGVhbCB3aXRoLiBXaGljaCBsZWFkcyBtZSB0byBiZWxpZXZlIHRoYXQgd2UganVzdCBuZWVkIHRv
IGRpc2FibGUKdGhlICJncmFjZWZ1bCBzaHV0ZG93biIgb24gdGhlIGNvbWJpbmF0aW9uIG9mIERT
SSArIEJZVC9DSFQuCgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
