Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650B12741
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 07:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130E89483;
	Fri,  3 May 2019 05:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46989483
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 05:48:28 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b1so4319572otp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 22:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJk8vxgxnyREeORp3ZGYiUe4W63+mvTYx011g+D2w9I=;
 b=IGmeIM1mS949iRpTZbzUFdM7wxJpt0aJZ/QDfJ4sNg2rP2ok061M094raNr7rBnjlV
 NIhVpywLGT5FD5PiiiL6EkV8mqctTG9sXgbhVk2HmeDmWO4KprAWBnLGSCkmDRdvo/ky
 L7eqmyJwS3EygkNgo1rV4+belKufVruInuE4cYuUo2EGduPn9wdh0KLwAg7822et3nWl
 wAfD0JfnUaq4Ir4Sfewph4LpZ4yIOF/XVJtZcz5dq/liOhqRgmfVA3cuHA2xwPEi/2ci
 41X5/OXfVjUPwxk3dPW1qiuYAVGn63vGMj3tmjh7LYmK/pUyHmorszlKBDrP7gQvmvpN
 LNFg==
X-Gm-Message-State: APjAAAV2ofz26dtqIIDOkk98EmqgHlrarvbkUjN0cy79hZ2GVFSI/s9m
 8kygT1VefTUu1OCWrZ0dvrKW9YdgACfz7Xr3QublnQ==
X-Google-Smtp-Source: APXvYqwsEAlSz/eNFlgajgo4Kt8DHISJN+MfNVQqCm9syohvOOWU5/fOAXzlAO0OoVTlNR0j/l6/cH2CfoUTavBQdJA=
X-Received: by 2002:a9d:3621:: with SMTP id w30mr5187084otb.98.1556862507760; 
 Thu, 02 May 2019 22:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
 <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
In-Reply-To: <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 22:48:16 -0700
Message-ID: <CAFd5g463PQGn3618Vo2Spu81zzL40jM6Skr1gSWtJqMx7Faj5A@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like
 logger
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yJk8vxgxnyREeORp3ZGYiUe4W63+mvTYx011g+D2w9I=;
 b=gVy2A/3xGfxoPlL5Ko9/iS3jo2EDVupQVAr70qs6RZrFHNgUtzEok56tjyUqT06FB0
 N61EUVCJQSGnIGYHynH3drr29YDViWxqPU9Sza34pLTsoxVh0uUM8E5CV1L0C/mIM9w0
 WGa5tKq18lnS81IMo5BcR1Ykh3Nl7b9ExnnVx27s6jE5lyDFV5nm2p2xr1/VPFBW2Ah2
 kgZSCZQGbf96we5F6/cwHf89KEU3jBrsGd1WH/gd1lUYccvZTH42q4V6uaQ3GXtHhroy
 5qgEL+EjcYwXRo906ivSwsvihl3a7m9bzISXOlTNYJMfYhl7JWVTEbNxfJuRwSUQRKBU
 kRfw==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA2OjUwIFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMS8xOSA1OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cgo8IHNu
aXAgPgoKPiA+IGRpZmYgLS1naXQgYS9rdW5pdC9rdW5pdC1zdHJlYW0uYyBiL2t1bml0L2t1bml0
LXN0cmVhbS5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
MC4uOTNjMTRlZWMwMzg0NAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIva3VuaXQva3VuaXQt
c3RyZWFtLmMKPiA+IEBAIC0wLDAgKzEsMTQ5IEBACgo8IHNuaXAgPgoKPiA+ICtzdGF0aWMgaW50
IGt1bml0X3N0cmVhbV9pbml0KHN0cnVjdCBrdW5pdF9yZXNvdXJjZSAqcmVzLCB2b2lkICpjb250
ZXh0KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBrdW5pdCAqdGVzdCA9IGNvbnRleHQ7Cj4gPiAr
ICAgICBzdHJ1Y3Qga3VuaXRfc3RyZWFtICpzdHJlYW07Cj4gPiArCj4gPiArICAgICBzdHJlYW0g
PSBremFsbG9jKHNpemVvZigqc3RyZWFtKSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIXN0
cmVhbSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArICAgICByZXMtPmFs
bG9jYXRpb24gPSBzdHJlYW07Cj4gPiArICAgICBzdHJlYW0tPnRlc3QgPSB0ZXN0Owo+ID4gKyAg
ICAgc3Bpbl9sb2NrX2luaXQoJnN0cmVhbS0+bG9jayk7Cj4gPiArICAgICBzdHJlYW0tPmludGVy
bmFsX3N0cmVhbSA9IG5ld19zdHJpbmdfc3RyZWFtKCk7Cj4gPiArCj4gPiArICAgICBpZiAoIXN0
cmVhbS0+aW50ZXJuYWxfc3RyZWFtKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
Pgo+IFdoYXQgaGFwcGVucyB0byBzdHJlYW0/IERvbid0IHlvdSB3YW50IHRvIGZyZWUgdGhhdD8K
Ckdvb2QgY2F0Y2guIFdpbGwgZml4IGluIG5leHQgcmV2aXNpb24uCgo8IHNuaXAgPgoKQ2hlZXJz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
