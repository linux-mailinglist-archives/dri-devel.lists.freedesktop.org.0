Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786DEA80FB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359E894DE;
	Wed,  4 Sep 2019 11:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C6894DE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:20:42 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z17so20150950otk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 04:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFWJamEuvSUKAx3iY+IepxMBLdh2qd8tqi8QiGH8fUY=;
 b=XBH9tQiCHOJenOVdcF4ryZkxRSyrIJSJvVPQicRQmscaS3HFHUHrUNevtsgdsyBwgQ
 v7ZjXx6tizdNxwFvb5VS9sMBFEiuuol8QwVEvrzpNd9IEyhaJjuhpRyvnhS2Kwad/O3e
 mE9FYUP/1U7IyHrKV+v5JpxW+NotseZ9543h6QYwRxyZ1saAXlPlVuq2m6CCGrZdcFEQ
 cT1HyDVuazwFUVEF4PhY3nn7tfn1ERCu50nJYsEc5sm1DcOyc8IhlPEMZZYUBxR2vExz
 Rc7esYlUaBXthFSQj3WyXSr5KFooZtPFRRbBDCDjJYdd0fWQjt9dcFPEseb7sXKyyX16
 TfZw==
X-Gm-Message-State: APjAAAXpkdbL+ywNzRrJZNz9wr85RwJg04pk/9rNWS6Bqc1Jjn9qOtOJ
 5fGBejtE/F1zb9+5VISi/kRhCDZIKb1F3b5W65VohA==
X-Google-Smtp-Source: APXvYqwVDRhU7kZmIkZ5qqDVDgi3WFH9khsOheDFHWeC0GZ33Wx8RDhjMj1WP/4E755AtDXu+hW4MzsL3zn2SguLz0I=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr29133390oto.204.1567596041257; 
 Wed, 04 Sep 2019 04:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
 <CAKMK7uGVKEN=pi4Erc_gtbL3ZFN-b6pm-nXSznjd_rH4H2yn4w@mail.gmail.com>
 <CAPM=9tzDMfRf_VKaiHmnb_KKVwqW3=y=09JO0SJrG6ySe=DbfQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzDMfRf_VKaiHmnb_KKVwqW3=y=09JO0SJrG6ySe=DbfQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 13:20:29 +0200
Message-ID: <CAKMK7uGtNu0M74+Ag5-7HJhuHDVv1HoMPz=2XjU6tCkfMScQnA@mail.gmail.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FFWJamEuvSUKAx3iY+IepxMBLdh2qd8tqi8QiGH8fUY=;
 b=MsI3qMdjqX4sXfGEfl7pXNkb0+MqR2dlVWz/uUGKDKROA+1rQ/pbCsx06rAd7RLMD7
 kDOT9dh0oSytQXnEcawdaldxiKMgPVSNocTZcN1xKhJfjQFq2u+4plh30CgRpWGTMGEN
 JrxkqIK8lAh239J8K2IoKG7oHvZbEey99YtKg=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Feng Tang <feng.tang@intel.com>,
 Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjE1IFBNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDQgU2VwIDIwMTkgYXQgMTk6MTcsIERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgNCwgMjAxOSBh
dCAxMDozNSBBTSBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBIaSBEYW5pZWwsCj4gPiA+Cj4gPiA+IE9uIFdlZCwgU2VwIDA0LCAyMDE5IGF0IDEwOjEx
OjExQU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBTZXAgNCwg
MjAxOSBhdCA4OjUzIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3
cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaQo+ID4gPiA+ID4KPiA+ID4gPiA+IEFtIDA0LjA5
LjE5IHVtIDA4OjI3IHNjaHJpZWIgRmVuZyBUYW5nOgo+ID4gPiA+ID4gPj4gVGhhbmsgeW91IGZv
ciB0ZXN0aW5nLiBCdXQgZG9uJ3QgZ2V0IHRvbyBleGNpdGVkLCBiZWNhdXNlIHRoZSBwYXRjaAo+
ID4gPiA+ID4gPj4gc2ltdWxhdGVzIGEgYnVnIHRoYXQgd2FzIHByZXNlbnQgaW4gdGhlIG9yaWdp
bmFsIG1nYWcyMDAgY29kZS4gQQo+ID4gPiA+ID4gPj4gc2lnbmlmaWNhbnQgbnVtYmVyIG9mIGZy
YW1lcyBhcmUgc2ltcGx5IHNraXBwZWQuIFRoYXQgaXMgYXBwYXJlbnRseSB0aGUKPiA+ID4gPiA+
ID4+IHJlYXNvbiB3aHkgaXQncyBmYXN0ZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5r
cyBmb3IgdGhlIGRldGFpbGVkIGluZm8sIHNvIHRoZSBvcmlnaW5hbCBjb2RlIHNraXBzIHRpbWUt
Y29uc3VtaW5nCj4gPiA+ID4gPiA+IHdvcmsgaW5zaWRlIGF0b21pYyBjb250ZXh0IG9uIHB1cnBv
c2UuIElzIHRoZXJlIGFueSBzcGFjZSB0byBvcHRtaXNlIGl0Pwo+ID4gPiA+ID4gPiBJZiAyIHNj
aGVkdWxlZCB1cGRhdGUgd29ya2VyIGFyZSBoYW5kbGVkIGF0IGFsbW9zdCBzYW1lIHRpbWUsIGNh
biBvbmUgYmUKPiA+ID4gPiA+ID4gc2tpcHBlZD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyBteSBr
bm93bGVkZ2UsIHRoZXJlJ3Mgb25seSBvbmUgaW5zdGFuY2Ugb2YgdGhlIHdvcmtlci4gUmUtc2No
ZWR1bGluZwo+ID4gPiA+ID4gdGhlIHdvcmtlciBiZWZvcmUgYSBwcmV2aW91cyBpbnN0YW5jZSBz
dGFydGVkLCB3aWxsIG5vdCBjcmVhdGUgYSBzZWNvbmQKPiA+ID4gPiA+IGluc3RhbmNlLiBUaGUg
d29ya2VyJ3MgaW5zdGFuY2Ugd2lsbCBjb21wbGV0ZSBhbGwgcGVuZGluZyB1cGRhdGVzLiBTbyBp
bgo+ID4gPiA+ID4gc29tZSB3YXksIHNraXBwaW5nIHdvcmtlcnMgYWxyZWFkeSBoYXBwZW5zLgo+
ID4gPiA+Cj4gPiA+ID4gU28gSSB0aGluayB0aGF0IHRoZSBtb3N0IG9mdGVuIGZiY29uIHVwZGF0
ZSBmcm9tIGF0b21pYyBjb250ZXh0IGlzIHRoZQo+ID4gPiA+IGJsaW5raW5nIGN1cnNvci4gSWYg
eW91IGRpc2FibGUgdGhhdCBvbmUgeW91IHNob3VsZCBiZSBiYWNrIHRvIHRoZSBvbGQKPiA+ID4g
PiBwZXJmb3JtYW5jZSBsZXZlbCBJIHRoaW5rLCBzaW5jZSBqdXN0IHdyaXRpbmcgdG8gZG1lc2cg
aXMgZnJvbSBwcm9jZXNzCj4gPiA+ID4gY29udGV4dCwgc28gc2hvdWxkbid0IGNoYW5nZS4KPiA+
ID4KPiA+ID4gSG1tLCB0aGVuIGZvciB0aGUgb2xkIGRyaXZlciwgaXQgc2hvdWxkIGFsc28gZG8g
dGhlIG1vc3QgdXBkYXRlIGluCj4gPiA+IG5vbi1hdG9taWMgY29udGV4dD8KPiA+ID4KPiA+ID4g
T25lIG90aGVyIHRoaW5nIGlzLCBJIHByb2ZpbGVkIHRoYXQgdXBkYXRpbmcgYSAzTUIgc2hhZG93
IGJ1ZmZlciBuZWVkcwo+ID4gPiAyMCBtcywgd2hpY2ggdHJhbnNmZXIgdG8gMTUwIE1CL3MgYmFu
ZHdpZHRoLiBDb3VsZCBpdCBiZSByZWxhdGVkIHdpdGgKPiA+ID4gdGhlIGNhY2hlIHNldHRpbmcg
b2YgRFJNIHNoYWRvdyBidWZmZXI/IHNheSB0aGUgb3JnaW5hbCBjb2RlIHVzZSBhCj4gPiA+IGNh
Y2hhYmxlIGJ1ZmZlcj8KPiA+Cj4gPiBIbSwgdGhhdCB3b3VsZCBpbmRpY2F0ZSB0aGUgd3JpdGUt
Y29tYmluaW5nIGdvdCBicm9rZW4gc29tZXdoZXJlLiBUaGlzCj4gPiBzaG91bGQgZGVmaW5pdGVs
eSBiZSBmYXN0ZXIuIEFsc28gd2Ugc2hvdWxkbid0IHRyYW5zZmVyIHRoZSBob2xlCj4gPiB0aGlu
ZywgZXhjZXB0IHdoZW4gc2Nyb2xsaW5nIC4uLgo+Cj4gRmlyc3QgcnVsZSBvZiBmYmNvbiB1c2Fn
ZSwgeW91IGFyZSBhbHdheXMgZWZmZWN0aXZlbHkgc2Nyb2xsaW5nLgo+Cj4gQWxzbyB0aGVzZSBk
ZXZpY2VzIG1pZ2h0IGJlIG9uIGEgUENJRSAxeCBwaWVjZSBvZiB3ZXQgc3RyaW5nLCBub3Qgc3Vy
ZQo+IGlmIHRoZSBudW1iZXJzIHJlZmxlY3QgdGhhdC4KCnBjaWUgMXggMS4wIGlzIDI1ME1CL3Ms
IHNvIHllYWggd2l0aCBhIGJpdCBvZiBpbmVmZmljaWVuY3kgYW5kCm92ZXJoZWFkIG5vdCBlbnRp
cmVseSBvdXQgb2YgdGhlIHF1ZXN0aW9uIHRoYXQgMTUwTUIvcyBpcyBhY3R1YWxseSB0aGUKaHcg
bGltaXQuIElmIGl0J3MgcmVhbGx5IHBjaWUgMXggMS4wLCBubyBpZGVhIHdoZXJlIHRvIGNoZWNr
IHRoYXQuCkFsc28gbWlnaHQgYmUgd29ydGggdG8gZG91YmxlLWNoZWNrIHRoYXQgdGhlIGdwdSBw
Y2kgYmFyIGlzIGxpc3RlZCBhcwp3YyBpbiBkZWJ1Z2ZzL3g4Ni9wYXRfbWVtdHlwZV9saXN0Lgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
