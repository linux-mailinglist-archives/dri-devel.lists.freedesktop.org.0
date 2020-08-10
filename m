Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E5240747
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 16:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB9189EB4;
	Mon, 10 Aug 2020 14:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C68F89EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 14:13:23 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id z3so7655713ilh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bZQQpI4s5ay74T0qjz+sTc/fW3X7rhK5/XLUmf2LHWQ=;
 b=c8V235ftO796jUkUikLtJC9HQxl1cm4NIjMpUYFpf4W3Ao1L7V5h/zbc3ebdAXi8HT
 vY97N/2gPbRzWt+XMNZ5m6ArBhm2qKwjarHB54hlUuCf4VPe0p7tVjUVwQR2wQIjn3+q
 RsmMqFqJ0OEZiAzxSaoZsJF6LOqK2Q2kZwe+8ACGFBjaZ74Brdd6PfSSp9z2eZiqtkhI
 U8QcPDQP8PqJcaxHaYsGOtMwYqViGwpmYVxoX8aExefmq29igIdIbxBE52JzcHh5Mvzw
 P51BJqlEZkBSAe8Dov6Jb+CpnqE8SzUszGVBmYo1B1SpVzKVa7A5bRI6YfuBvYOrGpIl
 1lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bZQQpI4s5ay74T0qjz+sTc/fW3X7rhK5/XLUmf2LHWQ=;
 b=jc1WORcWgpqb0p7B/CBidTNTDqWrnwjoG/Ty+uLBEMLhS78WyA3Eb8RopQN08NWKn9
 zljThJRJH6Vl1Vj3o6Lq581HufQDwuH2CZa8ttNSCm5x1WJpetIiQ/iRRVE8UWFIg9j7
 rGe9QjbAvYysQqu/o48zYiU46BmK52jUQiwgk+ScW8GXUxGfNSAEUcMat5WCVPx4SG9Q
 uOvpu5O8v0U3r1Vd/Q1iifO5bQ5QJoUepGwSVS4Q8WWpGW3v0+iWIg5+FwAyxXKcuNh+
 UiQlZ6XDeGkAKmZfjYWbbLw3eW0Dqb14KahJ71PlmMfzrnyAFD0ZOAGp+Bo5gO7ZAmMb
 Zl7w==
X-Gm-Message-State: AOAM532Qi3VUiC3t7bpFFhsBpVALMnHLeSaV3z2Qoyw+9sBuvZ+X/sxc
 lYnVmW+xx7bygjoO4nx3I2HcV+E7gk9CFp6CKhugMA==
X-Google-Smtp-Source: ABdhPJzYa5G+p3+rGY0jB6QDoMGPD+ESxdNa2siqaqsJVyjB0hiOWcMFdwN+3qvMZBHQA557ZEozXwx7yXCWhuORCyk=
X-Received: by 2002:a92:9f0b:: with SMTP id u11mr10768749ili.41.1597068801921; 
 Mon, 10 Aug 2020 07:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-7-bas@basnieuwenhuizen.nl>
 <20200805073210.GU6419@phenom.ffwll.local>
 <20200810122820.GJ2352366@phenom.ffwll.local>
 <49e200cd-3df6-8a11-34f4-d1342a79f75e@daenzer.net>
 <20200810130935.GT2352366@phenom.ffwll.local>
In-Reply-To: <20200810130935.GT2352366@phenom.ffwll.local>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 10 Aug 2020 16:13:11 +0200
Message-ID: <CAP+8YyH0ufOc34Bis3PqfUR6XdE+6kRMasfgz1E4XUWJbbmB+A@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/amd/display: Set DC options from modifiers.
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMzowOSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMDI6NDk6MDBQTSArMDIw
MCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gPiBPbiAyMDIwLTA4LTEwIDI6MjggcC5tLiwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+ID4KPiA+ID4gT2sganVzdCBsZWFybmVkIHRoYXQgYW1kZ3B1
IGhhdCBzZXQvZ2V0X3RpbGluZywgc28gSSdtIHVwZ3JhZGluZyBteSBpZGVhCj4gPiA+IGhlcmUg
dG8gYSB2ZXJ5IHN0cm9uZyByZWNvbW1lbmRhdGlvbiwgaS5lLiBwbGVhc2UgZG8gdGhpcyBleGNl
cHQgaWYKPiA+ID4gdGhlcmUncyBhbmQgYW1kIGRkeCB3aGljaCBzb21laG93IHdhbnRzIHRvIGNo
YW5nZSB0aWxpbmcgbW9kZSB3aGlsZSBhIGZiCj4gPiA+IGV4aXN0cywgYW5kIGV4cGVjdHMgdGhp
cyB0byBwcm9wYWdhdGUuCj4gPiA+Cj4gPiA+IEluIGk5MTUgd2UgZXZlbiBkaXNhbGxvdyB0aGUg
c2V0X3RpbGluZyBpb2N0bCB3aXRoIGFuIGVycm9yIGlmIGFuIGZiCj4gPiA+IGV4aXN0cywganVz
dCB0byBtYWtlIHN1cmUgdXNlcnNwYWNlIGJlaGF2ZXMuIEV2ZW4gaWYgdXNlcnNwYWNlIHVzZXMK
PiA+ID4gc2V0X3RpbGluZywgdGhpcyB3YXkgd2UgY2FuIGF0IGxlYXN0IGVuZm9yY2UgdGhlIHNh
bWUgc2VtYW50aWNzIG9mICJjbGllbnQKPiA+ID4gY2FuJ3QgcHVsbCBjb21wb3NpdG9yIG92ZXIg
dGhlIHRhYmxlIHdpdGggYSBzZXRfdGlsaW5nIGF0IHRoZSB3cm9uZyB0aW1lIgo+ID4gPiBvZiBt
b2RpZmllcnMuCj4gPgo+ID4gRldJVywgeGY4Ni12aWRlby1hbWRncHUgZG9lc24ndCBoYXZlIGFu
eSBjb2RlIHRvIHNldCB0aGUgdGlsaW5nCj4gPiBtZXRhZGF0YSwgb25seSBNZXNhIGFuZCBwcmVz
dW1hYmx5IEFNRCdzIFZ1bGthbi9PcGVuR0wgVU1EcyBkby4KPgo+IEFoIHJpZ2h0IHlvdSBkbyBl
dmVyeXRoaW5nIHdpdGggZ2xhbW91ciwgc28gdGhpcyBzaG91bGQgbmV2ZXIgc2hvdyB1cCBhcyBh
Cj4gcHJvYmxlbS4KCkkgdGhpbmsgaXQgaXMgYSBnb29kIGlkZWEgdG8gZG8gc28sIGJ1dCBjYW5u
b3QgZG8gaXQgY29tcGxldGVseSBpbgp0aGlzIHNlcmllcyBhcyB3ZSBkb24ndCBkZWZpbmUgbW9k
aWZpZXJzIGZvciBHRlg2LUdGWDggR1BVIGdlbmVyYXRpb25zCnlldC4gKHdhbnRlZCB0byBsZWF2
ZSB0aGVzZSBvdXQgZm9yIGEgYml0IHRvIHJlZHVjZSB0aGUgc2NvcGUgZm9yIHRoZQppbml0aWFs
IHZlcnNpb24pCgpUaGF0IHNhaWQsIHRoZXJlIGlzIGEgc2VyaWVzIHRoYXQgY2FwdHVyZXMgdGhl
IHRpbGluZyBmbGFncyBvbiBGQgpjcmVhdGlvbjogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy84MDEwOS8KCj4gLURhbmllbAo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
