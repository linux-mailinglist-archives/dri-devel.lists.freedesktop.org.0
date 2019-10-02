Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02975C4B58
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 12:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B96E92A;
	Wed,  2 Oct 2019 10:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15836E92A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 10:24:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l3so18986699wru.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O+hcgVLMwxs2OkjmvbvoX9zdHxPsFqiVek5U1Sq91Og=;
 b=oKE4ewQaRPCXSqBxtkvXrWRXvu0D8aqW3+MNwbipHCPsdIl41gxJ0JrhCfjlMEtNj5
 h1N2Pl1R26vsXhvimy3GMb1DF1fP/IYtL4+EP60bSshBiWm6Caycq+cP0F1jklM5l/Nx
 y31m98TAN3mSeP8nFbPupRyrjw1s4I2bd8QTk8zBcf80Vounp33oh4kJbwpDyrxEMW6B
 90Tn7RHp7jCa7Cai4mYB3h2JVH7TaXcYwkYDg2t8a4nuiVnt8CNeZwfbtTyZzQWSza1G
 lp7sqQ+JiMgDH869Yj1rXnzN6cKGdR+WciDBL9LMbOF8G977V1K5fu62ILrViy6brqCV
 7LbQ==
X-Gm-Message-State: APjAAAWAetCw0mjh5vGRGGReTAqElcXroreGFPF0Y+cQdPy5J9L+7WYA
 TtkmQx9jWHH4qwor+lFqyKXpAg==
X-Google-Smtp-Source: APXvYqzm4psWhT/qwxM+0DfcvNeW2kmFiBOtLH8/d0NySfTutKmqsAhdzKbtpHa3rlFDATSCfi8SFw==
X-Received: by 2002:adf:f20e:: with SMTP id p14mr1973496wro.212.1570011871281; 
 Wed, 02 Oct 2019 03:24:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t4sm20164065wrm.13.2019.10.02.03.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:24:30 -0700 (PDT)
Date: Wed, 2 Oct 2019 11:24:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191002102428.zaid63hp6wpd7w34@holly.lan>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h84rbile.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O+hcgVLMwxs2OkjmvbvoX9zdHxPsFqiVek5U1Sq91Og=;
 b=WYNiWUnrV3gtv/lZGZljpHNjOVvPMo/JfitKNRVoIB3e5+h6TMaXrdudYBeDJeACEh
 Gf6wtVTgc5Rr7LI47jxMg8NGGY4k/W+FstCSBorFGU1NQvGf83wuho34gwbRrnIFukDO
 X1tmnGQWh0oSFYUlYzGH8FhXB3517L921pERboLpQoXOPh3SGk3RskVJ2zS17nK9tcZu
 aeiQuI7c+k3lqFqyrwE9XyC+lWqUHquIbxwLPi0FR8aKgIyL+sNM8xi9GiHpjlGdBMnA
 78XOETjsuQ3p/Hm8EqynB8le6VQTmsccJhusHW4j/424yzkFYo7VYuYzAU/VzCJxzDn8
 SQqQ==
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
Cc: rafael@kernel.org, gregkh@linuxfoundation.org,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mat King <mathewk@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMTI6MzA6MDVQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAwMSBPY3QgMjAxOSwgTWF0IEtpbmcgPG1hdGhld2tAZ29vZ2xlLmNvbT4g
d3JvdGU6Cj4gPiBSZXNlbmRpbmcgaW4gcGxhaW4gdGV4dCBtb2RlCj4gPgo+ID4gSSBoYXZlIGJl
ZW4gbG9va2luZyBpbnRvIGFkZGluZyBMaW51eCBzdXBwb3J0IGZvciBlbGVjdHJvbmljIHByaXZh
Y3kKPiA+IHNjcmVlbnMgd2hpY2ggaXMgYSBmZWF0dXJlIG9uIHNvbWUgbmV3IGxhcHRvcHMgd2hp
Y2ggaXMgYnVpbHQgaW50byB0aGUKPiA+IGRpc3BsYXkgYW5kIGFsbG93cyB1c2VycyB0byB0dXJu
IGl0IG9uIGluc3RlYWQgb2YgbmVlZGluZyB0byB1c2UgYQo+ID4gcGh5c2ljYWwgcHJpdmFjeSBm
aWx0ZXIuIEluIGRpc2N1c3Npb25zIHdpdGggbXkgY29sbGVhZ3VlcyB0aGUgaWRlYSBvZgo+ID4g
dXNpbmcgZWl0aGVyIC9zeXMvY2xhc3MvYmFja2xpZ2h0IG9yIC9zeXMvY2xhc3MvbGVkcyBidXQg
dGhpcyBuZXcKPiA+IGZlYXR1cmUgZG9lcyBub3Qgc2VlbSB0byBxdWl0ZSBmaXQgaW50byBlaXRo
ZXIgb2YgdGhvc2UgY2xhc3Nlcy4KPiA+Cj4gPiBJIGFtIHByb3Bvc2luZyBhZGRpbmcgYSBjbGFz
cyBjYWxsZWQgInByaXZhY3lfc2NyZWVuIiB0byBpbnRlcmZhY2UKPiA+IHdpdGggdGhlc2UgZGV2
aWNlcy4gVGhlIGluaXRpYWwgQVBJIHdvdWxkIGJlIHNpbXBsZSBqdXN0IGEgc2luZ2xlCj4gPiBw
cm9wZXJ0eSBjYWxsZWQgInByaXZhY3lfc3RhdGUiIHdoaWNoIHdoZW4gc2V0IHRvIDEgd291bGQg
bWVhbiB0aGF0Cj4gPiBwcml2YWN5IGlzIGVuYWJsZWQgYW5kIDAgd2hlbiBwcml2YWN5IGlzIGRp
c2FibGVkLgo+ID4KPiA+IEN1cnJlbnQga25vd24gdXNlIGNhc2VzIHdpbGwgdXNlIEFDUEkgX0RT
TSBpbiBvcmRlciB0byBpbnRlcmZhY2Ugd2l0aAo+ID4gdGhlIHByaXZhY3kgc2NyZWVucywgYnV0
IHRoaXMgY2xhc3Mgd291bGQgYWxsb3cgZGV2aWNlIGRyaXZlciBhdXRob3JzCj4gPiB0byB1c2Ug
b3RoZXIgaW50ZXJmYWNlcyBhcyB3ZWxsLgo+ID4KPiA+IEV4YW1wbGU6Cj4gPgo+ID4gIyBnZXQg
cHJpdmFjeSBzY3JlZW4gc3RhdGUKPiA+IGNhdCAvc3lzL2NsYXNzL3ByaXZhY3lfc2NyZWVuL2Ny
b3NfcHJpdmFjeS9wcml2YWN5X3N0YXRlICMgMTogcHJpdmFjeQo+ID4gZW5hYmxlZCAwOiBwcml2
YWN5IGRpc2FibGVkCj4gPgo+ID4gIyBzZXQgcHJpdmFjeSBlbmFibGVkCj4gPiBlY2hvIDEgPiAv
c3lzL2NsYXNzL3ByaXZhY3lfc2NyZWVuL2Nyb3NfcHJpdmFjeS9wcml2YWN5X3N0YXRlCj4gPgo+
ID4gIERvZXMgdGhpcyBhcHByb2FjaCBzZWVtIHRvIGJlIHJlYXNvbmFibGU/Cj4gCj4gV2hhdCBw
YXJ0IG9mIHRoZSB1c2Vyc3BhY2Ugd291bGQgYmUgbWFuYWdpbmcgdGhlIHByaXZhY3kgc2NyZWVu
PyBTaG91bGQKPiB0aGVyZSBiZSBhIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgZGlzcGxheSBhbmQg
dGhlIHByaXZhY3kgc2NyZWVuIHRoYXQKPiBjb3ZlcnMgdGhlIGRpc3BsYXk/IEhvdyB3b3VsZCB0
aGUgdXNlcnNwYWNlIG1ha2UgdGhhdCBjb25uZWN0aW9uIGlmIGl0J3MKPiBhIHN5c2ZzIGludGVy
ZmFjZT8KPiAKPiBJIGRvbid0IGtub3cgaG93IHRoZSBwcml2YWN5IHNjcmVlbiBvcGVyYXRlcywg
YnV0IGlmIGl0IGRyYXdzIGFueSBwb3dlciwKPiB5b3UnbGwgd2FudCB0byBkaXNhYmxlIGl0IHdo
ZW4geW91IHN3aXRjaCBvZmYgdGhlIGRpc3BsYXkgaXQgY292ZXJzLgo+IAo+IElmIHRoZSBwcml2
YWN5IHNjcmVlbiBjb250cm9sIHdhcyBwYXJ0IG9mIHRoZSBncmFwaGljcyBzdWJzeXN0ZW0gKHNh
eSwgYQo+IERSTSBjb25uZWN0b3IgcHJvcGVydHksIHdoaWNoIGZlZWxzIHNvbWV3aGF0IG5hdHVy
YWwpLCBJIHRoaW5rIGl0IHdvdWxkCj4gbWFrZSBpdCBlYXNpZXIgZm9yIHVzZXJzcGFjZSB0byBo
YXZlIHBvbGljaWVzIHN1Y2ggYXMgZW5hYmxpbmcgdGhlCj4gcHJpdmFjeSBzY3JlZW4gYXV0b21h
dGljYWxseSBkZXBlbmRpbmcgb24gdGhlIGNvbnRlbnQgeW91J3JlIHZpZXdpbmcsCj4gYnV0IG9u
bHkgaWYgdGhlIGNvbnRlbnQgaXMgb24gdGhlIGRpc3BsYXkgdGhhdCBoYXMgYSBwcml2YWN5IHNj
cmVlbi4KCkNvbm5lY3RvcnMgdmVyc3VzIHN5c2ZzIGNhbWUgdXAgb24gYSBiYWNrbGlnaHQgdGhy
ZWFkIHJlY2VudGx5LgoKRGFuaWVsIFZldHRlciB3cm90ZSBhbiBleGNlbGxlbnQgc3VtbWFyeSBv
biB3aHkgaXQgaGFzIGJlZW4gKGFuZCBzdGlsbAppcykgZGlmZmljdWx0IHRvIG1pZ3JhdGUgYmFj
a2xpZ2h0IGNvbnRyb2xzIHRvd2FyZHMgdGhlIERSTSBjb25uZWN0b3IKaW50ZXJmYWNlOgpodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOS84LzIwLzc1MgoKTWFueSBvZiB0aGUgYmFja2xpZ2h0IGxl
Z2FjeSBwcm9ibGVtcyBkbyBub3QgYXBwbHkgdG8gcHJpdmFjeSBzY3JlZW5zCmJ1dCBJIGRvIHN1
Z2dlc3QgcmVhZGluZyB0aGlzIHBvc3QgYW5kIHNvbWUgb2YgdGhlIG5laWdoYm91cmluZyBwYXJ0
cwpvZiB0aGUgdGhyZWFkLiBJbiBwYXJ0aWN1bGFyIHRoZSBBQ1BJIGRyaXZlciB2ZXJzdXMgcmVh
bCBkcml2ZXIgaXNzdWVzCkRhbmllbCBtZW50aW9uZWQgY291bGQgb2NjdXIgYWdhaW4uIEhvcGVm
dWxseSBub3QgdGhvdWdoLCBJIG1lYW4gaG93Cndyb25nIGNhbiBhIDEtYml0IGNvbnRyb2wgZ28/
IChhY3R1YWxseSBuby4uLiBkb24ndCBhbnN3ZXIgdGhhdCkuCgpJdCB3b3VsZCBkZWZpbml0ZWx5
IGJlIGEgc2hhbWUgdG8gYnVpbGQgdXAgYW4gdW5uZWNlc3Nhcnkgc3lzZnMgbGVnYWN5CmZvciBw
cml2YWN5IHNjcmVlbnMgc28gZGVmaW5pdGVseSB3b3J0aCBzZWVpbmcgaWYgdGhpcyBjYW4gdXNl
IERSTQpjb25uZWN0b3IgcHJvcGVydGllcy4KCgpEYW5pZWwuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
