Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E144A828B5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 02:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624156E1B7;
	Tue,  6 Aug 2019 00:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C16E1B7;
 Tue,  6 Aug 2019 00:34:07 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id p197so59453288lfa.2;
 Mon, 05 Aug 2019 17:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8O+75KTG7qaPfsCrb2Ll/r7nCFoYCmo2rFBGeTY5do=;
 b=HX0BAe/Sjgx20VIH9VxNbnLbJsb4j7hRdLzg2v7kAAVNHs1TO5TjhQm9Tz24kheux9
 L5Ygwjj4SapUEQQgaxMc8YY+Q0QZOCqLefu/D9E48u2jTWRnfk5AH1d4nK5x8iBppY1j
 RvzsIlElT7562TCtASlul1/rZm9hZmt6ld/qBm/1l6NIX1Zu10AtkDKNEWPwF2bqfxb2
 4yl52JgUcXBgz097PFdouVLZmXx+2udEqvfykz+V7smu19CHlNvFEF+kHvS+fLENOGSE
 vNxuQ1oQEVls9UoMJl3TQsTCeQZfamccbswwpld1p/lIkUVLePwjvAQSlNQOS2ho0LOI
 Ai6w==
X-Gm-Message-State: APjAAAXg7vRTOiXhrcRj9AqGHubyAuLunwRvFprNhfd/y3IO3L3ubYm3
 JYvrqpDYxNie6MdhKspIuXVOwPFluiBaTvFGaFw=
X-Google-Smtp-Source: APXvYqw+7w76kQzaEWjJXRfHlDpsBGa4LwwNpdWMSsim9NL3gIEel38dwhS+5YZogg3a4xZ04/SrM8s/3wbKslAqxnk=
X-Received: by 2002:ac2:4c12:: with SMTP id t18mr280769lfq.134.1565051645125; 
 Mon, 05 Aug 2019 17:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
In-Reply-To: <20190803104719.gwb6hmreeaqyye6n@flea>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 Aug 2019 10:33:53 +1000
Message-ID: <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z8O+75KTG7qaPfsCrb2Ll/r7nCFoYCmo2rFBGeTY5do=;
 b=MTxfkFKA9B6pecZvhKhRko5O46GB9NosU2yaJBj0JxGUQ9pKSQb2UiC2gtA8uy2IHN
 QSIAfs9QFbit3USIjT53DYwqbrUrmOyFxh6MTRnlNsLsqleqwoF+ePDF+xu5sF75vKlK
 ZDhPMfcJ+lwoeoSclTyDENq+YOt1JvtCJbMDtvodC1TEzWfBcrCfCFIEbutXfne4zeQU
 np/VC/eHCu1OSeudMfbqGhMBlwMR5etdONYVGIDrqiynHYA+oYaku4PpC9MSqUnELyAk
 xI37fhxazJarhuBTT8NK49en76iU1PKAB2CqgXiPvouf2G/SR3JiVTEfbENOMx1HSeJw
 8p7w==
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAzIEF1ZyAyMDE5IGF0IDIwOjQ3LCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIERhbmllbCwgRGF2ZSwKPgo+IEhlcmUgaXMgdGhl
IGZpcnN0IChhbmQgcHJldHR5IGxhdGUpIGRybS1taXNjLW5leHQgUFIuCj4KPiBJdCdzIHByZXR0
eSBiaWcgZHVlIHRvIHRoZSBsYXRlbmVzcywgYnV0IHRoZXJlJ3Mgbm90aGluZyByZWFsbHkgbWFq
b3IKPiBzaG93aW5nIHVwLiBJdCdzIHByZXR0eSBtdWNoIHRoZSB1c3VhbCBidW5jaCBvZiByZXdv
cmtzLCBmaXhlcywgYW5kCj4gbmV3IGhlbHBlcnMgYmVpbmcgaW50cm9kdWNlZC4KPgoKZGltOiA0
MTVkMmU5ZTA3NTcgKCJSZXZlcnQgImRybS9nZW06IFJlbmFtZSBkcm1fZ2VtX2R1bWJfbWFwX29m
ZnNldCgpCnRvIGRybV9nZW1fbWFwX29mZnNldCgpIiIpOiBtYW5kYXRvcnkgcmV2aWV3IG1pc3Np
bmcuCmRpbTogYmU4NTUzODJiYWNiICgiUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2Vt
X21hcF9vZmZzZXQoKSIiKToKbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgpkaW06IGU0ZWVlOTNk
MjU3NyAoImRybS92Z2VtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgpt
YW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCmRpbTogODgyMDlkMmM1MDM1ICgiZHJtL21zbTogZHJv
cCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKbWFuZGF0b3J5IHJldmlldyBtaXNz
aW5nLgpkaW06IGNjZGFlNDI1NzU2OSAoImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBk
cm1faW52YWxpZF9vcCgpIik6Cm1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KClByZXR0eSBzdXJl
IHJldmlldyBpbiBkcm0tbWlzYy1uZXh0IGlzIGEgcnVsZS4gSSBkb24ndCBldmVuIHNlZSBhY2tz
Cm9uIG1vc3Qgb2YgdGhlc2UuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
