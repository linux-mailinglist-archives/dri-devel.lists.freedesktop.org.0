Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC640242AEF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4D089BCD;
	Wed, 12 Aug 2020 14:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B1989BB2;
 Wed, 12 Aug 2020 14:06:31 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p24so2373813ejf.13;
 Wed, 12 Aug 2020 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=d8f3pH5/ZCKSKStfszgIlZxnw3uyn/996p8sG8HyjxQ=;
 b=fAR/xXiaC+iP55fNn6oDuokITntCFEBi1xlzqIOiXdpufTT+WXrxe16rF8df2MiHZY
 er7UtqFH2MHRU7xYYD1IApTAK7fdlpfxic9pzjkwK5cY5cYUmVOs2zgzIvB8c+XvSiZR
 3L25GBDd93gJK37iUq3pqEhk5NLOUD9oT6bLhsIDtTdX/ne0Yg0xt9gS1NnFCxJxEQIB
 sskLpOZFE0XZFdBoFghrvl7obOn7ywiRYPOrKLFwLku3v746zDYlZPGdpOyW7kwQ8mQJ
 Wf8ihmeQWtY7mcxKWzJxDDH4F7cARHazoA3nwmdj5ULhEOfNu4ehVklCkuUeqEuOJ+vS
 FrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=d8f3pH5/ZCKSKStfszgIlZxnw3uyn/996p8sG8HyjxQ=;
 b=HvDHOsX0IEK9lI9FxinbPobQyMOQnXlh/ehVOz1kuAiaVe0AknoRuAhEFOr6J0i5cx
 cgpBxxIFJWL4RDoU7RkTucD/hxAomjGniF8P7VXHFrTt4qkUUw30zk2+3vmlqJohpOgI
 CJpee5x1Apjpts2lpVIuxbONaSSD7TrSXpj05SLGq1uv5EYrdLZVuI1Ias7GPO4juP5w
 XOTJL4xtSTx70ff2tVxDQwvUVhMMpQIwZd7PL7aZyAwHle5i8lYEeNoELcAHSKH+uUx1
 QttCVBkMv34AL0GMZnQXXD/Ts44is2Y0JfbUBmjpwne0LQyrLEG347lcmDZ7WRpA8rM6
 yQZA==
X-Gm-Message-State: AOAM530aYbCch0rXb28DQpxV1Lrb+GphR+ByjOcSf4Xg7gnXvXCHw+mM
 Nfnk4FO5xXsu2Vg0+Uc+3uE=
X-Google-Smtp-Source: ABdhPJznwOGp/qyo5pGS6jX40SdNtqxQhEKTMsJPS7+o051ebKYTfT0qr3V1BC6oqvTcaOqZcyqkbw==
X-Received: by 2002:a17:906:140e:: with SMTP id
 p14mr31966727ejc.430.1597241189936; 
 Wed, 12 Aug 2020 07:06:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id gl20sm1674979ejb.86.2020.08.12.07.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 07:06:28 -0700 (PDT)
Subject: Re: RFC: How to adjust the trace pid?
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>
References: <20200807133658.1866-1-christian.koenig@amd.com>
 <1975d7d1-8f94-5852-6ccc-19fde4d4a919@gmail.com>
 <CAKMK7uF7nTgJE38Krhnw9Ca4FtFpw4b=nFr8-tWqPxTkRrh=Pw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dca018cb-8455-874f-7473-fbfbd1d4c7a9@gmail.com>
Date: Wed, 12 Aug 2020 16:06:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF7nTgJE38Krhnw9Ca4FtFpw4b=nFr8-tWqPxTkRrh=Pw@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Shashank.Sharma@amd.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDguMjAgdW0gMTU6NDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXVn
IDEyLCAyMDIwIGF0IDM6NDIgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFBpbmc/IERhbmllbCwgRGF2ZSBhbnkgb3Bpbmlv
biBvbiB0aGlzPwo+IFR5cGUgcGF0Y2gsIGNjOiB0cmFjaW5nIHBlb3BsZSwgc2VlIHdoYXQgdGhl
eSBzYXk/CgpBZGRpbmcgSW5nbyBhbmQgU3RldmVuIHRoZW4uCgo+IHRiaCBJIGhhdmUgbm8gaWRl
YSwKPiBidXQgdGhleSBoYXZlIGJlZW4gbWFraW5nIHVuaGFwcHkgbm9pc2VzIGFib3V0IHNvbWUg
b2YgdGhlIHRyaWNrcwo+IHdlJ3ZlIHBsYXllZCBpbiB0aGUgcGFzdCBpbiBpOTE1IHRyYWNlcG9p
bnRzLiBTbyBub3QgZXZlcnl0aGluZyBpcwo+IGNvb2wgaW4gdGhlcmUuCgpXZWxsIHRoYXQgd2Fz
IHRoZSBmZWVkYmFjayBJIHdhcyBsb29raW5nIGZvci4KCj4gT3RoZXJ3aXNlIEkgZ3Vlc3MganVz
dCBhZGQgYW5vdGhlciB0cmFjZXBvaW50IHBhcmFtZXRlciB0byBkdW1wIHRoZQo+IGNvcnJlY3Qg
dXNlcnNwYWNlIG1tLgoKV2VsbCB0aGUgdHJhY2luZyBzdWJzeXN0ZW0gbG9va3MgbGlrZSByYXRo
ZXIgY29tcGxpY2F0ZWQgbWFjcm8gbWFnaWMsIHNvIApJJ20gbm90IHRvdWNoaW5nIHRoYXQgYmVm
b3JlIHNwZWFraW5nIHRvIGhlIG1haW50YWluZXIgd2hhdCBhcHByb2FjaCB3ZSAKc2hvdWxkIHRh
a2UuCgo+IDNyZCBvcHRpb24gY291bGQgYmUgdG8gZHVtcCB0aGUgY3VycmVudCBtbSAoc2luY2Ug
SSdtIGFzc3VtaW5nIHRob3NlCj4gdGhyZWFkcyBkbyBrdGhyZWFkX3VzZS91bnVzZV9tbSB0byBp
bXBlcnNvbmF0ZSB0aGUgcmlnaHQgdXNlcnNwYWNlCj4gcHJvY2VzcyBjb3JyZWN0bHkpIGluIHRo
ZSB0cmFjZXBvaW50IGluZnJhc3RydWN0dXJlIHRvbz8KCk5vcGUsIHdlIGRvbid0IHVzZSBrdGhy
ZWFkX3VzZS91bnVzZV9tbSBzaW5jZSB3ZSBkb24ndCB0b3VjaCB0aGUgcHJvY2VzcyAKd2hpY2gg
aW5pdGlhdGVkIHRoZSBvcGVyYXRpb24gaW4gYW55IHdheS4KClRoaXMgaXMganVzdCB0byBpbXBy
b3ZlIGRlYnVnZ2luZyBzaW5jZSBpdCBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byAKdHJhY2Ug
dGhlIHBpZCBvZiB0aGUgd29ya2VyIHRocmVhZC4gQW5kIHNpbmNlIHdlIGhhdmUgdGhlIHBpZCBv
ZiB0aGUgCmluaXRpYXRvciBhcm91bmQgYW55d2F5IHVzaW5nIGl0IHNob3VsZCBiZSB0cml2aWFs
LgoKUXVlc3Rpb24gaXMgcmF0aGVyIGhvdyB0byBkbyBpdCBjb3JyZWN0bHk/IEkgY291bGRuJ3Qg
ZmluZCBtdWNoIApwcmVjZWRlbmNlIGZvciB0aGlzLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4g
Q2hlZXJzLCBEYW5pZWwKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+IEFtIDA3LjA4LjIwIHVtIDE1OjM2
IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IEhpIGV2ZXJ5Ym9keSwKPj4+Cj4+PiBpbiBh
bWRncHUgd2UgZ290IHRoZSBmb2xsb3dpbmcgaXNzdWUgd2hpY2ggSSdtIHNlZWtpbmcgYWR2aXNl
IGhvdyB0byBjbGVhbmx5IGhhbmRsZSBpdC4KPj4+Cj4+PiBXZSBoYXZlIGEgYnVuY2ggb2YgdHJh
Y2UgcG9pbnRzIHdoaWNoIGFyZSByZWxhdGVkIHRvIHRoZSBWTSBzdWJzeXN0ZW0gYW5kIGV4ZWN1
dGVkIGluIGVpdGhlciBhIHdvcmsgaXRlbSwga3RocmVhZCBvciBmb3JlaWduIHByb2Nlc3MgY29u
dGV4dC4KPj4+Cj4+PiBOb3cgdHJhY2luZyB0aGUgcGlkIG9mIHRoZSBjb250ZXh0IHdoaWNoIHdl
IGFyZSBleGVjdXRpbmcgaW4gaXMgbm90IHJlYWxseSB0aGF0IHVzZWZ1bCwgc28gSSdtIHdvbmRl
cmluZyBpZiB3ZSBjb3VsZCBqdXN0IG92ZXJ3cml0ZSB0aGUgcGlkIHJlY29yZGVkIGluIHRoZSB0
cmFjZSBlbnRyeT8KPj4+Cj4+PiBUaGUgZm9sbG93aW5nIHBhdGNoIGRvZXMgZXhhY3RseSB0aGF0
IGZvciB0aGUgdm1fZ3JhYl9pZCgpIHRyYWNlIHBvaW50LCBidXQgSSdtIG5vdCAxMDAlIHN1cmUg
aWYgdGhhdCBpcyBsZWdhbCBvciBub3QuCj4+Pgo+Pj4gQW55IGlkZWFzPyBDb21tZW50cz8KPj4+
Cj4+PiBUaGFua3MsCj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
