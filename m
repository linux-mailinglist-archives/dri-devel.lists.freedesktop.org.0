Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE46A046
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409936E047;
	Tue, 16 Jul 2019 01:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00226E047
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 01:32:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id p17so18224322ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MTovimhI6De2cI3DcsVuiEx+QTqzfDNjeAX4Ay9ZtM=;
 b=SuooQ5gkUEEWGUsI5AgwAon8zICF413js2gXCVrMtzm0CgfQD9LyHOHTpnNrxEn0I2
 U5HM/U6rJw9vB9ez8eQJLTMINyloPzzC6MY53SSJXYhCT2n3gWh+ivwzFxZjtD9aDSrT
 T62RUHKiFrGPtW7y/N09mIXcn7GdVB5SI3aDfat7prlmIke7+6XTJNI/h2HGhq6xaT7E
 sSuwDVoEq1NYS4QVcSOTgfKdFyocfgLcwteOaQmqSeXYmRw3DCajecNVVInoFRCUqXpi
 4IM88rPE4K1eESvFCMcDRWS3R1aS5kkRS7LB9/xe+savVU/5DJxqXQcYDlMgDKvNAqQI
 /1vQ==
X-Gm-Message-State: APjAAAXJbxhvGDlb8ooZ6EDpjrsd5yGJCyPpLwoLzhqffcy2Kfg9pm6t
 MpPRGZRSWQeUptbn8KsBDRnpXIAa7y4=
X-Google-Smtp-Source: APXvYqzD11cZ2GRhgSlqRgX2STOzqO5Btl64hUpx1oTWWZiKsc91B7x1TKzA1t+60XnHDHB5ZfqZpw==
X-Received: by 2002:a2e:8681:: with SMTP id l1mr16295883lji.166.1563240718246; 
 Mon, 15 Jul 2019 18:31:58 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id z30sm2829392lfj.63.2019.07.15.18.31.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 18:31:57 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id s19so12376195lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:31:57 -0700 (PDT)
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1828591lfp.61.1563240716994;
 Mon, 15 Jul 2019 18:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txxWeKW1VLWNzLEykELmSCqo_kOHBDdJH-cJfAJXZnnuw@mail.gmail.com>
In-Reply-To: <CAPM=9txxWeKW1VLWNzLEykELmSCqo_kOHBDdJH-cJfAJXZnnuw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 18:31:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8hWQ1xnPAviyMFN1J4VcDsYnfDmGTYbgExZ8zzQdcPQ@mail.gmail.com>
Message-ID: <CAHk-=wj8hWQ1xnPAviyMFN1J4VcDsYnfDmGTYbgExZ8zzQdcPQ@mail.gmail.com>
Subject: Re: [git pull] drm pull for 5.3-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8MTovimhI6De2cI3DcsVuiEx+QTqzfDNjeAX4Ay9ZtM=;
 b=DplOrNfYlV3CrQj7L74n45nVI2h88eVaf8zWeB5KxygHLqJZcLBl432vBPRshqTDX5
 5ILgXHLHe26kJeqyVcc8YvTfzCIx5aCSV3zvP2iPUUByBZ+/Bzb6MAGZc4XamQY11uQR
 TNUcrFNyYYbi+y1doRV4d6WqkMvqni/BD7FdU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MzggQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFRoZSByZWFzb24gSSB3YXMgd2FpdGluZyBmb3IgdGhlIEhNTSB0
cmVlIHRvIGxhbmQsIGlzIGEgc2luZ2xlIHNpbGVudAo+IG1lcmdlIGNvbmZsaWN0IG5lZWRzIHRv
IGJlIHJlc29sdmVkIGFmdGVyIG1lcmdpbmcgdGhpcyBhcyBiZWxvdy4KClRoZXJlJ3MgbW9yZSB0
aGFuIHRoYXQgdGhlcmUuCgpGb3IgZXhhbXBsZSwgdGhlIERSTV9BTURHUFVfVVNFUlBUUiBjb25m
aWcgaGFzIGEKCiAgICAgICAgZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KICAgICAgICBzZWxlY3Qg
SE1NX01JUlJPUgoKYW5kIHRoYXQgd29uJ3Qgd29yayBhbnkgbW9yZS4gVGhlIGhtbSB0cmVlIGNo
YW5nZWQgdGhlIHJlcXVpcmVtZW50cyB0byBiZQoKICAgICAgICBkZXBlbmRzIG9uIEhNTV9NSVJS
T1IKCmluc3RlYWQuCgpOb3csIGFyZ3VhYmx5IHRoZSBobW0gdHJlZSBjaGFuZ2UgaW4gdGhpcyBy
ZXNwZWN0IGlzIGFuIGFubm95YW5jZSAtCnRoZSBvbGQgbW9kZWwgd2FzIG11Y2ggbW9yZSB1c2Vy
LWZyaWVuZGx5IHdoZXJlIHRoZSBkcml2ZXJzIHRoYXQKd2FudGVkIEhNTSB3b3VsZCBqdXN0IHNl
bGVjdCBpdCB3aGVuIGl0IHdhcyBhdmFpbGFibGUuCgpTZWUgY29tbWl0IDQzNTM1YjBhZWZhYiAo
Im1tOiByZW1vdmUgdGhlIEhNTSBjb25maWcgb3B0aW9uIikuCgpJJ3ZlIGRvbmUgdGhlIG1lcmdl
LCBidXQgbXkgdGVzdHMgYXJlIHN0aWxsIG9uLWdvaW5nLiBBbmQgYWZ0ZXIgSSd2ZQpmaW5pc2hl
ZCB0aG9zZSwgSSdsbCBjb21wYXJlIGFnYWluc3QgeW91ciBzdWdnZXN0ZWQgbWVyZ2UgdG8gc2Vl
IGlmIEkKbWlzc2VkIGFueXRoaW5nIGluIHR1cm4uLgoKICAgICAgICAgICAgICAgICBMaW51cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
