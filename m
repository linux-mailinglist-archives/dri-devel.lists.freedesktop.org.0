Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E574B36F861
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 12:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0B6E1A7;
	Fri, 30 Apr 2021 10:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534C6E303
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:18:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n127so25705979wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Oe3InzGocgx+SVAORJk85RdD0gPbn/WHv34EAPUqs8M=;
 b=V9jg8ZHohbeo9gquZlSBn5dRWMlzUnLMOK0ml+wUy2pO+llGJLJTHZh0+CKEDIaqUh
 r1i0UbQFr/ja2DIEocr7eeu9OclHvhlzY9D+RKO3yG2ntsiBMlf3Ag6xTXG1yQQ2P27m
 qn9ZvTBAu34JvjldXrCJezd6jClbnB4jXpkQxBFv0l5wrrDL7/we3YPedIQ6gxlndmUe
 YIfaPmRM/rbt9z7tVZP1/hgv+29l8lRUWO7sSeJ9ARR9cIRcwqSN0Ohpk46saThrhFbt
 P8UDWjQCDHnoOQgOzfzmSqp1z7mSChG0ZbsazD9mje/oOu1qyvCOB55Ax4kZ2KMA7bFD
 Wq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oe3InzGocgx+SVAORJk85RdD0gPbn/WHv34EAPUqs8M=;
 b=KicYZynfZmlV33/JCOEuEexClog9p8SkIT1X+SUyFpjAdmDf8LoIbXKUPLHs7crje3
 gU7cwynbt1tEX60ZTSez0pgCFGy8iQ6P+WhKHCfRjpeNa4q6F09IcoKylxE6AvI3D2na
 /zCpo4tkd0KrG/A/56k9+5nF52jdWsFLANUMs35AtxndIgTp+xdLnrEyUp2uZwgXc+nO
 TcuMH80cD+f3hDlPsPJEtCQ1Vec2anfMRnHqjxWp0JIjTxN9trnZGlf6v4qCiLo+ehse
 pbNS6VBC/QlmZjRR5tETuvKiI8SfZJcid1Wk3wGZe22CzXCXvTsO35DPAQpAF1k0CA3q
 n1Ww==
X-Gm-Message-State: AOAM531VSbrUOa2OxeW/Gi3vbagXuFGPi+4yhYX3PBVowgBdBvNxODxF
 JikIDK046HnrbtH+uPujaAnoFVB/+oVWMNFyH4WIyg==
X-Google-Smtp-Source: ABdhPJyglXc1LG+4N3OnYUgy2G/YFDiqDJZ3hC/mvQGyl2x2kw/CucuPcj2JBRv7i447spYTOAimIKv7XmQU/VrxOSo=
X-Received: by 2002:a1c:1b49:: with SMTP id b70mr5412251wmb.147.1619777918888; 
 Fri, 30 Apr 2021 03:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local> <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
 <72f21ab9-9376-b366-2b69-94ea65e332c1@gmail.com>
 <YIlkgRDQDe+E558E@phenom.ffwll.local>
 <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
 <YIlykcjDV9ckeyyG@phenom.ffwll.local>
 <CADnq5_MJgq40-YscW8bDmUkb_WyuZOXPtdm2ErEyvmnv=2pBHQ@mail.gmail.com>
 <YIqUp6WpkbHJltZm@phenom.ffwll.local>
 <CAKMK7uHQ44O_yyuveqYAwTejezJ3HC84fcosnq-bSgBWy_ShOw@mail.gmail.com>
 <06fab310-afb6-c720-a2e7-d8e3d70f81b8@gmail.com>
 <CAKMK7uEWw4o_B5tZGKscywKP8MrBGQghdct8tKpZ58ybpxjDLw@mail.gmail.com>
In-Reply-To: <CAKMK7uEWw4o_B5tZGKscywKP8MrBGQghdct8tKpZ58ybpxjDLw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Apr 2021 11:17:43 +0100
Message-ID: <CAPj87rPu2ujdEMekOcjvwtnEBJeeJAvTsBHaCJYT=H2juDm6ig@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIDMwIEFwciAyMDIxIGF0IDEwOjM1LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+IE9uIEZyaSwgQXByIDMwLCAyMDIxIGF0IDExOjA4IEFNIENocmlz
dGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gVGhpcyBkb2Vzbid0IHdvcmsgaW4gaGFyZHdhcmUuIFdlIGF0IGxlYXN0IG5lZWQgdG8gc2V0
dXAgYSBmZXcgcmVnaXN0ZXJzCj4gPiBhbmQgbWVtb3J5IGxvY2F0aW9ucyBmcm9tIGluc2lkZSB0
aGUgVk0gd2hpY2ggdXNlcnNwYWNlIHNob3VsZG4ndCBoYXZlCj4gPiBhY2Nlc3MgdG8gd2hlbiB3
ZSB3YW50IHRoZSBlbmQgb2YgYmF0Y2ggZmVuY2UgYW5kIHJpbmcgYnVmZmVyIHN0YXJ0IHRvCj4g
PiBiZSByZWxpYWJsZS4KPgo+IFRoZSB0aGluZyBpcywgd2UgZG9uJ3QgY2FyZSB3aGV0aGVyIGl0
J3MgcmVsaWFibGUgb3Igbm90LiBVc2Vyc3BhY2UgaXMKPiBhbGxvd2VkIHRvIGxpZSwgbm90IHNp
Z25hbCwgc2lnbmFsIHRoZSB3cm9uZyB0aGluZywgb3V0IG9mIG9yZGVyLAo+IGV2ZXJ5dGhpbmcu
Cj4KPiBUaGUgZGVzaWduIGFzc3VtZXMgYWxsIHRoaXMgaXMgcG9zc2libGUuCj4KPiBTbyB1bmxl
c3MgeW91IGNhbid0IHNpZ25hbCBhdCBhbGwgZnJvbSB1c2Vyc3BhY2UsIHRoaXMgd29ya3MuIEFu
ZCBmb3IKPiB0aGUgImNhbid0IHNpZ25hbCBhdCBhbGwiIGl0IGp1c3QgbWVhbnMgc29tZXRoaW5n
IG5lZWRzIHRvIGRvIGEgY3B1Cj4gYnVzeSB3YWl0IGFuZCBidXJuIGRvd24gbG90cyBvZiBjcHUg
dGltZS4gSSBob3BlIHRoYXQncyBub3QgeW91ciBodwo+IGRlc2lnbiA6LSkKCkkndmUgYmVlbiBz
aXR0aW5nIHRoaXMgb25lIG91dCBzbyBmYXIgYmVjYXVzZSB3aGF0IG90aGVyLURhbidzCnByb3Bv
c2VkIHNlZW1zIHRvdGFsbHkgc2Vuc2libGUgYW5kIHdvcmthYmxlIGZvciBtZSwgc28gSSdsbCBs
ZXQgaGltCmFyZ3VlIGl0IHJhdGhlciB0aGFuIGNvbmZ1c2UgaXQuCgpCdXQgLSB5ZXMuIE91ciB0
aHJlYXQgbW9kZWwgZG9lcyBub3QgY2FyZSBhYm91dCBhIG1hbGljaW91cyBjb250ZW50CndoaWNo
IGRlbGliZXJhdGVseSBzdWJtaXRzIGdhcmJhZ2UgYW5kIHRoZW4gZ2V0cyB0aGUgY29tcG9zaXRv
ciB0bwpkaXNwbGF5IGdhcmJhZ2UuIElmIHRoYXQncyB0aGUgYXR0YWNrIHRoZW4geW91IGNvdWxk
IGp1c3QgZW1pdCBub2lzZQpmcm9tIHlvdXIgZnJhZyBzaGFkZXIuCgpDaGVlcnMsCkRhbmllbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
