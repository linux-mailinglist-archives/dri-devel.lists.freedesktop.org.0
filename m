Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C06879B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 13:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA7089916;
	Mon, 15 Jul 2019 11:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890F889916
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:02:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f9so16549034wre.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 04:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hukSDBvejCeRA/4yqIF2pUsY8MeiMorK9iH41/yECWE=;
 b=Xq6Wrlk0hf6PqIF2Kjv5aAHlLKU05QMw/XbwOBp/oGHT+IQGZ0CRR/TknW30ive0Du
 6oxTe19AWr38nDY4C8nQ6dhyOyTy+QelzQQyiKYu/S02OTbEWvZtn4unEB76RjdGcJBz
 5zo5qcgvz7nzzl4vsrCkr++ApEq/+K7EVax67iQQU7GLR77CCCn70JiiPtDAFx+1YqL6
 1MgBpHg9/jt18nbrPzNLhZokiCkSgDMzCqXiOtQ5cAFAhPRcMZiIiM02KxDe6/GYrLRE
 4C7PO+i4f1J0gdg7ssHE4fPM4kZhzLn6lEMou0mLHPtsLNzoQvvWai7cnsdJXNlxV2A7
 wbeQ==
X-Gm-Message-State: APjAAAUL7aWSGJeL6+djMuFf5uukyygR3vVih+YVF2MEvkpySwV1gXRJ
 AQKvqMAKAJwapCy2uepj2l0=
X-Google-Smtp-Source: APXvYqyDpmRiJ4rUoNj4baDQxpZ5k4SeUDsKZbZ5q6B2B2SNT0sa1BsSAQXMsvyv0I1v3koYaRYD6Q==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr9964536wrv.146.1563188550205; 
 Mon, 15 Jul 2019 04:02:30 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id y18sm16255024wmi.23.2019.07.15.04.02.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 04:02:29 -0700 (PDT)
Date: Mon, 15 Jul 2019 12:02:28 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v3] gpu/drm_memory: fix a few warnings
Message-ID: <20190715110228.GD20839@arch-x1c3>
References: <1562685190-1353-1-git-send-email-cai@lca.pw>
 <1562960735.8510.30.camel@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562960735.8510.30.camel@lca.pw>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hukSDBvejCeRA/4yqIF2pUsY8MeiMorK9iH41/yECWE=;
 b=WVAJvThDlrUR1PjmbcoQBsJgIoTLsiFGlMMJBhFmzAqQ4fz7gq23nw8IsmAL4OLRvB
 rGZ33j+7jr/gAXiShpPdenl2kOWKzf4bkQVOYcvLLsaRD5+kONM6zp4VekvriKYw4mh0
 GJYv9/nOo4Nf5LyGib1GZQRqbpMfjwJLdBPG6oLSU1pJkNAgnt+6PvGpm9oj21LUUM3x
 z3SvHGe4lccKkwNUuioSOITAFgwRG4un6LY04ufhxs/0muhucWhucj3ojNMEVpCxH3lY
 8pQmmjbmAABsnw4BFSSf7uS83iy0IF71yahblNeP3ZGpnpduf4zjrGmv1KUyAkkFyCQj
 Uu1Q==
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
Cc: sean@poorly.run, corbet@lwn.net, airlied@linux.ie,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rfontana@redhat.com, joe@perches.com,
 linux-spdx@archiver.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUWlhbiwKCk9uIDIwMTkvMDcvMTIsIFFpYW4gQ2FpIHdyb3RlOgo+IE1heWJlIG9uZSBvZiB0
aGUgbm9uLURSTSBtYWludGFpbmVycyAoQW5kcmV3LCBUaG9tYXMgb3IgR3JlZykgd2hvIGNhcmVz
IGEgYml0Cj4gYWJvdXQgU1BEWCBjYW4gcGljayB0aGlzIHVwLiBJdCBvY2N1cnMgdG8gbWUgbm9u
ZSBvZiBEUk0gbWFpbnRhaW5lcnMgY2FyZXMgYWJvdXQKPiB0aGlzIGFzIHRoZXJlIGlzIG5vIGZl
ZWRiYWNrIGZyb20gYW55IG9mIHRoZW0gZm9yIG1vbnRocyBzaW5jZSB2MS4KPiAKQUZBSUNUIHRo
ZXJlIGFyZSBhIGNvdXBsZSBvZiByZWFzb25zIHdoeSB0aGlzIGhhcyBnb25lIHVubm90aWNlZDoK
IC0gc3VtbWFyeSBpcyB0aGUgcHJldHR5IGFtYmlndW91cwogLSBjb21taXQgZG9lcyB0d28gdGhp
Z3MKCkFub3RoZXIgdGhpbmcgdG8gY29uc2lkZXIgaXMgdGhhdCB0aGlzIHBhdGNoIHRvdWNoZXMg
YSBzaW5nbGUgZmlsZSwKd2hpbGUgdGhlIGV4YWN0IHNhbWUgaXNzdWUgaXMgYWxzbyBwcmVzZW50
IGluIG1hbnkgb3RoZXIgZmlsZXMuCgpRdWljayBsb29rIGF0IHRoZSBmb2xsb3dpbmcgbGlzdHM6
CmhlYWQgLW4yIGRyaXZlcnMvZ3B1L2RybS9kcm1fKltjaF0gIHwgbGVzcwoKZHJtX2FncHN1cHBv
cnQuYwpkcm1fZG1hLmMKZHJtX2xlZ2FjeV9taXNjLmMKZHJtX2xvY2suYwpkcm1fbWVtb3J5LmMK
ZHJtX3NjYXR0ZXIuYwpkcm1fdm0uYwoKSWYgeW91IGNhbiBmaXh1cCB0aGUgc3wvKip8Lyp8IGlu
IHRoZSBhYm92ZSwgSSdkIGdsYWRseSBtZXJnZSB0aGUgcGF0Y2guCgpPbiB0aGUgdG9waWMgb2Yg
U1BEWCAtIG5vIG9iamVjdGlvbiBvbiBteSBlbmQsIGJ1dCBpdCBzaG91bGQgYmUgYQpzZXBhcmF0
ZSBwYXRjaCwgd2hpY2ggcmVwbGFjZXMgdGhlIGV4cGxpY2l0IHZlcmJvc2UgbGljZW5zZSB0ZXh0
IHdpdGgKdGhlIHRhZy4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
