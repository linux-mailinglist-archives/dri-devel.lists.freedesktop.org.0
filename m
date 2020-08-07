Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102823F0C3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 18:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD526EA0A;
	Fri,  7 Aug 2020 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B706EA0A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:13:15 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A90F922CF8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596816795;
 bh=AfuvdFn3dMHqvQQoxBneF6L/AD9mtL8sc5x4o3BprDc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DWJHBwYgk1neCdP4+TIFmGkZr41TsTc+6PXJ0l//hCW+xbq81LlM6pUlR0lRzpXMt
 UhuUAaSdNZZLoIRS0tB9mm6eK9q6/zjyfEV2wjKYq/1bH94H5UCrnEVXYYHzyO/LFZ
 YErF7gjHvlpWAP0ERaub9pCEqKgXxjldbBjY/EVA=
Received: by mail-oi1-f172.google.com with SMTP id l204so2396778oib.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:13:15 -0700 (PDT)
X-Gm-Message-State: AOAM532dGzt4Y5E2MkV0t696rSGCJaXgVtd+PVGN0mrboth7lA8RpqEb
 MfLhN8iVfCLLJHK0kAUCCvJ6Hp2wJma7iBbtHw==
X-Google-Smtp-Source: ABdhPJwvEIz202H+y8lt7/5urap/1s4x9MmUoqD47TMfOnZglCtDSfQblglc2OIFHIEzaeCAJcyGROSzQTGRmOwgWjE=
X-Received: by 2002:aca:c3d8:: with SMTP id
 t207mr12260276oif.152.1596816794972; 
 Fri, 07 Aug 2020 09:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200710095409.407087-1-peron.clem@gmail.com>
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Aug 2020 10:13:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
Message-ID: <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMzo1NCBBTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhpcyBzZXJpZSBjbGVhbnMgYW5kIGFk
ZHMgcmVndWxhdG9yIHN1cHBvcnQgdG8gUGFuZnJvc3QgZGV2ZnJlcS4KPiBUaGlzIGlzIG1vc3Rs
eSBiYXNlZCBvbiBjb21tZW50IGZvciB0aGUgZnJlc2hseSBpbnRyb2R1Y2VkIGxpbWEKPiBkZXZm
cmVxLgo+Cj4gV2UgbmVlZCB0byBhZGQgcmVndWxhdG9yIHN1cHBvcnQgYmVjYXVzZSBvbiBBbGx3
aW5uZXIgdGhlIEdQVSBPUFAKPiB0YWJsZSBkZWZpbmVzIGJvdGggZnJlcXVlbmNpZXMgYW5kIHZv
bHRhZ2VzLgo+Cj4gRmlyc3QgcGF0Y2hlcyBbMDEtMDddIHNob3VsZCBub3QgY2hhbmdlIHRoZSBh
Y3R1YWwgYmVoYXZpb3IKPiBhbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBhbmZyb3N0X2RldmZyZXEg
c3RydWN0Lgo+Cj4gUmVnYXJkcywKPiBDbMOpbWVudAo+Cj4gQ2hhbmdlcyBzaW5jZSB2NDoKPiAg
LSBGaXggbWlzc2VkIGEgcGZkZXYgdG8gJnBmZGV2LT5kZXZmcmVxIGR1cmluZyByZWJhc2UKPgo+
IENoYW5nZXMgc2luY2UgdjM6Cj4gIC0gQ29sbGVjdCBTdGV2ZW4gUHJpY2UgcmV2aWV3ZWQtYnkg
dGFncwo+ICAtIFJlYmFzZSBvbiBuZXh0L21hc3RlciAobmV4dC0yMDIwMDcwOSkKPgo+IENoYW5n
ZXMgc2luY2UgdjI6Cj4gIC0gQ29sbGVjdCBBbHlzc2EgUm9zZW56d2VpZyByZXZpZXdlZC1ieSB0
YWdzCj4gIC0gRml4IG9wcF9zZXRfcmVndWxhdG9yIGJlZm9yZSBhZGRpbmcgb3BwX3RhYmxlIChp
bnRyb2R1Y2UgaW4gdjIpCj4gIC0gQ2FsbCBlcnJfZmluaSBpbiBjYXNlIG9wcF9hZGRfdGFibGUg
ZmFpbGVkCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIENvbGxlY3QgU3RldmVuIFByaWNlIHJl
dmlld2VkLWJ5IHRhZ3MKPiAgLSBGaXggc3BpbmxvY2sgY29tbWVudAo+ICAtIERyb3AgT1BQIGNs
b2NrLW5hbWUgcGF0Y2gKPiAgLSBEcm9wIGRldmljZV9wcm9wZXJ0eV90ZXN0IHBhdGNoCj4gIC0g
QWRkIHJlbmFtZSBlcnJvciBsYWJlbHMgcGF0Y2gKPgo+IENsw6ltZW50IFDDqXJvbiAoMTQpOgo+
ICAgZHJtL3BhbmZyb3N0OiBhdm9pZCBzdGF0aWMgZGVjbGFyYXRpb24KPiAgIGRybS9wYW5mcm9z
dDogY2xlYW4gaGVhZGVycyBpbiBkZXZmcmVxCj4gICBkcm0vcGFuZnJvc3Q6IGRvbid0IHVzZSBw
ZmRldmZyZXEuYnVzeV9jb3VudCB0byBrbm93IGlmIGh3IGlzIGlkbGUKPiAgIGRybS9wYW5mcm9z
dDogaW50cm9kdWNlIHBhbmZyb3N0X2RldmZyZXEgc3RydWN0Cj4gICBkcm0vcGFuZnJvc3Q6IHVz
ZSBzcGlubG9jayBpbnN0ZWFkIG9mIGF0b21pYwo+ICAgZHJtL3BhbmZyb3N0OiBwcm9wZXJseSBo
YW5kbGUgZXJyb3IgaW4gcHJvYmUKPiAgIGRybS9wYW5mcm9zdDogcmVuYW1lIGVycm9yIGxhYmVs
cyBpbiBkZXZpY2VfaW5pdAo+ICAgZHJtL3BhbmZyb3N0OiBtb3ZlIGRldmZyZXFfaW5pdCgpL2Zp
bmkoKSBpbiBkZXZpY2UKPiAgIGRybS9wYW5mcm9zdDogZHluYW1pY2FsbHkgYWxsb2MgcmVndWxh
dG9ycwo+ICAgZHJtL3BhbmZyb3N0OiBhZGQgcmVndWxhdG9ycyB0byBkZXZmcmVxCj4gICBhcm02
NDogZGVmY29uZmlnOiBFbmFibGUgZGV2ZnJlcSBjb29saW5nIGRldmljZQo+ICAgYXJtNjQ6IGR0
czogYWxsd2lubmVyOiBoNjogQWRkIGNvb2xpbmcgbWFwIGZvciBHUFUKPiAgIFtETyBOT1QgTUVS
R0VdIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogaDY6IEFkZCBHUFUgT1BQIHRhYmxlCj4gICBbRE8g
Tk9UIE1FUkdFXSBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGZvcmNlIEdQVSByZWd1bGF0b3IgdG8g
YmUgYWx3YXlzCgpQYXRjaGVzIDEtMTAgYXBwbGllZCB0byBkcm0tbWlzYy4KClJvYgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
