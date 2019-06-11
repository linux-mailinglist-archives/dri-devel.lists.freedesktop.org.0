Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05A3DBCD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 22:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49944891F2;
	Tue, 11 Jun 2019 20:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117B4891F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 20:29:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f21so1574828pgi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhnwSrdCPnvzoEVfuuVGqE83p7TnkQ5Modn2BNCoQD0=;
 b=KqSF8DmyFt4VYhR4AvQF5v8GCAtPhmTgZKMo+sF9apCSCq5xvru7t+DWaRYZ641Nnr
 M2Yp2YeFU4Zf77U6hqdqrr51SxOE7j3OIXeBwatjGRAlsTqWFQcMXV0nCPfqpojqrQLm
 GG/nOwu/Xod0Bdzd+uDlEqIhjupP5QlzholS+h+emKJiLH2Zgq+addzgA28n2+m5B0Z2
 yAUDyhGoPDgpBSzSXKiYQjJPQjsbYBoNXMXB+Zdp2/wkvtwDFeP8QZSNbPxWkqIQ5ZRp
 XrMkLdAPjcNxh/1rXSaqCahSr779/2MjhI3muXcU/mDouNTV2aWEtae7fExPpH+E/RQg
 hVCQ==
X-Gm-Message-State: APjAAAWdm4Ojbq+Cph0GSNTi7FONqUC9As1v6fnUolBSnh43u2QY5//J
 hXh59pwmoe4CVJrUi8ld50dn1JDCjPW8BA25MbQ2dA==
X-Google-Smtp-Source: APXvYqycBtJ32qbIn8pTyxMIAID5Xv7JTruAR7oTyIED4r622bu9rIlLgVdk0eekxjLa2OE4wVYL1Pw8y64Cqw0kRwU=
X-Received: by 2002:a17:90a:2e89:: with SMTP id
 r9mr28553830pjd.117.1560284952085; 
 Tue, 11 Jun 2019 13:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-18-brendanhiggins@google.com>
 <20190517182254.548EA20815@mail.kernel.org>
 <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
 <20190607190047.C3E7A20868@mail.kernel.org>
 <20190611175830.GA236872@google.com>
 <20190611185018.2E1C021744@mail.kernel.org>
In-Reply-To: <20190611185018.2E1C021744@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 11 Jun 2019 13:29:01 -0700
Message-ID: <CAFd5g47dmcHOCX41cr2v9Kaj3xa_5-PoqUPX_1=AoQLUG90NkQ@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dhnwSrdCPnvzoEVfuuVGqE83p7TnkQ5Modn2BNCoQD0=;
 b=Pp0Hq+hd8QA6syECahlCWtYv82jhOxBm0sr+fZ9Dkk8nXtHe7nrSiSj+V8u0FaITQ7
 84fXuzNXkrhzDQgkHPp26EjnsIzrDKXg48+xvOTrPv1gFdJxgRLOvcs0dwgoU2BGvzqE
 Liz3+gL3rcT7wqBUJosubNY4aHZAru2eeUFG6CtPZ2mbKIzTjquHFKUIQcWXvVk4hMLI
 7UB1amIr3aRGarnBUHse/35CwxBlRRF3qifo7BnhaOJV61RWbVqr0wA4GIowlDaA6gfT
 pWINRb5VwbD/mtNfms9GrZfwha/4G8tSCCTtYnHFhjTrLaOGAdTroClIT1QeFCWuqloy
 NJbA==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Iurii Zaikin <yzaikin@google.com>, Jeff Dike <jdike@addtoit.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6NTAgQU0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA2LTExIDEw
OjU4OjMwKQo+ID4gT24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTI6MDA6NDdQTSAtMDcwMCwgU3Rl
cGhlbiBCb3lkIHdyb3RlOgo+ID4gPiBRdW90aW5nIEl1cmlpIFphaWtpbiAoMjAxOS0wNi0wNSAx
ODoyOTo0MikKPiA+ID4gPiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAxMToyMiBBTSBTdGVwaGVu
IEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFF1b3Rp
bmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA1LTE0IDE1OjE3OjEwKQo+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEva2VybmVsL3N5c2N0bC10ZXN0LmMgYi9rZXJuZWwvc3lzY3RsLXRlc3QuYwo+ID4g
PiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAwLi5mZTBmMmJhZTY2MDg1Cj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiA+ID4g
KysrIGIva2VybmVsL3N5c2N0bC10ZXN0LmMKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBzeXNjdGxfdGVzdF9kb2ludHZlY19oYXBweV9zaW5nbGVf
bmVnYXRpdmUoc3RydWN0IGt1bml0ICp0ZXN0KQo+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiAr
ICAgICAgIHN0cnVjdCBjdGxfdGFibGUgdGFibGUgPSB7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAucHJvY25hbWUgPSAiZm9vIiwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5kYXRh
ICAgICAgICAgICA9ICZ0ZXN0X2RhdGEuaW50XzAwMDEsCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAubWF4bGVuICAgICAgICAgPSBzaXplb2YoaW50KSwKPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIC5tb2RlICAgICAgICAgICA9IDA2NDQsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAucHJvY19oYW5kbGVyICAgPSBwcm9jX2RvaW50dmVjLAo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgLmV4dHJhMSAgICAgICAgID0gJmlfemVybywKPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIC5leHRyYTIgICAgICAgICA9ICZpX29uZV9odW5kcmVkLAo+ID4gPiA+ID4gPiArICAgICAg
IH07Cj4gPiA+ID4gPiA+ICsgICAgICAgY2hhciBpbnB1dFtdID0gIi05IjsKPiA+ID4gPiA+ID4g
KyAgICAgICBzaXplX3QgbGVuID0gc2l6ZW9mKGlucHV0KSAtIDE7Cj4gPiA+ID4gPiA+ICsgICAg
ICAgbG9mZl90IHBvcyA9IDA7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAgICAgICB0YWJs
ZS5kYXRhID0ga3VuaXRfa3phbGxvYyh0ZXN0LCBzaXplb2YoaW50KSwgR0ZQX1VTRVIpOwo+ID4g
PiA+ID4gPiArICAgICAgIEtVTklUX0VYUEVDVF9FUSh0ZXN0LCAwLCBwcm9jX2RvaW50dmVjKCZ0
YWJsZSwgMSwgaW5wdXQsICZsZW4sICZwb3MpKTsKPiA+ID4gPiA+ID4gKyAgICAgICBLVU5JVF9F
WFBFQ1RfRVEodGVzdCwgc2l6ZW9mKGlucHV0KSAtIDEsIGxlbik7Cj4gPiA+ID4gPiA+ICsgICAg
ICAgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNpemVvZihpbnB1dCkgLSAxLCBwb3MpOwo+ID4gPiA+
ID4gPiArICAgICAgIEtVTklUX0VYUEVDVF9FUSh0ZXN0LCAtOSwgKihpbnQgKil0YWJsZS5kYXRh
KTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJcyB0aGUgY2FzdGluZyBuZWNlc3Nhcnk/IE9yIGNhbiB0
aGUgbWFjcm8gZG8gYSB0eXBlIGNvZXJjaW9uIG9mIHRoZQo+ID4gPiA+ID4gc2Vjb25kIHBhcmFt
ZXRlciBiYXNlZCBvbiB0aGUgZmlyc3QgdHlwZT8KPiA+ID4gPiAgRGF0YSBmaWVsZCBpcyBkZWZp
bmVkIGFzIHZvaWQqIHNvIEkgYmVsaWV2ZSBjYXN0aW5nIGlzIG5lY2Vzc2FyeSB0bwo+ID4gPiA+
IGRlcmVmZXJlbmNlIGl0IGFzIGEgcG9pbnRlciB0byBhbiBhcnJheSBvZiBpbnRzLiBJIGRvbid0
IHRoaW5rIHRoZQo+ID4gPiA+IG1hY3JvIHNob3VsZCBkbyBhbnkgdHlwZSBjb2VyY2lvbiB0aGF0
ID09IG9wZXJhdG9yIHdvdWxkbid0IGRvLgo+ID4gPiA+ICBJIGRpZCBjaGFuZ2UgdGhlIGNhc3Qg
dG8gbWFrZSBpdCBtb3JlIGNsZWFyIHRoYXQgaXQncyBhIHBvaW50ZXIgdG8gYW4KPiA+ID4gPiBh
cnJheSBvZiBpbnRzIGJlaW5nIGRlcmVmZXJlbmNlZC4KPiA+ID4KPiA+ID4gT2ssIEkgc3RpbGwg
d29uZGVyIGlmIHdlIHNob3VsZCBtYWtlIEtVTklUX0VYUEVDVF9FUSBjaGVjayB0aGUgdHlwZXMg
b24KPiA+ID4gYm90aCBzaWRlcyBhbmQgY2F1c2UgYSBidWlsZCB3YXJuaW5nL2Vycm9yIGlmIHRo
ZSB0eXBlcyBhcmVuJ3QgdGhlIHNhbWUuCj4gPiA+IFRoaXMgd291bGQgYmUgc2ltaWxhciB0byBv
dXIgbWluL21heCBtYWNyb3MgdGhhdCBjb21wbGFpbiBhYm91dAo+ID4gPiBtaXNtYXRjaGVkIHR5
cGVzIGluIHRoZSBjb21wYXJpc29ucy4gVGhlbiBpZiBhIHRlc3QgZGV2ZWxvcGVyIG5lZWRzIHRv
Cj4gPiA+IGNvbnZlcnQgb25lIHR5cGUgb3IgdGhlIG90aGVyIHRoZXkgY291bGQgZG8gc28gd2l0
aCBhCj4gPiA+IEtVTklUX0VYUEVDVF9FUV9UKCkgbWFjcm8gdGhhdCBsaXN0cyB0aGUgdHlwZXMg
dG8gY29lcmNlIGJvdGggc2lkZXMgdG8KPiA+ID4gZXhwbGljaXRseS4KPiA+Cj4gPiBEbyB5b3Ug
dGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIGEgcGhvbnkgY29tcGFyZSBzaW1pbGFyIHRv
IGhvdwo+ID4gbWluL21heCB1c2VkIHRvIHdvcmsgcHJpb3IgdG8gNC4xNywgb3IgdG8gdXNlIHRo
ZSBuZXcgX190eXBlY2hlY2soLi4uKQo+ID4gbWFjcm8/IFRoaXMgbWlnaHQgc2VlbSBsaWtlIGEg
ZHVtYiBxdWVzdGlvbiAoYW5kIG1heWJlIGl0IGlzKSwgYnV0IEl1cmlpCj4gPiBhbmQgSSB0aG91
Z2h0IHRoZSBmb3JtZXIgY3JlYXRlZCBhbiBlcnJvciBtZXNzYWdlIHRoYXQgd2FzIGEgYml0IGVh
c2llcgo+ID4gdG8gdW5kZXJzdGFuZCwgd2hlcmVhcyBfX3R5cGVjaGVjayBpcyBvYnZpb3VzbHkg
c3VwZXJpb3IgaW4gdGVybXMgb2YKPiA+IGNvZGUgcmV1c2UuCj4gPgo+ID4gVGhpcyBpcyB3aGF0
IHdlIGFyZSB0aGlua2luZyByaWdodCBub3c7IGlmIHlvdSBkb24ndCBoYXZlIGFueSBjb21wbGFp
bnRzCj4gPiBJIHdpbGwgc3F1YXNoIGl0IGludG8gdGhlIHJlbGV2YW50IGNvbW1pdHMgb24gdGhl
IG5leHQgcmV2aXNpb246Cj4KPiBDYW4geW91IHByb3ZpZGUgdGhlIGRpZmZlcmVuY2UgaW4gZXJy
b3IgbWVzc2FnZXMgYW5kIGRlc2NyaWJlIHRoYXQgaW4KPiB0aGUgY29tbWl0IHRleHQ/IFRoZSBj
b21taXQgbWVzc2FnZSBpcyB3aGVyZSB5b3UgInNlbGwiIHRoZSBwYXRjaCwgc28KPiBiZWluZyBh
YmxlIHRvIGNvbXBhcmUgdGhlIHRyYWRlb2ZmIG9mIGhhdmluZyBhbm90aGVyIG1hY3JvIHRvIGRv
IHR5cGUKPiBjb21wYXJpc29ucyB2cy4gcmV1c2luZyB0aGUgb25lIHRoYXQncyB0aGVyZSBpbiBr
ZXJuZWwuaCB3b3VsZCBiZSB1c2VmdWwKPiB0byBhbGxheSBjb25jZXJucyB0aGF0IHdlJ3JlIGR1
cGxpY2F0aW5nIGxvZ2ljIGZvciBiZXR0ZXIgZXJyb3IKPiBtZXNzYWdlcy4KCk9oIHNvcnJ5LCBJ
IGRpZG4ndCB0aGluayB0b28gaGFyZCBhYm91dCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2luY2UgSQpm
aWd1cmVkIGl0IHdvdWxkIGdldCBzcGxpdCB1cCBhbmQgc3F1YXNoZWQgaW50byB0aGUgZXhpc3Rp
bmcgY29tbWl0cy4KSSBqdXN0IHdhbnRlZCB0byBnZXQgaXQgb3V0IHNvb25lciB0byBkaXNjdXNz
IHRoaXMgYmVmb3JlIEkgcG9zdCB0aGUKbmV4dCByZXZpc2lvbiAocHJvYmFibHkgbGF0ZXIgdGhp
cyB3ZWVrKS4KCj4gSG9uZXN0bHksIEknZCBwcmVmZXIgd2UganVzdCB1c2UgdGhlIG1hY3JvcyB0
aGF0IHdlJ3ZlIGRldmVsb3BlZCBpbgo+IGtlcm5lbC5oIHRvIGRvIGNvbXBhcmlzb25zIGhlcmUg
c28gdGhhdCB3ZSBjYW4gZ2V0IGNvZGUgcmV1c2UsIGJ1dCBtb3JlCj4gaW1wb3J0YW50bHkgc28g
dGhhdCB3ZSBkb24ndCB0cmlwIG92ZXIgcHJvYmxlbXMgdGhhdCBjYXVzZWQgdGhvc2UgbWFjcm9z
Cj4gdG8gYmUgY3JlYXRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuIElmIHRoZSBlcnJvciBtZXNzYWdl
IGlzIGJhZCwgcGVyaGFwcwo+IHRoYXQgY2FuIGJlIGZpeGVkIHdpdGggc29tZSBzb3J0IG9mIGNv
bXBpbGVyIGRpcmVjdGl2ZSB0byBtYWtlIHRoZSBlcnJvcgo+IG1lc3NhZ2UgYSBsaXR0bGUgbW9y
ZSB1c2VmdWwsIGkuZS4gY29tcGlsZXRpbWVfd2FybmluZygpIHRocm93biBpbnRvCj4gX190eXBl
Y2hlY2soKSBvciBzb21ldGhpbmcuCgpUaGF0J3MgYSBnb29kIHBvaW50LiBJIGhhdmUgbm8gcXVh
bG1zIHN0aWNraW5nIHdpdGggX190eXBlY2hlY2soLi4uKQpmb3Igbm93OyBpZiB3ZSBsYXRlciBm
ZWVsIHRoYXQgaXQgaXMgY2F1c2luZyBwcm9ibGVtcywgd2UgY2FuIGFsd2F5cwpmaXggaXQgbGF0
ZXIgYnkgc3VwcGx5aW5nIG91ciBvd24gd2FybmluZyBpbiB0aGUgbWFubmVyIHlvdSBzdWdnZXN0
LgoKSXVyaWksIGRvIHlvdSBoYXZlIGFueSBhZGRpdGlvbmFsIHRob3VnaHRzIG9uIHRoaXM/Cgo+
Cj4gPiAtLS0KPiA+IEZyb206IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+ID4K
PiA+IEFkZHMgYSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBjb21wYXJpbmcgdmFsdWVzIG9mIGRpZmZl
cmVudCB0eXBlcyBzaW1pbGFyCj4gPiB0byB3aGF0IG1pbigpIC8gbWF4KCkgbWFjcm9zIGRvLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
