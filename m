Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D369A63
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160A089AA7;
	Mon, 15 Jul 2019 18:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08A89AA7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:00:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id i21so17194368ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nO5O+YvT7yDDwaOrG6FBszo4i//OnQ067kGK33ZDVmM=;
 b=uZdrlzhDg9KmO5YfQUFe86XkgQNTxxwgPa1vcoQXcfhHAMxfAzgCBLG9UMJGh03Dlg
 8gPfTZON6kmsDu2FZEbH4tEli2rzevKpmm3lxRCgsPXtBnzsZ4iTZ2pljaPPqJFLOWJ3
 xr3rhr57Mc7Sfi33qR5uWAas3h7TvCq9mAQhT8vEkgjpwoIkoqHhhg6Rv3jyn/H5y1sb
 QW4StZ7SJ1F7ArHSDtipOiaSC9NolX/6Jj/eUrORfxdeXGztpOjNEZLtj2vc2il8hpWE
 4SVq65DUIbi5Ssvtwlp5+IpX/Fsr0k072i0JL5GTNX3X9WzDCAkmmdXUFMrqfNS+j6O9
 vwyg==
X-Gm-Message-State: APjAAAUzt9uiyUZf6h71xJRnfiAHDT1H2aSrHDAAb9qOqclJ1PSn9aTB
 mW2r8LSdBAUCAWxHZOcP+MmJLdq2YCA=
X-Google-Smtp-Source: APXvYqyBgqxfK0zVzRLNVHSjYQGMXXSzsJubft2g0dHh7cY/SBTO9wvivnk1eav8U/TLrGbOQWJ8YQ==
X-Received: by 2002:a2e:8396:: with SMTP id x22mr15173077ljg.135.1563213630013; 
 Mon, 15 Jul 2019 11:00:30 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id p13sm3281991ljc.39.2019.07.15.11.00.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:00:29 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id m23so17144184lje.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:00:28 -0700 (PDT)
X-Received: by 2002:a2e:9b83:: with SMTP id z3mr14263413lji.84.1563213628470; 
 Mon, 15 Jul 2019 11:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
In-Reply-To: <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 11:00:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
Message-ID: <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nO5O+YvT7yDDwaOrG6FBszo4i//OnQ067kGK33ZDVmM=;
 b=Ljprv0R0eic6HXzVS6gGqcdFzlGrHqGYh6k6OB97GCmdfmdhLVrBCs9Un6FdrcVa0i
 O9IjGbq520L8/BcFC8NSOMIeu5mjyLm2K8K95eccEhBRuXPdvPX2VnOOtry2mMJf084F
 T/TlaTAimYnlETp3HtOetlLmvrSLFF8LPoLEg=
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTA6MzcgQU0gTGludXMgVG9ydmFsZHMKPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IEknbSBub3QgcHVsbGluZyB0aGlzLiBX
aHkgZGlkIHlvdSBtZXJnZSBpdCBpbnRvIHlvdXIgdHJlZSwgd2hlbgo+IGFwcGFyZW50bHkgeW91
IHdlcmUgYXdhcmUgb2YgaG93IHF1ZXN0aW9uYWJsZSBpdCBpcyBqdWRnaW5nIGJ5IHRoZSBkcm0K
PiBwdWxsIHJlcXVlc3QuCgpMb29raW5nIGF0IHNvbWUgb2YgdGhlIGZhbGxvdXQsIEkgYWxzbyBz
ZWUgdGhhdCB5b3UgdGhlbiBhZGRlZCB0aGF0CiJhZGp1c3QgYXBwbHlfdG9fcGZuX3JhbmdlIGlu
dGVyZmFjZSBmb3IgZHJvcHBlZCB0b2tlbiIgcGF0Y2ggdGhhdApzZWVtcyB0byBiZSBmb3IgZWFz
aWVyIG1lcmdpbmcgb2YgdGhpcyBhbGwuCgpCdXQgeW91IHJlbW92ZSB0aGUgJ3Rva2VuJyBlbnRp
cmVseSBpbiBvbmUgcGxhY2UsIGFuZCBpbiBhbm90aGVyIHlvdQprZWVwIGl0IGFuZCBqdXN0IHNh
eSAid2hhdGV2ZXIsIGl0J3MgdW51c2VkLCBwYXNzIGluIE5VTEwiLiBXSEFBPwoKQXMgcGFydCBv
ZiBsb29raW5nIGF0IHRoaXMgYWxsLCBJIGFsc28gbm90ZSB0aGF0IHNvbWUgb2YgdGhpcyBpcyBh
bHNvCnZlcnkgbm9uLWtlcm5lbHkuCgpUaGUgd2hvbGUgdGhpbmcgd2l0aCB0cnlpbmcgdG8gaW1w
bGVtZW50IGEgImNsb3N1cmUiIGluIEMgaXMgc2ltcGx5Cm5vdCBob3cgd2UgZG8gdGhpbmdzIGlu
IHRoZSBrZXJuZWwgKGFsdGhvdWdoIEkndmUgYWRtaXR0ZWRseSBzZWVuCnNpZ25zIG9mIGl0IGlu
IHNvbWUgZHJpdmVycykuCgpJZiB0aGlzIHNob3VsZCBiZSBkb25lIGF0IGFsbCAoYW5kIHRoYXQn
cyBxdWVzdGlvbmFibGUpLCBhdCBsZWFzdCBkbwppdCBpbiB0aGUgY2Fub25pY2FsIGtlcm5lbCB3
YXk6IHBhc3MgaW4gYSBzZXBhcmF0ZSAiYWN0b3IiIGZ1bmN0aW9uCnBvaW50ZXIgYW5kIGFuIGFy
Z3VtZW50IGJsb2NrLCBkb24ndCB0cnkgdG8gbWl4IGZ1bmN0aW9uIHBvaW50ZXJzIGFuZAphcmd1
bWVudCBkYXRhIGFuZCBjYWxsIGl0IGEgImNsb3N1cmUiLgoKV2UgdHJ5IHRvIGtlZXAgZGF0YSBh
bmQgZnVuY3Rpb25zIHNlcGFyYXRlLiBJdCdzIG5vdCBldmVuIGZvciBzZWN1cml0eQpjb25jZXJu
cyAoYWx0aG91Z2ggdGhvc2UgaGF2ZSBjYXVzZWQgc29tZSBzcGxpdHMgaW4gdGhlIHBhc3QgLSBh
dm9pZApwdXR0aW5nIGZ1bmN0aW9uIHBvaW50ZXJzIGluIHN0cnVjdHVyZXMgdGhhdCB5b3UgdGhl
biBjYW4ndCBtYXJrCnJlYWQtb25seSEpLCBpdCdzIGEgbW9yZSBnZW5lcmljIGlzc3VlIG9mIGp1
c3Qga2VlcGluZyBhcmd1bWVudHMgYXMKYXJndW1lbnRzIC0gZXZlbiBpZiB5b3UgdGhlbiBtYWtl
IGEgc3RydWN0dXJlIG9mIHRoZW0gaW4gb3JkZXIgdG8gbm90Cm1ha2UgdGhlIGNhbGxpbmcgY29u
dmVudGlvbiB2ZXJ5IGNvbXBsaWNhdGVkLgoKKFllcywgd2UgZG8gaGF2ZSB0aGUgcGF0dGVybiBv
ZiBzb21ldGltZXMgbWl4aW5nIGZ1bmN0aW9uIHBvaW50ZXJzCndpdGggImRlc2NyaWJpbmcgZGF0
YSIsIGllIHRoZSAic3RydWN0IGZpbGVfb3BlcmF0aW9ucyIgc3RydWN0dXJlCmlzbid0IF9qdXN0
XyBhY3R1YWwgZnVuY3Rpb24gcG9pbnRlcnMsIGl0IGFsc28gY29udGFpbnMgdGhlIG1vZHVsZQpv
d25lciwgZm9yIGV4YW1wbGUuIEJ1dCB0aG9zZSBhcmVuJ3QgYWJvdXQgbWl4aW5nIGZ1bmN0aW9u
IHBvaW50ZXJzCndpdGggdGhlaXIgYXJndW1lbnRzLCBpdCdzIGFib3V0IGJhc2ljYWxseSAiZGVz
Y3JpYmluZyIgYW4gb2JqZWN0CmludGVyZmFjZSB3aXRoIG1vcmUgdGhhbiBqdXN0IHRoZSBvcGVy
YXRpb24gcG9pbnRlcnMpLgoKU28gc29tZSBvZiB0aGlzIGNvZGUgaXMgc3R1ZmYgdGhhdCBJIHdv
dWxkIGhhdmUgbGV0IGdvIGlmIGl0IHdhcyBpbgpzb21lIGluZGl2aWR1YWwgZHJpdmVyICgiQ2xv
c3VyZXM/IEMgZG9lc24ndCBoYXZlIGNsb3N1cmVzISBCdXQKd2hhdGV2ZXIgLSB0aGF0IGRyaXZl
ciB3cml0ZXIgY2FtZSBmcm9tIHNvbWUgcGxhY2UgdGhhdCB0YXVnaHQgbGFtZGEKY2FsY3VsdXMg
YmVmb3JlIHRlY2huaW5nIEMiKS4KCkJ1dCBpbiB0aGUgY29yZSBtbSBjb2RlLCBJIHdhbnQgcmV2
aWV3cy4gQW5kIEkgd2FudCB0aGUgY29kZSB0byBmb2xsb3cKbm9ybWFsIGtlcm5lbCBjb252ZW50
aW9ucy4KCiAgICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
