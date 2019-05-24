Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144A297F8
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AF56E101;
	Fri, 24 May 2019 12:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BDB6E101
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:25:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z23so4959082wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k5P1pSB7ZlLWglxoqVR2MiCXxC6+2SRvrlS+nRjC2ss=;
 b=W7zRHwx7Xuc3M5i1Yx7nva1oQ6I3EPdMCa1Wf3waPYaJE//h4NIpHmyhIbjmYSDHYq
 sWPQEg6FKwFOFCV36KCb7BgW0zpieKHm6MIq5M1dcSuFXWqUHs8D0xBQSkyfiT+8WlOQ
 rBtfh0ymKIJD8mbm8wTNgGJqk++sM1CAC+qTbPk3nWTlTMUZXx9yH6f77KDeXhNrs1vt
 7PoeoqBB0NUpHbsDo0ub0z8a5opJS/Se4k0WKlAkYiSrbpfeg4I/C+Ic6SBScoeun2J4
 X5a7P3vUUp0EZexDeizuWya2XVUmbaseSZ5/fa8YqHdgsQ0a9/Bh8i1M30/sV3qs7Uub
 3Qvg==
X-Gm-Message-State: APjAAAVi6HpwqACalJfTwSmF+X1Ot1fdZxi7elmoMQdIIDXWwIXYJC00
 W+biDtYDWaAOVqPGuNOMtoegrJ08
X-Google-Smtp-Source: APXvYqzXN5ka6YMqnaiEgtBjul/uIa9xj9dQvqy+hSxcbBSVPrvazv7HiB3M5/vpLLO04OozBUtqWA==
X-Received: by 2002:a05:600c:23ce:: with SMTP id
 p14mr15057643wmb.36.1558700707584; 
 Fri, 24 May 2019 05:25:07 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id h6sm2000689wrm.47.2019.05.24.05.25.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 05:25:06 -0700 (PDT)
Date: Fri, 24 May 2019 12:24:56 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190524122456.GA483@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-V2SBdg3Diz@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-V2SBdg3Diz@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k5P1pSB7ZlLWglxoqVR2MiCXxC6+2SRvrlS+nRjC2ss=;
 b=QbgGp293YwKUBX9+6fs4Di11af0qslYkH4CoBpC40IofH+5IRWbAKfmUpW3gf6cpyh
 atDZHCVzce7A1t7h2xZyRnlipOkrUtSqsAkHiXfHDGTLrCBD+6CV264vn+8KAezlBitK
 +FE/Cxsvr36oSYuHNdbWqJSmmIiPgaWhGybBOHrYlsN6bhPFGUG8dry0PQqQ94UrUQbZ
 +FggYIoxaXSjmCq2RuTjqo2OwUw7+rklVOdxVVIhiTub0+Ci7a2wanPfrXzW69quFb9a
 o6IH4aGb3LvzAwkl8wyrOJPzbHYAqFBKnpXppaFKF+KMaVugLyhtjeHmdRU0mOXA/jtF
 bTqg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2VlbXMgSSBnZXQgdGhlIHNhbWUgZnJlZXplcyB0aGFuIHlvdS4gSXQgdGFrZXMgaG91cnMg
b2YgZ2FtaW5nIHRvIGdldCBzb21lCnJhbmRvbSBoYXJkIGhhbmcgKG5vIGxvZykuIEkgdGhvdWdo
dCBJIHdhcyBvdmVyaGVhdGluZywgYnV0IHJlYWxpemVkIHRoYXQgbXkgc3lzdGVtIGlzIG9uCiJ2
YWNhdGlvbiIgd2hpbGUgcGxheWluZy4KbGludXggYW1kLXN0YWdpbmctZHJtLW5ldy94MTEgbmF0
aXZlL21lc2EvbGx2bShlcmsuLi4pLCBhbGwgZ2l0IG5vIG9sZGVyIHRoYW4gYQp3ZWVrLgpwbGF5
aW5nIG1vc3RseSBkb3RhMiB2dWxrYW4gb24gQU1EIFRBSElUSSBYVApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
