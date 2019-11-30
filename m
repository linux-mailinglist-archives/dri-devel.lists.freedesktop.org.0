Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D710DE69
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 18:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235E16E151;
	Sat, 30 Nov 2019 17:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7F6E151
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 17:42:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e9so35183960ljp.13
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 09:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OY7cEjDNgu8kaIIhsnYFUXoWVVZdXt/b0h/OEHq0PY=;
 b=UbnvBZf/uRoLfyI7fOJplpGpN4vr4cvXhkNMx/gGcmxMbsYX0rPiWojPrxE7UOZpMZ
 /izAPgj3e4XuFtEAHSSd8lZmE1ERrW6VvqJ8v0sDnJoVJCPxrCQSZvsjCA+96r1187FE
 2FDD4Wla7DilzUGVTpFFjb0/tjqCp4iSOsw3/pSOZam50JIOgh9Za/E/pWUEQRDjhG5p
 SNEKyb8og4OApGefZ6yQeHqfGEkzafauAACD5NmuTsjofx/Bt6QbEJrxRysUAUUSLino
 QZHJsTHSvj4mtKORI5ll6IFDNGiWu4/fvWwVRcnEoEMkXJF6o7dhnanfw9fM2fmIfr4g
 5uVg==
X-Gm-Message-State: APjAAAVU7bGHlASQ3g7tSOWxx4+d5n2vb5BjLiNCyRo52dvJLc6zX2Gg
 3kXhiQQ35BYhrb3LPW0X8/wn1Xhmo4c=
X-Google-Smtp-Source: APXvYqx4SGBwEvaxqnRNvIKdcopbPQPlNgMNxBpeGxUGZU6f3806VeneqFlpF863EdUy23kum/cu5Q==
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr2128895ljj.155.1575135744718; 
 Sat, 30 Nov 2019 09:42:24 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id p26sm12143757lfh.64.2019.11.30.09.42.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 09:42:23 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id a17so24816858lfi.13
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 09:42:23 -0800 (PST)
X-Received: by 2002:ac2:50cc:: with SMTP id h12mr28807478lfm.29.1575135742985; 
 Sat, 30 Nov 2019 09:42:22 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txVpjxR1UAOPpXn-ZqMamAUdzfq_HOEav99A0A0sfFBUw@mail.gmail.com>
In-Reply-To: <CAPM=9txVpjxR1UAOPpXn-ZqMamAUdzfq_HOEav99A0A0sfFBUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2019 09:42:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjryrAniBWJyeEBaye8rnX=S-BT3_c_jRcSZj4xfPvjhw@mail.gmail.com>
Message-ID: <CAHk-=wjryrAniBWJyeEBaye8rnX=S-BT3_c_jRcSZj4xfPvjhw@mail.gmail.com>
Subject: Re: [git pull] mm + drm vmwgfx coherent
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7OY7cEjDNgu8kaIIhsnYFUXoWVVZdXt/b0h/OEHq0PY=;
 b=JOZDGt1czSe4MNLzWjpCvKey9irF4zZMRZbgmXvmbswCLh4edHM3+zG0W7AepyQuH5
 S3UpE5aoX1tumTjLBhmdAur1fzssaA7JclP95veaMEk0fW0Lg9jRSLW4arbfZ1m4grx1
 2xnyuKZReOfnhOTL1Vmau6ogbpCrBe+7dJuts=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgNToxNSBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBqdXN0IGEgc2VwYXJhdGVkIHB1bGwgZm9yIHRoZSBt
bSBwYWdld2Fsa2luZyArIGRybS92bXdnZnggd29yawo+IFRob21hcyBkaWQgYW5kIHlvdSB3ZXJl
IGludm9sdmVkIGluLCBJJ3ZlIGxlZnQgaXQgc2VwYXJhdGUgaW4gY2FzZSB5b3UKPiBkb24ndCBm
ZWVsIGFzIGNvbWZvcnRhYmxlIHdpdGggaXQgYXMgdGhlIG90aGVyIHN0dWZmLgoKVGhhbmtzLCBw
dWxsZWQgKGFuZCB0aGUgZGVsYXkgd2Fzbid0IGJlY2F1c2Ugb2YgbWUgYmVpbmcgbmVydm91cyBh
Ym91dAp0aGUgY29kZSwgaXQgd2FzIGp1c3QgYmVjYXVzZSBvZiB0dXJrZXkgYW5kIGEgZGF5IG9m
IHJlc3QgYWZ0ZXJ3YXJkcykuCgpBbmQgSSBhcHByZWNpYXRlIHRoZSBzZXBhcmF0aW9uIC0gbm90
IGJlY2F1c2UgSSB3YXNuJ3QgY29tZm9ydGFibGUKd2l0aCB0aGUgZmluYWwgY29kZSwgYnV0IHNp
bXBseSBiZWNhdXNlIGl0J3MgYSByYXRoZXIgZGlmZmVyZW50IHRoaW5nCnRoYW4gdGhlIHVzdWFs
IGRybSBjb2RlLiBIYXZpbmcgdGhhdCBhcyBhIHNlcGFyYXRlIHB1bGwgYW5kIG5vdCBtaXhlZAp1
cCB3aXRoIHRoZSByZWd1bGFyIGRyaXZlciB1cGRhdGVzIGlzIGp1c3QgaG93IEkgcHJlZmVyIGl0
LgoKVGhhbmtzLAoKICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
