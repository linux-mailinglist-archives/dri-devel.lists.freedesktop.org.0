Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2672EE7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE05E6E4ED;
	Wed, 24 Jul 2019 12:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990096E4ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:33:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b17so31856579lff.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7kS5ybLEu9f+0d0ORBluh1Iea1DKw9wPyo+P2zv7nU=;
 b=XMYXFB4nsA1/VILq5rgQ/tuZnlQxvAoRhEjRljly16ZHPWx7PJoEf7Oy4j4Vy//bmU
 mlnf0jV6HxdqvaXu6v7w1m9bFnPpJpMq+6q5zkukSHD/Z0gCEI+qQpgLKTCcmzr0G6s2
 uaL3+YbD/fsfQ/C6TFaaZ0F7EcU/refxA6kROIgx6cQvziPIyfUqM2/LO6K/ClEhkE6c
 fcQOfwg+lb6PxLXdNtip83VD6ZNGRMoL4BqQ+OY8K2o7L2XUOF9gFe29eyM1atKJNWQM
 ljP297CwJWYcyuzqxE9wfdR+f6ciMC+nZLojntfPfx0VmKP8z51B4I9ApEFLNHNTFp+0
 TwgQ==
X-Gm-Message-State: APjAAAV/siv0ImrakPHbzrZoKhtCnPTnNkGUXVg25zf9D0xPDuMGBo5J
 M4fTKXLOOb8v/0dpIOb0r55RXttKqIlpdwKkLpj/SJJL
X-Google-Smtp-Source: APXvYqxF9+lZImdaWVw2qDAanbZBmG/zxRqdtKg/JeSUyBHG5btyFc/m0EUT/jR3A7N9H66HWGbnKaViaV05x6HnPu0=
X-Received: by 2002:a19:7616:: with SMTP id c22mr39077348lff.115.1563971598026; 
 Wed, 24 Jul 2019 05:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-2-linus.walleij@linaro.org>
 <1709073.y2qmsckc0Q@linux-e202.suse.de>
In-Reply-To: <1709073.y2qmsckc0Q@linux-e202.suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Jul 2019 14:33:06 +0200
Message-ID: <CACRpkdYAgLJ9asftN5EafeN5EVEyH_xHVdwjbecZqvgz-JJ98A@mail.gmail.com>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
To: Fabian Vogt <fabian@ritter-vogt.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=X7kS5ybLEu9f+0d0ORBluh1Iea1DKw9wPyo+P2zv7nU=;
 b=U5LKoKOHcjVoVpEjsIlvqHSGVMxp0l/IvE/3HS3WSSzG3rIaHsjERsN3xAJcKhHiBZ
 agNocCeScCzkjLkEcV78/wF5qEJzanfry+P55q13YsSD847Y3zlhgxel7MnYXK8SvMbu
 pf3sNFjzjsMDtE6d0kG9CYq355vNcgo3eQe79fOO5BfouaKJG1rW9gXpL8kFAig0HIJb
 a0uydKJdkyi0zb6SUEu4g1yMmXyOWwvCTBkNJbjS20bzRwVKwrsFKiIkTardEcWeDPvF
 mkQh/cqUw0FVWtaXX7SQII1T1D86RDgy6qiHH8/NDLevmFyCz33+z9d4P/nJpFYbCHPx
 Br0A==
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
Cc: Daniel Tang <dt.tangr@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNToxOSBQTSBGYWJpYW4gVm9ndCA8ZmFiaWFuQHJpdHRl
ci12b2d0LmRlPiB3cm90ZToKCj4gSSBnYXZlIHRoZSBzZXJpZXMgYSB0cnkgKHZpcnR1YWwgQ1gg
YW5kIFRQIHNvIGZhciwgd2lsbCBkbyBvbiBhIHJlYWwgQ1ggbGF0ZXIpOgo+IE9PUFMgd2l0aCBh
IG51bGxwdHIgZGVyZWYgZHVyaW5nIHByb2JlLgo+IFRoaXMgZGlmZiB3aGljaCBqdXN0IG1vdmVz
IHNvbWUgbGluZXMgYXJvdW5kIGZpeGVzIHRoYXQgYW5kIHRoZSBMQ0QgYXBwZWFycyB0bwo+IHdv
cmsgcHJvcGVybHkuCgpPSyBJIGZvbGRlZCB0aGlzIGludG8gbXkgcGF0Y2gsIHRoYW5rcyEKCj4g
T25jZSBJIHZlcmlmaWVkIHRoZSAyNGJpdCBkZXB0aCBhbmQgY2xvY2sgc3BlZWQgY29uZmlnIG9u
IEhXIGFzIHdlbGwsIEkgY2FuCj4gZ2l2ZSB5b3UgbXkgVGVzdGVkLWJ5LCBvciB3b3VsZCB5b3Ug
cHJlZmVyIHRoYXQgSSByZXN1Ym1pdCB5b3VyIHNlcmllcyB3aXRoIHRoZQo+IGZpeCBiZWxvdz8K
Ckl0J3MgZmluZSBpZiB5b3UgdGVzdCBpdCBqdXN0IHdpdGggeW91ciBwYXRjaCBhcy1pcywgSSBk
aWRuJ3QgY2hhbmdlIGFueXRoaW5nCmVsc2UuCgpJIHdvdWxkIGJlIGFtYXplZCBpZiBpdCAianVz
dCB3b3JrcyIgbm93LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
