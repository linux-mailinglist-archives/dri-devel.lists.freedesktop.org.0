Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5182411ABE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 16:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B24895C3;
	Thu,  2 May 2019 14:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42E9895C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 14:04:30 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB3F1206DF;
 Thu,  2 May 2019 14:04:28 +0000 (UTC)
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Greg KH <gregkh@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
From: shuah <shuah@kernel.org>
Message-ID: <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
Date: Thu, 2 May 2019 08:04:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502105053.GA12416@kroah.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556805870;
 bh=Wa7agHm7Un4ja3yaCvgGgD1ND3pUZJ7MD4aKZiRFMCM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yX5jTSzrUif4ca3k3xa8i9BRvwX2CoEc3LSZADtQzBQU989uyUErZwEyIeGvuAtbz
 UMq4IZzjZwSlSfIlEfCCs4JueRJdLmpmGVu4hBGn/PniD+9zEIFE0G2oc27b7amOah
 TyFD1OvQOYCZcqsTjmi92jjUJmi6G3VQLb2z3k/0=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, frowand.list@gmail.com,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yLzE5IDQ6NTAgQU0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDEsIDIwMTkg
YXQgMDQ6MDE6MDlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+PiAjIyBUTERSCj4+
Cj4+IEkgcmViYXNlZCB0aGUgbGFzdCBwYXRjaHNldCBvbiA1LjEtcmM3IGluIGhvcGVzIHRoYXQg
d2UgY2FuIGdldCB0aGlzIGluCj4+IDUuMi4KPiAKPiBUaGF0IG1pZ2h0IGJlIHJ1c2hpbmcgaXQs
IG5vcm1hbGx5IHRyZWVzIGFyZSBhbHJlYWR5IGNsb3NlZCBub3cgZm9yCj4gNS4yLXJjMSBpZiA1
LjEtZmluYWwgY29tZXMgb3V0IHRoaXMgU3VuZGF5Lgo+IAo+PiBTaHVhaCwgSSB0aGluayB5b3Us
IEdyZWcgS0gsIGFuZCBteXNlbGYgdGFsa2VkIG9mZiB0aHJlYWQsIGFuZCB3ZSBhZ3JlZWQKPj4g
d2Ugd291bGQgbWVyZ2UgdGhyb3VnaCB5b3VyIHRyZWUgd2hlbiB0aGUgdGltZSBjYW1lPyBBbSBJ
IHJlbWVtYmVyaW5nCj4+IGNvcnJlY3RseT8KPiAKPiBObyBvYmplY3Rpb24gZnJvbSBtZS4KPiAK
Clllcy4gSSBjYW4gdGFrZSB0aGVzZSB0aHJvdWdoIGtzZWxmdGVzdCB0cmVlIHdoZW4gdGhlIHRp
bWUgY29tZXMuCkFncmVlIHdpdGggR3JlZyB0aGF0IDUuMiBtaWdodCBiZSBydXNoaW5nIGl0LiA1
LjMgd291bGQgYmUgYSBnb29kCnRhcmdldC4KCnRoYW5rcywKLS0gU2h1YWgKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
