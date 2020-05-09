Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85121CD23F
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6079A6E1E2;
	Mon, 11 May 2020 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B749E6E378
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 16:28:50 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id c16so4352756ilr.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q+G3n0BC6hJndjVqlDDRUwRFiTvwE59s/Dv1p0GcOKU=;
 b=cNjWqWivzOhFHzLnDSnGrNqHbuOmY40pyxLu5KvDXpmYi1Yo63eDrhCaMQsKYl8/y9
 8sdBVYDJuuguXIu8gQcII/1SGRVbEfUcPYSc0N6Q4OpAa2lseunrVGnivuYgC5B1w5BL
 MEzq6CtG+a1PI0HTLkwZCSRpTuRra2wlWaRKUcFmmwgpaqxY6uI2lBv9jy1Qklvzl0ie
 N0qVyUiylgcwpIqvcpSE18yYzFE2o4d91r56Nut/Z3H7GskROdJ31EkFb1WggUL7S/k3
 3i+dx65cc7RCgY6T5ZYTjtkzZCkXdEu2SLUuuNKJkDod6EUL6rj8iu/X5qfUrTDcI4ge
 jVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q+G3n0BC6hJndjVqlDDRUwRFiTvwE59s/Dv1p0GcOKU=;
 b=fSu7LO24idBSBc0GRqDyFQg4BlgyA7aNW1lNrJgGaFmrX5fBl7qsxA1+5S170ZlxMB
 2iuxVh93s5xGVh1pYKeTRYBOwaCfn3KBlY+peNjza2bjh6ODZ7u1zu9OlArClq9WuZWo
 5pYbuM/y7lqvAUI4ey171/ne/z+zP9NLfY1LVlq8Y5KZgK7UeCr4VVU6utVwMmMUtzwd
 0fnR9an8a3FE8Iiz5r4QdY8P91LsEz+0+DfGx6vr/tQ8LVbtM7wYE2GKBIFsbxDhbrja
 bxFFzeaLmnrbcgcZugqYgsNeFTe1Eerw/HxNEOJ8L+qSji/OlkERfpr3nhKY18NxsEoc
 OpfA==
X-Gm-Message-State: AGi0PuZr0pm7qLe+KE5qQdkedHMaGb+26xzqy9SOPeLPAvKR+NHfnnAn
 szOGxjaVx4QvyO6zo6NlTD+5zqbVczHFBfS8mxk=
X-Google-Smtp-Source: APiQypLbie3SZ0jbR++PomgLTh6NayJLBGJx2NpUasMR4UkTmHMfU0UB8UKVJ2mcC0XbthoAMMeEWf8tS0OF6Zc24z8=
X-Received: by 2002:a92:507:: with SMTP id q7mr3078878ile.150.1589041729849;
 Sat, 09 May 2020 09:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCcfrMhu5Mi7YZTttw2k+hGui0GFAmOhPh_9fv4Te27M0+A@mail.gmail.com>
 <13285d84-5a5e-c695-2a8b-7ca50c976b90@arm.com>
In-Reply-To: <13285d84-5a5e-c695-2a8b-7ca50c976b90@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 9 May 2020 18:28:38 +0200
Message-ID: <CAJiuCcduOw1jZ60j+i8GnAda6HACUeCD-DyqoY1aYisSOcuiXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gVGh1LCA3IE1heSAyMDIwIGF0IDE2OjMwLCBTdGV2ZW4gUHJpY2UgPHN0
ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDAyLzA1LzIwMjAgMjM6MDcsIENsw6lt
ZW50IFDDqXJvbiB3cm90ZToKPiA+IEhpIFN0ZXZlbiwKPiA+Cj4gPiBPbiBUdWUsIDE0IEFwciAy
MDIwIGF0IDE1OjEwLCBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToK
PiA+Pgo+ID4+IEhpIENsw6ltZW50LAo+ID4+Cj4gPj4gT24gMTMvMDQvMjAyMCAxODoyOCwgQ2zD
qW1lbnQgUMOpcm9uIHdyb3RlOgo+ID4+PiBIaSBTdGV2ZW4sCj4gPj4+Cj4gPgo8c25pcD4KPgo+
IFNpbmNlIHlvdSd2ZSBnb3QgYSByZXByb2R1Y3Rpb24gLSBjYW4geW91IGdldCBhIGJhY2t0cmFj
ZSB3aGVyZSB0aGUKPiByZWd1bGF0b3IgaXMgZ2V0dGluZyBkaXNhYmxlZD8KClJlZ3VsYXRvciBp
cyBkaXNhYmxlZCBmcm9tIHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKQoKWyAgIDMzLjc1NzY1MF0g
dmRkLWdwdTogZGlzYWJsaW5nClsgICAzMy43NjA3MThdIENQVTogMiBQSUQ6IDMxIENvbW06IGt3
b3JrZXIvMjoxIE5vdCB0YWludGVkCjUuNy4wLXJjMi1uZXh0LTIwMjAwNDI0ICM4ClsgICAzMy43
NjgzNjJdIEhhcmR3YXJlIG5hbWU6IEJlZWxpbmsgR1MxIChEVCkKWyAgIDMzLjc3MjU1M10gV29y
a3F1ZXVlOiBldmVudHMgcmVndWxhdG9yX2luaXRfY29tcGxldGVfd29ya19mdW5jdGlvbgpbICAg
MzMuNzc4ODEzXSBDYWxsIHRyYWNlOgpbICAgMzMuNzgxMjYxXSAgZHVtcF9iYWNrdHJhY2UrMHgw
LzB4MWEwClsgICAzMy43ODQ5MjJdICBzaG93X3N0YWNrKzB4MTgvMHgzMApbICAgMzMuNzg4MjM4
XSAgZHVtcF9zdGFjaysweGMwLzB4MTE0ClsgICAzMy43OTE2MzhdICByZWd1bGF0b3JfbGF0ZV9j
bGVhbnVwKzB4MTY0LzB4MWYwClsgICAzMy43OTYxNjVdICBjbGFzc19mb3JfZWFjaF9kZXZpY2Ur
MHg2NC8weGUwClsgICAzMy44MDA0MzFdICByZWd1bGF0b3JfaW5pdF9jb21wbGV0ZV93b3JrX2Z1
bmN0aW9uKzB4NGMvMHg2MApbICAgMzMuODA2MDg0XSAgcHJvY2Vzc19vbmVfd29yaysweDE5Yy8w
eDMzMApbICAgMzMuODEwMDkwXSAgd29ya2VyX3RocmVhZCsweDRjLzB4NDMwClsgICAzMy44MTM3
NDhdICBrdGhyZWFkKzB4MTM4LzB4MTYwClsgICAzMy44MTY5NzNdICByZXRfZnJvbV9mb3JrKzB4
MTAvMHgyNAoKdGhlIHVzZV9jb3VudCBpcyBhdCAwLi4uCgpJIGhhdmUgY2hlY2sgYW5kIHRoZSBy
ZWd1bGF0b3JfZ2V0IGlzIGNhbGxlZCBhbmQgcmVndWxhdG9yX3B1dCBpcwpuZXZlciBjYWxsZWQg
Zm9yIHZkZC1ncHUuCk5vdCBzdXJlIHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUuLi4KCgo+Cj4gPiAg
IC0gVGhlIENvb2xpbmcgbWFwIGlzIG5vdCBwcm9iZSBjb3JyZWN0bHkgOgo+ID4gWyAgICAyLjU0
NTc1Nl0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IFtkcm06cGFuZnJvc3RfZGV2ZnJlcV9pbml0Cj4g
PiBbcGFuZnJvc3RdXSBGYWlsZWQgdG8gcmVnaXN0ZXIgY29vbGluZyBkZXZpY2UKPiA+IEludHJv
ZHVjZSBpbiB0aGlzIGNvbW1pdCA6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vY2xlbWVudHBlcm9u
L2xpbnV4L2NvbW1pdC8wMjUyYzM4ZmQ1NWFkNzgzNjZhYzRiMTcxNGUyODVjODhkYjM0NTU3Cj4g
Pgo+ID4gRG8geW91IGhhdmUgYW4gaGludCBhYm91dCB3aGF0IEknbSBtaXNzaW5nID8KPgo+IFNv
cnJ5LCBteSBrbm93bGVkZ2Ugb2YgdGhlIGNvb2xpbmcgZnJhbWV3b3JrIGlzIHZlcnkgbGltaXRl
ZC4gV2hhdAo+IHlvdSd2ZSBnb3QgbG9va3MgcGxhdXNpYmxlLCBidXQgSSdtIGFmcmFpZCBJIGNh
bid0IHJlYWxseSBoZWxwIGJleW9uZAo+IHRoYXQhIEFzIGJlZm9yZSAtIGNhbiB5b3UgdHJ5IGFk
ZGluZyBzb21lIHByaW50aygpcyBpbiBlLmcuCj4gb2ZfZGV2ZnJlcV9jb29saW5nX3JlZ2lzdGVy
X3Bvd2VyKCkgYW5kIGZpbmQgb3V0IHdoZXJlIGl0IGlzIGJhaWxpbmcgb3V0PwoKRHVtYiBpc3N1
ZSwgSSB3YXMgbWlzc2luZyB0aGUgQ09ORklHX0RFVkZSRVFfVEhFUk1BTCAtXy0sIEkgd2lsbCBt
YWtlCmEgcGF0Y2ggdG8gZW5hYmxlIGl0IGluIGFybTY0IGRlZmNvbmZpZy4KClJlZ2FyZHMsCkNs
ZW1lbnQKCj4KPiBTdGV2ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
