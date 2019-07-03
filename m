Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0525E5EB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1FC89906;
	Wed,  3 Jul 2019 14:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5C789906;
 Wed,  3 Jul 2019 14:00:31 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id e8so2435609otl.7;
 Wed, 03 Jul 2019 07:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jDKghcGx8Rqud/e2wrQe2rdlSLjtFm6gll0bHfKWH4=;
 b=ppZiZyEHorrgekTsl0gSZnYTPC2oxqgI7MqKI7BCM3sXo61ZiLzHXLDLL6HFJur+rL
 F+60fgh8LTpn3BXq1twHdAI6HOrari12XTgczGZ1MPTVNeFKCBeo1faWV8SfUt6i0E0C
 LwmCiZRw/2LhL3q0lXyZ33w0bGrk8+Pya5y4DcMsLsB8Bx5ZPKu3Gdbytju+LKkJkiNH
 ClnAFqqADos1WzvnhL5Z2d9HR/mpmCE0UWmqi6UQQAegTPtkPNjEyJd7d0vc70BiX1/N
 uiJQFrF4fCfvk2W+elvBNPOHV3GHdSOBX9SAJKFWteMgH3Xb+XZVBZen7tRbzFcmybar
 IR2A==
X-Gm-Message-State: APjAAAXg1lvLilbN61JGqY/OETASE5x2/0UtbU/z8I9xEUebSUZMLLig
 dyvYy+MUfz2/2donOeSrEv8hfVxxw7TVpJAAd8M=
X-Google-Smtp-Source: APXvYqxcbGpCpDEG0Hy50AZ4fLbtZMwY9qzEGtnpEojsG6W4Zm2+DtqxxKAmkM7vL6QXglHD9jkH4Tsz513QMy/kQo0=
X-Received: by 2002:a9d:620e:: with SMTP id g14mr30466682otj.317.1562162431069; 
 Wed, 03 Jul 2019 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190703133104.3211-1-emil.l.velikov@gmail.com>
 <20190703133104.3211-2-emil.l.velikov@gmail.com>
 <9237e00e-2e10-4961-a759-19f0cb75a1fb@email.android.com>
In-Reply-To: <9237e00e-2e10-4961-a759-19f0cb75a1fb@email.android.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jul 2019 15:00:40 +0100
Message-ID: <CACvgo51MdDQSyf=a_gpFA66KepsDBcxZo66aZ_B6m9apvBJMhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3jDKghcGx8Rqud/e2wrQe2rdlSLjtFm6gll0bHfKWH4=;
 b=t3v13KUlXMFbS+tbmN0Hwe5iguk5Fh6YHmS2+ancbyjEUT46i9O6s8KM28hshovDMt
 GEn7bGF2Ar5ae7zCLetOc8jqKmdamRbrisZjun7BnpaDdzR8i7XH0zwXTImVO7Nxx4Q8
 WKXlAdpJXZqsDUY+QlnGIqfm2RbC+efvdPPTJ/Il/hY/S93pZhhEznfZL5zSmdrgrFPJ
 BuhSs3Y3x5eyK36fW7ElJjitMdAUe1STXa3sI+knbVQZQsB+J6Lfm93Gi/pJoYC0m3iH
 siLZMoZZVnx5IZl+XrwzZioG4F+L0w2/bYbXSH1u7LPsoW8RxzZOhl4eRz+AJwj0z2W6
 dtxg==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDE0OjQ4LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFdlbGwgdGhpcyBpcyBzdGlsbCBhIE5BSy4KPgo+
IEFzIHN0YXRlZCBwcmV2aW91c2x5IHBsZWFzZSBqdXN0IGRvbid0IHJlbW92ZSBEUk1fQVVUSCBh
bmQga2VlcCB0aGUgZnVuY3Rpb25hbGl0eSBhcyBpdCBpcy4KPgpBRkFJQ1Qgbm9ib2R5IHdhcyBp
biBmYXZvdXIgb2YgeW91ciBzdWdnZXN0aW9uIHRvIHJlbW92ZSBEUk1fQVVUSCBmcm9tCnRoZSBo
YW5kbGUgdG8vZnJvbSBmZCBpb2NsdHMuClRodXMgdGhpcyBzZWVtcyBsaWtlIHRoZSBzZWNvbmQg
YmVzdCBvcHRpb24uCgpUaGlyZCByb3V0ZSB0aGF0IEkgc2VlIGlzIGRvaW5nIGRyaXZlcl9uYW1l
ID09ICJhbWRncHUiIHx8IGRyaXZlcl9uYW1lCj09ICJyYWRlb24iIGluIGNvcmUuCklmIHlvdSBo
YXZlIGFsdGVybmF0aXZlIHNvbHV0aW9uIEknbSBhbGwgZWFycy4KCi1FbWlsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
