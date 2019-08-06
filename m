Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5682F8E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEC76E354;
	Tue,  6 Aug 2019 10:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7F889F27
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 10:14:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so81793899ljg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 03:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WA1PZ71O/SjMHVw3c0YHfht5EP1T46U6jPbJu0k6rO8=;
 b=egLzpIUzjcj/V7Kxv/Wy79QzuFYEGhqosu2RMwj0/danXCOvp7gVUnYz67+rl9SBcN
 FNGtZ4CDpleLu1gBkt02DC8M9fTV70FW/LlRISuVJaMGcoTr0q6QQ8vp0WGA3dsbiHJ1
 LMDBziz7g2k/2mzIDqj8CHaMkoAjQ0zQBnDUKdMDfeO/QYi0NkWibPwko8cRPq2HVZmE
 SHPaqoz0cT+XNtpQU6vT3TxADWWOfBM9sLVQXa+PxLIIGHrpNpabPk9uyvqAkodoCmyt
 MiJInmWCx+65GLBimvHSfLbiiZfubd/xePE0cm5D3F9tKVHaIa72DJRSqmW4V8WmRnAm
 kncQ==
X-Gm-Message-State: APjAAAWu1h2waNlcvxBSGfTZ01gU0mCV+hoobmuAru6qJhkCWVIJBy32
 7L9LYAqELS4+x8Yw7kbuVUANycSIqRhyA7w6kL8Zkw==
X-Google-Smtp-Source: APXvYqwI6qc1hM1VrxKIO/gC1mYXSMZJYiA9imlb5Oz4BJ9IAIzq8Nuu/rK1Yxu8Xd1ZpyeRlsGeCAroffaNMeoH+6I=
X-Received: by 2002:a2e:968e:: with SMTP id q14mr1244489lji.195.1565086460402; 
 Tue, 06 Aug 2019 03:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
 <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
 <CACvgo50z6bGu4=jqEHCSUOd_geadEwuOcOquLiVRsCdRroG2fg@mail.gmail.com>
 <CAKMK7uFpuLhR6eL+C15-kPYiEO1upU0+z9nz2BOhriKtSnqX5Q@mail.gmail.com>
In-Reply-To: <CAKMK7uFpuLhR6eL+C15-kPYiEO1upU0+z9nz2BOhriKtSnqX5Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 6 Aug 2019 11:12:34 +0100
Message-ID: <CAPj87rMj+Y6vW9VubUnHm1QUmh5JJ-+VwQRd5SULwH0rg6ZYSw@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WA1PZ71O/SjMHVw3c0YHfht5EP1T46U6jPbJu0k6rO8=;
 b=uyqhKI3m//hXkutjqkasSH7iHlvzIsNMzZVMT0WgEud7MnplxmMPT2RDm63BWLcXDC
 CiIYQj8WOEIiqPn8hO+lgRVZ+XyvgLHf3yyAsYWcyS1fNnP96ARta8yaa4iv1pg2XHbX
 v60v5MflmOjxp7R4YOSw/RBGGYMagAGaqxsq1EGFfD9xqWS9pwClXx7y7tpH3UUpFFVj
 +6co+4n+U9fpjsfzOg1SMInI+UXsToS6zH5TIINN9UXO2FcCX81z2QSlhYNtIi0J/VBR
 fq9sg4EqUlJ2xdOdOBhW0TRVAzR2Lgl5AhvpC9K2gAq51qfmjkwQnG1quuA0COhTjJt3
 98pA==
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
Cc: Maxime Ripard <mripard@kernel.org>, "DRM maintainer tools announcements,
 discussion, and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDYgQXVnIDIwMTkgYXQgMTA6NTgsIERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgMTE6NTUgQU0g
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVHVl
LCA2IEF1ZyAyMDE5IGF0IDEwOjQ5LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPiB3cm90ZToKPiA+ID4gVGhlIHRoaW5nIGlzLCBkaW0gcHVzaCBzaG91bGRuJ3QgYWxsb3cg
eW91IHRvIGRvIHRoYXQuIEFuZCB0aGUgcGF0Y2hlcwo+ID4gPiBoYXZlIGNsZWFybHkgYmVlbiBh
cHBsaWVkIHdpdGggZGltIGFwcGx5IChvciBhdCBsZWFzdCB5b3UgYWRkZWQgdGhlCj4gPiA+IExp
bmspLCB1bmxpa2UgUm9iIHdobyBzZWVtcyB0byBqdXN0IGhhdmUgcHVzaGVkIHRoZSByZXZlcnQu
Cj4gPiA+Cj4gPiBUaGFua3MsIGRpZCBub3Qga25vdyBhYm91dCBkaW0gcHVzaC4gV2lsbCBtYWtl
IHN1cmUgSSB1c2UgaXQuCj4KPiBTbyB0aGUgaW50cm8gZG9jIGlzbid0IGdvb2QgZW5vdWdoLCBh
bmQgd2UgbmVlZCB0byBlbmZvcmNlIGl0LiBJIHRoaW5rCj4gRGFuaWVsJ3MgaWRlYSB3YXMgdG8g
aGF2ZSBhIHByZS1tZXJnZSBob29rIHdoaWNoIGNoZWNrcyBmb3IgYSBnaXQKPiB2YXJpYWJsZSB1
c2luZyAtLXB1c2gtb3B0aW9uLiBDYW4geW91IHBscyBsb29rIGludG8gdGhpcz8gSSBndWVzcyB3
ZSdkCj4gbmVlZCB0aGUgZGltIHBhdGNoLCBhbmQgZXhhbXBsZSBwcmVtZXJnZSBob29rIHRvIGJl
IGluc3RhbGxlZAo+IHNlcnZlci1zaWRlLiBTaG91bGQgaGF2ZSBhIG5pY2UgZXJyb3IgbWVzc2Fn
ZSB0b28gb2ZjLgoKWWVhaCwgdGhlIGRvY3MgYXJlIGFscmVhZHkgcXVpdGUgY2xlYXIgdGhhdCB5
b3UgY2Fubm90IHB1c2ggdG8gdGhlIERSTQp0cmVlcyB3aXRoIG5vcm1hbCBnaXQsIGFuZCB0aGF0
IHlvdSBoYXZlIHRvIHVzZSBkaW0uIE5vdCBvbmx5IGRvZXMgaXQKY2hlY2sgYW5kIGVuZm9yY2Ug
YWxsIHRoZSBydWxlcyBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgYnV0IGl0IGFsc28KcmVidWlsZHMg
ZHJtLXRpcCBhbmQga2VlcHMgb3RoZXIgdHJlZXMgaW4gc3luYywgd2hpY2ggaXNuJ3QgZG9uZSB3
aXRoCmEgcmVndWxhciBnaXQgcHVzaC4KClRoZSBpZGVhIEkgaGFkIGEgZmV3IHdlZWtzIGFnbyB3
YXMgdG8gaGF2ZSBkaW0gdXNlICdnaXQgcHVzaAotLXB1c2gtb3B0aW9uIGZkby5wdXNoZWRXaXRo
RGltPXRoaXMtd2FzLXB1c2hlZC13aXRoLWRpbS1hbmQtbm90LW1hbnVhbGx5JywKdGhlbiBoYXZl
IHRoZSBob29rcyBvbiB0aGUgc2VydmVyIHNpZGUgY2hlY2sgZm9yIHRoYXQgb3B0aW9uIGFuZApy
ZWZ1c2UgYW55IGRpcmVjdCBwdXNoZXMuIChPciBhdCBsZWFzdCwgaWYgcGVvcGxlIGFyZSBwdXNo
aW5nCmRpcmVjdGx5LCB0aGV5IGhhdmUgdG8gX3JlYWxseV8gdHJ5IHRvIGJlIGRvaW5nIGl0LCBh
bmQgY2FuJ3QgZG8gaXQgYnkKYWNjaWRlbnQuKQoKSWYgc29tZW9uZSB0eXBlcyB1cCB0aGUgZGlt
IHBhdGNoIHRvIGRvIHRoYXQgYW5kIGdldHMgaXQgY29tbWl0dGVkLAphZnRlciBhIGNvdXBsZSBv
ZiBkYXlzJyBncmFjZSBwZXJpb2QgZm9yIGV2ZXJ5b25lIHRvIHVwZGF0ZSBJIGNhbiByb2xsCm91
dCB0aGUgc2VydmVyLXNpZGUgaG9va3Mgd2hpY2ggcmVmdXNlIG5vbi1kaW0gcHVzaGVzLgoKQ2hl
ZXJzLApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
