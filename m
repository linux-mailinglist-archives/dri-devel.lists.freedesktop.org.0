Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43148CA07A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584896E9FE;
	Thu,  3 Oct 2019 14:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419386E9FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 14:39:52 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n14so3023088ljj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 07:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4BJLNO1nnen45Bue2c6+QWaeFM+NUXNmcN3wO45Wjs4=;
 b=WGCVaQeuakgzDqxc9ZW4UDpexxSUIMQl9qliXUgmrlVBR/jV+6lHb0Uy8lg5WC+Wl5
 q/hrX5rRBk7O5xcO8jBxWdg8ZRDLiWjaXCbYyzfE4N/50h6LCed3Ls+K1dKB0+v08t3s
 E2St9Qkpjlh2TqtqbZJVURbiyB+nWl47wxlzPOwlAWUBUlBLpQQHEtFqlR533BCju4Da
 9q1EVnGhEDbris8mPnuzUL+aDXLtinIC/lKdVafwRkqvtYJ1AUqALNmGfz4EYUL0DCd3
 jSAfjESZt0ipWMXbj3Uvv1xl9M2UkeyqddlEJQ360Savq1idhdcW+3c2/KZA/2K9oEzT
 3GSQ==
X-Gm-Message-State: APjAAAVZ9SYbbKJ2OoYAicMy2lpQtKwzzTH74NoA9NJSsO99RFizBk5b
 MRdnAU8MegCdp8u3NNZ+DQAawM/IKGLOZgRj6MRF3w==
X-Google-Smtp-Source: APXvYqyoTjg2yu9W/7cu3VsJfhVSAP4iuY3SW2NhSndP3RLZVIIhRQXVpWq1aumTQgFWXKRgi+Y6WuTDVZSWQEpGVBM=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr6532816lje.118.1570113590655; 
 Thu, 03 Oct 2019 07:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
 <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
In-Reply-To: <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2019 16:39:39 +0200
Message-ID: <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4BJLNO1nnen45Bue2c6+QWaeFM+NUXNmcN3wO45Wjs4=;
 b=hC0MBIOv99lcqwkgOhJzHbxuJlcR6UF11aD7HCAkB+aMXleaIUPfDtuEhjp6Ud7d+x
 gc6pmY7bL6tUuRbDywxqB2J1WoqqeFNyN3xiImutQAV/zgR4UA2rO340ledNR6F1IFs3
 mm2WmSNfSZovnGWCgHRa3qXWdVCpR3aLeiwiO6por1NWIvZAjlICR0XQpHQ5ALMdJ8VO
 P/IbGz/GiceRUiREKV8kuNinDvh37Z36Rqk4olPswDk8y8QYDiPbFXQfADJH3Lbk2e5e
 gBthUT6vqbA76lABDQcff4RdYexJ2iqxpFCN6h4oTv2KvxCaqZWOrO86moQQ+fO7uOG8
 vJ8w==
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCA0OjM0IFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjM5IFBNIEpv
bmF0aGFuIE5ldXNjaMOkZmVyCj4gPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4gd3JvdGU6Cj4KPiA+
IFRoZSA6ZG9jOiByZWZlcmVuY2UgZGlkIG5vdCBtYXRjaCB0aGUgRE9DIGNvbW1lbnQncyBuYW1l
Lgo+ID4KPiA+IEZpeGVzOiA1ZmM1MzdiZmQwMDAgKCJkcm0vbWNkZTogQWRkIG5ldyBkcml2ZXIg
Zm9yIFNULUVyaWNzc29uIE1DREUiKQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPgo+IEJvdGggcGF0Y2hlcyBhcHBsaWVkIQoK
Li4uYnV0IEkgY2FuJ3QgcHVzaCB0aGUgY2hhbmdlczoKCiQgZGltIHB1c2gtYnJhbmNoIGRybS1t
aXNjLW5leHQKZGltOiA5ZmExZjk3MzRlNDAgKCJSZXZlcnQgImRybS9zdW40aTogZHNpOiBDaGFu
Z2UgdGhlIHN0YXJ0IGRlbGF5CmNhbGN1bGF0aW9uIiIpOiBjb21taXR0ZXIgU2lnbmVkLW9mZi1i
eSBtaXNzaW5nLgpkaW06IEVSUk9SOiBpc3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwgYWJvcnRp
bmcKCk5vdCBldmVuIG15IGNvbW1pdCwgYXBhcnQgZnJvbSB0aGF0IGl0IGxvb2tzIGxpa2UgaXQg
ZG9lcyBoYXZlCnRoZSBjb21taXR0ZXIgU2lnbmVkLW9mZi1ieS4gSSdtIGNvbmZ1c2VkIGFuZCBk
b24ndCBrbm93IHdoYXQKdG8gZG8uLi4gYW55b25lIGhhcyBzb21lIGhpbnRzPwoKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
