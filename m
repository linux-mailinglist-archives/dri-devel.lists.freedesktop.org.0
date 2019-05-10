Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF071999A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586889A44;
	Fri, 10 May 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 42286 seconds by postgrey-1.36 at gabe;
 Fri, 10 May 2019 03:04:55 UTC
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87918969E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 03:04:54 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x4A34X0S007394
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 12:04:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4A34X0S007394
X-Nifty-SrcIP: [209.85.221.171]
Received: by mail-vk1-f171.google.com with SMTP id r195so1138771vke.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 20:04:34 -0700 (PDT)
X-Gm-Message-State: APjAAAVo2GxtdBxhEuhWZaCuaQO1pt5HVJKEQlGKVCcOT8UyyHVLlqRk
 POIdwZtNkF3Zngo/ADwmC0SLc1TYo3bgtI0sodI=
X-Google-Smtp-Source: APXvYqy2m1+g4N+7CIk2iyVkz9i+viWE9nsO8OqKDhs3ADzAs5NWYmvIdraov4KIA0ibHwe/v+Jg8QmbzOy0PS2UyFc=
X-Received: by 2002:a1f:d585:: with SMTP id m127mr3859437vkg.34.1557457473272; 
 Thu, 09 May 2019 20:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-7-brendanhiggins@google.com>
In-Reply-To: <20190501230126.229218-7-brendanhiggins@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 May 2019 12:03:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
Message-ID: <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] kbuild: enable building KUnit
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1557457474;
 bh=DYJ0GRwyv9LQw+wYut+AKlESUHW5OcD/mZsMQ0v23g4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jupzuktqIfQz0vJS1GaSpRqu2LQlIojIZ6l/TI0jmjH+y1VkJRBs89e7uRAv6B1Ef
 uHXWjQCyh3QM1FLLkbOfmNDmcIDMv3Oq/FlPK1nJiwjkiN5C9tudnBuh0F8evz5qm8
 ZorME1HYwlKxsObBT8LwUNg5l1Fi86fQ7ffUtVkUvXf1TvrufFpYms99rIymu6dL/K
 hIlycbAJXfNN986oEc9iUdGhQ9gZ5CSC7yKV9BeU183dZd8/MJ0EQhq+4AgJe2J6jP
 TyF0SLqvX8D3dQhEIQDaNOjnh/QC3NF0r7D48IC/P5jvWFHuMVUbINwaFq0DbE19/a
 SQYZWBc5p+oIQ==
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
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, amir73il@gmail.com,
 dri-devel <dri-devel@lists.freedesktop.org>, Alexander.Levin@microsoft.com,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "Cc: Shuah Khan" <shuah@kernel.org>, linux-nvdimm@lists.01.org,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, rientjes@google.com,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA4OjAzIEFNIEJyZW5kYW4gSGlnZ2lucwo8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgS1VuaXQgdG8gcm9vdCBLY29uZmlnIGFu
ZCBNYWtlZmlsZSBhbGxvd2luZyBpdCB0byBhY3R1YWxseSBiZSBidWlsdC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KCllvdSBu
ZWVkIHRvIG1ha2Ugc3VyZQp0byBub3QgYnJlYWsgZ2l0LWJpc2VjdCdhYmlsaWx0eS4KCgpXaXRo
IHRoaXMgY29tbWl0LCBJIHNlZSBidWlsZCBlcnJvci4KCiAgQ0MgICAgICBrdW5pdC90ZXN0Lm8K
a3VuaXQvdGVzdC5jOjExOjEwOiBmYXRhbCBlcnJvcjogb3MuaDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQogI2luY2x1ZGUgPG9zLmg+CiAgICAgICAgICBefn5+fn4KY29tcGlsYXRpb24gdGVy
bWluYXRlZC4KbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOzI3OToga3VuaXQv
dGVzdC5vXSBFcnJvciAxCm1ha2U6ICoqKiBbTWFrZWZpbGU7MTc2Mzoga3VuaXQvXSBFcnJvciAy
CgoKCgoKCgoKPiAtLS0KPiAgS2NvbmZpZyAgfCAyICsrCj4gIE1ha2VmaWxlIHwgMiArLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL0tjb25maWcgYi9LY29uZmlnCj4gaW5kZXggNDhhODBiZWFiNjg1My4uMTA0Mjg1MDFl
ZGI3OCAxMDA2NDQKPiAtLS0gYS9LY29uZmlnCj4gKysrIGIvS2NvbmZpZwo+IEBAIC0zMCwzICsz
MCw1IEBAIHNvdXJjZSAiY3J5cHRvL0tjb25maWciCj4gIHNvdXJjZSAibGliL0tjb25maWciCj4K
PiAgc291cmNlICJsaWIvS2NvbmZpZy5kZWJ1ZyIKPiArCj4gK3NvdXJjZSAia3VuaXQvS2NvbmZp
ZyIKPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDJiOTk2NzkxNDhk
YzcuLjc3MzY4ZjQ5OGQ4NGMgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmls
ZQo+IEBAIC05NjksNyArOTY5LDcgQEAgZW5kaWYKPiAgUEhPTlkgKz0gcHJlcGFyZTAKPgo+ICBp
ZmVxICgkKEtCVUlMRF9FWFRNT0QpLCkKPiAtY29yZS15ICAgICAgICAgKz0ga2VybmVsLyBjZXJ0
cy8gbW0vIGZzLyBpcGMvIHNlY3VyaXR5LyBjcnlwdG8vIGJsb2NrLwo+ICtjb3JlLXkgICAgICAg
ICArPSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkvIGNyeXB0by8gYmxvY2sv
IGt1bml0Lwo+Cj4gIHZtbGludXgtZGlycyAgIDo9ICQocGF0c3Vic3QgJS8sJSwkKGZpbHRlciAl
LywgJChpbml0LXkpICQoaW5pdC1tKSBcCj4gICAgICAgICAgICAgICAgICAgICAgJChjb3JlLXkp
ICQoY29yZS1tKSAkKGRyaXZlcnMteSkgJChkcml2ZXJzLW0pIFwKPiAtLQo+IDIuMjEuMC41OTMu
ZzUxMWVjMzQ1ZTE4LWdvb2cKPgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
