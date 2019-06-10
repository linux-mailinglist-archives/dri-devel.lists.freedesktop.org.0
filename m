Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07743BAFF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 19:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0062989168;
	Mon, 10 Jun 2019 17:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A835289168
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:32:12 +0000 (UTC)
Received: by mail-it1-x133.google.com with SMTP id e25so321246itk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1efoJlMlx1bDC8zbQV54m5FdUp3IUHZz7pfVRtJSBuU=;
 b=mieOodgZqt5UgFV9X503GVt1K0NLNMT9N7nvOSDMhwX/SW30fvZVP7EFazNVTMekGg
 J1NC0Vm8BWQTj/1iYL8CwMC2T3BJPexeti2Kn8ERGQtFQtxlxWY+PI8I3l/b1+Qsy+OA
 aPRowQKj4kF84NPMuwjifBRxEi/cmSynp2TS6ZI1gIfn9YP1CkI49kqwNtAFyObI4gBo
 v4ql/1rsJIb4BYyZUQ1xC8OxkNAd80jcVK/2QHDz4LXiP2hsa7bdtNQWZgRMlVucwfhO
 Uvp/IGZHY3fvJnX2x4gU3f46L0uqqDs0+kRQ7kN5EHhHIk+35cmJRUwKEaszLUqjehjV
 Bv7Q==
X-Gm-Message-State: APjAAAXeuqNOFxBPnXHvJi8lcXV0b5qyWQ3CEZ6nMwa2fQ+mIxqN/8+2
 RtCqwncMofknH7wBkmsjM4s4TQHMWV8=
X-Google-Smtp-Source: APXvYqyLeBSVClYvdXW3elsuNKf7zmqz7eVdELGzO7XL+lbrsznXdwqYE3wv2JPeMWm5sR2zXovTAw==
X-Received: by 2002:a24:ed4a:: with SMTP id r71mr9778159ith.124.1560187931532; 
 Mon, 10 Jun 2019 10:32:11 -0700 (PDT)
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id y20sm179405iol.34.2019.06.10.10.32.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 10:32:11 -0700 (PDT)
Received: by mail-it1-f173.google.com with SMTP id j194so364119ite.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 10:32:11 -0700 (PDT)
X-Received: by 2002:a02:7b2d:: with SMTP id q45mr43201657jac.127.1560187930753; 
 Mon, 10 Jun 2019 10:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAK4VdL03VzCyGfmMNoTL6EsDdrprv0Arhp+mueFRWKxJhzA_vg@mail.gmail.com>
In-Reply-To: <CAK4VdL03VzCyGfmMNoTL6EsDdrprv0Arhp+mueFRWKxJhzA_vg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Jun 2019 10:32:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmTK6GFMMqjeO7E4bMO6GGy=fF7PmMiKC+8TwNtRrZ=w@mail.gmail.com>
Message-ID: <CAD=FV=UmTK6GFMMqjeO7E4bMO6GGy=fF7PmMiKC+8TwNtRrZ=w@mail.gmail.com>
Subject: Re: Pine64+ sun4i-drm Attempting to unwedge stuck i2c bus
To: Erico Nunes <nunes.erico@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1efoJlMlx1bDC8zbQV54m5FdUp3IUHZz7pfVRtJSBuU=;
 b=KiqdnIY/R7OuRvguj97CAfu7fjRPVP0ahCxJpGBV/HMeazYfJk2m9RZkjEBordFO10
 cJp6xjAiQMg5A5Or/NQI8lzQZrakzNFpynktdlZ2W6t1zLThQOLl/QDFe3+dq0vsKL6e
 9KR/JSOh5Higt8vHXOs1I8H2h5Y0ctDycIo88=
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAxMDoyOCBBTSBFcmljbyBOdW5lcyA8bnVuZXMu
ZXJpY29AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gdXBkYXRpbmcgbXkgUGluZTY0KyB0
byB0aGUgbGF0ZXN0IGRybS1taXNjLW5leHQgdG9kYXkgKDQyNzIzMWJjNmQ1KQo+IHN0YXJ0ZWQg
Z2l2aW5nIG1lIHRoZSBCVUcgYW5kIE9vcHMgYmVsb3cuIEl0J3MgY29uc2lzdGVudGx5Cj4gcmVw
cm9kdWNlYWJsZS4gV2l0aG91dCBLQVNBTiBJIHN0aWxsIGdldCB0aGUgT29wcy4KPiBJIHdhcyBh
YmxlIHRvIGJpc2VjdCBpdCB0byBbNTBmOTQ5NWVmZTMwOGViMjVmZDkyMWVhN2M4YzgxNDNkZGVl
YWUzMF0KPiBkcm0vYnJpZGdlL3N5bm9wc3lzOiBkdy1oZG1pOiBBZGQgInVud2VkZ2UiIGZvciBk
ZGMgYnVzIC4KPiBSZWFkaW5nIHRoZSBjb21tZW50cyBvbiB0aGF0IHBhdGNoIEknbSBub3Qgc3Vy
ZSB3aHkgaXQgaXMgZXZlbiB0cnlpbmcKPiB0byBydW4gdGhpcyAidW53ZWRnZSIgaGFuZGxlciBv
biB0aGUgUGluZTY0Ky4KPgo+IEFueSBjbHVlPwoKSSBzZWUgdGhlIGJ1Zy4gIFBhdGNoIGNvbWlu
ZyByaWdodCB1cC4gIFNvcnJ5LgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
