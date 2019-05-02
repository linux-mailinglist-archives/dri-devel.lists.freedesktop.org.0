Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129C12825
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CE2896DD;
	Fri,  3 May 2019 06:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1FC891DA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 21:16:27 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n2so1610825pgg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 14:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SXzn4PL7BS9Zk+Qjz5Z6ao7p78pnuZhgvrrpjIHBgqs=;
 b=B5U9mCvtz3wDnQGsBa1oA60OXFShWhwOikUvLCZ4pE1X2v+QYNWd3QM/1oGYqnbdcP
 20/+hKDbC4tYQmoA0JkrWInoj/MnRmVTB29Lq9rV+dQ1UngqlnygO1nzMVUQxup8aTCx
 H8jHcI5clncEQO3Pb7q2MtDGmoJpO2RRfdqmtDHJlDXN5Dr8H18i0NWex+Rk5xJ6nz3j
 I1nY6fe21v6Uuu0UzohCMvy2kbMp5PcPd+T5q4JGjg9DqhZI0C1cfTrNl8CNL0joEnWx
 e1M1z+iHK/vtpFJSqw2WXI/T7KbT5mpllOWQ6vnozf8TWcx0y0S6cnm1YDAcHSwo8Clo
 VGqg==
X-Gm-Message-State: APjAAAW9N5FsRY2pXBxmaquZBAEYXzOi2U65Z9Ib1pSGmBIVNZwY2J3t
 OcxjNwL0fAwoWErQUGvEct4=
X-Google-Smtp-Source: APXvYqyaAKrOO8dNkOZg12O3d42lENfOgkrL7qBtR/V01hTlj71I+CQb4vEU5IP/L2A0+G0+xdSQEg==
X-Received: by 2002:a63:5f42:: with SMTP id t63mr6174518pgb.275.1556831786717; 
 Thu, 02 May 2019 14:16:26 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net.
 [24.6.192.50])
 by smtp.gmail.com with ESMTPSA id f63sm102173pfc.180.2019.05.02.14.16.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 14:16:26 -0700 (PDT)
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
To: Brendan Higgins <brendanhiggins@google.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
Date: Thu, 2 May 2019 14:16:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SXzn4PL7BS9Zk+Qjz5Z6ao7p78pnuZhgvrrpjIHBgqs=;
 b=kCJFdJIIF969KctuD3d2wM6Ofbq6dPOZFLTH8wlGl+7+cVokVRuDwro7NOWN9ohV8k
 ImAl50lyzEBsv7yN+yDsApIRZoLtSCfwhyzyxPvjXoEWcvwOBh4YVBGfYFjfXofVIUhG
 4IdfwHyJltRS5sW89ee6jcilUM33Ka1rf9l/1hx/r4xvkgirrOsCcjMVyOo7fNRjZFEX
 W57GSaPxOGJB3pNyXX+NzqVUj3/2JEPXwOjRvCBv8sNkyMt8fb6SSscfdGTffg6t6JdB
 E1xSneePimV/qvTL3gOacgC8P6jcyMC1ik1HBxyp2Tove1HOXYfOKbo6mTy7cNVaJPvY
 TkNA==
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
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yLzE5IDExOjA3IEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gVGh1LCBNYXkg
MiwgMjAxOSBhdCA0OjAyIEFNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3
cm90ZToKPj4KPj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MjFQTSAtMDcwMCwgQnJl
bmRhbiBIaWdnaW5zIHdyb3RlOgo+Pj4gRnJvbTogRmVsaXggR3VvIDxmZWxpeGd1b3hpdXBpbmdA
Z21haWwuY29tPgo+Pj4KPj4+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGNyZWF0ZSBtaW5pbWFs
IGlzb2xhdGVkIHRlc3QgYmluYXJpZXM7IGluIHRoZQo+Pj4gbWVhbnRpbWUgd2UgYXJlIHVzaW5n
IFVNTCB0byBwcm92aWRlIHRoZSBpbmZyYXN0cnVjdHVyZSB0byBydW4gdGVzdHMsIHNvCj4+PiBk
ZWZpbmUgYW4gYWJzdHJhY3Qgd2F5IHRvIGNvbmZpZ3VyZSBhbmQgcnVuIHRlc3RzIHRoYXQgYWxs
b3cgdXMgdG8KPj4+IGNoYW5nZSB0aGUgY29udGV4dCBpbiB3aGljaCB0ZXN0cyBhcmUgYnVpbHQg
d2l0aG91dCBhZmZlY3RpbmcgdGhlIHVzZXIuCj4+PiBUaGlzIGFsc28gbWFrZXMgcHJldHR5IGFu
ZCBkeW5hbWljIGVycm9yIHJlcG9ydGluZywgYW5kIGEgbG90IG9mIG90aGVyCj4+PiBuaWNlIGZl
YXR1cmVzIGVhc2llci4KPj4+Cj4+PiBrdW5pdF9jb25maWcucHk6Cj4+PiAgIC0gcGFyc2UgLmNv
bmZpZyBhbmQgS2NvbmZpZyBmaWxlcy4KPj4+Cj4+PiBrdW5pdF9rZXJuZWwucHk6IHByb3ZpZGVz
IGhlbHBlciBmdW5jdGlvbnMgdG86Cj4+PiAgIC0gY29uZmlndXJlIHRoZSBrZXJuZWwgdXNpbmcg
a3VuaXRjb25maWcuCj4+PiAgIC0gYnVpbGQgdGhlIGtlcm5lbCB3aXRoIHRoZSBhcHByb3ByaWF0
ZSBjb25maWd1cmF0aW9uLgo+Pj4gICAtIHByb3ZpZGUgZnVuY3Rpb24gdG8gaW52b2tlIHRoZSBr
ZXJuZWwgYW5kIHN0cmVhbSB0aGUgb3V0cHV0IGJhY2suCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
RmVsaXggR3VvIDxmZWxpeGd1b3hpdXBpbmdAZ21haWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTog
QnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+Pgo+PiBBaCwgaGVy
ZSdzIHByb2JhYmx5IG15IGFuc3dlciB0byBteSBwcmV2aW91cyBsb2dnaW5nIGZvcm1hdCBxdWVz
dGlvbiwKPj4gcmlnaHQ/ICBXaGF0J3MgdGhlIGNoYW5jZSB0aGF0IHRoZXNlIHdyYXBwZXJzIG91
dHB1dCBzdHVmZiBpbiBhIHN0YW5kYXJkCj4+IGZvcm1hdCB0aGF0IHRlc3QtZnJhbWV3b3JrLXRv
b2xzIGNhbiBhbHJlYWR5IHBhcnNlPyAgOikKPiAKPiBJdCBzaG91bGQgYmUgcHJldHR5IGVhc3kg
dG8gZG8uIEkgaGFkIHNvbWUgcGF0Y2hlcyB0aGF0IHBhY2sgdXAgdGhlCj4gcmVzdWx0cyBpbnRv
IGEgc2VyaWFsaXplZCBmb3JtYXQgZm9yIGEgcHJlc3VibWl0IHNlcnZpY2U7IGl0IHNob3VsZCBi
ZQo+IHByZXR0eSBzdHJhaWdodGZvcndhcmQgdG8gdGFrZSB0aGUgc2FtZSBsb2dpYyBhbmQganVz
dCBjaGFuZ2UgdGhlCj4gb3V0cHV0IGZvcm1hdC4KCldoZW4gZXhhbWluaW5nIGFuZCB0cnlpbmcg
b3V0IHRoZSBwcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGUgcGF0Y2ggSSBmb3VuZAp0aGUgd3JhcHBl
cnMgdXNlZnVsIHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gYWJvdXQgaG93IHRvIGNvbnRyb2wgYW5k
IHVzZQp0aGUgdGVzdHMsIGJ1dCBJIGhhZCBubyBpbnRlcmVzdCBpbiB1c2luZyB0aGUgc2NyaXB0
cyBhcyB0aGV5IGRvIG5vdApmaXQgaW4gd2l0aCBteSBwZXJzb25hbCBlbnZpcm9ubWVudCBhbmQg
d29ya2Zsb3cuCgpJbiB0aGUgcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhlIHBhdGNoLCB0aGVzZSBo
ZWxwZXIgc2NyaXB0cyBhcmUgb3B0aW9uYWwsCndoaWNoIGlzIGdvb2QgZm9yIG15IHVzZSBjYXNl
LiAgSWYgdGhlIGhlbHBlciBzY3JpcHRzIGFyZSByZXF1aXJlZCB0bwpnZXQgdGhlIGRhdGEgaW50
byB0aGUgcHJvcGVyIGZvcm1hdCB0aGVuIHRoZSBzY3JpcHRzIGFyZSBub3QgcXVpdGUgc28Kb3B0
aW9uYWwsIHRoZXkgYmVjb21lIHRoZSBleHBlY3RlZCBlbnZpcm9ubWVudC4gIEkgdGhpbmsgdGhl
IHByb3Blcgpmb3JtYXQgc2hvdWxkIGV4aXN0IHdpdGhvdXQgdGhlIGhlbHBlciBzY3JpcHRzLgoK
LUZyYW5rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
