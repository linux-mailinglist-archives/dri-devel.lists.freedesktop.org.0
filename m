Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC57A162
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 08:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295616E404;
	Tue, 30 Jul 2019 06:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3706E404
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:40:59 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id c4so25018404uad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 23:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xlIrk9aoAuBCVVoQb+SeumlsnMNMFJy4TnbyOV4bOLk=;
 b=tyD7kmD7XV9c+kFlbxenUq4JhmUvXCHX7QN7daCicDeDi9kJY8BFyV1DSrOK3PzIbx
 O6TqzUvjs94CDEhsi7faM0jAKqMJCDgp4P+Ds1R+ibyhx8Tjk+QDiqdcql8HN4C+t+Yt
 Q00iGs2SAtLrR1ErTZI/eBC2lJNP1hX+DcmAJC3+d+7fGyCtaMUqnJqfZKdwiU0gjCjd
 WRZUxQ+zIsADJs77NsQEVjJyfv+XE7iFWNYIgCNItOvb7h4GjlAXhrGu2/6weOYQuJe3
 1drT5p7jy3PPcvVG4JnYm9OUsSwO1d1lD2aWNdzmfxL63FXG3cPvkBecZ9hQ1mdDnmNV
 03qw==
X-Gm-Message-State: APjAAAV13bSVBra5CzBfPhMGmdBCRiYx5R90f+TAAUTxUUD0nRE0Kj0b
 M2NyNRLqcvwDLpy7r6SxYY/wZxAyzl7Y77CrceQ=
X-Google-Smtp-Source: APXvYqwALbreK3dFHUV+MlHIhSu+pj/pvpNVxqOTSyy0kl3dG/SsSOMvhDIf1FSqkrAPivtJXkD7GvqUCf9lgWtyz2w=
X-Received: by 2002:ab0:20d8:: with SMTP id z24mr39477701ual.1.1564468858671; 
 Mon, 29 Jul 2019 23:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190729195526.13337-1-noralf@tronnes.org>
In-Reply-To: <20190729195526.13337-1-noralf@tronnes.org>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Date: Tue, 30 Jul 2019 08:40:22 +0200
Message-ID: <CAMqqaJF8wsekJgriFBxoj5t7FoKTYpqOm_9-NTmf-p5cq3P35Q@mail.gmail.com>
Subject: Re: [RFC 0/4] drm/mipi-dbi: Support panel drivers
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lusticky.cz; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xlIrk9aoAuBCVVoQb+SeumlsnMNMFJy4TnbyOV4bOLk=;
 b=LJzuM9wvGUn5g5/6tcCgIXd/sTAC66iMlHLPLuEKSB3wyjnvV8FC1XdzZQ6Yw33SWW
 ghKKZdCa791pPxlZUbBi5yUlZE5AhBLy3J6suWSfdFWzMUwrD6Nuoer5nKJGhdOCnSBB
 CpvD1tLNCi8Ko9955E98sDDpHHmjW55HlxVV8Jzin7nZE/GI7PoM15w65nqhLLAZoaQc
 7QzRu5xJQCLHj39V8++O5JGJPtnM0Sb1XFx/FcRor2m8g5wYMgaAvtBi92dg+rmXQ6dg
 g6HUn297gDFDDSa8xrsGjzvlIrYIz11hRFP3PZPn1F7wvx4kHG5OCYknogL2u3ltpQNe
 I8CQ==
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
Cc: daniel.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLAp0aGUgcGF0Y2ggc2VyaWVzIGxvb2tzIGdvb2QsIHNlZSBjb21tZW50cyBpbiB0
aGUgcGF0Y2ggZW1haWxzLgoKT25lIHF1ZXN0aW9uOiBpcyB0aGVyZSBhIGdlbmVyYWwgbWVjaGFu
aXNtIHRvIHRlbGwgYSBkcml2ZXIgbm90IHRvIHVzZQpwYXJhbGxlbCBSR0IgZXZlbiB0aG91Z2gK
dGhlIGRpc3BsYXkgc3VwcG9ydHMgaXQgYW5kICJwb3J0IiBpcyBzcGVjaWZpZWQgaW4gdGhlIGRl
dmljZS10cmVlPwoKSm9zZWYKCnBvIDI5LiA3LiAyMDE5IHYgMjE6NTUgb2Rlc8OtbGF0ZWwgTm9y
YWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IG5hcHNhbDoKPgo+IEluc3BpcmVkIGJ5
IHRoZSB0aHJlYWRbMV0gZm9sbG93aW5nIHRoZSBzdWJtaXNzaW9uIG9mIGEgbmV3IGlsaTkzNDEK
PiBwYW5lbCBkcml2ZXJbMl0sIEkgc2V0IG91dCB0byBzZWUgaWYgSSBjb3VsZCBzdXBwb3J0IHBh
bmVsIGRyaXZlcnMgaW4KPiBkcm1fbWlwaV9kYmkuCj4KPiBJIGhhdmUgaW5jbHVkZWQgdGhlIG9y
aWdpbmFsIGRyaXZlciwgZG9uZSBzb21lIHByZXAgd29yayBvbiBpdCwgYWRkZWQKPiBwYW5lbCBz
dXBwb3J0IHRvIGRybV9taXBpX2RiaSBhbmQgY29udmVydGVkIG1pMDI4M3F0IHRvIHRoaXMgbmV3
IHBhbmVsCj4gZHJpdmVyLgo+Cj4gVGhlIGJpZyBxdWVzdGlvbiBpcyB3aGV0aGVyIG9yIG5vdCBw
YW5lbCBkcml2ZXJzIHNob3VsZCBiZSBhbGxvd2VkIHRvCj4gdHVybiB0aGVtc2VsdmVzIGludG8g
ZnVsbCBmbGVkZ2VkIERSTSBkcml2ZXJzLgo+Cj4gTm9yYWxmLgo+Cj4gWzFdCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVseS8yMjgxOTMu
aHRtbAo+IFsyXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzE2NTI4
Lwo+Cj4gSm9zZWYgTHVzdGlja3kgKDEpOgo+ICAgZHJtL3BhbmVsOiBBZGQgSWxpdGVrIElMSTkz
NDEgcGFyYWxsZWwgUkdCIHBhbmVsIGRyaXZlcgo+Cj4gTm9yYWxmIFRyw7hubmVzICgzKToKPiAg
IGRybS9wYW5lbC9pbGk5MzQxOiBSZWJhc2UgYW5kIHNvbWUgbW9yZQo+ICAgZHJtL21pcGktZGJp
OiBTdXBwb3J0IGNvbW1hbmQgbW9kZSBwYW5lbCBkcml2ZXJzCj4gICBkcm0vcGFuZWwvaWxpOTM0
MTogU3VwcG9ydCBtaTAyODNxdAo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA2ICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jICAg
ICAgICAgICAgICAgfCAxMTAgKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcg
ICAgICAgICAgICAgICAgfCAgIDkgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0
ZWstaWxpOTM0MS5jIHwgNDUyICsrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJt
X21pcGlfZGJpLmggICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ICA2IGZpbGVzIGNoYW5nZWQs
IDU4NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYwo+Cj4gLS0KPiAyLjIwLjEKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
