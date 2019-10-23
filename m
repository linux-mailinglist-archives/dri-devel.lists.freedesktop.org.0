Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E3E17BA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 12:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48D6EA2F;
	Wed, 23 Oct 2019 10:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500576EA2F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 10:22:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 613D5814;
 Wed, 23 Oct 2019 12:22:13 +0200 (CEST)
Date: Wed, 23 Oct 2019 13:22:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
Message-ID: <20191023102207.GB4763@pendragon.ideasonboard.com>
References: <20191022214208.211448-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022214208.211448-1-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571826133;
 bh=eGJOH1VGLoVHmq/1QUJrrmrQnHMBekaXv4x5beDzUns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNt1lFgV/RYMyeFBPXTgQiKb3GwPw/Wa344JMMSZWnwFmLvL/ZwSc8yFopTSs7O3V
 3BEcvANOutiE3Uqo9EUjLPvIH0XYH9JeysLU4k3odp1PfhlVV0P9EFVjba6AUVEZTx
 Bg5kiEXBNGIQl2WjyNDPL8rSeOPgyZ4CMk60KXUs=
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Feng Tang <feng.tang@intel.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, kernel-team@android.com,
 linux-media@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Maxim Martynov <maxim@arista.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-bluetooth@vger.kernel.org,
 David Ahern <dsahern@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFyaywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBPY3QgMjIsIDIwMTkg
YXQgMDI6NDE6NDVQTSAtMDcwMCwgTWFyayBTYWx5enluIHdyb3RlOgo+IFJlcGxhY2UgYWxsIG9j
Y3VycmVuY2VzIG9mIHByZWZlcmVkIHdpdGggcHJlZmVycmVkIHRvIG1ha2UgZnV0dXJlCj4gY2hl
Y2twYXRjaC5wbCdzIGhhcHB5LiAgQSBmZXcgcGxhY2VzIHRoZSBpbmNvcnJlY3Qgc3BlbGxpbmcg
aXMKPiBtYXRjaGVkIHdpdGggdGhlIGNvcnJlY3Qgc3BlbGxpbmcgdG8gcHJlc2VydmUgZXhpc3Rp
bmcgdXNlciBzcGFjZSBBUEkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyayBTYWx5enluIDxzYWx5
enluQGFuZHJvaWQuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvaXAtc3lz
Y3RsLnR4dCAgICAgICAgfCAgIDIgKy0KPiAgLi4uL2Zpcm13YXJlL2VmaS9saWJzdHViL2VmaS1z
dHViLWhlbHBlci5jICAgIHwgICAyICstCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9jb21wcmVzc29yLmggICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9rbXMuYyAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmggICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNf
dmlkZW8uYyAgICAgICAgICAgICB8ICAgNiArLQo+ICBmcy9uZnMvbmZzNHhkci5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgaW5jbHVkZS9saW51eC9pcHY2LmggICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGluY2x1ZGUvbmV0L2FkZHJjb25mLmgg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBpbmNsdWRlL25ldC9pZl9pbmV0Ni5o
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgaW5jbHVkZS9uZXQvbmRpc2MuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICstCj4gIGluY2x1ZGUvdWFwaS9saW51eC9p
Zl9hZGRyLmggICAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICBpbmNsdWRlL3VhcGkvbGludXgv
aXB2Ni5oICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgaW5jbHVkZS91YXBpL2xpbnV4
L3N5c2N0bC5oICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gIGluY2x1ZGUvdWFwaS9saW51
eC91c2IvdmlkZW8uaCAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICBrZXJuZWwvc3lzY3RsX2Jp
bmFyeS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KPiAgbmV0LzZsb3dwYW4vbmRp
c2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gIG5ldC9pcHY0L2Rldmlu
ZXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyMCArKy0tCj4gIG5ldC9pcHY2L2Fk
ZHJjb25mLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDExMyArKysrKysrKysrLS0tLS0t
LS0KPiAgMTkgZmlsZXMgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygt
KQoKW3NuaXBdCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVv
LmMgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMKPiBpbmRleCA4ZmE3N2E4MWRk
N2YuLjAwOTZlNmFhY2RiNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZj
X3ZpZGVvLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMKPiBAQCAt
Mjc2LDEzICsyNzYsMTMgQEAgc3RhdGljIGludCB1dmNfZ2V0X3ZpZGVvX2N0cmwoc3RydWN0IHV2
Y19zdHJlYW1pbmcgKnN0cmVhbSwKPiAgCWlmIChzaXplID49IDM0KSB7Cj4gIAkJY3RybC0+ZHdD
bG9ja0ZyZXF1ZW5jeSA9IGdldF91bmFsaWduZWRfbGUzMigmZGF0YVsyNl0pOwo+ICAJCWN0cmwt
PmJtRnJhbWluZ0luZm8gPSBkYXRhWzMwXTsKPiAtCQljdHJsLT5iUHJlZmVyZWRWZXJzaW9uID0g
ZGF0YVszMV07Cj4gKwkJY3RybC0+YlByZWZlcnJlZFZlcnNpb24gPSBkYXRhWzMxXTsKPiAgCQlj
dHJsLT5iTWluVmVyc2lvbiA9IGRhdGFbMzJdOwo+ICAJCWN0cmwtPmJNYXhWZXJzaW9uID0gZGF0
YVszM107Cj4gIAl9IGVsc2Ugewo+ICAJCWN0cmwtPmR3Q2xvY2tGcmVxdWVuY3kgPSBzdHJlYW0t
PmRldi0+Y2xvY2tfZnJlcXVlbmN5Owo+ICAJCWN0cmwtPmJtRnJhbWluZ0luZm8gPSAwOwo+IC0J
CWN0cmwtPmJQcmVmZXJlZFZlcnNpb24gPSAwOwo+ICsJCWN0cmwtPmJQcmVmZXJyZWRWZXJzaW9u
ID0gMDsKPiAgCQljdHJsLT5iTWluVmVyc2lvbiA9IDA7Cj4gIAkJY3RybC0+Yk1heFZlcnNpb24g
PSAwOwo+ICAJfQo+IEBAIC0zMjUsNyArMzI1LDcgQEAgc3RhdGljIGludCB1dmNfc2V0X3ZpZGVv
X2N0cmwoc3RydWN0IHV2Y19zdHJlYW1pbmcgKnN0cmVhbSwKPiAgCWlmIChzaXplID49IDM0KSB7
Cj4gIAkJcHV0X3VuYWxpZ25lZF9sZTMyKGN0cmwtPmR3Q2xvY2tGcmVxdWVuY3ksICZkYXRhWzI2
XSk7Cj4gIAkJZGF0YVszMF0gPSBjdHJsLT5ibUZyYW1pbmdJbmZvOwo+IC0JCWRhdGFbMzFdID0g
Y3RybC0+YlByZWZlcmVkVmVyc2lvbjsKPiArCQlkYXRhWzMxXSA9IGN0cmwtPmJQcmVmZXJyZWRW
ZXJzaW9uOwo+ICAJCWRhdGFbMzJdID0gY3RybC0+Yk1pblZlcnNpb247Cj4gIAkJZGF0YVszM10g
PSBjdHJsLT5iTWF4VmVyc2lvbjsKPiAgCX0KCltzbmlwXQoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3VzYi92aWRlby5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3VzYi92aWRlby5o
Cj4gaW5kZXggZDg1NGNiMTljNDJjLi41OTE2N2YwZWQ1YzEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3VzYi92aWRlby5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3VzYi92
aWRlby5oCj4gQEAgLTQ0OCw3ICs0NDgsMTAgQEAgc3RydWN0IHV2Y19zdHJlYW1pbmdfY29udHJv
bCB7Cj4gIAlfX3UzMiBkd01heFBheWxvYWRUcmFuc2ZlclNpemU7Cj4gIAlfX3UzMiBkd0Nsb2Nr
RnJlcXVlbmN5Owo+ICAJX191OCAgYm1GcmFtaW5nSW5mbzsKPiAtCV9fdTggIGJQcmVmZXJlZFZl
cnNpb247Cj4gKwl1bmlvbiB7Cj4gKwkJX191OCBiUHJlZmVycmVkVmVyc2lvbjsKPiArCQlfX3U4
IGJQcmVmZXJlZFZlcnNpb24gX19hdHRyaWJ1dGVfXygoZGVwcmVjYXRlZCkpOyAvKiBOT1RZUE8g
Ki8KPiArCX0gX19hdHRyaWJ1dGVfXygoX19wYWNrZWRfXykpOwoKUXVpdGUgaW50ZXJlc3Rpbmds
eSB0aGlzIHR5cG8gaXMgcGFydCBvZiB0aGUgVVNCIGRldmljZSBjbGFzcyBkZWZpbml0aW9uCmZv
ciB2aWRlbyBkZXZpY2VzIChVVkMpIHNwZWNpZmljYXRpb24uIEkgdGh1cyB0aGluayB3ZSBzaG91
bGQga2VlcCB1c2luZwp0aGUgZmllbGQgbmFtZSBiUHJlZmVyZWRWZXJzaW9uIHRocm91Z2ggdGhl
IGNvZGUsIG90aGVyd2lzZSBpdCB3b3VsZG4ndAptYXRjaCB0aGUgc3BlYy4KCj4gIAlfX3U4ICBi
TWluVmVyc2lvbjsKPiAgCV9fdTggIGJNYXhWZXJzaW9uOwo+ICB9IF9fYXR0cmlidXRlX18oKF9f
cGFja2VkX18pKTsKCltzbmlwXQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
