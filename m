Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13169C56
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598389B57;
	Mon, 15 Jul 2019 20:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245889B48
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:07:40 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 16so17537972ljv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eixaqw4rkktSrGNopKKbb/e4i5OCHkekMi3cawhMjd0=;
 b=iutGM+0HvC+yMrWLitH7rBMrnyPnO7iOEFfzFF6AWuAxr5x7F23d2h7vLQA/jOy9fy
 kBRhu1qiO6qcCfYVcT3Ye7vt42UVBquyueGf3jNC8LYwS1nvpX6k1szjdOwyJsM63BOC
 6nboWBIw+s28H1+bZwFWgQpMAhSugYpK4g9fhfOo+Kzvc00HQo7MpxFssMUuo/JpDww9
 zVRTqNVwBGVRdqroHYPNDiD0ftbVOM8ihR4bZkS2mmaJUpdCMM3wHA64+Elk5Vm7Okcp
 w2hqrHncJVt5ZXyW4PYE4q3IWR421q4z5uQs9ExQcEc9iUR+InxW7+Z7kYPS7YZs7oQ5
 geIg==
X-Gm-Message-State: APjAAAV2azHXOv1IvDiEdUGzbHOy4o3kgRRijDkr80iaVkPQYsJYFEOA
 6zXpt0Tmp6cb28MPL7xAS5Z7tDmgOKM=
X-Google-Smtp-Source: APXvYqyS+o5/5/74Dhz1odaUJRjmxrs2Ilm62NIrlAbbi5MD7j7QutAGJ56lHYIBagUpyesE9C9lOw==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr14789785lji.188.1563221257479; 
 Mon, 15 Jul 2019 13:07:37 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id v4sm3301471lji.103.2019.07.15.13.07.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 13:07:36 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id k18so17547321ljc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:07:35 -0700 (PDT)
X-Received: by 2002:a2e:9b83:: with SMTP id z3mr14547098lji.84.1563221255694; 
 Mon, 15 Jul 2019 13:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
In-Reply-To: <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 13:07:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
Message-ID: <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eixaqw4rkktSrGNopKKbb/e4i5OCHkekMi3cawhMjd0=;
 b=P2iRueoZZZolheElzwSTwYwc4RL+cazdVv/CsaDqThr07wrKc70nMd66dNr+4RJgdC
 BvRP6r9qDsoTmR2kyUtGbeyA8kOaLPvgB2B6eZHY99jN0c+s0VmexvYTt39LILXFaAJR
 8isLgd729Gom3bcquhSVnuvvT3p838Xh7cOZk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTI6MzYgUE0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2Fy
ZSkKPHRob21hc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Cj4gLSBJJ3ZlIG5ldmVyIGhhZCBhbnkg
a2VybmVsIGNvZGUgbW9yZSByZXZpZXdlZCB0aGFuIHRoaXMuCgpIbW0uIEl0IG1heSBoYXZlIGJl
ZW4gcmV2aWV3ZWQsIGJ1dCB0aGF0IHdhc24ndCB2aXNpYmxlIGluIHRoZSBjb21taXRzCnRoZW1z
ZWx2ZXMsIHNvIHdoZW4gSSBsb29rIGF0IHRoZSBwdWxsIHJlcXVlc3QsIEkgZG9uJ3Qgc2VlIHRo
YXQuCgo+IC0gVGhlIGNvbWJpbmVkIGNhbGxiYWNrIC8gYXJndW1lbnQgc3RydWN0OiBJdCB3YXMg
c3Ryb25nbHkgaW5zcGlyZWQgYnkKPiB0aGUgc3RydWN0IG1tX3dhbGsgKG1tLmgpLCB0aGUgcGFn
ZSB3YWxrIGNvZGUgYmVpbmcgcXVpdGUgc2ltaWxhciBpbgo+IGZ1bmN0aW9uYWxpdHkuCgpUaGUg
bW1fd2FsayBzdHJ1Y3QgaXMgaW5kZWVkIGEgYml0IHNpbWlsYXIsIGFuZCBpcyBpbiBmYWN0IGEg
Yml0CnByb2JsZW1hdGljIGV4YWN0bHkgYmVjYXVzZSBpdCBtaXhlcyBmdW5jdGlvbiBwb2ludGVy
cyB3aXRoIG5vbi1jb25zdApkYXRhLgoKSSB3aXNoIGl0IGhhZCBiZWVuIGEgJ2NvbnN0IHN0cnVj
dCBtbV93YWxrICoiIHRoYXQgb25seSBwYXNzZWQgaW4gdGhlCnN0dWZmIHRoYXQgZGVzY3JpYmVz
IHdoYXQgdG8gZG8gb24gdGhlIHdhbGsgaXRzZWxmLiAgT3Igc2VwYXJhdGVkIGludG8KdHdvIGRp
ZmZlcmVudCBwb2ludGVycyAtIG9uZSBmb3IgdGhlICJ0aGlzIGlzIHdoYXQgdG8gZG8gZm9yIHRo
ZSB3YWxrIgphbmQgb25lIGZvciAidGhpcyBpcyB0aGUgd2Fsa2luZyBkYXRhIi4KCkluIGZhY3Qs
IEkgdGhpbmsgdGlnaHQgbm93IHRoYXQgaXMgYWN0dWFsbHkgX2FsbW9zdF8gdGhlIGNhc2UgYW5k
IHdlCmNvdWxkIG1ha2UgdGhlbSBjb25zdCwgZXhjZXB0IGZvciAid2Fsay0+dm1hIiB3aGljaCBp
cyB1cGRhdGVkCmR5bmFtaWNhbGx5IGFzIHdlIHdhbGsuICBPaCB3ZWxsLgoKQW5kIGZvciBhbGwg
SSBrbm93LCBzb21lIG9mIHRoZSB3YWxrZXJzIG1heSBiZSBtb2RpZnlpbmcgdGhlaXIKInByaXZh
dGUiIGZpZWxkIHRvbywgc2luY2UgdGhhdCdzIGxlZnQgdG8gdGhlIHdhbGtlcnMuCgpTbyB5ZXMs
IHRoYXQgb25lIGFsc28gaGFzIHNvbWUgcHJvYmxlbXMsIEkgYWdyZWUuCgogICAgICAgICAgICAg
ICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
