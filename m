Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC730A429
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 10:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1A6E52E;
	Mon,  1 Feb 2021 09:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9A6E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 09:15:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y14so6030086ljn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 01:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iH/u1v9633tZp53DfPGofrXYijYUz7l4gThb28mt2OU=;
 b=IJ8dMST09U91CykhFVYKsgrl+i/1URg5hwD8RvddnWN0PuSd3Y8/vGcKxapO1nyYQb
 O+ir2Maf6hHsT4zQ1Y0pbzUwxBSnnCkjAQ/AiA+eohRNiJ71XyR23Nj9R7h/wmT5s8pX
 O1PK9fKv6UyIL7eKCImHX/kUzp0NrMWmbjfFNw9GIMSUGaOWgByBkKpxlRvXHamLaA5H
 fXcM+m9KUKu5w6T3eeZr1l128KNewRcZXSUX0f0yqPBUec4wWSV1YQL5L4FACJFOu+rH
 djsf+5DF2vAvQXHX1iA3LzWD/3dt2Gb2TnkDXs5hLTWIPqncbG//YmxNk4m2FGFnqvqe
 sl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iH/u1v9633tZp53DfPGofrXYijYUz7l4gThb28mt2OU=;
 b=uSWd4B+by7U5o1QLLGQA8kQdJMrR/ARLux1FGSCO7ZrGMBHEht4Zch1ut+a8z2skUv
 5/UuD+XtN9Bh5q798+LMQb238n7OM07kjWxDO+vecY/KDH6U4BOswGyUqPnvi+c3xvgI
 3d16KUtFFvFA/6BEXzoZgRfNWbavO5O5/MxX9PqhIusG+XgdSrp+TT6t28vRqZZJOTzX
 GV9VGhUbqMVkO9oe8BEDc2CHgDRTxyBbSMqrVLHx7LYJgKsIAmuzI1bbNA//jfTGB0sC
 ebwJ6EvEa9qDST21+/+oMfhuKmriYIpPQku8SCIJlJ8QF6Lk0w/TbSaEKqgXoN0e1LBq
 wbLg==
X-Gm-Message-State: AOAM530DeBYLVtqhBvsdc2MKaEMOkWt8jt1n21U1CFG0u+6/lvpytIwk
 KWtQ9etZrAEhaITiLTDIpQQ/Lmxsbu51aPPSR/8=
X-Google-Smtp-Source: ABdhPJzkrJf3tGSfgb4O/OUCYfu/O+6UP9ibMjh0EtJMPsIhuHRS8JQXShiotlbQlevwreQcxv0YkKXj7nqgbufQ0zE=
X-Received: by 2002:a05:651c:1390:: with SMTP id
 k16mr9477452ljb.205.1612170900057; 
 Mon, 01 Feb 2021 01:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-2-tzimmermann@suse.de>
 <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>
 <542864ec-aae6-9382-337a-c8631d88d016@suse.de>
In-Reply-To: <542864ec-aae6-9382-337a-c8631d88d016@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 1 Feb 2021 10:14:49 +0100
Message-ID: <CAMeQTsbgO40UryWTQGYN=z=Ff+7hMknNxuzAxqdy-D_LEc76kw@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/gma500: Remove Medfield support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMSwgMjAyMSBhdCA5OjIzIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpIFBhdHJpawo+Cj4gQW0gMjkuMDEuMjEgdW0gMTU6
MjUgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOgo+ID4gT24gRnJpLCBKYW4gMjksIDIwMjEgYXQg
MTA6NTYgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+
ID4+Cj4gPj4gTWVkZmllbGQgaXMgYW4gb3V0ZGF0ZWQgbW9iaWxlIHBsYXRmb3JtIHdpdGggYXBw
YXJlbnRseSBubyB1c2VycyBsZWZ0Lgo+ID4+IFJlbW92ZSBpdCBmcm9tIGdtYTUwMC4KPiA+Pgo+
ID4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pgo+ID4KPiA+IEdyZWF0LCBmaW5hbGx5IHdlIGdldCByaWQgb2YgdGhhdCBEU0kgY29kZSA6KQo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5yLmpha29ic3Nv
bkBnbWFpbC5jb20+Cj4KPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIG1lYW5pbmcgb2YgdGhlIFMt
by1iIHRhZyBoZXJlLiBDYW4gSSBjb3VudCB0aGlzCj4gYXMgYW4gQS1iPwoKSXQgbWVhbnMgSSds
bCB0YWtlIHRoZSBwYXRjaCB0aHJvdWdoIG15IHBhdGggKHdoaWNoIGlzIGRybS1taXNjIGluIHRo
aXMgY2FzZSkuCgpJIG5vcm1hbGx5IEEtYiBzdHVmZiB0aGF0IGlzIHBhcnQgb2YgYSB3aWRlciBz
ZXJpZXMgdGhhdCBJIHdpbGwgbm90CnRha2UgbXlzZWxmIGFuZCBTLW8tYiB3aGVuIEknbGwgdGFr
ZSBpdC4KCi1QYXRyaWsKCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+ID4KPgo+IC0tCj4g
VGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xo
cmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
