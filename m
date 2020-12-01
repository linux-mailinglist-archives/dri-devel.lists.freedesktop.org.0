Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758562CA977
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 18:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5BC6E87C;
	Tue,  1 Dec 2020 17:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BA36E86B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 17:22:51 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id x15so2402248otp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 09:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=okfDslTkg6NFPNKQsN5vZ0Hdc5IFszgg0osL1p9341k=;
 b=bc4cNLwCsDdBY6LBqvdFh5M7x3qQo+tIuMQuFe1DzAR7NjHY1J/w3mLmYT2zLJkJ6H
 1I0VDQYtj4+5TjJxUMWLLUVLhmhIXZt7La8LWZikJdf6OaaJCsgid4sNRyPxxNLqLEdy
 stmnJhK5fj97f/urcgWa/846M9KLKbH1cCwjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=okfDslTkg6NFPNKQsN5vZ0Hdc5IFszgg0osL1p9341k=;
 b=FIsN4izgrjmMsp8oWV6QOwds4uU1KvMP7PsZnmB1BjAuLXtwsW5m/FyjCuNygKbjKt
 cTzSUh+i1Br3vR/Y/8aGoRdN46cXzo/8qL8giITTNY81BsrteTqa6UoNUeqCHmw8iw6M
 hOG/XS2Deu/mF9thPChH+sDSggsWJFptBi+ZXqtcxZziPjkKvlqbgSw88w3eHY8XsAl+
 RqlzTpA4oZvrE3VoBUuJC8cbb63udUnYdJSYquCveO5iXRsPrMRE8PWrhmUjQ1drpSdx
 UBjM3jF4cyXY613+IN/O3w+tA8SzFepsGWh0qBmwcD1aZ555qQ+mDszoGwfbBFuGvSCR
 5PEg==
X-Gm-Message-State: AOAM530SeZguUgU+pSRRS47XlzmbsMHL94pJ+C4OnUZX6KUbaP9ySroY
 4l7cssDg8q/1P9/LIQsJBrnndSnO1xzIY1NkX31ZVA==
X-Google-Smtp-Source: ABdhPJwoIjVlE72vtwzpmgLh4fJoxWWRou6+0XCEjP5Jbvi6g1DOHlJYg9Iy0ZJ7tzZjCUWBrVKAtiN2VKEXZi44a/w=
X-Received: by 2002:a05:6830:12d5:: with SMTP id
 a21mr525944otq.281.1606843370634; 
 Tue, 01 Dec 2020 09:22:50 -0800 (PST)
MIME-Version: 1.0
References: <3a1d46a8-cefe-cebb-2ab9-7bee1dea1d82@amd.com>
In-Reply-To: <3a1d46a8-cefe-cebb-2ab9-7bee1dea1d82@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Dec 2020 18:22:39 +0100
Message-ID: <CAKMK7uHZmsMmJGu_wj7L=XjJcay_VLW8V=0mPiN_FcbRQB5LgQ@mail.gmail.com>
Subject: Re: Dim blowing up in my face
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMSwgMjAyMCBhdCA1OjU4IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwsCj4KPiBJJ3ZlIGp1c3QgcHVz
aGVkIGEgbWlub3IgVFRNIGNsZWFudXAgYW5kIGRpbSBpcyBjb21wbGFpbmluZyB0aGF0Cj4gZHJt
LWludGVsL2RybS1pbnRlbC1ndC1uZXh0IG1lcmdlIGludG8gZHJtLXRpcCBmYWlsZWQuCj4KPiBJ
bnZlc3RpZ2F0aW5nIHRoYXQgbG9va3MgbGlrZSBzb21ldGhpbmcgY29tcGxldGVseSB1bnJlbGF0
ZWQgYW5kIEkgZG9uJ3QKPiBrbm93IHRoZSBJbnRlbCBjb2RlIHdlbGwgZW5vdWdoIHRvIGZpeCBp
dCBteXNlbGYuCj4KPiBIb3cgdG8gd2UgcHJvY2VlZD8KClByb2JhYmx5IGp1c3Qgc29tZW9uZSBj
b25jdXJyZW50bHkgcHVzaGluZyBhbmQgaGFzbid0IHJlc29sdmVkIHRoZWlyCmNvbmZsaWN0cyB5
ZXQuIEJlc3QgaXMgdG8gYXNrIG9uICNpbnRlbC1nZnggd2hvIGRpZCBpdCB0byBtYWtlIHN1cmUg
aXQKZ2V0cyBmaXhlZC4KLURhbmllbAoKPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
