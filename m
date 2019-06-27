Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F657969
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 04:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D096E580;
	Thu, 27 Jun 2019 02:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5296E580;
 Thu, 27 Jun 2019 02:21:53 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id p17so649868ljg.1;
 Wed, 26 Jun 2019 19:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRhh2BLMZL95EMjVW2in5uISjMR/OjhejEPFgKSUvXM=;
 b=hNuIMnP8b4PKirjwpcfrh7rNmlWB96X7Z25iJ3OvCgjoOtumKvF5AubiAOyv1xk4sg
 Fk+pKtWAtV5W5piV21iZMGqPk0qMTJIh/2c+RC4Hgt/NcLiZCF67kUYsEvWZouYvyXy1
 k2EKxFSZZom45TKc5C/ZWeFq6a4nCXtKqal2LID1j5p7eS+l/yLWcWuEeqfg4XZ5rSaJ
 Q0XVxOv4BuOFIveWpiNcaz8ZPyEKBpBftC8zo8Yv9oRdk/Bi/tRsOtcwpYYryDB58rh7
 zHhvGM8XcglnMb+g4H7R/Jg6BZLYQRNXGJZV9zhK13HdvZgYvB4stcSjd2pFTp+vlbzW
 Oz+g==
X-Gm-Message-State: APjAAAVspGlD8ES4v7JrjxrEyUUGlJY7BdF0PD3LXbUMIukaMIHV3IJX
 qW6Jpv9ruDWjkYLzUPab9FQ5ug8B9lzzSBIwrac=
X-Google-Smtp-Source: APXvYqxqJ/BTGNE5tosMdEVYJoTmCd9DGd6+UWGNZDmQGmFo1PU2KIrEjbyCeARqJ4YNIKD30UsMO1ljccBByn7JSO0=
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr851068lji.188.1561602111271; 
 Wed, 26 Jun 2019 19:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
In-Reply-To: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Jun 2019 12:21:39 +1000
Message-ID: <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
Subject: Re: [pull] drm/msm: msm-next for 5.3
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RRhh2BLMZL95EMjVW2in5uISjMR/OjhejEPFgKSUvXM=;
 b=nrCIngIDKNrFoCwFgn6/okDJclVnto0cZ2YimrTJ3yOMp12imq8hQEshF237VELdQz
 FgbQVvhVKEaUYW+FXxTbwnEEc2ghU8LbALSMCZ+lWNl6baQbdwb1UFlKrhJ1l1kC5vY5
 t6aIArR503EMgFLZKOYiKZm5x0PamvKNok1VuBfO9AOGv5W/BK7niLt6kHDwcYLlxnX4
 vpiZKZuWGeeujHWx2nrY4zQ2bJq1BmfxqflIxw232AUd2lsyfwQ+NuwaZBUWjEJZuXuT
 LZG7ueV8hYwRUzMVTWqJVFCyx2Y16ac9RZOM0dEMcuWTPHxPfJe9p1zBpeHzxObQHUHc
 m+zw==
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
Cc: Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSBhdCAwODozNCwgUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEhpIERhdmUsCj4KCk5hdWdodHkgbmF1Z2h0eSByZWJhc2UuCgpkaW06
IGY0N2JlZTJiYTQ0NyAoImRybS9tc20vYTN4eDogcmVtb3ZlIFRQTDEgcmVncyBmcm9tIHNuYXBz
aG90Iik6ClN1YmplY3QgaW4gZml4ZXMgbGluZSBkb2Vzbid0IG1hdGNoIHJlZmVyZW5jZWQgY29t
bWl0OgpkaW06ICAgICA3MTk4ZTZiMDMxNTUgZHJtL21zbTogYWRkIGEzeHggZ3B1IHN1cHBvcnQK
ZGltOiBmYzE5Y2JiNzg1ZDcgKCJkcm0vbXNtL21kcDU6IEZpeCBtZHA1X2NmZ19pbml0IGVycm9y
IHJldHVybiIpOgpTdWJqZWN0IGluIGZpeGVzIGxpbmUgZG9lc24ndCBtYXRjaCByZWZlcmVuY2Vk
IGNvbW1pdDoKZGltOiAgICAgMmUzNjJlMTc3MmI4IChkcm0vbXNtL21kcDU6IGludHJvZHVjZSBt
ZHA1X2NmZyBtb2R1bGUpCgpQbGVhc2UgZml4IG9yIHNxdWFzaCB0aG9zZSBhbmQgcmVzZW5kLgoK
RGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
