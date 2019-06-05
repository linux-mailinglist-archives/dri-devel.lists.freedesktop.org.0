Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB035EAE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416089A5E;
	Wed,  5 Jun 2019 14:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B887989A5E;
 Wed,  5 Jun 2019 14:07:33 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a25so19208085lfg.2;
 Wed, 05 Jun 2019 07:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZNLeEeWXELZlwmN5K1nlFiQp6OF7jLq/i7HnGbUTGY=;
 b=lFDzvdrNpjI/NcApyXl5So3+ZlOOexUhQpJabyVYZGZSEVTsxrMSTqiwpUl81i3ukp
 4KFLu+V3OG4YZpom+H0ILpZG/1fQwZIBcj36QLeIa2+cF45l5CD+FP+rD0S8GQ2HLgvE
 k5XPtTgtv4L3uJkaRuZE/gU/VGT1zEE6Wihm6BFFfBZbzBX4kChBHzaMFq1XEOYwMK/i
 7UJ/z2AUweWoIAPgStT0oSFPl/8Q6RMZOaMrNtMo/4sOmpoGmBEne7S1dtGjoydVb4bA
 A6Eyt8+BxoUAkdpIwljuYV2Iva/iM1YFLvCqG6V9MRDkRwuKECAjqS6qFypFg20J8bID
 gd0w==
X-Gm-Message-State: APjAAAUXumrXr1sOBax7XkwAp0vVY6CKfTVv6qhxHEekQ1RBlQvrMFd1
 6QFV91AlvrBR8dtUSsEvO+ANWtXhy8jYG0xM09o=
X-Google-Smtp-Source: APXvYqxK0jGc74KzTfgUR61rtFTclSzqxMlAaM7jnBtBbDPIi68l1EA6fMWPl6Wrbw5ICZLr4e1ol3KpihO8wjsp/NA=
X-Received: by 2002:a19:5046:: with SMTP id z6mr20717982lfj.185.1559743652150; 
 Wed, 05 Jun 2019 07:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
 <CAOuPNLjeCkb+685oSOR2FoJMw9-L=Lky0PhVpkgMiV+n+ztdsA@mail.gmail.com>
 <CAOuPNLiBddMKfjK1bLbymnBb6NfTW3jh7kBQtZLt06gBk_CTJw@mail.gmail.com>
In-Reply-To: <CAOuPNLiBddMKfjK1bLbymnBb6NfTW3jh7kBQtZLt06gBk_CTJw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Jun 2019 11:07:22 -0300
Message-ID: <CAOMZO5CaRADMnLcb432iDqfXYCa1rueV-jxFQYDiZ2HHusP0Xg@mail.gmail.com>
Subject: Re: dpms mode change with wayland on iMX.6
To: Pintu Agarwal <pintu.ping@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HZNLeEeWXELZlwmN5K1nlFiQp6OF7jLq/i7HnGbUTGY=;
 b=Cqu/KFsVJs4b8SOxwkLY0ZTzwgh3L61UixRAs3iW0SkL1WH8Vvky10cGMexqm2fY4Z
 sDELQdanDw4K5p9JwHaqSuYF6PA2EhPJhmg/JYALjKWmVTEEalNsz/KUtaEmLwlIuZGk
 sOlQMTsYRVRTQ8Hb+qnEdyTVEaZC6Z8ZpKFvceNLZR1Lx71C6RnKBoayctFMj0+9HbU7
 uA+oiHyzKGTxAcFsYHRlqHTe83HH3JX93gyvbLOVHXwevsUyRasRaiaA61/R4fsdNdId
 4gZWoiknmfCM5+IKQZTGaHERs+L2ICWzHZ3SM/0RH457AIU4qo7KfdS9on4jDS5B/+KZ
 q+vQ==
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
Cc: paulo.r.zanoni@intel.com,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMTA6NTMgQU0gUGludHUgQWdhcndhbCA8cGludHUucGlu
Z0BnbWFpbC5jb20+IHdyb3RlOgoKPiBPbmUgbW9yZSBwb2ludDoKPiBBbHRob3VnaCBpdCBpcyBo
YXZpbmcgS2VybmVsIDMuMTAsIGJ1dCB0aGUgRFJNIG1vZHVsZXMgd2VyZSB1cGdyYWRlZAo+IHRv
IEtlcm5lbCA0LjkueHggZnJvbSBtYWlubGluZS4KPiBTbywgbGF0ZXN0IERSTSBjaGFuZ2VzIGFy
ZSBhbHJlYWR5IGFwcGxpZWQuCgpQbGVhc2UgZG9uJ3QgZG8gdGhpczoganVzdCB1c2UgYSByZWNl
bnQgbWFpbmxpbmUga2VybmVsIGluc3RlYWQgb2YKbWl4aW5nIDMuMTAga2VybmVsICsgRFJNIHBh
cnQgZnJvbSA0LjkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
