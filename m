Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B189457570
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBADB6E55A;
	Thu, 27 Jun 2019 00:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34046E55A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:23:24 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id i2so257066plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 17:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c34/FfI7PALcZVh0MK4YlFiWvnY7m44Qb8oCZcTiVbU=;
 b=kNA9axr1ShduAgXMPUL1yYhrXOQUtG/Ikq+mvVetWRUOeHi/3MyLfqV5Aofw1btR5a
 wOhtrGpX5KmTVCcPAeZXzSmzdgpfYaP40pD4PbQx9dc6k9S5dIPUAwfWqrmy3pUOanrt
 C+t0lKqasrCzFzg5uzM3p90l1M1+nzXmPafWQLFIQ0k2TP8wzjTykh/sYGpD8gTD2QRr
 2YsQUiXj5V17xGfqnngVNagOMsWeSJ2IKvzGCgNH0I3vjWWi7rDOAUPHRltoKyW+EkK9
 Kx10aNUKeFusevHDTiEpgwTaqZ+u3PD0caFrnWiJ2NcnXde30j89m+4ChHGwuhy4oGS5
 AtoQ==
X-Gm-Message-State: APjAAAWF1HkNQiNqbCVG7jPRmownqy52/QzcEU651fa9owFc0SVRl5Q/
 o/PgNv7YOTSoOGC8bhN0xUXkiUZtlyHGzbryt3tDFQ==
X-Google-Smtp-Source: APXvYqz8ozeAzYHPHzqs1rNqRCdggL5+4sDGi+NHmPQJCmuSKDQDwiM3UtGQ8HWyljDXcSyRIYd62W6XpQAlC3xYRPM=
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr950785plb.297.1561595003889; 
 Wed, 26 Jun 2019 17:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-14-brendanhiggins@google.com>
 <20190626000150.GT19023@42.do-not-panic.com>
 <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
 <20190626220350.GA19023@42.do-not-panic.com>
In-Reply-To: <20190626220350.GA19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 26 Jun 2019 17:23:12 -0700
Message-ID: <CAFd5g44ZbVCM3rksF44z_diiejS+Xc+qcXm120L+t+FHwuGyrA@mail.gmail.com>
Subject: Re: [PATCH v5 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=c34/FfI7PALcZVh0MK4YlFiWvnY7m44Qb8oCZcTiVbU=;
 b=a1r7b0eQqi65SnqqxyoyNoD4dz3PJJz11oTPJDYx1ctiFPDiwwrUHcLazOdtvx2h+b
 BJ557GOrC/erbl4AklySqzJS15SQHRCyi1pl5V+Ls9UzeK+ybM4aUzx/S+y9D7ra9gXL
 ud7lUYI/Zqb2M3pihkmgYamKJ46DHL/UUeQ91qNrgnYGOngk+Ky+30mJQ2BAC1N4CLmf
 9YUjsBmnOgUwCj1x8uLgqFqywqoB2YH5RUIgldau68pKxTutIfleZKg6l9x3MWTSKJaB
 ouNqg9FBjBvdFyIKXW5If/Gp0dxolKfdIn0hpcE+lOOFMC9WXHkJlNZBl9+xdWTdckpr
 zuaA==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@google.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMzowMyBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwMTowMjo1NUFN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBh
dCA1OjAxIFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MDhBTSAtMDcwMCwgQnJlbmRh
biBIaWdnaW5zIHdyb3RlOgo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGlu
Zy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1hbGxfcGFzc2VkLmxvZwo+ID4g
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVz
dF9pc190ZXN0X3Bhc3NlZC1jcmFzaC5sb2cKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtZmFpbHVyZS5s
b2cKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9k
YXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtbm9fdGVzdHNfcnVuLmxvZwo+ID4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9vdXRwdXRfaXNv
bGF0ZWRfY29ycmVjdGx5LmxvZwo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVz
dGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9yZWFkX2Zyb21fZmlsZS5rY29uZmlnCj4gPiA+Cj4g
PiA+IFdoeSBhcmUgdGhlc2UgYmVpbmcgYWRkZWQgdXBzdHJlYW0/IFRoZSBjb21taXQgbG9nIGRv
ZXMgbm90IGV4cGxhaW4KPiA+ID4gdGhpcy4KPiA+Cj4gPiBPaCBzb3JyeSwgdGhvc2UgYXJlIGZv
ciB0ZXN0aW5nIHB1cnBvc2VzLiBJIHRob3VnaHQgdGhhdCB3YXMgY2xlYXIKPiA+IGZyb20gYmVp
bmcgaW4gdGhlIHRlc3RfZGF0YSBkaXJlY3RvcnkuIEkgd2lsbCByZWZlcmVuY2UgaXQgaW4gdGhl
Cj4gPiBjb21taXQgbG9nIGluIHRoZSBuZXh0IHJldmlzaW9uLgo+Cj4gU3RpbGwsIEkgZG9uJ3Qg
Z2V0IGl0LiBUaGV5IHNlZW0gdG8gYmUgcmVzdWx0cyBmcm9tIGEgcHJpb3IgcnVuLiBXaHkgZG8K
PiB3ZSBuZWVkIHRoZW0gZm9yIHRlc3RpbmcgcHVycG9zZXM/CgpUaG9zZSBsb2dzIGFyZSB0aGUg
cmF3IG91dHB1dCBmcm9tIFVNTCB3aXRoIEtVbml0IGluc3RhbGxlZC4gVGhleSBhcmUKZm9yIHRl
c3Rpbmcga3VuaXRfdG9vbCwgdGhlIFB5dGhvbiBzY3JpcHRzIGFkZGVkIGluIHRoaXMgY29tbWl0
LiBPbmUKb2YgdGhlIHRoaW5ncyB0aGF0IGt1bml0X3Rvb2wgZG9lcyBpcyBwYXJzZXMgdGhlIHJl
c3VsdHMgb3V0cHV0IGJ5ClVNTCwgZXh0cmFjdHMgdGhlIEtVbml0IGRhdGEsIGFuZCBwcmVzZW50
cyBpdCBpbiBhIHVzZXIgZnJpZW5kbHkKbWFubmVyLgoKSSBhZGRlZCB0aGVzZSBsb2dzIHNvIEkg
Y291bGQgdGVzdCB0aGF0IGt1bml0X3Rvb2wgcGFyc2VzIGNlcnRhaW4Ka2luZHMgb2Ygb3V0cHV0
IGNvcnJlY3RseS4gRm9yIGV4YW1wbGUsIEkgd2FudCB0byBrbm93IHRoYXQgaXQgcGFyc2VzCmEg
dGVzdCBmYWlsdXJlIGNvcnJlY3RseSBhbmQgaW5jbHVkZXMgdGhlIGFwcHJvcHJpYXRlIGNvbnRl
eHQuIFNvIEkKaGF2ZSBhIGxvZyBmcm9tIGEgdW5pdCB0ZXN0IHRoYXQgZmFpbGVkLCBhbmQgSSBo
YXZlIGEgdGVzdCAoYSBQeXRob24KdGVzdCB0aGF0IGlzIGFsc28gaW4gdGhpcyBjb21taXQpIHRo
YXQgdGVzdHMgd2hldGhlciBrdW5pdF90b29sIGNhbgpwYXJzZSB0aGUgbG9nIGNvcnJlY3RseS4K
CkRvZXMgdGhhdCBtYWtlIHNlbnNlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
