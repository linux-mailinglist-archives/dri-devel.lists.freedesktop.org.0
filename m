Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A794D193752
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 05:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844156E23F;
	Thu, 26 Mar 2020 04:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC066E23F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 04:37:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id u59so5357246edc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 21:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y20CeGQScdwXv2e5cBbGORXlmOAQqvqGM8Tbmxh+s8U=;
 b=NnPN28SRXi1uUhX29Dz/ecQfFMQ9NJKJyWfz57OCY+So4pdu/YOtIs8TLBwkfsbit8
 L86CQNndJIPSxbZw7+4McwCfFyqnS6QAt1fSE5U6H3Nkqv2JcsH+BTOz8r1B0Uc8Po1Z
 FgR6DJqLubRVXNqXIs/ECINnaIo/eKg3fGwLnsgMno5LAY1Pq7LQB8Q8gF3vAkoCcfMl
 vnzZaNxFqEbBn7VWrLnFQoq2BGEYck/v2nPHqISNO3LxmmA59JHDiQBRYPWN1ddlZtC/
 o2henSodF7cP9rrq67FXCK5UY4MkegV791GX8DXKjyZFfwDOuyMKqMfSIUGM48MvD7s8
 I4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y20CeGQScdwXv2e5cBbGORXlmOAQqvqGM8Tbmxh+s8U=;
 b=ipcFhwB9lyyXPEFHdBvl0TDh40BkRUL0alillM09MTBcX4XiQEyZuS3N8FRtsqTVLN
 /HoGxoEuKnqxhr6N6XgzQiyUoSEkyCkEKn31MXVSftAX5YGRf76ddTR1Ms9xalsgU8Xw
 dnMtX2yR7oKBat+I5JxBJL9SgcgTk+HRHE4tKQsGtfKn2jjHF/FgI77lDFoON0e+/neM
 RSWZfLuY2wv2kch3xV9qEnlIzrVN/YU93f2ph3BvDfT3qs2EiINSUclyTfie2QUn/h2l
 OH6S0l4mk+nHuhDDt7+zDFLJuOY4sHyeK/6BwNetCkUI9l0lxycG5kMLBHNsVWlrwqI9
 py0g==
X-Gm-Message-State: ANhLgQ1kAXgMuM+xJho8ncoqsA9QWzoLe5ihJUjyi53Nd8YTXZoZDN1p
 QkpsVk+vtDdWA+rOR7thxwzlz4MrRiQ7CkZGDj9yKg==
X-Google-Smtp-Source: ADFU+vuEqHrADScJDNrE5jEmfQwLB6omwEtMI9r+jBDuPZsEKbUtAYrdc7Maiu+s44RUM2179JuB/uQYQyUXcglHnqw=
X-Received: by 2002:a17:906:6987:: with SMTP id
 i7mr6196042ejr.12.1585197418839; 
 Wed, 25 Mar 2020 21:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200220122719.4302-1-thomas_os@shipmail.org>
 <20200220122719.4302-2-thomas_os@shipmail.org>
In-Reply-To: <20200220122719.4302-2-thomas_os@shipmail.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 25 Mar 2020 21:36:47 -0700
Message-ID: <CAPcyv4hUGPCWrR=Mj4-dR3vOq5peSXvBWL2F4c0ktsAT+YygEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] fs: Constify vma argument to vma_is_dax
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgNDoyNyBBTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBUaG9tYXMgSGVsbHN0
cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4KPiBUaGUgdm1hIGFyZ3VtZW50IGlzIG9ubHkg
ZGVyZWZlcmVuY2VkIGZvciByZWFkaW5nLgo+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+
IENjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENj
OiAiS2lyaWxsIEEuIFNodXRlbW92IiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbT4K
PiBDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IENjOiAiSsOpcsO0
bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxs
aWFtc0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxz
dHJvbUB2bXdhcmUuY29tPgo+IFJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xh
bmRAdm13YXJlLmNvbT4KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2ZzLmggfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZnMuaCBiL2luY2x1ZGUvbGludXgvZnMuaAo+IGluZGV4IDk4ZTAzNDlh
ZGI1Mi4uNGY0MWZkYmY0MDJmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZnMuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvZnMuaAo+IEBAIC0zMzY3LDcgKzMzNjcsNyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgaW9faXNfZGlyZWN0KHN0cnVjdCBmaWxlICpmaWxwKQo+ICAgICAgICAgcmV0dXJu
IChmaWxwLT5mX2ZsYWdzICYgT19ESVJFQ1QpIHx8IElTX0RBWChmaWxwLT5mX21hcHBpbmctPmhv
c3QpOwo+ICB9Cj4KPiAtc3RhdGljIGlubGluZSBib29sIHZtYV9pc19kYXgoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFfaXNfZGF4KGNvbnN0IHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gICAgICAgICByZXR1cm4gdm1hLT52bV9m
aWxlICYmIElTX0RBWCh2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZy0+aG9zdCk7Cj4gIH0KCkxvb2tz
IGdvb2QgdG8gbWU6CgpBY2tlZC1ieTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRl
bC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
