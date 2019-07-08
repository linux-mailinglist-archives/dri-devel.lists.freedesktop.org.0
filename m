Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896062C73
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 01:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB0389FA6;
	Mon,  8 Jul 2019 23:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259D589FA6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 23:16:02 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k8so9056698plt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 16:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGZm1g5vtwwYit0yoo3SBX6Ei/KDlijim8AwfezWq5Q=;
 b=jLiW+sSvVbfqYYoLGuHWHScA3YgklKlFqxoqUPAPG8DMnaQS4PfDAdO0x5p5mmyDuA
 FiPX+GYXfgR5YUKIxC96UTTl5yGNvCPwGn+a8rMcAZ7sFAS9BBGbtuQ79k0cXRPjZG/j
 +Kt5XeuOP1EZhRtQshe0xiVYIDVnPfl0PXpYBsL4TnMg9s+i6cYaQD3HE1Skd53H7AM1
 abtWRVlUrbQyTtkEysPBjJqzhget2Y6/SkCpiWNVFS332W9OVCbytmd5DzAJhLyotu6b
 OrzYf7RBUmvI1yk9Vi4yutBeZjK4NlFTkjLg+Jym1t6vKuzhmgAUDUCCbdiFbabw+4mB
 0W5g==
X-Gm-Message-State: APjAAAUEZ6kl7qYhhecThqdygUt9nUkne1STe6urA3NJnB2k3+eWa1xH
 8OGe5f41wVLxDHJ5+RmydTwj2tFw7eAhHnEdKfFN8g==
X-Google-Smtp-Source: APXvYqxLj9lV04W3pazbpY/qgg7ti1gSJwsPPAdwKpyGKBI70/LFOjfevFPZPMucLfnGO+AW10E2yFZhfTdlozEZOjY=
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr26754760plb.297.1562627761245; 
 Mon, 08 Jul 2019 16:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-19-brendanhiggins@google.com>
 <20190705204810.GE19023@42.do-not-panic.com>
In-Reply-To: <20190705204810.GE19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 Jul 2019 16:15:49 -0700
Message-ID: <CAFd5g44j7ECQorYLnDQadAaj+yBki98kFjmjejn+3W4eHtqGDA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
To: Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oGZm1g5vtwwYit0yoo3SBX6Ei/KDlijim8AwfezWq5Q=;
 b=lFUSTt8nxcpQ1geusJZ3lspP7XQwyYNu3KMayNoosCV6UA30ZuMzOWUPZfCjTUzeKM
 iYW2yITMtWXzol7/+legnfgPOBGwjXoEFw7yce+7btcdg0htf2Hg4YfxND5u9apalxJL
 B3QYi+HDYUWlIIkNVozIYrBRfW/Zk/Qz4dosV0rI2mUxb16C62VVRSPlRILHQVx/6UE4
 RshFiQlSNd9CkGW5eoiTTfauBDsWytWT+kOLzVSwNCWkeJDN/HkdAIqfFvOi2TKYEg+r
 l8O7ss1ZZdrzfcN3z+0quxvvwbfum43KpVYwwtrEJTbglIXZty13qrEB3TCpWKeCVLSU
 fZ/A==
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

Q0MnaW5nIEl1cmlpIFphaWtpbgoKT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxOjQ4IFBNIEx1aXMg
Q2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAz
LCAyMDE5IGF0IDA1OjM2OjE1UE0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+IEFk
ZCBlbnRyeSBmb3IgdGhlIG5ldyBwcm9jIHN5c2N0bCBLVW5pdCB0ZXN0IHRvIHRoZSBQUk9DIFNZ
U0NUTCBzZWN0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1
bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiA+IEFja2VkLWJ5OiBMdWlzIENoYW1iZXJs
YWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPgo+IENvbWUgdG8gdGhpbmsgb2YgaXQsIEknZCB3ZWxj
b21lIEl1cmlpIHRvIGJlIGFkZGVkIGFzIGEgbWFpbnRhaW5lciwKPiB3aXRoIHRoZSBob3BlIEl1
cmlpIHdvdWxkIGJlIHVwIHRvIHJldmlldyBvbmx5IHRoZSBrdW5pdCBjaGFuZ2VzLiBPZgo+IGNv
dXJzZSBpZiBJdXJpaSB3b3VsZCBiZSB1cCB0byBhbHNvIGhlbHAgcmV2aWV3IGZ1dHVyZSBwcm9j
IGNoYW5nZXMsCj4gZXZlbiBiZXR0ZXIuIDMgcGFpciBvZiBleWViYWxscyBpcyBiZXR0ZXIgdGhh
biAyIHBhaXJzLgoKV2hhdCBkbyB5b3UgdGhpbmssIEl1cmlpPwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
