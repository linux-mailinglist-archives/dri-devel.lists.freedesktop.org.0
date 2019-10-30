Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E195EAC21
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE556EDD4;
	Thu, 31 Oct 2019 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039676E934
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 10:29:38 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id t26so2485819qtr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 03:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=czU7HzP6DFG+QGZIivdRBvNS5jNlduf8mAt1YzDvVTQ=;
 b=firuLmX8YnJuDr1ylhr3poupHUIlp25aUP2244/pKH1gGSv1SDZg1nHv33IzQdln1l
 KSk45rpZhz8IZi/9n9lag5tZrtTToaPI6x8HP5kff7jvWs+j5Fnf6XEmrHXKd81FmuEF
 15mDowK0Im7jP4ulBISfY0n76WLrc7QYKhGyu6EYp6B2jtn1pyGJrY9r1+pyg9TU5FB1
 2AvDrUbtLmzx6PnRzewDA8EpI52RhL5nkmQEvdq/N4lux22XBlg7nrU3pVWY4dT8o0uh
 3Jvczm2w+Zij7utq50oC3w3LFXUzYpt9eBikRjLP23CIYFxKhg5j0cAX+wwDnfGwgdRu
 GAdQ==
X-Gm-Message-State: APjAAAUu0jKy72TFuNLL4c9zozoz5Nuf+RmoIjJgdu1f9Kp203ZlJVgv
 wDT5NX9o8ZYeRz4czXqQTQx8f8V/hVjzZ2vh8meqWw==
X-Google-Smtp-Source: APXvYqyY5T2WwdX0mJSYsnJh3/hfizo9f9VHhqy+xUHwQ3zrHKLOjhlGB6++spXWfoRSWXGeqmjHu6gLX3V8BxO6H64=
X-Received: by 2002:ad4:43e5:: with SMTP id f5mr27717464qvu.37.1572431377931; 
 Wed, 30 Oct 2019 03:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAB4CAwcMqyOLJFPcVyoGuiXo-ujeyzL2TJkpZ3qAc1HymJ2x7A@mail.gmail.com>
In-Reply-To: <CAB4CAwcMqyOLJFPcVyoGuiXo-ujeyzL2TJkpZ3qAc1HymJ2x7A@mail.gmail.com>
From: Chris Chiu <chiu@endlessm.com>
Date: Wed, 30 Oct 2019 18:29:26 +0800
Message-ID: <CAB4CAwdsiknt99wk7akPFtsC6GQHtCViecB8k1QZW7-OW5ffvg@mail.gmail.com>
Subject: Re: Unexpected screen flicker during i915 initialization
To: Jani Nikula <jani.nikula@intel.com>, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>, daniel@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=czU7HzP6DFG+QGZIivdRBvNS5jNlduf8mAt1YzDvVTQ=;
 b=xdNyogpac3p0FXHke3oPRulvO/IxkuAWDR0O0Nne+5pOEOjBIxFW8YjEep/S/4uiob
 iBC+kiOv1hL6/bnDvQIEflQFK64XqzIjIdH9griQU8Rq+L7unmcwa17TOW9kj1iD6PDJ
 9BGjVnYwQljoLGxHbv4bUS3CxH+WMBh43hXm2VpViujVyYhNhz948P3ey+0kCYwLbzlc
 SbeVKYj27oTxlHDZ69u/7RvKp9y2MVeXOLFVatbR57PIKOogDr3jLv8SCQX8rSFUXKA+
 uuJHugeXxnLU6oX3fF2Nv7qC6caMQxUzBaMHAk1xLlfG8dHrG+spE8Fo1w0Wc9gOdUNJ
 GHow==
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgNjoyNSBQTSBDaHJpcyBDaGl1IDxjaGl1QGVuZGxlc3Nt
LmNvbT4gd3JvdGU6Cj4KPiBIaSBndXlzLAo+ICAgICBXZSBoYXZlIDIgbGFwdG9wcywgQVNVUyBa
NDA2TUEgYW5kIEFjZXIgVHJhdmVsTWF0ZSBCMTE4LCBib3RoCj4gcG93ZXJlZCBieSB0aGUgc2Ft
ZSBJbnRlbCBONTAwMCBHZW1uaUxha2UgQ1BVLiBPbiB0aGUgQWNlciBsYXB0b3AsIHRoZQo+IHBh
bmVsIHdpbGwgYmxpbmsgb25jZSBkdXJpbmcgYm9vdCB3aGljaCBuZXZlciBoYXBwZW5zIG9uIHRo
ZSBBU1VTCj4gbGFwdG9wLiBJdCBjYXVnaHQgbXkgYXR0ZW50aW9uIGFuZCBJIGZpbmQgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGVtCj4gYnV0IEkgbmVlZCBoZWxwIGZvciBtb3JlIGluZm9ybWF0
aW9uLAoKU29ycnksIEkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0aGUgcHJvYmxlbSB3YXMgcmVw
cm9kdWNlZCBvbiB0aGUKbGF0ZXN0IGtlcm5lbCA1LjMuCgpDaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
