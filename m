Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21382EB7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0B6E33E;
	Tue,  6 Aug 2019 09:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D816E33E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 09:32:28 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id j26so57892900vsn.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 02:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sAkfaDay2yq73PTAVJIzr9h5FmlrUk+FU61nVcYfwNw=;
 b=dwt8CTovhmlYc1ibHWJm0RutxGcBWsZof0obfA/Sdg6rrnG1MI5jBIu/3RSsHvAHrV
 XKaExAo0l823+4FNfyUMisN36fTx8axKjY6clYwhBbNXfFCfS8pLlizL5n20EXUyZUOE
 OT6FOTwd261sofcJmCTJfV3cZSJVXsmJEFY/cWAHwxDe7QjDkx77XeBOTR9y4YNrKFva
 /6nXEaxDTEwWjIu/2jkgBJyaIdV7rB6kOqQzgifF6gEW1MOEF0YCjDHSkC11yIXEYU1e
 CPUHtFVgr1PjWxEL9xa4kBfKha0mWFo5HstLhsBFfFeqo06yZJJi6AcB/VYN/FKNHEbg
 36+A==
X-Gm-Message-State: APjAAAVH875R3+DpQA2qa0+7Iwdm7tijTsyVCqAPQ84QmUkH1MvJsfHk
 HoVGna/3TTYisv8tJVwJL3RxA8ikAvSXseHR4vEPSEb4
X-Google-Smtp-Source: APXvYqwPMwdmNChUsGpYfrwlailR28tHN1uqt+143JmfbP8dZpJzxSrgVVr5EOcYXZL3NHeCfQTJ/IVmyQk0wmnGamM=
X-Received: by 2002:a67:9946:: with SMTP id b67mr1684044vse.37.1565083947355; 
 Tue, 06 Aug 2019 02:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190802170117.10942-1-emil.l.velikov@gmail.com>
 <5dfd670173701da38226bc0da071ba829b11cf4c.camel@vmware.com>
In-Reply-To: <5dfd670173701da38226bc0da071ba829b11cf4c.camel@vmware.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 10:31:37 +0100
Message-ID: <CACvgo50wj=wUytUvh_QRq3g4FbQqt83ZnnpyHK_tN5yCUZSPEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
To: Deepak Singh Rawat <drawat@vmware.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sAkfaDay2yq73PTAVJIzr9h5FmlrUk+FU61nVcYfwNw=;
 b=iNfzPJ/GLcLxYt25uPzfQuj2Fl6fBWHDg4oVdIPflHBgEMhdqMDCXxEa+lCvAYyu6i
 SFadsdJazvtPK9Mt0yvtMdlTi0t8V3uzdfDuINtqGOiVfS8w+Oqa4ueeSiMv93Y+tkEk
 fA9g6hk5I4YHlrraEfLddTVOmOPZuu+qCRcBKF2zAveWvV/kCGRa22/TNlcDArzG4L6P
 rp3IQcNTBfVQfWQxh9+6tpIqa86sdhg+ERU+YEArOSJCZZflTKoTJaxrcVOwS5Plmphi
 wWlW8XeEfkT7s2xcpH/v2faOlM2RUNca5xDUR949tdfV1WcRmsmnUu3EtEf1TwpefVgP
 m1JQ==
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
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA1IEF1ZyAyMDE5IGF0IDE2OjM3LCBEZWVwYWsgU2luZ2ggUmF3YXQgPGRyYXdhdEB2
bXdhcmUuY29tPiB3cm90ZToKPgo+IEhpIEVtaWwsCj4KPiBUaGFua3MgZm9yIGRvaW5nIHRoaXMu
IExvb2tzIGdvb2QgdG8gbWUuIEJ5IHRoZSB3YXkgSSB0aGluayBUaG9tYXMgaGFkCj4gYSBwYXRj
aCB0byBnZXQgcmlkIG9mIGxlZ2FjeSBsb2NraW5nIG1lY2hhbmlzbS4gSSBkb24ndCBrbm93IHdo
ZW4gaXQKPiB3aWxsIGdvIHVwc3RyZWFtLiBXaXRoIHRoYXQgd2Ugbm8gbmVlZCBmb3IgdGhlIGJl
bG93IGNoZWNrLgo+CkFncmVlZCB0aGUgcGF0Y2hlcyB3ZXJlIHBhcnQgb2YgdGhlIDUuMy1yYzEg
cHVsbCByZXF1ZXN0IHRvIExpbnVzLgpTYWRseSB0aGUgd2hvbGUgdm13Z2Z4IGJyYW5jaCB3YXMg
cmV2ZXJ0ZWQgWzFdIDotKAoKT25jZSB0aGF0IHJlLWxhbmRzLCB3ZSBjYW4gcmVtb3ZlIHRoaXMg
dGVtcG9yYXJ5IHdvcmthcm91bmQuCgo+IFJldmlld2VkLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdh
dEB2bXdhcmUuY29tPgo+CkdyZWF0LCB0aGFuayB5b3UuCgotRW1pbAoKWzFdIGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI2NTQyLmh0
bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
