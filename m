Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575429115F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A926EADD;
	Sat, 17 Aug 2019 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800F56E9C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:12:21 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id u190so1923205qkh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x9tHuYoDj493ySsdiocBgo6BvbYr3tE408m35OPfD4Q=;
 b=ctHpAvKps7MCnK9g+qWQkYEAsgJsy+SCg+ZvuR1HwlM6EIjjS9w7Y4OzcDgSwh2wFo
 dfKF1utwprLw+FrgN7sOOytOC7rASlitZgwsjSXxjwFFl1n7J9ZnMQ3jkirRqdima39h
 PfTB4ZZbfW8TWiSboglZ2ZTq5XL5r842/N84LRVP4tKooRRZydZB5ZgB/v1mKt7zJsww
 +TeXcF4R2QhP7DcpOWStqOlv3DVPaoYt2hn/hRG5hJ4f8Cvv0/XDd8WqrTvR8P64kwvf
 C9u/dRQn+DeqWZWVakEUJ+HGjO8mOvrwr7rjoYcyEzWxLHgbfBoCW/T2rof81qGFGES1
 pJfQ==
X-Gm-Message-State: APjAAAVB6pDOcSZcUxx3OATHvMWXSSDxyrZQdVJgl9o2CNer78AbAVra
 CsEJ1CycuU4QnxSbjeXxcYGcMA==
X-Google-Smtp-Source: APXvYqz16XhS3FDKKD5LBLAsMVIBRO6xvZ5cmQP2Rz9DeNPuZ4bmBJXLkXIkrLSg+KeUbMTyo0lWcg==
X-Received: by 2002:ae9:f812:: with SMTP id x18mr4132770qkh.290.1565878340460; 
 Thu, 15 Aug 2019 07:12:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o201sm1475995qka.14.2019.08.15.07.12.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 07:12:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyGUF-0004xm-IP; Thu, 15 Aug 2019 11:12:19 -0300
Date: Thu, 15 Aug 2019 11:12:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815141219.GF21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815132127.GI9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x9tHuYoDj493ySsdiocBgo6BvbYr3tE408m35OPfD4Q=;
 b=XeuqQCC74y0Tv1RcnQ+QEVxSfwBYVcbFQBv+jHQag9nVoOXYoudI2lsh2oUCEAr39H
 sOBQIHpCJGpf7SZDnsCbABopShyqJF2q2pi6SScyiS2HfIeCvK099//uePU5aMlLfWT6
 9rT/cI5D9uxh84+vzkj7b39A9JCbigiI8u5l63sz2xgiIZS4oQhkLKvvXrLyOi/jHouS
 FHbctFaUe8dq9V6Xp87qmVqN+IWfrjgvVxMfluoX3mjYCvUeczlqt9UvXBmeMyoUR00/
 t5fYmPRvwnODhoTvJWr3AELdv5sIvrNPS63oJojBRQ8h+bdOj03joAvRyD4cBFwQn3n0
 vq0g==
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDM6MjE6MjdQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFRodSAxNS0wOC0xOSAwOToyMzo0NCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTg6MjlBTSArMDIwMCwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPiA+ID4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDg6NTg6MDVQTSAtMDMwMCwg
SmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDEw
OjIwOjI0UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiBJbiBzb21lIHNw
ZWNpYWwgY2FzZXMgd2UgbXVzdCBub3QgYmxvY2ssIGJ1dCB0aGVyZSdzIG5vdCBhCj4gPiA+ID4g
PiBzcGlubG9jaywgcHJlZW1wdC1vZmYsIGlycXMtb2ZmIG9yIHNpbWlsYXIgY3JpdGljYWwgc2Vj
dGlvbiBhbHJlYWR5Cj4gPiA+ID4gPiB0aGF0IGFybXMgdGhlIG1pZ2h0X3NsZWVwKCkgZGVidWcg
Y2hlY2tzLiBBZGQgYSBub25fYmxvY2tfc3RhcnQvZW5kKCkKPiA+ID4gPiA+IHBhaXIgdG8gYW5u
b3RhdGUgdGhlc2UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgd2lsbCBiZSB1c2VkIGluIHRo
ZSBvb20gcGF0aHMgb2YgbW11LW5vdGlmaWVycywgd2hlcmUgYmxvY2tpbmcgaXMKPiA+ID4gPiA+
IG5vdCBhbGxvd2VkIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIGZvcndhcmQgcHJvZ3Jlc3MuIFF1b3Rp
bmcgTWljaGFsOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAiVGhlIG5vdGlmaWVyIGlzIGNhbGxlZCBm
cm9tIHF1aXRlIGEgcmVzdHJpY3RlZCBjb250ZXh0IC0gb29tX3JlYXBlciAtCj4gPiA+ID4gPiB3
aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9uIGFueSBsb2NrcyBvciBzbGVlcGFibGUgY29uZGl0aW9u
YWxzLiBUaGUgY29kZQo+ID4gPiA+ID4gc2hvdWxkIGJlIHN3aWZ0IGFzIHdlbGwgYnV0IHdlIG1v
c3RseSBkbyBjYXJlIGFib3V0IGl0IHRvIG1ha2UgYSBmb3J3YXJkCj4gPiA+ID4gPiBwcm9ncmVz
cy4gQ2hlY2tpbmcgZm9yIHNsZWVwYWJsZSBjb250ZXh0IGlzIHRoZSBiZXN0IHRoaW5nIHdlIGNv
dWxkIGNvbWUKPiA+ID4gPiA+IHVwIHdpdGggdGhhdCB3b3VsZCBkZXNjcmliZSB0aGVzZSBkZW1h
bmRzIGF0IGxlYXN0IHBhcnRpYWxseS4iCj4gPiA+ID4gCj4gPiA+ID4gQnV0IHRoaXMgZGVzY3Jp
YmVzIGZzX3JlY2xhaW1fYWNxdWlyZSgpIC0gaXMgdGhlcmUgc29tZSByZWFzb24gd2UgYXJlCj4g
PiA+ID4gY29uZmxhdGluZyBmc19yZWNsYWltIHdpdGggbm9uLXNsZWVwaW5nPwo+ID4gPiAKPiA+
ID4gTm8gaWRlYSB3aHkgeW91IHRpZSB0aGlzIGludG8gZnNfcmVjbGFpbS4gV2UgY2FuIGRlZmlu
aXRseSBzbGVlcCBpbiB0aGVyZSwKPiA+ID4gYW5kIGZvciBlLmcuIGtzd2FwZCAod2hpY2ggYWxz
byB3cmFwcyBldmVyeXRoaW5nIGluIGZzX3JlY2xhaW0pIHdlJ3JlCj4gPiA+IGV2ZW50IHN1cHBv
c2VkIHRvIEkgdGhvdWdodC4gVG8gbWFrZSBzdXJlIHdlIGNhbiBnZXQgYXQgdGhlIGxhc3QgYml0
IG9mCj4gPiA+IG1lbW9yeSBieSBmbHVzaGluZyBhbGwgdGhlIHF1ZXVlcyBhbmQgd2FpdGluZyBm
b3IgZXZlcnl0aGluZyB0byBiZSBjbGVhbmVkCj4gPiA+IG91dC4KPiA+IAo+ID4gQUZBSUsgdGhl
IHBvaW50IG9mIGZzX3JlY2xhaW0gaXMgdG8gcHJldmVudCAiaW5kaXJlY3QgZGVwZW5kZW5jeSB1
cG9uCj4gPiB0aGUgcGFnZSBhbGxvY2F0b3IiIGllIGEganVzdGlmaWNhdGlvbiB0aGF0IHdhcyBn
aXZlbiB0aGlzICFibG9ja2FibGUKPiA+IHN0dWZmLgo+ID4gCj4gPiBGb3IgaW5zdGFuY2U6Cj4g
PiAKPiA+ICAgZnNfcmVjbGFpbV9hY3F1aXJlKCkKPiA+ICAga21hbGxvYyhHRlBfS0VSTkVMKSA8
LSBsb2NrIGRlcCBhc3NlcnRpb24KPiA+IAo+ID4gQW5kIGZ1cnRoZXIsIE1pY2hhbCdzIGNvbmNl
cm4gYWJvdXQgaW5kaXJlY3RuZXNzIHRocm91Z2ggbG9ja3MgaXMgYWxzbwo+ID4gaGFuZGxlZCBi
eSBsb2NrZGVwOgo+ID4gCj4gPiAgICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIENQVTEKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
dXRleF9sb2NrKCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBr
bWFsbG9jKEdGUF9LRVJORUwpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbXV0ZXhfdW5sb2NrKCkKPiA+ICAgZnNfcmVjbGFpbV9hY3F1aXJlKCkKPiA+ICAgbXV0
ZXhfbG9jaygpIDwtIGxvY2sgZGVwIGFzc2VydGlvbgo+ID4gCj4gPiBJbiBvdGhlciB3b3Jkcywg
dG8gcHJldmVudCByZWN1cnNpb24gaW50byB0aGUgcGFnZSBhbGxvY2F0b3IgeW91IHVzZQo+ID4g
ZnNfcmVjbGFpbV9hY3F1aXJlKCksIGFuZCBsb2NrZGVwIHZlcmZpZXMgaXQgaW4gaXRzIHVzdWFs
IHJvYnVzdCB3YXkuCj4gCj4gZnNfcmVjbGFpbV9hY3F1aXJlIGlzIGFib3V0IEZTL0lPIHJlY3Vy
c2lvbnMgSUlVQy4gV2UgYXJlIHRhbGtpbmcgYWJvdXQKPiBhbnkgIUdGUF9OT1dBSVQgYWxsb2Nh
dGlvbiBjb250ZXh0IGhlcmUgYW5kIGFueSB7aW59ZGlyZWN0IGRlcGVuZGVuY3kgb24KPiBpdC4g
CgpBRkFJSyAnR0ZQX05PV0FJVCcgaXMgY2hhcmFjdGVyaXplZCBieSB0aGUgbGFjayBvZiBfX0dG
UF9GUyBhbmQKX19HRlBfRElSRUNUX1JFQ0xBSU0uLgoKVGhpcyBtYXRjaGVzIHRoZSBleGlzdGlu
ZyB0ZXN0IGluIF9fbmVlZF9mc19yZWNsYWltKCkgLSBzbyBpZiB5b3UgYXJlCk9LIHdpdGggR0ZQ
X05PRlMsIGFrYSBfX0dGUF9JTyB3aGljaCB0cmlnZ2VycyB0cnlfdG9fY29tcGFjdF9wYWdlcygp
LAphbGxvY2F0aW9ucyBkdXJpbmcgT09NLCB0aGVuIEkgdGhpbmsgZnNfcmVjbGFpbSBhbHJlYWR5
IG1hdGNoZXMgd2hhdAp5b3UgZGVzY3JpYmVkPwoKPiBXaGV0aGVyIGZzX3JlY2xhaW1fYWNxdWly
ZSBjYW4gYmUgcmV1c2VkIGZvciB0aGF0IEkgZG8gbm90IGtub3cKPiBiZWNhdXNlIEkgYW0gbm90
IGZhbWlsaWFyIHdpdGggdGhlIGxvY2tkZXAgbWFjaGluZXJ5IGVub3VnaAoKV2VsbCwgaWYgZnNf
cmVjbGFpbSBpcyBub3QgYWxyZWFkeSB0ZXN0aW5nIHRoZSBmbGFncyB5b3Ugd2FudCwgdGhlbiB3
ZQpjb3VsZCBhZGQgYW5vdGhlciBsb2NrZGVwIG1hcCB0aGF0IGRvZXMuIFRoZSBiYXNpYyBwcmlu
Y2lwbGUgaXMgdGhlCnNhbWUsIGlmIHlvdSB3YW50IHRvIGRldGVjdCBhbmQgcHJldmVudCByZWN1
cnNpb24gaW50byB0aGUgYWxsb2NhdG9yCnVuZGVyIGNlcnRhaW4gR0ZQIGZsYWdzIHRoZW4gdGhl
biBBRkFJSyBsb2NrZGVwIGlzIHRoZSBiZXN0IHRvb2wgd2UKaGF2ZS4KCj4gTm8sIG5vbi1ibG9j
a2luZyBpcyBhIHZlcnkgY29hcnNlIGFwcHJveGltYXRpb24gb2Ygd2hhdCB3ZSByZWFsbHkgbmVl
ZC4KPiBCdXQgaXQgc2hvdWxkIGdpdmUgdXMgZXZlbiBhIHN0cm9uZ2VyIGNvbmRpdGlvbi4gRXNz
ZW50aWFsbHkgYW55IHNsZWVwCj4gb3RoZXIgdGhhbiBhIHByZWVtcHRpb24gc2hvdWxkbid0IGJl
IGFsbG93ZWQgaW4gdGhhdCBjb250ZXh0LgoKQnV0IGl0IGlzIGEgbm9uc2Vuc2UgQVBJIHRvIGdp
dmUgdGhlIGRyaXZlciBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LAp0aGUgYmxvY2tpbmcgYWx0ZXJu
YXRpdmUgdG8gdGhlIG5vbi1ibG9ja2luZyBpbnZhbGlkYXRlX3JhbmdlIGFuZCB0aGVuCmRlbWFu
ZCBpdCB0byBiZSBub24tYmxvY2tpbmcuCgpJbnNwZWN0aW5nIHRoZSBjb2RlLCBubyBkcml2ZXJz
IGFyZSBhY3R1YWxseSBhYmxlIHRvIHByb2dyZXNzIHRoZWlyCnNpZGUgaW4gbm9uLWJsb2NraW5n
IG1vZGUuCgpUaGUgYmVzdCB3ZSBnb3Qgd2FzIGRyaXZlcnMgdGVzdGVkIHRoZSBWQSByYW5nZSBh
bmQgcmV0dXJuZWQgc3VjY2VzcwppZiB0aGV5IGhhZCBubyBpbnRlcmVzdC4gV2hpY2ggaXMgYSBi
aWcgd2luIHRvIGJlIHN1cmUsIGJ1dCBpdCBsb29rcwpsaWtlIGdldHRpbmcgYW55IG1vcmUgaXMg
bm90IHJlYWxseSBwb3Nzc2libGUuCgpIb3dldmVyLCB3ZSBjb3VsZCAocHJvYmFibHkgZXZlbiBz
aG91bGQpIG1ha2UgdGhlIGRyaXZlcnMgZnNfcmVjbGFpbQpzYWZlLgoKSWYgdGhhdCBpcyBlbm91
Z2ggdG8gZ3VhcmFudGVlIHByb2dyZXNzIG9mIE9PTSwgdGhlbiBsZXRzIGNvbnNpZGVyCnNvbWV0
aGluZyBsaWtlIHVzaW5nIGN1cnJlbnRfZ2ZwX2NvbnRleHQoKSB0byBmb3JjZSBQRl9NRU1BTExP
Q19OT0ZTCmFsbG9jYXRpb24gYmVoYXZpb3Igb24gdGhlIGRyaXZlciBjYWxsYmFjayBhbmQgbG9j
a2RlcCB0byB0cnkgYW5kIGtlZXAKcHVzaGluZyBvbiB0aGUgdGhlIGRlYnVnZ2luZywgYW5kIGRy
b3BwaW5nICFibG9ja2luZy4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
