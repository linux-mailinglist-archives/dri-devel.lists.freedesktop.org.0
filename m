Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09705A6CCF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEEC892BE;
	Tue,  3 Sep 2019 15:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8B4892BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 15:22:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id u6so13031992edq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 08:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZ5CZDcXrND2jbljHxs/cV3y+JvNidev8udWa1RS1ik=;
 b=ON5AsaEU8HVu/n4eOV/3RwyunSUQX79IdnS8gGBFcFN7kgGEl2fTMM7wcIAh9AuwdF
 FJHysjqok/ELP4k24u/1p7fF08VELLIS6W271GmmAzDO5eN2jNslnPd0Bsrvzi2bZl5L
 OT3pNoK/UrnzQ6CL3iHGa+p+g5CmbSk7w2V25hNH1qAHmtFeKMW/fgDQuaAAl6YJtWmJ
 sfjRgTvL3lMwhd4lBVTPdgyG+cfauR6Y0ieUQ1hxNN9dArd5XgpXr43SD5V4hGRovxNT
 Wj28jfJUUhxqMWeQOe2e7Ku1dWWe9aWRd0Ghz6WyTl1MB20sq7Sd1T9ixa6psuPnxn2X
 dsvg==
X-Gm-Message-State: APjAAAX04AWtDjMR1myKnrmzruarGwU4ngNv2/Ne0MdOSjne5iIt7q2z
 C0K6Iqb0kh4vespo5HHXThA1S2QJ3GCycm2PWuI=
X-Google-Smtp-Source: APXvYqyAL2RetRKUcbfaeIu3uF4RGOA7/ELf5DOykkMIUXjs73OxXiiNZudtqTLDaoJItO/7qr2J7USqAOLgxBYhNKs=
X-Received: by 2002:a17:906:b845:: with SMTP id
 ga5mr5685048ejb.278.1567524135481; 
 Tue, 03 Sep 2019 08:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
In-Reply-To: <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Sep 2019 08:22:03 -0700
Message-ID: <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NZ5CZDcXrND2jbljHxs/cV3y+JvNidev8udWa1RS1ik=;
 b=EPB0CWkz3A6BTebHcErQO8gFtXiTlVzgiIVm6gURSO2u+inrjpteDYG5vh8W20on2K
 u+lr2NqHosRYMWHmj6njCt1/pLQ63M+ADt4jYC8l9IcyAsUwpcxYBgdBZsugVwkyFAa/
 1t3eDUrcLqsqqAfDiqqmSIV9UT2rpYwE7Ania5d75ZAPoswEYZqkLR1XQb0xlNciqQej
 gJJP4EwXsSgyvCKltB4Is6Dcm4qmwk2hsdqMkxIQ8zdKyjURg9HxK14tSgL0gZi77oF1
 pjIQ/aCM6nRDOpUy1fNeE0nJnKLpm4a/3CVpcSibI+cRn/HFDTXcXvV+st1TB5oknMqA
 wvxQ==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Chris Healy <cphealy@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMTowMyBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iaW4sCj4KPiBPbiBNb24sIFNlcCAyLCAyMDE5IGF0
IDExOjQ1IEFNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+Cj4g
PiBUcnkgMDAzNmJjNzNjY2JlIC0gdGhhdCBsb29rcyBsaWtlIHNvbWV0aGluZyB0aGF0IENPTkZJ
R19ETUFfQVBJX0RFQlVHCj4gPiBzaG91bGQgaGF2ZSBiZWVuIHNjcmVhbWluZyBhYm91dCBhbnl3
YXkuCj4KPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4KPgo+IEkgY2FuIHN1Y2Nlc3NmdWxs
eSBib290IGFmdGVyIHJldmVydGluZyB0aGUgZm9sbG93aW5nIGNvbW1pdHM6Cj4KPiBjb21taXQg
MTQxZGI1NzAzYzg4N2Y0Njk1NzYxNWNkNjYxNmNhMjhmZTQ2OTFlMCAoSEVBRCkKPiBBdXRob3I6
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBEYXRlOiAgIE1vbiBTZXAgMiAx
NDo1ODoxOCAyMDE5IC0wMzAwCj4KPiAgICAgUmV2ZXJ0ICJkcm0vbXNtOiBzdG9wIGFidXNpbmcg
ZG1hX21hcC91bm1hcCBmb3IgY2FjaGUiCj4KPiAgICAgVGhpcyByZXZlcnRzIGNvbW1pdCAwMDM2
YmM3M2NjYmU3ZTYwMGEzNDY4YmY4ZTg4NzliMTIyMjUyMjc0Lgo+Cj4gY29tbWl0IGZhNWIxZjYy
MGYyOTg0YzI1NDg3N2Q2MDQ5MjE0YzM5YzI0YzgyMDcKPiBBdXRob3I6IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4KPiBEYXRlOiAgIE1vbiBTZXAgMiAxNDo1NjowMSAyMDE5IC0w
MzAwCj4KPiAgICAgUmV2ZXJ0ICJkcm0vbXNtOiBVc2UgdGhlIGNvcnJlY3QgZG1hX3N5bmMgY2Fs
bHMgaW4gbXNtX2dlbSIKPgo+ICAgICBUaGlzIHJldmVydHMgY29tbWl0IDNkZTQzM2M1YjM4YWY0
OWE1ZmM3NjAyNzIxZTJhYjVkMzlmMWU2OWMuCj4KPiBSb2IsCj4KPiBXaGF0IHdvdWxkIGJlIHRo
ZSByZWNvbW1lbmRlZCBhcHByb2FjaCBmb3IgZml4aW5nIHRoaXM/Cj4KCldlIG5lZWQgYSBkaXJl
Y3Qgd2F5IHRvIGhhbmRsZSBjYWNoZSwgc28gd2UgY2FuIHN0b3AgdHJ5aW5nIHRvIHRyaWNrCkRN
QSBBUEkgaW50byBkb2luZyB3aGF0IHdlIHdhbnQuCgpTb21ldGhpbmcgbGlrZSB0aGlzIGlzIHdo
YXQgSSBoYWQgaW4gbWluZDoKCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvNjUyMTEvCgpJIGd1ZXNzIEkgY291bGQgcmVzcGluIHRoYXQuICBJJ20gbm90IHJlYWxseSBz
dXJlIG9mIGFueSBvdGhlciB3YXkgdG8KaGF2ZSB0aGluZ3Mgd29ya2luZyBvbiB0aGUgZGlmZmVy
ZW50IGNvbWJpbmF0aW9ucyBvZiBhcmNocyBhbmQgZG1hX29wcwp0aGF0IHdlIGhhdmUuICBMYXRl
bHkgZml4aW5nIG9uZSBoYXMgYmVlbiBicmVha2luZyBhbm90aGVyLgoKQlIsCi1SCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
