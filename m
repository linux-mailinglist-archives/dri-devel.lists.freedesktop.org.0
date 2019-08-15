Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C378EE53
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B596E415;
	Thu, 15 Aug 2019 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630BF6E40E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:35:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c7so6402474otp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtTSn2uMyyP8QHhCiI6vaNdIzu8IHEHZhZ5nwC+nMAU=;
 b=XE7HhoniEedFct4bJkS1Mug/8x4DNSf1uetGpqNLaPUricDdDSKtrdK701WQwmg3xm
 RVCAetaF82/FaTjVQgtXFE4jv2j3UFPQQfRZyLTGSdadtXkmbwgWGVLfD1k0UJQQXDLt
 UvMnBlC+TZNPrbQM/TmhXJouyGQgARdlVCM39FK3H5DdowlNYSKH4W1Gx34UH2acZ1bs
 fQj3VN5A77f4ELhL15KLKTtE6/oUESrds9EyLdR0gHLpBOjNtZiA+ZVexqdCkiWaqijo
 P/xWS6k3FXjHZedjqAhKFAWZ6SfT80vEkSSfmydsdMrhBXet4Yu7BRs4Oxa3BgAgBw4l
 NIyg==
X-Gm-Message-State: APjAAAV0rTHGRdVyDIa8jD/BaGveEHzcBi6FTHRJNdKprgA6ax2tIRep
 0TP+iR281+MZkThEGMCrTT/uFmVVTlRoDd0Q6OA5UQ==
X-Google-Smtp-Source: APXvYqzKOnt+7f9VOL89+ec428aBeZSnl2atgboE0ieQNu4BQtWa3L1DeSUe5NY6fj6Fh4lzcbXWphwAs3uyRC9CmKY=
X-Received: by 2002:a6b:f906:: with SMTP id j6mr5800892iog.26.1565879733515;
 Thu, 15 Aug 2019 07:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <CADnq5_NUox3vvg6Mt3i9erA+AL2MfotpNBZQnWWknn4j+j-F=Q@mail.gmail.com>
 <CACO55tty6TqEo4UBkX5YckLuP-XhHXKVs0ew+Q8__sKMi1BCbA@mail.gmail.com>
 <CADnq5_PWuLU0pcG549-xThMHy3W0P2+fAO_Ledk6FP2TVG3+gQ@mail.gmail.com>
 <6ed1c393ffeb4c24ab5875927d6a37ac@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <6ed1c393ffeb4c24ab5875927d6a37ac@AUSX13MPC101.AMER.DELL.COM>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:35:22 +0200
Message-ID: <CACO55ttUKCGJq66czgsgWSR5VE6VmQFs6Syr0R2CenXomU2O-w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Mario.Limonciello@dell.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDozMCBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5j
b20+IHdyb3RlOgo+Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMDoxNSBBTSBLYXJvbCBI
ZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXVn
IDE1LCAyMDE5IGF0IDQ6MTMgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+
Cj4gPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEwOjA0
IEFNIEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAzOjU2IFBNIDxNYXJpby5MaW1vbmNpZWxs
b0BkZWxsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+ID4gPiA+ID4gPiBGcm9tOiBsaW51eC1hY3BpLW93bmVyQHZnZXIu
a2VybmVsLm9yZyA8bGludXgtYWNwaS0KPiA+IG93bmVyQHZnZXIua2VybmVsLm9yZz4gT24KPiA+
ID4gPiA+ID4gPiBCZWhhbGYgT2YgRGF2ZSBBaXJsaWUKPiA+ID4gPiA+ID4gPiBTZW50OiBXZWRu
ZXNkYXksIEF1Z3VzdCAxNCwgMjAxOSA1OjQ4IFBNCj4gPiA+ID4gPiA+ID4gVG86IEthcm9sIEhl
cmJzdAo+ID4gPiA+ID4gPiA+IENjOiBMS01MOyBMaW51eCBBQ1BJOyBkcmktZGV2ZWw7IG5vdXZl
YXU7IFJhZmFlbCBKIC4gV3lzb2NraTsgQWxleCBIdW5nOwo+ID4gQmVuCj4gPiA+ID4gPiA+ID4g
U2tlZ2dzOyBEYXZlIEFpcmxpZQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbTm91dmVhdV0g
W1BBVENIIDEvN10gUmV2ZXJ0ICJBQ1BJIC8gT1NJOiBBZGQgT0VNIF9PU0kKPiA+IHN0cmluZyB0
bwo+ID4gPiA+ID4gPiA+IGVuYWJsZSBkR1BVIGRpcmVjdCBvdXRwdXQiCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0IDA3OjMxLCBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4KPiA+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjg1ODZhNTFlZWE2NjZkNTUzMWJjYWVmMmY2OGU0
YWJiZDg3MjQyYy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgb3JpZ2luYWwg
Y29tbWl0IG1lc3NhZ2UgZGlkbid0IGV2ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXwo+ID4gc3Vw
cG9ydCBpdCBhbmQKPiA+ID4gPiA+ID4gPiA+IGl0IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxs
Lgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEFsc28gd2hhdCB3YXMgdGhlIGlzc3Vl
IGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVuY2VzIHRvIGFueSBidWdzCj4gPiBhbmQgbm90
Cj4gPiA+ID4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlzc3VlIGF0IGFsbCBpc24ndCB0
aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBBbmQg
ZXZlbiBpZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRvIG1ha2Ug
aXQgd29yawo+ID4gaW5zaWRlIHRoZQo+ID4gPiA+ID4gPiA+ID4gZHJpdmVyLCBub3QgYWRkaW5n
IHNvbWUgaGFja3kgd29ya2Fyb3VuZCB0aHJvdWdoIEFDUEkgdHJpY2tzLgo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IEFuZCB3aGF0IG91dCBvZiB0cmVlIGRyaXZlcnMgZG8gb3IgZG8g
bm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBvbmUKPiA+IGJpdCBhbnl3YXkuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSB0aGluayB0aGUgcmV2ZXJ0cyBzaG91
bGQgYmUgbWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRoZSBvcmlnaW5hbAo+ID4gPiA+ID4g
PiA+IHBhdGNoZXMgd2VudCBpbiB2aWEgdGhlcmUsIGFuZCB3ZSBzaG91bGQgZ2V0IHRoZW0gaW4g
YXNhcC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8
YWlybGllZEByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+IERhdmUuCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJlIHJlZ3Jlc3Npb25zIG9uIG1h
Y2hpbmVzIGluIHRoZSBmaWVsZCB3aXRoCj4gPiB0aGUKPiA+ID4gPiA+ID4gaW4gdHJlZSBkcml2
ZXJzIGJ5IHJldmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbiBhbnN3ZXIg
Zm9yIGFsbAo+ID4gb2YgdGhvc2UKPiA+ID4gPiA+ID4gYmVmb3JlIHRoaXMgcmV2ZXJ0IGlzIGFj
Y2VwdGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBSZWdhcmRpbmcgc3lzdGVtcyB3aXRoIElu
dGVsK05WSURJQSwgd2UnbGwgaGF2ZSB0byB3b3JrIHdpdGggcGFydG5lcnMgdG8KPiA+IGNvbGxl
Y3QKPiA+ID4gPiA+ID4gc29tZSBpbmZvcm1hdGlvbiBvbiB0aGUgaW1wYWN0IG9mIHJldmVydGlu
ZyB0aGlzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaGVuIHRoaXMgaXMgdXNlZCBvbiBhIHN5
c3RlbSB3aXRoIEludGVsK0FNRCB0aGUgQVNMIGNvbmZpZ3VyZXMgQU1ECj4gPiBHUFUgdG8gdXNl
Cj4gPiA+ID4gPiA+ICJIeWJyaWQgR3JhcGhpY3MiIHdoZW4gb24gV2luZG93cyBhbmQgIlBvd2Vy
IEV4cHJlc3MiIGFuZAo+ID4gIlN3aXRjaGFibGUgR3JhcGhpY3MiCj4gPiA+ID4gPiA+IHdoZW4g
b24gTGludXguCj4gPiA+ID4gPgo+ID4gPiA+ID4gYW5kIHdoYXQncyBleGFjdGx5IHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAo+ID4gPiA+ID4gaXNz
dWUgaGVyZT8KPiA+ID4gPgo+ID4gPiA+IEh5YnJpZCBHcmFwaGljcyBpcyB0aGUgbmV3ICJzdGFu
ZGFyZCIgd2F5IG9mIGhhbmRsaW5nIHRoZXNlIGxhcHRvcHMuCj4gPiA+ID4gSXQgdXNlcyB0aGUg
c3RhbmRhcmQgX1BSMyBBUENJIG1ldGhvZCB0byBoYW5kbGUgZEdQVSBwb3dlci4gIFN1cHBvcnQK
PiA+ID4gPiBmb3IgdGhpcyB3YXMgYWRkZWQgdG8gTGludXggcmVsYXRpdmVseSBsYXRlciBjb21w
YXJlZCB0byB3aGVuIHRoZQo+ID4gPiA+IGxhcHRvcHMgd2VyZSBsYXVuY2hlZC4gICJQb3dlciBF
eHByZXNzIiB1c2VkIHRoZSBvdGhlciBBTUQgc3BlY2lmaWMKPiA+ID4gPiBBVFBYIEFDUEkgbWV0
aG9kIHRvIGhhbmRsZSBkR1BVIHBvd2VyLiAgVGhlIGRyaXZlciBzdXBwb3J0cyBib3RoIHNvCj4g
PiA+ID4gZWl0aGVyIG1ldGhvZCB3aWxsIHdvcmsuCj4gPiA+ID4KPiA+ID4gPiBBbGV4Cj4gPiA+
ID4KPiA+ID4KPiA+ID4gdGhhbmtzIGZvciBjbGFyaWZ5aW5nLiBCdXQgdGhhdCBzdGlsbCBtZWFu
cyB0aGF0IHdlIHdvbid0IG5lZWQgc3VjaAo+ID4gPiB3b3JrYXJvdW5kcyBmb3IgQU1EIHVzZXJz
LCByaWdodD8gYW1kZ3B1IGhhbmRsZXMgaHlicmlkIGdyYXBoaWNzIGp1c3QKPiA+ID4gZmluZSwg
cmlnaHQ/Cj4gPgo+ID4gWWVhaCBpdCBzaG91bGQsIGFzc3VtaW5nIHlvdSBoYXZlIGEgbmV3IGVu
b3VnaCBrZXJuZWwgd2hpY2ggc3VwcG9ydHMKPiA+IEhHLCB3aGljaCBoYXMgYmVlbiBzZXZlcmFs
IHllYXJzIGF0IHRoaXMgcG9pbnQgSUlSQy4KPiA+Cj4gPiBBbGV4Cj4gPgo+Cj4gQ2FuIHlvdSBk
ZWZpbmUgaG93IG5ldyBvZiBhIGtlcm5lbCBpcyBhIG5ldyBlbm91Z2gga2VybmVsPwo+Cj4gTG9v
a2luZyBvbiBteSBzaWRlIHRoZXNlIHByb2JsZW1zIHdlcmUgb24gbmV3IGhhcmR3YXJlIChQcmVj
aXNpb24gNzc0MCkgYW5kCj4gYXJlIGNoZWNrZWQgYXMgcmVjZW50bHkgYXMgc3RhcnQgb2YgdGhp
cyBzdW1tZXIsIHcvIGtlcm5lbCA0LjE1LgoKVGhhdCdzIG5vdCBldmVuIGEgbG9uZyB0ZXJtIG9u
ZS4gQW5kIGl0IHNob3VsZG4ndCBnZXQgYW55IGZpeGVzLiBJCmp1c3QgY2hlY2tlZCwgbGFzdCB1
cGRhdGUgd2FzIDE2IG1vbnRocyBhZ28uCgo+Cj4gV2UgY2FuIGFycmFuZ2UgdG8gaGF2ZSBpdCBj
aGVja2VkIGFnYWluIG9uIDUuM3JjWCB3LyB0aGUgT1NJIGRpc2FibGVkLgoKeWVhaCwgcGxlYXNl
IGRvLiBJZiB0aGVyZSBhcmUgYW55IGlzc3Vlcywgd2UgKGFzIGluIGRybSBkZXZlbG9wZXJzKQph
cmUgaGFwcHkgdG8gZml4IHRoZSBpc3N1ZXMgaW5zaWRlIHRoZSBkcml2ZXJzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
