Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2234AB7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300198953E;
	Tue,  4 Jun 2019 14:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F968953E;
 Tue,  4 Jun 2019 14:46:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so343727wme.4;
 Tue, 04 Jun 2019 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmFyUgMd+rlLQOf/AHTkPZqIQ2sydnRl9v/Tyb0J2Uo=;
 b=qhCdjaOMbz+WOrwktpPQZSzW0+KqvjhDwrKO8pPBHpug0u8GeFGS0o6fcDSllw/XJc
 40QwXnswpq762lYDxXlGt3wVK5gInsPfVYSnARjCaof7DVcXbBFbJZEUNA7Qojt1fWsf
 w7ZxMp4v4ZKMGBo1hQCpcB6XErAVhd04Rx8rJ55fEJftU4oae4wblGc6g1SmdNd4Oi1p
 WVL45bUQVKbttEElAIVO8QvbCrOrSzy9JUWUWtiXdwCrOGckj1YeQxshRnuby4tRrt6b
 w9kqPcBubSchYDvsWuv+PABjjg2+P3+vW5EoJwtK7ednLYM1/6k8aav3fR7w23VFNZcz
 mLhA==
X-Gm-Message-State: APjAAAUhmWTppeHZgh5mkFlMfqtvh3n1gXry5EhlVfSKycQtdFqSggm7
 pkAQdBIcyrV80jgfBJ3snWODH2XgCiwtnV/WbCFLog==
X-Google-Smtp-Source: APXvYqyWsNA871D5w0+HAqQUgxnPDxonQ18/0Oy0JVlOBnSXsFTvt+1PPT//oifqN7qf4osx4zrZphCQXNGgtz7IOoA=
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr3970256wml.141.1559659585294; 
 Tue, 04 Jun 2019 07:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190529220944.14464-1-alexander.deucher@amd.com>
 <CAKMK7uFFB7ME=d1U-SpCUEtVbysAuW2H--=4EeKKJYofeggLoA@mail.gmail.com>
In-Reply-To: <CAKMK7uFFB7ME=d1U-SpCUEtVbysAuW2H--=4EeKKJYofeggLoA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Jun 2019 10:46:13 -0400
Message-ID: <CADnq5_O42stLJBp71kknaoP=hPR828nbD5diC=HG-Wwag5--PA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.3
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lmFyUgMd+rlLQOf/AHTkPZqIQ2sydnRl9v/Tyb0J2Uo=;
 b=EB9aMJkYHL4V2YwmhBUdAS1zanTgSYPSbWAMApfo/J2dBARc+OiK9O2ULzgqYzbKsg
 XYX0e+InmyAUg1AY0c15BQ8M2N8E7MkRE6siF6dshJoo9r6vP9pmJwwT9Gl/YeeQYLIz
 E0tt9gqooIoPPaVfg7hGEKOpNAv1SUjWyjo3UUEviExpkMtgD7qqUNAnxdBPX/DTI6TR
 tury/pSzXX8+zegiUZXTWdmzxph8zdkd1adaUu24f+bFRTgFB1+UfvyhhLjwh+duCLaQ
 2CD1Suur7XplKD2eofZ5pTSeBHDkDgbQ8tyxC29L603qU1zIjyyzkgQcOOJJ0KQkNiOE
 u4IA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAxMTozNiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDMwLCAyMDE5IGF0IDEyOjA5IEFN
IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBE
YXZlLCBEYW5pZWwsCj4gPgo+ID4gTmV3IHN0dWZmIGZvciA1LjM6Cj4gPiAtIEFkZCBuZXcgdGhl
cm1hbCBzZW5zb3JzIGZvciB2ZWdhIGFzaWNzCj4gPiAtIFZhcmlvdXMgUkFTIGZpeGVzCj4gPiAt
IEFkZCBzeXNmcyBpbnRlcmZhY2UgZm9yIG1lbW9yeSBpbnRlcmZhY2UgdXRpbGl6YXRpb24KPiA+
IC0gVXNlIEhNTSByYXRoZXIgdGhhbiBtbXUgbm90aWZpZXIgZm9yIHVzZXIgcGFnZXMKPiA+IC0g
RXhwb3NlIHhnbWkgdG9wb2xvZ3kgdmlhIGtmZAo+ID4gLSBTUi1JT1YgZml4ZXMKPiA+IC0gRml4
ZXMgZm9yIG1hbnVhbCBkcml2ZXIgcmVsb2FkCj4gPiAtIEFkZCB1bmlxdWUgaWRlbnRpZmllciBm
b3IgdmVnYSBhc2ljcwo+ID4gLSBDbGVhbiB1cCB1c2VyIGZlbmNlIGhhbmRsaW5nIHdpdGggVVZE
L1ZDRS9WQ04gYmxvY2tzCj4gPiAtIENvbnZlcnQgREMgdG8gdXNlIGNvcmUgYnBjIGF0dHJpYnV0
ZSByYXRoZXIgdGhhbiBhIGN1c3RvbSBvbmUKPiA+IC0gQWRkIEdXUyBzdXBwb3J0IGZvciBLRkQK
PiA+IC0gVmVnYSBwb3dlcnBsYXkgaW1wcm92ZW1lbnRzCj4gPiAtIEFkZCBDUkMgc3VwcG9ydCBm
b3IgRENFIDEyCj4gPiAtIFNSLUlPViBzdXBwb3J0IGZvciBuZXcgc2VjdXJpdHkgcG9saWN5Cj4g
PiAtIFZhcmlvdXMgY2xlYW51cHMKPgo+ID4gQ2h1bm1pbmcgWmhvdSAoMSk6Cj4gPiAgICAgICBk
cm0vYW1kZ3B1OiBhZGQgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUgdG8gYW1kZ3B1Cj4KPiBUaGlz
IHVuY29uZGl0aW9uYWxseSBlbmFibGVzIHRpbWVsaW5lIHN5bmNvYmogc3VwcG9ydCwgV2hpY2gg
SSB0aG91Z2h0Cj4gd2UndmUgZGVjaWRlZCB0byBob2xkIGJhY2sgYmVoaW5kIHNvbWUgbW9kdWxl
X3BhcmFtX25hbWVkX3Vuc2FmZSBvcgo+IGV4cGVyaW1lbnRhbCBLY29uZmlnLCBhdCBsZWFzdCB1
bnRpbCBLSFIgcmF0aWZpZXMgdGhlIGV4dGVuc2lvbnMgYW5kCj4gZXZlcnlvbmUgY2FuIHB1Ymxp
c2ggdGhlIG1lc2EgcGF0Y2hlcy4gVGhpcyBpcyBraW5kYSB1YXBpIHdpdGhvdXQKPiB1c2Vyc3Bh
Y2UgYXMtaXMgLi4uIGFsc28gbm90IG9uIHlvdXIgc3VtbWFyeSwgb3IgSSdtIGJsaW5kLgoKU29y
cnksIGZvciBzb21lIHJlYXNvbiBJIGhhZCBpdCBpbiBteSBoZWFkIHRoYXQgd2Ugd2VyZSBnb2lu
ZyB0byBzdGFydAplbmFibGluZyB0aGlzIGlzIDUuMy4gIE1heWJlIEkgd2FzIG1peGluZyBpdCB1
cCB3aXRoIHNvbWV0aGluZyBlbHNlLgpJIG5lZWQgdG8gcmUtcmVhZCB0aGUgdGhyZWFkLiAgSSBj
YW4gc2VuZCBhbiB1cGRhdGVkIHB1bGwgd2l0aCBhCnJldmVydC4KCkFsZXgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
