Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660B5F37A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68216E27F;
	Thu,  4 Jul 2019 07:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845AA89A16;
 Wed,  3 Jul 2019 15:18:03 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m24so5695717ioo.2;
 Wed, 03 Jul 2019 08:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tBeQ15keJRuzad4ERXIDpILI/nTmHRA/IZ5Wy12SIY=;
 b=qhYB3p8sepqvW95x0BNiKTjH3lgsNj1Fbe2lqg6SlyxzCtbAp+952Ed5GGvKmsRDbr
 1lspcjxIPjZmyuwLuCWdHutHHsC1pzJC1JHo2NGmcIYM0mQ7sVhNy8YDThNDQdwG1iva
 hWZ2dhlZhJf9ZjsITG00Q6RBKFz9qNxeB3Fs4/GAekRmUcAMPITe7FtANbrQ8+/Gt+Rt
 KiOPpn2Fx/t48qS3iC30GVzC5F90Y8GCX8iy33k0nA+DpPiO629lG/Czp2jxcqpr7Cun
 OcaiWJdl8xdUzoNsB7hoDArz5VY2x5y7xJ2oek4WSUKaKDs6pH+JmbwDM/pGd3T4lwnn
 wfJw==
X-Gm-Message-State: APjAAAXnXQ4+F7qdBjA86pujE1mrUgc4+Nl59Vgvi+Qxkevswb25KNh8
 30r565N0FPJXQbGK/Cxa/PoJLLYjmBEmmWntwbepfw==
X-Google-Smtp-Source: APXvYqynbo0TvCuoYXiCZt+eOeNeSj1rTV/qRqThMPaa0pfxvV2Mi/VojWfBO0/yJi3CyvK++1xCXJsBnVwJOSOnsE8=
X-Received: by 2002:a02:bca:: with SMTP id 193mr43442848jad.46.1562166607574; 
 Wed, 03 Jul 2019 08:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
 <20190703040843.GA27383@builder>
 <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
In-Reply-To: <CAF6AEGvwMj+R6KbFYbatx8AuF+5mztc7246ocKXfRWnpphv9NA@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 3 Jul 2019 09:09:57 -0600
Message-ID: <CAOCk7Nr_LYhGOcUCMA83MQ8Xc4zRPfNcSkD6aGJFAcD_udDU-A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4tBeQ15keJRuzad4ERXIDpILI/nTmHRA/IZ5Wy12SIY=;
 b=Kwjl9r08+wXXoiN7tk3DWvDtFrJpEccsm62jss4sY9SfrWV26ulm9a3JOfJUxHmx7N
 ehnLYqfv1Bt9MXCPQtbN5rT42RI4XGhCDypgyS9k5Tfir6+5Nu1f/Hqphsyay/q/l4NA
 cA6nHKqA6BXqsZfKoGe4YBQ6tF22kOQ/o2u6LwBr9PY0WPF2rGrJLEchvXtnf4jMV607
 FH7GaCt/uON5U/+J0ntxesMHutIiyrchvocnI1k+FuPUgEcEBqOoA2aZo3Cmee9uUUjj
 +jdhx2TJH6g0kj5g/7R7WRR8+8zlr/C2poqXaeVNeakFCFDvMgpp6fdaFb+YyyIbVG7N
 ZP2A==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCA2OjI1IEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAyLCAyMDE5IGF0IDk6MDggUE0gQmpvcm4gQW5k
ZXJzc29uCj4gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBN
b24gMDEgSnVsIDEwOjM5IFBEVCAyMDE5LCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPgo+ID4gPiBD
cmVhdGluZyB0aGUgbXNtIGdlbSBhZGRyZXNzIHNwYWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRv
IHRoZSBkZXYgd2hlcmUKPiA+ID4gdGhlIGlvbW11IGlzIGxvY2F0ZWQuICBUaGUgZHJpdmVyIGN1
cnJlbnRseSBhc3N1bWVzIHRoaXMgaXMgdGhlIHNhbWUgYXMKPiA+ID4gdGhlIHBsYXRmb3JtIGRl
dmljZSwgd2hpY2ggYnJlYWtzIHdoZW4gdGhlIGlvbW11IGlzIG91dHNpZGUgb2YgdGhlCj4gPiA+
IHBsYXRmb3JtIGRldmljZS4gIFVzZSB0aGUgZHJtX2RldmljZSBpbnN0ZWFkLCB3aGljaCBoYXBw
ZW5zIHRvIGFsd2F5cyBoYXZlCj4gPiA+IGEgcmVmZXJlbmNlIHRvIHRoZSBwcm9wZXIgZGV2aWNl
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdv
QGdtYWlsLmNvbT4KPiA+Cj4gPiBTb3JyeSwgYnV0IG9uIGRiODIwYyB0aGlzIHBhdGNoIHJlc3Vs
dHMgaW46Cj4gPgo+ID4gWyAgIDY0LjgwMzI2M10gbXNtX21kcCA5MDEwMDAubWRwOiBbZHJtOm1k
cDVfa21zX2luaXQgW21zbV1dICpFUlJPUiogZmFpbGVkIHRvIGF0dGFjaCBpb21tdTogLTE5Cj4g
Pgo+ID4gRm9sbG93ZWQgYnkgMyBvb3BzZXMgYXMgd2UncmUgdHJ5aW5nIHRvIGZhaWwgdGhlIGlu
aXRpYWxpemF0aW9uLgo+Cj4geWVhaCwgdGhhdCBpcyBraW5kYSB3aGF0IEkgc3VzcGVjdGVkIHdv
dWxkIGhhcHBlbi4gIEkgZ3Vlc3MgdG8gZGVhbAo+IHdpdGggaG93IHRoaW5ncyBhcmUgaG9va2Vk
IHVwIG9uIDg5OTgsIHBlcmhhcHMgdGhlIGJlc3QgdGhpbmcgaXMgdG8KPiBmaXJzdCB0cnkgJnBk
ZXYtPmRldiwgYW5kIHRoZW4gaWYgdGhhdCBmYWlscyB0cnkgZGV2LT5kZXYKClRoYW5rcyBmb3Ig
dGhlIHRlc3QgZmVlZGJhY2sgQmpvcm4uICBJdHMgdW5mb3J0dW5hdGUgdGhpcyBzb2x1dGlvbgpk
aWRuJ3Qgd29yayBhcyBJIGV4cGVjdGVkLiAgSSdsbCBnaXZlIFJvYidzIHN1Z2dlc3Rpb24gYSBz
aG90IGFuZCBzcGluCmFub3RoZXIgdmVyc2lvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
