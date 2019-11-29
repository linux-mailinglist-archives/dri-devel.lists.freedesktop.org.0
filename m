Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774E10DDB3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B516E107;
	Sat, 30 Nov 2019 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C96E99F;
 Fri, 29 Nov 2019 20:16:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 21so1509712ljr.0;
 Fri, 29 Nov 2019 12:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/o9QO+OTkUrAkPVwBsYCrg637ZIGXxFSYV4h1auTC4=;
 b=fS6711UcxskCdxHzcCYX7nKUdcZa+TXrQqWFbZUn+frDwNtl1bEDY7ZN2n2g+29EKl
 P3LzpDKLBG2mNFOyVOG/ctRNr3saECC3Y+HtutxcIc8s4cDfyKvdCp6r+NvgkW92DgyQ
 a73a9NfbkMRABQYF3nsnMcLzjt/RRAroXaa75iEW6c9YqSNNjyi7+ZPWIwWGurYnIpbO
 NvPvj5b05UJLwQ1ZHdbkGRl+/uN8wS3V7bnYOOdK/9nCHoxzT8Ft68sERDxU41iqqcFj
 LdVDTcOPegdlQimqKG+n+V+Ut/nRuaaAyhYG7hYXjPIIgt1UO1Jpr/vJaPkBa6DjYC61
 /t9Q==
X-Gm-Message-State: APjAAAUXdZimswW0l4TAXFWimVkeuDHjMPQvv7oON6kJr5pmqNDQiamf
 wd/7uMN4LKDTECstRWkuLTy1SGYYMOyDT8nMkGU=
X-Google-Smtp-Source: APXvYqyRZ1DbVGmEx2KN+XiIKlg0OpG3Nc9KVZrQtWxEa5MzDbC8oykauTyr6y696hArjznX5aIEaeF8QZMFbtpQbCE=
X-Received: by 2002:a2e:8601:: with SMTP id a1mr9634352lji.179.1575058613233; 
 Fri, 29 Nov 2019 12:16:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575022735.git.jani.nikula@intel.com>
 <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
 <20191129152424.GG624164@phenom.ffwll.local>
In-Reply-To: <20191129152424.GG624164@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Nov 2019 21:16:42 +0100
Message-ID: <CANiq72kRGg1AZHC-pR_uKykMxmcMPM2+qbXVPVQhHrZRzu723Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] auxdisplay: constify fb ops
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w/o9QO+OTkUrAkPVwBsYCrg637ZIGXxFSYV4h1auTC4=;
 b=ExFhuhuO77tprALZnWnoxuAuMwoBli1hlmu5MRh3UhlYOp7PzdT5rt43NAzdkr8GHE
 daSYq+gk8bGho/setUK82bknPqsvmiTPakI0KfK7nMC7eky6auHGNpIZR0TH+LA6Gywq
 FZnMX437qmDREPNg8LqK/dTEvWXYSSCC/Ttgp/DW0fdHIJG/Hegj7D5wsnmPWqqhkwLt
 39IjuCWzEgoqQitIE5KH+ETpxcRNQUr9ZePoAnuJwLWDKgTDWVdySb3Rl4hwQiK0vcEf
 +vDD6afQZ6WSqLEHunKNed6Eg7WrSgIrptUK4Sp9rts3Rmy2/8CpB3AiI+nTodTuvkRQ
 y7Nw==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Robin van der Gracht <robin@protonic.nl>, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgNDoyNCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT2gsIGFub3RoZXIgZGlzcGxheSBzdWJzeXN0ZW0/IEludHJpZ3Vp
bmcgLi4uCj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KCkl0IGlzIGludGVuZGVkIGZvciBkaXNwbGF5cyB0aGF0IGFyZSBub3QgaW50ZW5kZWQg
YXMgdGhlIHVzdWFsL21haW4KZGlzcGxheSwgZS5nLiB2ZXJ5IHNtYWxsIExDRHMgOikKClJldmll
d2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5vamVkYS5zYW5kb25pc0BnbWFpbC5jb20+CgpD
aGVlcnMsCk1pZ3VlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
