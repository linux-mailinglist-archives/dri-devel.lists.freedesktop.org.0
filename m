Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2391168
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182306EA11;
	Sat, 17 Aug 2019 15:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BEB6E440
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 16:56:33 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id k13so2998544qtm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 09:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8Q3BUPafjT//7zqZyDAGCCoPTiMdeG8OI4h/hxD+trk=;
 b=H0M9uX9yiO6kHT5OVe2d9oDGZlQPgpjBHPg6aQsiaVd2QfhMZ/L1BRoru5LvgtETgb
 mG3uSD82DDYyQzqSvDGJQKBg4Wj9cttJMW54lzaS8iSQ+yErnk1g5pDnecp++MQN/6BD
 FOx0VlZ+Hkqa30LaeprpUPaydh9XXNG7brn38xPwJBY/YKU4ZmD7rsA+LyqvufKMTADK
 CP9/8R7OZp4dSE5hEZLPlbsE4Yos6XPi4QHo9kebhx16xZyidG5SwhPfQym57K/aASad
 IseJJaRtYo6wIeC+JP5udQ0Cuq8Hbiy6sb6uJxwiKMLbA37FqcPpNcU3duNNFBOt4nKn
 8J9Q==
X-Gm-Message-State: APjAAAWZc+Aj03A67FqGkg7q/7A/jHH1hZAmRGLXkS59Hnh+tmubaMHt
 LsUk+nii/BH6eKQzIsD0yXXAtw==
X-Google-Smtp-Source: APXvYqzn3Iu7ObjjA8SMNGcPxln0Wb7FQwoIxDnrko+LZW/8NghOd8XtvpT4mfbuJe+bGykaqWSrJw==
X-Received: by 2002:ac8:4247:: with SMTP id r7mr4846720qtm.219.1565888192037; 
 Thu, 15 Aug 2019 09:56:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f133sm1620929qke.62.2019.08.15.09.56.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 09:56:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyJ39-0006Zn-5c; Thu, 15 Aug 2019 13:56:31 -0300
Date: Thu, 15 Aug 2019 13:56:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815165631.GK21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815155950.GN9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8Q3BUPafjT//7zqZyDAGCCoPTiMdeG8OI4h/hxD+trk=;
 b=l/2uXRd4T7HQOUDBG/JM+iUspGtfzLrxEqhgp3H9MuxzleYOE7XUTyFzkXSdKaCTcb
 q9MfXp3hYV+sssTkJDkOOSAm8bJQBLEjDvpI3VvG5Bah4pKJ0GwqOvPqD1hTMQ2juM4F
 wG3FcmtRNOq7XeZkSWigoJioXNZBC8G26nVgROu929tLZSwPk789miZ0cuWwTTyj8PQY
 kGTmipP1NMr8zg4r5RP6wvNh8HqOFhJI316r2CopVOgXT2m8TBtFcD5juD/oONpbcfrC
 7ZtrySmSL1jVyB5LFHnhVSicKT/IZ1SgzrKNZaX2H1Okq65iudeI58fGM7w480kbI10U
 mk4w==
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6MDA6NDFQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgoKPiA+IEFGQUlLICdHRlBfTk9XQUlUJyBpcyBjaGFyYWN0ZXJpemVkIGJ5IHRoZSBsYWNr
IG9mIF9fR0ZQX0ZTIGFuZAo+ID4gX19HRlBfRElSRUNUX1JFQ0xBSU0uLgo+ID4KPiA+IFRoaXMg
bWF0Y2hlcyB0aGUgZXhpc3RpbmcgdGVzdCBpbiBfX25lZWRfZnNfcmVjbGFpbSgpIC0gc28gaWYg
eW91IGFyZQo+ID4gT0sgd2l0aCBHRlBfTk9GUywgYWthIF9fR0ZQX0lPIHdoaWNoIHRyaWdnZXJz
IHRyeV90b19jb21wYWN0X3BhZ2VzKCksCj4gPiBhbGxvY2F0aW9ucyBkdXJpbmcgT09NLCB0aGVu
IEkgdGhpbmsgZnNfcmVjbGFpbSBhbHJlYWR5IG1hdGNoZXMgd2hhdAo+ID4geW91IGRlc2NyaWJl
ZD8KPiAKPiBObyBHRlBfTk9GUyBpcyBlcXVhbGx5IGJhZC4gUGxlYXNlIHJlYWQgbXkgb3RoZXIg
ZW1haWwgZXhwbGFpbmluZyB3aGF0Cj4gdGhlIG9vbV9yZWFwZXIgYWN0dWFsbHkgcmVxdWlyZXMu
IEluIHNob3J0IG5vIGJsb2NraW5nIG9uIGRpcmVjdCBvcgo+IGluZGlyZWN0IGRlcGVuZGVjeSBv
biBtZW1vcnkgYWxsb2NhdGlvbiB0aGF0IG1pZ2h0IHNsZWVwLgoKSXQgaXMgbXVjaCBlYXNpZXIg
dG8gZm9sbG93IHdpdGggc29tZSBoaW50cyBvbiBjb2RlLCBzbyB0aGUgdHJ1ZQpyZXF1aXJlbWVu
dCBpcyB0aGF0IHRoZSBPT00gcmVwZWFyIG5vdCBibG9jayBvbiBHRlBfRlMgYW5kIEdGUF9JTwph
bGxvY2F0aW9ucywgZ3JlYXQsIHRoYXQgY29uc3RyYWludCBpcyBub3cgY2xlYXIuCgo+IElmIHlv
dSBjYW4gZXhwcmVzcyB0aGF0IGluIHRoZSBleGlzdGluZyBsb2NrZGVwIG1hY2hpbmVyeS4gQWxs
Cj4gZmluZS4gQnV0IHRoZW4gY29uc2lkZXIgZGVwbG95bWVudHMgd2hlcmUgbG9ja2RlcCBpcyBu
by1ubyBiZWNhdXNlCj4gb2YgdGhlIG92ZXJoZWFkLgoKVGhpcyBpcyBhbGwgZm9yIGRyaXZlciBk
ZWJ1Z2dpbmcuIFRoZSBwb2ludCBvZiBsb2NrZGVwIGlzIHRvIGZpbmQgYWxsCnRoZXNlIHBhdGhz
IHdpdGhvdXQgaGF2ZSB0byBoaXQgdGhlbSBhcyBhY3R1YWwgcmFjZXMsIHVzaW5nIGRlYnVnCmtl
cm5lbHMuCgpJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhpcyBraW5kIG9mIGRlYnVnZ2luZyBvbiBw
cm9kdWN0aW9uIGtlcm5lbHM/Cgo+ID4gVGhlIGJlc3Qgd2UgZ290IHdhcyBkcml2ZXJzIHRlc3Rl
ZCB0aGUgVkEgcmFuZ2UgYW5kIHJldHVybmVkIHN1Y2Nlc3MKPiA+IGlmIHRoZXkgaGFkIG5vIGlu
dGVyZXN0LiBXaGljaCBpcyBhIGJpZyB3aW4gdG8gYmUgc3VyZSwgYnV0IGl0IGxvb2tzCj4gPiBs
aWtlIGdldHRpbmcgYW55IG1vcmUgaXMgbm90IHJlYWxseSBwb3Nzc2libGUuCj4gCj4gQW5kIHRo
YXQgaXMgYWxyZWFkeSBhIGdyZWF0IHdpbiEgQmVjYXVzZSBtYW55IG5vdGlmaWVycyBvbmx5IGRv
IGNhcmUKPiBhYm91dCBwYXJ0aWN1bGFyIG1hcHBpbmdzLiBQbGVhc2Ugbm90ZSB0aGF0IGJhY2tp
bmcgb2ZmIHVuY29uZGl0aW9hbmxseQo+IHdpbGwgc2ltcGx5IGNhdXNlIHRoYXQgdGhlIG9vbSBy
ZWFwZXIgd2lsbCBoYXZlIHRvIGJhY2sgb2ZmIG5vdCBkb2luZwo+IGFueSB0ZWFyIGRvd24gYW55
dGhpbmcuCgpXZWxsLCBJJ20gd29ya2luZyB0byBwcm9wb3NlIHRoYXQgd2UgZG8gdGhlIFZBIHJh
bmdlIHRlc3QgdW5kZXIgY29yZQptbXUgbm90aWZpZXIgY29kZSB0aGF0IGNhbm5vdCBibG9jayBh
bmQgdGhlbiB3ZSBzaW1wbHkgcmVtb3ZlIHRoZSBpZGVhCm9mIGJsb2NrYWJsZSBmcm9tIGRyaXZl
cnMgdXNpbmcgdGhpcyBuZXcgJ3JhbmdlIG5vdGlmaWVyJy4gCgpJIHRoaW5rIHRoaXMgcHJldHR5
IG11Y2ggc29sdmVzIHRoZSBjb25jZXJuPwoKPiA+IEhvd2V2ZXIsIHdlIGNvdWxkIChwcm9iYWJs
eSBldmVuIHNob3VsZCkgbWFrZSB0aGUgZHJpdmVycyBmc19yZWNsYWltCj4gPiBzYWZlLgo+ID4g
Cj4gPiBJZiB0aGF0IGlzIGVub3VnaCB0byBndWFyYW50ZWUgcHJvZ3Jlc3Mgb2YgT09NLCB0aGVu
IGxldHMgY29uc2lkZXIKPiA+IHNvbWV0aGluZyBsaWtlIHVzaW5nIGN1cnJlbnRfZ2ZwX2NvbnRl
eHQoKSB0byBmb3JjZSBQRl9NRU1BTExPQ19OT0ZTCj4gPiBhbGxvY2F0aW9uIGJlaGF2aW9yIG9u
IHRoZSBkcml2ZXIgY2FsbGJhY2sgYW5kIGxvY2tkZXAgdG8gdHJ5IGFuZCBrZWVwCj4gPiBwdXNo
aW5nIG9uIHRoZSB0aGUgZGVidWdnaW5nLCBhbmQgZHJvcHBpbmcgIWJsb2NraW5nLgo+IAo+IEhv
dyBhcmUgeW91IGdvaW5nIHRvIGVuZm9yY2UgaW5kaXJlY3QgZGVwZW5kZW5jeT8gRS5nLiBhIGxv
Y2sgdGhhdCBpcwo+IGFsc28gdXNlZCBpbiBvdGhlciBjb250ZXh0IHdoaWNoIGRlcGVuZCBvbiBz
bGVlcGFibGUgbWVtb3J5IGFsbG9jYXRpb24KPiB0byBtb3ZlIGZvcndhcmQuCgpZb3UgbWVhbiBs
aWtlIHRoaXM6CgogICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soKQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga21hbGxvYyhHRlBfS0VSTkVM
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCkK
ICBmc19yZWNsYWltX2FjcXVpcmUoKQogIG11dGV4X2xvY2soKSA8LSBpbGxlZ2FsOiBsb2NrIGRl
cCBhc3NlcnRpb24KCj8KCmxvY2tkZXAgaGFuZGxlcyB0aGlzIC0gdGhhdCBpcyB3aGF0IGl0IGRv
ZXMsIGl0IGJ1aWxkcyBhIGdyYXBoIG9mIGFsbApsb2NrIGRlcGVuZGVuY2llcyBhbmQgcmVxdWly
ZXMgdGhlIGdyYXBoIHRvIGJlIGFjeWNsaWMuIFNvIG11dGV4X2xvY2sKZGVwZW5kcyBvbiBmc19y
ZWNsYWltX2xvY2sgb24gQ1BVMSB3aGlsZSBvbiBDUFUwLCBmc19yZWNsYWltX2xvY2sKZGVwZW5k
cyBvbiBtdXRleF9sb2NrLiBUaGlzIGlzIGFuIEFCQkEgbG9ja2luZyBjeWNsZSBhbmQgbG9ja2Rl
cCB3aWxsCnJlbGlhYmx5IHRyaWdnZXIuCgpTbywgaWYgd2Ugd2FudGVkIHRvIGRvIHRoaXMsIEkn
ZCBwcm9iYWJseSBzdWdnZXN0IHdlIHJldG9vbApmc19yZWNsYWltJ3MgaW50ZXJmYWNlIGJlIG1v
cmUgbGlrZQoKICBwcmV2ZW50X2dmcF9mbGFncyhfX0dGUF9JTyB8IF9fR0ZQX0ZTKTsKICBbLi5d
CiAgcmVzdG9yZV9nZnBfZmxhZ3MoX19HRlBfSU8gfCBfX0dGUF9GUyk7CgpXaGljaCBpcyBsb2Nr
ZGVwIGJhc2VkIGFuZCBmb2xsb3dzIHRoZSBpbmRpcmVjdCBsb2NrIGRlcGVuZGVuY2llcyB5b3UK
dGFsa2VkIGFib3V0LgoKVGhlbiBPT00gYW5kIHJlY2xhaW0gY2FuIHNwZWNpZnkgdGhlIGRpZmZl
cmVudCBmbGFncyB0aGV5IHdhbnQKYmxvY2tlZC4gIFdlIGNvdWxkIHByb2JhYmx5IHVzZSB0aGUg
c2FtZSBBUEkgd2l0aCBXUV9NRU1fUkVDTEFJTSBhcyBJCndhcyBjaGF0dGluZyB3aXRoIFRlanVu
IGFib3V0OgoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtcmRtYS9tc2c3NzM2
Mi5odG1sCgpJTUhPIHRoaXMgc3R1ZmYgaXMgKnN1cGVyIGNvbXBsaWNhdGVkKiBmb3IgdGhvc2Ug
b2YgdXMgb3V0c2lkZSB0aGUgbW0Kc3Vic3lzdGVtLCBzbyBoYXZpbmcgc29tZSByZWFsbHkgY2xl
YXIgYW5ub3RhdGlvbnMgbGlrZSB0aGUgYWJvdmUKd291bGQgZ28gYSBsb25nIHdheSB0byBoZWxw
IHVuZGVyc3RhbmQgdGhlc2Ugc3BlY2lhbCBjb25zdHJhaW50cy4KCkknbSBwcmV0dHkgc3VyZSB0
aGVyZSBhcmUgbG90cyBvZiBkcml2ZXIgYnVncyByZWxhdGVkIHRvIHVzaW5nIHRoZQp3cm9uZyBH
RlAgZmxhZ3MgaW4gdGhlIGtlcm5lbC4KCj4gUmVhbGx5LCB0aGlzIHdhcyBhaW1lZCB0byBnaXZl
IGEgdmVyeSBzaW1wbGUgZGVidWdnaW5nIGFpZC4gSWYgaXQgaXMKPiBjb25zaWRlcmVkIHRvIGJl
IHNvIGNvbnRyb3ZlcnNpYWwsIGV2ZW4gdGhvdWdoIEkgcmVhbGx5IGRvIG5vdCBzZWUgd2h5LAo+
IHRoZW4gbGV0J3MganVzdCBkcm9wIGl0IG9uIHRoZSBmbG9vci4KCk15IGNvbmNlcm4gaXMgdGhh
dCB0aGUgcmVxdWlyZW1lbnQgd2FzIHZlcnkgdW5jbGVhci4gSSdtIHRyeWluZyB0bwp1bmRlcnN0
YW5kIGFsbCB0aGUgYml0cyBvZiBob3cgdGhlc2Ugbm90aWZpZXJzIHdvcmsgYW5kIHRoZSBleGFj
dApzZW1hbnRpYyBvZiB0aGlzIE9PTSBwYXRoIGhhdmUgYmVlbiB2YXVnZSBpZiBpdCBpcyByZWFs
bHkgc29tZSBHRlAKZmxhZyByZXN0cmljdGlvbiBvciB0cnVlbHkgcmVsYXRlZCB0byBub3Qgc2xl
ZXBpbmcuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
