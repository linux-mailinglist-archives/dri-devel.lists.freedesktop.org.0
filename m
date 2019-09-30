Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA77DC25B4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59726E4A6;
	Mon, 30 Sep 2019 17:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4F6E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:12:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q64so10285737ljb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Act6rfhr6ll6+lxDGIt9p6YkkxuZ3qqsousOClbC28=;
 b=mWNKEyRIZOnXKJF5U4/E2L7lhZkTTTf19Xm4LTE8RQRfQyOdCaqkM1v+1t8xP2v7u2
 WCH4uHRoycj0VQupJPbybS33TBahN4+73Md6WmiHDBzE3JCilrh879U1k4dU1Jj9EvUU
 01XwaqTH34okH6jW6zjXqW53oOpokYhEkMDfBCjkU/3N3nxZ0T8HUDesTPWb7QDcZ63s
 ghCeCk3Yhr6QrNGZpJhZhlFZ1PBvSG+r7TMUbVNJLxAYQooaJ0Fg1lDI4aT1LF+aEDfa
 guVU2Wso3xsUgkgibJlL+NgdVYMVpXEc3BT+nVpazLrULBEjJpkVmR/Uh7nSx4FF+j15
 sA0w==
X-Gm-Message-State: APjAAAXNfVIc/M7ZBGFj92z0CZGzirBNRyeiLpFtgjGuiNIKOUH0XXnV
 GJMnczOTibb9V8o6IK6adBCv6UWSSn0=
X-Google-Smtp-Source: APXvYqwMIuHo03cCc8VMVXFnFjjrHwlNrPwMYLmIHu8N3JurXNfHRmCSkdwP0rNwuLDEb7c41ZapuA==
X-Received: by 2002:a2e:8ec1:: with SMTP id e1mr12961130ljl.14.1569863561341; 
 Mon, 30 Sep 2019 10:12:41 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id y206sm3232882lfc.6.2019.09.30.10.12.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2019 10:12:39 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id y3so10317993ljj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:12:39 -0700 (PDT)
X-Received: by 2002:a2e:3015:: with SMTP id w21mr12950349ljw.165.1569863559288; 
 Mon, 30 Sep 2019 10:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <20190927121754.kn46qh2crvsnw5z2@box>
 <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
 <20190930130357.ye3zlkbka2jtd56a@box>
In-Reply-To: <20190930130357.ye3zlkbka2jtd56a@box>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Sep 2019 10:12:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigUfYXiizFH6tBCH0Na=L+c=k7CgXGoZjwKg4K1rNJ2Q@mail.gmail.com>
Message-ID: <CAHk-=wigUfYXiizFH6tBCH0Na=L+c=k7CgXGoZjwKg4K1rNJ2Q@mail.gmail.com>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3Act6rfhr6ll6+lxDGIt9p6YkkxuZ3qqsousOClbC28=;
 b=V7RLMXPETXEXeWwE1Sbnizu2qEFIZYZq5cHmesMNso3mhFcDh0YU3w13uEDwi4/e7M
 gJ+BO6drpJpEQ0Js3lc9uRgVOARgIqUEGJ6wTOYYpcZxE8hNq1rhk8iDoPfDqTkT+AwE
 a0YtiITRaLk9xBmk/4pRQlcopVx7UWpdCLzTY=
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNjowNCBBTSBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmls
bEBzaHV0ZW1vdi5uYW1lPiB3cm90ZToKPgo+IEhhdmUgeW91IHNlZW4gcGFnZV92bWFfbWFwcGVk
X3dhbGsoKT8gSSBtYWRlIGl0IHNwZWNpZmljYWxseSBmb3Igcm1hcCBjb2RlCj4gdG8gY292ZXIg
Y2FzZXMgd2hlbiBhIFRIUCBpcyBtYXBwZWQgd2l0aCBQVEVzLiBUbyBtZSBpdCdzIG5vdCBhIGJp
Zwo+IHN0cmV0Y2ggdG8gbWFrZSBpdCBjb3ZlciBtdWx0aXBsZSBwYWdlcyB0b28uCgpJIGFncmVl
IHRoYXQgaXMgY2xvc2VyLCBidXQgaXQgZG9lcyBtYWtlIGZvciBjYWxsaW5nIHRoYXQgYmlnIGNv
bXBsZXgKZnVuY3Rpb24gZm9yIGV2ZXJ5IGl0ZXJhdGlvbiBzdGVwLgoKT2YgY291cnNlLCB5b3Ug
YXJlIHJpZ2h0IHRoYXQgdGhlIGNhbGxiYWNrIGFwcHJvYWNoIGlzIHByb2JsZW1hdGljCnRvbywg
bm93IHRoYXQgd2UgaGF2ZSByZXRwb2xpbmUgaXNzdWVzLCBtYWtpbmcgdGhvc2UgdmVyeSBleHBl
bnNpdmUuCkJ1dCBhdCBsZWFzdCB0aGF0IGhvcGVmdWxseSBnZXRzIGZpeGVkIHNvbWUgZGF5IGFu
ZCBnZXRzIHRvIGJlIGEgcmFyZQpwcm9ibGVtLgoKTWF0dGVyIG90IHRhc3RlLCBJIGd1ZXNzLgoK
ICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
