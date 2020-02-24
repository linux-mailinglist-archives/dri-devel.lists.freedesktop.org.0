Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23A16AA20
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 16:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D62889FD3;
	Mon, 24 Feb 2020 15:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66A26E530
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 15:30:56 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id k188so5915273vsc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A+rfj58zmooXQX1aPFev1QVBlcTLgw2drFE9Eh3yQxM=;
 b=QSXH1wQHXNCbyxWwJAFhUyN21BpLygn0uWpf1XQHFST3GXm3fribEjTUxo8ufSrBgG
 N5vv2xXFMnP73vYuZBoGER8H5LjCcUaOM4/+QQ3q6QLxW26x9JaiBwFn5/BDJkQXQdai
 gbML1K8eRuRZPRw6GTiyzfGhrUF3E5ngX+904FZOnLgJiBb6Ex8+ZkL8RGMFomNJoRNM
 uwTiLn1Xt53ZQ/yIbLrQXqTMtrk7/2VPPg7rwWIrz1DYXPnN3NAs5ecgrfuQqZWTL1yk
 1DSlPiMHdefsX7kCgW0f6zvtKwuEES1eKx/Qi+3ATC7sKVjwHMqWc429xB8sy0B3ZYxn
 bBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A+rfj58zmooXQX1aPFev1QVBlcTLgw2drFE9Eh3yQxM=;
 b=XWqFlxcY2Biqt+UX74DGDaOl8bkPi1qmwkxhUUHBiq7WugySm28ori8hLsOPDtWjXD
 oREowEppD7NhJMM1JmvkVbqPaxCuBpn21bNSlSmWM++KYjSUn2OiPVa+yZg6qlnPJMrO
 QIzBdUe74rrKxWfY5cfMiCQC8qQZUSdB5wBBfyBEnSxf1wsIhYqhmAZaYYCpM4WH2Q88
 aQJ6ZKHQwJkWjHyDDOV9PIo3ed2v25ligt53xuFlbqig+j20duZEVAYTFer14H8JzsCA
 NLMVnWRrUboX3lrOyxzAUQsFjQ5Q4vZ6kG/iQ9b5kXSHKMqbLgKgYNFQrl+LeU1DSU3x
 sCfA==
X-Gm-Message-State: APjAAAWuKtFVe5eJrwNqec4MGwJC1M8AKDClh8ncBHIVJvmdRefoWEet
 R5n60AVfQo5a0087AmodiBNwmXQcj5I27pO3X1c=
X-Google-Smtp-Source: APXvYqycf0xjncNiwb8B+/PTybmhSM1gJsSY/+3gbMguvmabWldN/5JtY1yZVr3+W8Jbe/vWuAqn6n5oezNLzhosq98=
X-Received: by 2002:a67:fc54:: with SMTP id p20mr27166373vsq.37.1582558255931; 
 Mon, 24 Feb 2020 07:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 15:30:38 +0000
Message-ID: <CACvgo539+Nc616tV2EvJN=x0FJr5cFGewFaYg+yt=1dgVYm17w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Drop DRIVER_USE_AGP
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Xiaojie Yuan <xiaojie.yuan@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMiBGZWIgMjAyMCBhdCAxNzo1NCwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBUaGlzIGRvZXNuJ3QgZG8gYW55dGhpbmcgZXhjZXB0IGF1
dG8taW5pdCBkcm1fYWdwIHN1cHBvcnQgd2hlbiB5b3UKPiBjYWxsIGRybV9nZXRfcGNpX2Rldigp
LiBXaGljaCBhbWRncHUgc3RvcHBlZCBkb2luZyB3aXRoCj4KPiBjb21taXQgYjU4YzExMzE0YTE3
MDZiZjA5NGM0ODllZjVjYjI4Zjc2NDc4YzcwNAo+IEF1dGhvcjogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IERhdGU6ICAgRnJpIEp1biAyIDE3OjE2OjMxIDIwMTcg
LTA0MDAKPgo+ICAgICBkcm0vYW1kZ3B1OiBkcm9wIGRlcHJlY2F0ZWQgZHJtX2dldF9wY2lfZGV2
IGFuZCBkcm1fcHV0X2Rldgo+Cj4gTm8gaWRlYSB3aGV0aGVyIHRoaXMgd2FzIGludGVudGlvbmFs
IG9yIGFjY2lkZW50YWwgYnJlYWthZ2UsIGJ1dCBJCj4gZ3Vlc3MgYW55b25lIHdobyBtYW5hZ2Vz
IHRvIGJvb3QgYSB0aGlzIG1vZGVybiBncHUgYmVoaW5kIGFuIGFncAo+IGJyaWRnZSBkZXNlcnZl
cyBhIHByaWNlLiBBIHByaWNlIEkgbmV2ZXIgZXhwZWN0IGFueW9uZSB0byBldmVyIGNvbGxlY3QK
PiA6LSkKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4g
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Cj4gQ2M6IFhpYW9qaWUgWXVhbiA8
eGlhb2ppZS55dWFuQGFtZC5jb20+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
Cj4gQ2M6ICJUaWFuY2kuWWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+IENjOiAiTWFyZWsgT2zF
ocOhayIgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CgpJJ3ZlIGhhZCB0aGlzIHBhdGNoIGxvY2FsbHkgZm9yIGFnZXMsIGJ1dCBu
ZXZlciBzZW50IGl0IG91dDoKClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
