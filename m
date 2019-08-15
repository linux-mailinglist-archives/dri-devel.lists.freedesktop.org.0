Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897D91169
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4C96EA48;
	Sat, 17 Aug 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC196EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 17:17:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so3117856qto.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 10:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z8ffACx97UoCYoWbcK20vb+vJc46Di7ZY3J/Q+sVrN4=;
 b=JX1wNTvLoV3lZrE8YAbsGOAXZNnE92vcnm+KSm/u8Y8Wl4A8yoO4KMNm3FaIn18IJ2
 jk7Hugm07sM8tChWXxTRovxkg56XDAakSPzHa7OjrhtLHOAsw6oV9J6tjAv4DpRm+nz8
 oXtz/M39eARWu6T9n7Md6jXC5LrVq6XOgush+cBRFnN8t018qiTx1JHkfUdhtqOcPD3t
 bRaPf4n88/WYCSgyCIRMVmVQYXn0uc7DJbyAC9XJa8CZdESD7xrygNZsRma15lpCtPh5
 Ce+1XJl0Sf3E7IO5EYhfwpd6QFRPq0W6IUYG24Rr/j4oNsJzMP5N2Bganc/REEk7ZqvJ
 QKVw==
X-Gm-Message-State: APjAAAV5Pjfx0WceDCw30xj3HAPK3Yqsa9BuUOl+Oy08Fk4seFbLH6SI
 /iR3yDpRzUvTADFFZhOHIkCvSw==
X-Google-Smtp-Source: APXvYqy8bClE2PtYhlNsbzNy3sfuIfpzHgK8LEd061uqbj3o3CPG3Uelsdo/F1E4oVxX/Cn3DR0XDA==
X-Received: by 2002:ac8:6b45:: with SMTP id x5mr4726244qts.329.1565889470494; 
 Thu, 15 Aug 2019 10:17:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id x28sm1853523qtk.8.2019.08.15.10.17.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 10:17:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyJNl-0006n3-Lb; Thu, 15 Aug 2019 14:17:49 -0300
Date: Thu, 15 Aug 2019 14:17:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815171749.GM21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814235805.GB11200@ziepe.ca>
 <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz>
 <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz>
 <20190815165631.GK21596@ziepe.ca>
 <20190815171156.GB30916@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815171156.GB30916@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z8ffACx97UoCYoWbcK20vb+vJc46Di7ZY3J/Q+sVrN4=;
 b=lrLcqqVVbBaaW5DmpJaOL2mAta1VuHGEWegYy4v8k9O/KYbA6trUfUtSwOXUA310uN
 zuvisW/tOnzl/qIbzDfd4s3DNn2oJk4o0dxwnY/ZA56xooLiBHwRGX7/e/IRF4uCvJRB
 gB253hM+6t/Z3jYXj3AHAc09XhS2/PZIrdxHVerl0xsJ/so5ncLIXCUE4xzYVLJEjsPP
 GkcGuLjNzYWjfCaXPfSyoxq6CfnLddPdNdVqoeGSnNtvn/yy7fnMHG5zCWqXToBvxETG
 SAyXDrs7d4csk5SF9eMf58/iCQdcp2DH2M7Cmh4WFK4tJIJ45uHTq8hpFiNJmrDGh4h8
 A8YQ==
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDE6MTE6NTZQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwMTo1NjozMVBNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNjowMDo0MVBNICsw
MjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiAKPiA+ID4gPiBBRkFJSyAnR0ZQX05PV0FJVCcg
aXMgY2hhcmFjdGVyaXplZCBieSB0aGUgbGFjayBvZiBfX0dGUF9GUyBhbmQKPiA+ID4gPiBfX0dG
UF9ESVJFQ1RfUkVDTEFJTS4uCj4gPiA+ID4KPiA+ID4gPiBUaGlzIG1hdGNoZXMgdGhlIGV4aXN0
aW5nIHRlc3QgaW4gX19uZWVkX2ZzX3JlY2xhaW0oKSAtIHNvIGlmIHlvdSBhcmUKPiA+ID4gPiBP
SyB3aXRoIEdGUF9OT0ZTLCBha2EgX19HRlBfSU8gd2hpY2ggdHJpZ2dlcnMgdHJ5X3RvX2NvbXBh
Y3RfcGFnZXMoKSwKPiA+ID4gPiBhbGxvY2F0aW9ucyBkdXJpbmcgT09NLCB0aGVuIEkgdGhpbmsg
ZnNfcmVjbGFpbSBhbHJlYWR5IG1hdGNoZXMgd2hhdAo+ID4gPiA+IHlvdSBkZXNjcmliZWQ/Cj4g
PiA+IAo+ID4gPiBObyBHRlBfTk9GUyBpcyBlcXVhbGx5IGJhZC4gUGxlYXNlIHJlYWQgbXkgb3Ro
ZXIgZW1haWwgZXhwbGFpbmluZyB3aGF0Cj4gPiA+IHRoZSBvb21fcmVhcGVyIGFjdHVhbGx5IHJl
cXVpcmVzLiBJbiBzaG9ydCBubyBibG9ja2luZyBvbiBkaXJlY3Qgb3IKPiA+ID4gaW5kaXJlY3Qg
ZGVwZW5kZWN5IG9uIG1lbW9yeSBhbGxvY2F0aW9uIHRoYXQgbWlnaHQgc2xlZXAuCj4gPiAKPiA+
IEl0IGlzIG11Y2ggZWFzaWVyIHRvIGZvbGxvdyB3aXRoIHNvbWUgaGludHMgb24gY29kZSwgc28g
dGhlIHRydWUKPiA+IHJlcXVpcmVtZW50IGlzIHRoYXQgdGhlIE9PTSByZXBlYXIgbm90IGJsb2Nr
IG9uIEdGUF9GUyBhbmQgR0ZQX0lPCj4gPiBhbGxvY2F0aW9ucywgZ3JlYXQsIHRoYXQgY29uc3Ry
YWludCBpcyBub3cgY2xlYXIuCj4gPiAKPiA+ID4gSWYgeW91IGNhbiBleHByZXNzIHRoYXQgaW4g
dGhlIGV4aXN0aW5nIGxvY2tkZXAgbWFjaGluZXJ5LiBBbGwKPiA+ID4gZmluZS4gQnV0IHRoZW4g
Y29uc2lkZXIgZGVwbG95bWVudHMgd2hlcmUgbG9ja2RlcCBpcyBuby1ubyBiZWNhdXNlCj4gPiA+
IG9mIHRoZSBvdmVyaGVhZC4KPiA+IAo+ID4gVGhpcyBpcyBhbGwgZm9yIGRyaXZlciBkZWJ1Z2dp
bmcuIFRoZSBwb2ludCBvZiBsb2NrZGVwIGlzIHRvIGZpbmQgYWxsCj4gPiB0aGVzZSBwYXRocyB3
aXRob3V0IGhhdmUgdG8gaGl0IHRoZW0gYXMgYWN0dWFsIHJhY2VzLCB1c2luZyBkZWJ1Zwo+ID4g
a2VybmVscy4KPiA+IAo+ID4gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRoaXMga2luZCBvZiBkZWJ1
Z2dpbmcgb24gcHJvZHVjdGlvbiBrZXJuZWxzPwo+ID4gCj4gPiA+ID4gVGhlIGJlc3Qgd2UgZ290
IHdhcyBkcml2ZXJzIHRlc3RlZCB0aGUgVkEgcmFuZ2UgYW5kIHJldHVybmVkIHN1Y2Nlc3MKPiA+
ID4gPiBpZiB0aGV5IGhhZCBubyBpbnRlcmVzdC4gV2hpY2ggaXMgYSBiaWcgd2luIHRvIGJlIHN1
cmUsIGJ1dCBpdCBsb29rcwo+ID4gPiA+IGxpa2UgZ2V0dGluZyBhbnkgbW9yZSBpcyBub3QgcmVh
bGx5IHBvc3NzaWJsZS4KPiA+ID4gCj4gPiA+IEFuZCB0aGF0IGlzIGFscmVhZHkgYSBncmVhdCB3
aW4hIEJlY2F1c2UgbWFueSBub3RpZmllcnMgb25seSBkbyBjYXJlCj4gPiA+IGFib3V0IHBhcnRp
Y3VsYXIgbWFwcGluZ3MuIFBsZWFzZSBub3RlIHRoYXQgYmFja2luZyBvZmYgdW5jb25kaXRpb2Fu
bGx5Cj4gPiA+IHdpbGwgc2ltcGx5IGNhdXNlIHRoYXQgdGhlIG9vbSByZWFwZXIgd2lsbCBoYXZl
IHRvIGJhY2sgb2ZmIG5vdCBkb2luZwo+ID4gPiBhbnkgdGVhciBkb3duIGFueXRoaW5nLgo+ID4g
Cj4gPiBXZWxsLCBJJ20gd29ya2luZyB0byBwcm9wb3NlIHRoYXQgd2UgZG8gdGhlIFZBIHJhbmdl
IHRlc3QgdW5kZXIgY29yZQo+ID4gbW11IG5vdGlmaWVyIGNvZGUgdGhhdCBjYW5ub3QgYmxvY2sg
YW5kIHRoZW4gd2Ugc2ltcGx5IHJlbW92ZSB0aGUgaWRlYQo+ID4gb2YgYmxvY2thYmxlIGZyb20g
ZHJpdmVycyB1c2luZyB0aGlzIG5ldyAncmFuZ2Ugbm90aWZpZXInLiAKPiA+IAo+ID4gSSB0aGlu
ayB0aGlzIHByZXR0eSBtdWNoIHNvbHZlcyB0aGUgY29uY2Vybj8KPiAKPiBJIGFtIG5vdCBzdXJl
IGkgZm9sbG93IHdoYXQgeW91IHByb3Bvc2UgaGVyZSA/IExpa2UgaSBwb2ludGVkIG91dCBpbgo+
IGFub3RoZXIgZW1haWwgZm9yIEdQVSB3ZSBkbyBuZWVkIHRvIGJlIGFibGUgdG8gc2xlZXAgKHdl
IG1pZ2h0IGdldAo+IGx1Y2t5IGFuZCBub3QgbmVlZCB0b28gYnV0IHRoaXMgaXMgcnVudGltZSB0
aGluZykgd2l0aGluIG5vdGlmaWVyCj4gcmFuZ2Vfc3RhcnQgY2FsbGJhY2suIFRoaXMgaGFzIGJl
ZW4gc29tZXRoaW5nIGFsbG93IGJ5IG5vdGlmaWVyIHNpbmNlCj4gaXQgaGFzIGJlZW4gaW50cm9k
dWNlZCBpbiB0aGUga2VybmVsLgoKU29ycnksIEkgbWVhbiByZW1vdmUgdGhlIGlkZWEgb2YgdGhl
IGJsb2NrYWJsZSBmbGFnIGZyb20gdGhlCmRyaXZlcnMuIERyaXZlcnMgd2lsbCBhbHdheXMgYmUg
YWJsZSB0byBibG9jaywgd2l0aGluIHRoZSBleGlzdGluZwpsaW1pdGF0aW9uIG9mIGZzX3JlY2xh
aW0KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
