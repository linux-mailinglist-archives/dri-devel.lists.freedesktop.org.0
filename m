Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0DCD3CA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 19:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF766E41D;
	Sun,  6 Oct 2019 17:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0672B6E41D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 17:18:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f5so11208210ljg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 10:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nqhtcbRfDvEQJJkAJFzv4RBTuiXKftvmCXLEi1f3srQ=;
 b=FBg2z40L8pUGIr2YdGvIzl7ucBABDwIrjrQ5yfXyUKDmLllnroDLp3s6yURUB7eOEI
 tjYqw+OVoOpLNRsCC5gnCtC4Mfu+5LwMQwPzFteDp9etSQy2PuTfVXgcMW06VOybu5PW
 frmwjyh1c0NjKNSAIDcAPHgd+9fThlKYzn9EBPdML7FNkNwTIyg/Gb3TBeM1taxLoj3Z
 MgCrqNFY9hWTNNdgSDYJdD2hVrZ0KWmtV6U5Fy126T7sFCLUe2b+5ZGXz2evwdiSuWpB
 9rRoTfmbsPTwExBARgLpxOpvW9LDdlTml4gto47BYgoYUtVeVV2H+SSQZAnY+LAyfirg
 PkKQ==
X-Gm-Message-State: APjAAAXB4ioVcDK5qBFn0eQ47+1eUCb8y9EfzlRayr9wAk3QFQGwl8E0
 hWSxSpODz0krETDefM61xZDyhXRkY10=
X-Google-Smtp-Source: APXvYqxNuvnWkKO5l1yHnj9SRTPuRFrIQgZg1ULy18s84votVY/KZhTXl+4YQpFuWQccsL8IeZQ8fQ==
X-Received: by 2002:a2e:9e8b:: with SMTP id f11mr11822451ljk.153.1570382309905; 
 Sun, 06 Oct 2019 10:18:29 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id x30sm2594051ljd.39.2019.10.06.10.18.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2019 10:18:27 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 72so7627012lfh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 10:18:27 -0700 (PDT)
X-Received: by 2002:a19:741a:: with SMTP id v26mr14509292lfe.79.1570382307072; 
 Sun, 06 Oct 2019 10:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
 <20191006165436.GA29585@mit.edu>
In-Reply-To: <20191006165436.GA29585@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Oct 2019 10:18:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
Message-ID: <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: "Theodore Y. Ts'o" <tytso@mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nqhtcbRfDvEQJJkAJFzv4RBTuiXKftvmCXLEi1f3srQ=;
 b=RFX9iEr5oOWgtzp3IBXT04OndQR1DU0EDSHmP2z8P81qc5WnlH3q3z+H6Fn+Q2bRDQ
 H0mj8t0g+mmdm8jwf4l9ysW9y9jx14fPTmNboT3xsSFw9Hg+XXFMXj7P26RjheVyaX4i
 ysqZhaJqY2V93IZXO8nKnxagXIV7guXuOEkKQ=
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
 Brendan Higgins <brendanhiggins@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgNiwgMjAxOSBhdCA5OjU1IEFNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gV2VsbCwgb25lIHRoaW5nIHdlICpjYW4qIGRvIGlzIGlmIChhKSBp
ZiB3ZSBjYW4gY3JlYXRlIGEga3NlbGZ0ZXN0Cj4gYnJhbmNoIHdoaWNoIHdlIGtub3cgaXMgc3Rh
YmxlIGFuZCB3b24ndCBjaGFuZ2UsIGFuZCAoYikgd2UgY2FuIGdldAo+IGFzc3VyYW5jZXMgdGhh
dCBMaW51cyAqd2lsbCogYWNjZXB0IHRoYXQgYnJhbmNoIGR1cmluZyB0aGUgbmV4dCBtZXJnZQo+
IHdpbmRvdywgdGhvc2Ugc3Vic3lzdGVtcyB3aGljaCB3YW50IHRvIHVzZSBrc2VsZiB0ZXN0IGNh
biBzaW1wbHkgcHVsbAo+IGl0IGludG8gdGhlaXIgdHJlZS4KClllcy4KCkF0IHRoZSBzYW1lIHRp
bWUsIEkgZG9uJ3QgdGhpbmsgaXQgbmVlZHMgdG8gYmUgZXZlbiB0aGF0IGZhbmN5LiBFdmVuCmlm
IGl0J3Mgbm90IGEgc3RhYmxlIGJyYW5jaCB0aGF0IGdldHMgc2hhcmVkIGJldHdlZW4gZGlmZmVy
ZW50CmRldmVsb3BlcnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8ganVzdCBoYXZlIHBlb3BsZSBkbyBh
ICJsZXQncyB0cnkgdGhpcyIKdGhyb3ctYXdheSBicmFuY2ggdG8gdXNlIHRoZSBrdW5pdCBmdW5j
dGlvbmFsaXR5IGFuZCB2ZXJpZnkgdGhhdAoieWVhaCwgdGhpcyBpcyBmYWlybHkgY29udmVuaWVu
dCBmb3IgZXh0NCIuCgpJdCBkb2Vzbid0IGhhdmUgdG8gYmUgbWVyZ2VkIGluIHRoYXQgZm9ybSwg
YnV0IGp1c3QgY29uZmlybWF0aW9uIHRoYXQKdGhlIGluZnJhc3RydWN0dXJlIGlzIGhlbHBmdWwg
YmVmb3JlIGl0IGdldHMgbWVyZ2VkIHdvdWxkIGJlIGdvb2QuCgogICAgICAgICAgICAgICBMaW51
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
