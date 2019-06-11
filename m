Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2F3C6F8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 11:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE25C89154;
	Tue, 11 Jun 2019 09:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2B989154
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:06:04 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r10so11147486otd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 02:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rwXJ0N12YFLwa3eVVBLbd7agid8j+bBmrKd/BuMAQiU=;
 b=UfzLLeJIBSzwXrEyEnzcfn0Ilb/UkZ+dONa3AglaThSMH/hLij3EUF8wPNBcS0XO6M
 IUD79zyEnkysSm92q2DyjQMqT4T7QzZ4WQ7HHcnOEu1rDpkHCI0W/W5q2DejcNIFQ5RG
 AoGhkTtzQF6Za2mOiZ35RXfVV8vzNLfDd39wBeGJKVeVLSb1ylIRSPV9FX+AB5v5JY4m
 z8xK1at+bMZKfU+HPcIQzjPKjyEMwp54nhSHs+RA5M4ehqDKO97bAS6/Inz3E1CoVrkQ
 rQ/CcWQ5x/gDaprlLMMApzWq2qaU3UwLZtDxf8YWu77g6p86tRGfk66ucKfwqFwXEBwo
 xolg==
X-Gm-Message-State: APjAAAUgoI5/9imDBBi6YUFbsc3aCTI/2S9p0npN9LN7i0dC5Ia5lMl5
 640MGuUKmcFmO0tbGZ3cWNeBb1UU9k21+NcoFDeZbg==
X-Google-Smtp-Source: APXvYqwt5kZU7hIpkWm84uXzdUMrPiTBicmCiNGzeSrhCoNIMPJy4+6RoWMUsldwEhyEIw/4xp2QBOwFT1bi+jIWYPo=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr32393993otp.106.1560243963973; 
 Tue, 11 Jun 2019 02:06:03 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 11 Jun 2019 11:05:52 +0200
Message-ID: <CAKMK7uHXF-ZyVjz1UTOZvSn_TxXMFwjiDz8cYGmwzzpWHNcTyw@mail.gmail.com>
Subject: 5.1 backport request
To: stable <stable@vger.kernel.org>, Dave Airlie <airlied@linux.ie>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rwXJ0N12YFLwa3eVVBLbd7agid8j+bBmrKd/BuMAQiU=;
 b=DsUPLa7LCfch9zRy/io0G7X75mksebnmHPsCdAHYt9k7o48Xp45CvOqTXFWAuZSz7P
 9ghAVBrDBjTT9piadvsFYmZiLgAcunqzMT49u4pChgIOR4ziZN03szKDxIgf0BcKs14x
 f1wrIQFRbwDDw/NH60x4yMljZyH2If4elyyVw=
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgc3RhYmxlIHRlYW0sCgpQbGVhc2UgYmFja3BvcnQgZGJiOTI0NzE2NzRhICgiUmV2ZXJ0ICJk
cm06IGFsbG93IHJlbmRlciBjYXBhYmxlCm1hc3RlciB3aXRoIERSTV9BVVRIIGlvY3RscyIiKSB0
byA1LjEsIHdlIGFjY2lkZW50YWxseSBmb3Jnb3QgdGhlIENjOgpzdGFibGUgYW5kIEZpeGVzOiBs
aW5lIGZvciB0aGF0IHJldmVydC4gVGhhbmtzIHRvIE1pY2hlbCBmb3Igc3BvdHRpbmcKdGhpcy4K
CkRhdmUsIGZvciBuZXh0IHRpbWUgYXJvdW5kIHRoZXJlJ3MgJCBkaW0gZml4ZXMgJGJyb2tlbl9z
aGExCgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
