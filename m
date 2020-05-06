Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E81C6C62
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 11:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343E89D81;
	Wed,  6 May 2020 09:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE3689D81
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 09:04:34 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d7so1355115ioq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sTnxH9G9lR6+PJewhmpGTxPtG0Z0Cz1wccF+DGccv+M=;
 b=Nf6tozgJRQRu37up6F72efLB+cyG2mYVv5/wWuGP57EvNLIEJJWXIg0t12DDs8fVoA
 x5Ef6ZNng5Fnd4hWxTSo6wS33JFsXouyIzIKXv74UTmXkmKO96nnwhW19VCI6iPB6ReC
 7nu4204MHUz71FoC0Kootamsm1qO8IiZ7gXYbATYPO4NE6uUxbuKCjA/z0wXnM8bwhvX
 k9SeBhPPl8X8u1LKFyB7b7dW4qknE7U1efu34gGJyLCsPPuOFnhXnFiJ0b5gjWK4+zTY
 at+lOpdoCwcQMNoaA9TaOsEtHWHKsUNc102jtuwtILTeMG/t6W4SepDKSzvf+q1NQXpd
 UgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sTnxH9G9lR6+PJewhmpGTxPtG0Z0Cz1wccF+DGccv+M=;
 b=dK0kV3jPOBg8JsMVzYv37T9BtyYlULfSlbtWnE842dFpbwtjUHv01dTms0YDzaoF4N
 4RR6OhIeH3aDaS23+QX6Eoizl/b/d3krDvrAEjaT27JkrkbkqQoe2q08GPg5u//T+6X5
 sawK8YTG88NpriG9ikVWdauhRhrwVshZ53eCKfRPEGTQyh8xLNrp2UEkmGdFI3SdieUN
 a10J9y/yREvj/ZJ4UyOVzsNbZnKc8mudFEnAICsY/jAOrGuBGsK9vfVlFu+ZXpt0+9St
 26ZAUy37vyfY5QHc321644qlyV9cGjJ9tLcSI1v2nP+rXxy2pH1LYi8NN8VNqELd/TKH
 mcxQ==
X-Gm-Message-State: AGi0PuY40bsdjtxy33a6XLlitU0+t6IHF038+dgHGvNqzMuWbT3gcwqZ
 titZxvSj3V4bL9hVLnrP7SDJeyjDvJT74ZlEkzAT76jcDOo=
X-Google-Smtp-Source: APiQypKdZsDxlNAG1MQN5F/vI3O3AbMtIiwtGRnzQiTlrBAq9D5U4ltEmSEim7Scvc9bURGZ48/SKFLeVNp0J4c8ETo=
X-Received: by 2002:a02:6983:: with SMTP id e125mr7607980jac.47.1588755874113; 
 Wed, 06 May 2020 02:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
 <20200506074457.GK6112@intel.com>
In-Reply-To: <20200506074457.GK6112@intel.com>
From: Artem Mygaiev <joculator@gmail.com>
Date: Wed, 6 May 2020 12:04:22 +0300
Message-ID: <CAJwc6Kum2SrGixZyJzAWjC71pxO8zkBJ7MBfdVhxZOFvWyw4RQ@mail.gmail.com>
Subject: Re: Question about sRGB framebuffer support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gVmlsbGUKCk9uIFdlZCwgTWF5IDYsIDIwMjAgYXQgMTA6NDUgQU0gVmlsbGUgU3lyasOk
bMOkCjx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1h
eSAwNSwgMjAyMCBhdCAwMToyNDoxNlBNICswMzAwLCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+ID4g
SGVsbG8gYWxsCj4gPgo+ID4gSSBhbSBjdXJyZW50bHkgd29ya2luZyBvbiBEUk0vS01TIGRyaXZl
ciBmb3IgRnJlc2NvIExvZ2ljIEZMMjAwMCBVU0IgZGlzcGxheQo+ID4gY29udHJvbGxlciBbMV0u
IEkgaGF2ZSBhbHJlYWR5IGltcGxlbWVudGVkIGEgUE9DIGRyaXZlciBbMl0gd2hpY2ggaXMgd29y
a2luZyBmb3IKPiA+IG1lLCBhbHRob3VnaCB0aGVyZSBhcmUgc3RpbGwgcGxlbnR5IG9mIHRoaW5n
cyB0byBpbXByb3ZlIG9yIGZpeCwgb2YgY291cnNlLgo+ID4KPiA+IFNvIGZhciBJIGhhdmUgb25l
IHRoaW5nIHRoYXQgSSBzb21laG93IGNhbm5vdCBmaW5kIGluIERSTS9LTVMgZG9jdW1lbnRhdGlv
biBvcgo+ID4gZXhpc3RpbmcgZHJpdmVyczogaG93IHRvIHRlbGwgdGhlIHN5c3RlbSB0aGF0IEhX
IGV4cGVjdHMgc1JHQiAoaS5lLiBub24tbGluZWFyKQo+ID4gY29sb3IgZW5jb2RpbmcgaW4gZnJh
bWVidWZmZXJzPyBUaGlzIGlzIGEgSFcgbGltaXRhdGlvbiB0aGF0IEkgY2Fubm90IGluZmx1ZW5j
ZQo+ID4gYnkgY29uZmlndXJhdGlvbi4KPgo+IERvZXMgaXQgZG8gc29tZXRoaW5nIHRvIHByb2Nl
c3MgdGhlIGRhdGEgdGhhdCByZXF1aXJlcyBsaW5lYXJpemF0aW9uCj4gb3Igd2h5IGRvZXMgaXQg
Y2FyZSBhYm91dCB0aGUgZ2FtbWEgYXBwbGllZCB0byB0aGUgZGF0YT8gSW4gYSB0eXBpY2FsCj4g
dXNlIGNhc2UgdGhlIGRhdGEgaXMganVzdCBwYXNzZWQgdGhyb3VnaCB1bmxlc3MgdGhlIHVzZXIg
YXNrcyBvdGhlcndpc2UsCj4gc28gaXQgZG9lc24ndCBtYXR0ZXIgbXVjaCB3aGF0IGdhbW1hIHdh
cyB1c2VkLiBUaG91Z2ggbW9zdCBkaXNwbGF5cwo+IHByb2JhYmx5IGV4cGVjdCBzb21ldGhpbmcg
cmVzZW1ibGluZyBzUkdCIGdhbW1hIGJ5IGRlZmF1bHQsIHNvIHRoYXQncwo+IHByZXN1bWFibHkg
d2hhdCBtb3N0IHRoaW5ncyBnZW5lcmF0ZSwgYW5kIGltYWdlcy92aWRlb3MvZXRjLiBwcmV0dHkK
PiBtdWNoIGFsd2F5cyBoYXZlIGdhbW1hIGFscmVhZHkgYXBwbGllZCB3aGVuIHRoZXkgYXJlIHBy
b2R1Y2VkLgo+CgpVbmZvcnR1bmF0ZWx5IHRoZSBIVyB3YXMgZGVzaWduZWQgaW4gYSB3YXkgdGhh
dCB3aGVuIGl0IGlzIGNvbmZpZ3VyZWQgdG8gMjQtYml0ClJHQjg4OCBpdCBleHBlY3RzIHNSR0Ig
YW5kIGFwcGxpZXMgZGVnYW1tYSBhdXRvbWF0aWNhbGx5LiBJdCBpcyBub3QgcG9zc2libGUgdG8K
ZGlzYWJsZSB0aGlzLCBJJ3ZlIGFza2VkIHZlbmRvciBhbmQgdGhleSBjb25maXJtZWQgdGhpcyBb
MV0uCgpUaGUgb25seSB3b3JrYXJvdW5kIEkgY291bGQgaW1wbGVtZW50IG5vdyBpcyB0byBzd2l0
Y2ggaXQgdG8gMTYtYml0IFJHQjU2NSBhbmQKcGVyZm9ybSBmcmFtZWJ1ZmZlciBjb252ZXJzaW9u
cyBpbiBkcml2ZXIsIHNpbWlsYXIgdG8gd2hhdApybV9mYl94cmdiODg4OF90b19yZ2I1NjUoKSBh
bGlrZSBoZWxwZXJzIGRvOyBidXQgaXQgd291bGQgYmUgc3RpbGwgZ3JlYXQgdG8KdW5kZXJzdGFu
ZCB3aGV0aGVyIGl0IGlzIHBvc3NpYmxlIHRvIHN1cHBvcnQgc1JHQi4KClsxXSBodHRwczovL2dp
dGh1Yi5jb20vRnJlc2NvTG9naWMvRkwyMDAwL2lzc3Vlcy80MgoKPiA+Cj4gPiBBbnkgcG9pbnRl
cnMgYXJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuCj4gPgo+ID4gWzFdIHd3dy5mcmVzY29sb2dpYy5j
b20vcHJvZHVjdC9zaW5nbGUvZmwyMDAwCj4gPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2tsb2dn
L2ZsMjAwMF9kcm0KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiAgLS0gQXJ0ZW0KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4g
LS0KPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAoKQmVzdCByZWdhcmRzLApBcnRlbSBNeWdhaWV2
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
