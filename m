Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC78CA06C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D098922F;
	Thu,  3 Oct 2019 14:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73C8922F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 14:34:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u28so2029762lfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 07:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hvhATlwGfyzse+9lgJuOQKk+XJVPQgsWU7QyuLbTa+Y=;
 b=cWKvm3dX/rN8YI01r4x2EIgpVMckyrKDhVbL23M2SQwTRZatJCMeQ2sdr91Z8/kkY9
 pPqKt6tKgM3kCa5Ea1yxDYmzzt7t0thDw2Lgf4/sDanggbxpqf9nY/U2zt/7vRs0fQB3
 7Y0u+YBgSyuOebyx6szNvk+SnAsuGbG4ubAEyMJsqlP0nr42AcwVQiW+kwhSwWSOVsi2
 pzcsMeRMyxob58rtX/xSDeKSJhAGk8YOodqQQUJicMHh9/dBwROvMFDJ0NOw8NYC2t0f
 d+ogU4oEqyhy59DocS6U4SNriIx0dZiHplOnCAh72G2u+bGRaA1gJvkA1p6EVZHvpOZi
 4jCw==
X-Gm-Message-State: APjAAAVN+kQ2Eagv/B4g6wvBSj2w01DPeurYP7EsS1anHVEpq4j9SFWx
 oIkZf4kusE4VixK1IpZXlCxegC+9BCCqfbapLMDbIA==
X-Google-Smtp-Source: APXvYqxzdsOLb8buBtK6RvHEFpfSWOJXyEBRpRiDNtKzXeUnHA0CllgxBBRm5WSuEe//ZJx/EU+gvI5WYGl1L3RQ1m0=
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr5569285lfo.152.1570113282029; 
 Thu, 03 Oct 2019 07:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
In-Reply-To: <20191002153827.23026-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2019 16:34:30 +0200
Message-ID: <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hvhATlwGfyzse+9lgJuOQKk+XJVPQgsWU7QyuLbTa+Y=;
 b=R5NhMiwTWg9Str5l+j5vYpmLZDbmTPsgZ8TvltgouFfOYaOXhwRZjBuIRZH8KjOaL7
 rQbdWUA1Pt66YY3f2a8LSttvEhDB6cwIjVZS94ykci+fo/geFnvch8LCaW0YvE+7BosL
 0Ulk/Y1buj8QeivGnUH1btbcghmWjdRUIFavFvpKCLf59hxKPHPd73t88sxuBbyx/jyJ
 uf3nJWF7IZE+FBsQYJmGRXXICXNj8IjhTTdyUegdL7Wh/MsRI7AuvzpsPum+xHamQJKM
 j/h/eD3iJvpmFr4aVdXTm/hQwlgOPeeQ47PSo2IZ1vRHcSBV9qZTW4f95BIZ+gu8sdnb
 u26Q==
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

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjM5IFBNIEpvbmF0aGFuIE5ldXNjaMOkZmVyCjxqLm5l
dXNjaGFlZmVyQGdteC5uZXQ+IHdyb3RlOgoKPiBUaGUgOmRvYzogcmVmZXJlbmNlIGRpZCBub3Qg
bWF0Y2ggdGhlIERPQyBjb21tZW50J3MgbmFtZS4KPgo+IEZpeGVzOiA1ZmM1MzdiZmQwMDAgKCJk
cm0vbWNkZTogQWRkIG5ldyBkcml2ZXIgZm9yIFNULUVyaWNzc29uIE1DREUiKQo+IFNpZ25lZC1v
ZmYtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CgpCb3Ro
IHBhdGNoZXMgYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
