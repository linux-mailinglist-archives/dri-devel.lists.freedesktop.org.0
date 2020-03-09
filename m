Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A717E3AB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 16:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5B6E1A3;
	Mon,  9 Mar 2020 15:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30BC6E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:34:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o10so3683477ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QwVsZuSkMOjTvHjgsayvwCMFNGOlcSyBHIVPsci9r20=;
 b=zgluYkyHtj/LwlG+SC3CTFcxfBmlsR8wVyICfi7DuWZKYMl6fQbMgB1gxkZVtBLuHR
 vj0V7O9RCTA+FqucURwQfae2PucGsmeb/cRXW2XhbGG9i2TtkIgajlcII5zGFcob1PFo
 d2TFCRBFkzDTtOjzf78uKU9LG6Qi5TGv4/dWctIBc5e8UiS+gPkGVPX3GotQCDsrtw5w
 yjXblZ+h1ggLHHnHJbsABBqmz2u6l04b67oFniVUDvcVaSzrZ4LTEYTTZ+fDNSaZ0xIi
 nYZp7hj4zxYsb2gmCvfz+xsTk8ccxI6Vh1MmW3Ao7s2plcHACDOEnU80DzhZnyGLfSlp
 OOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QwVsZuSkMOjTvHjgsayvwCMFNGOlcSyBHIVPsci9r20=;
 b=paz42XZXohBR/+FoSKjl7T6jXznq1ZFzGbbVBu0BshARxz6g/tV0G7jVmkuaoegnPN
 /cn5t261NVo55I3Bf37oUrw7Twkrfw1ZCwyUcrbCLqJ0Nj4pc5yIYeOgyxn9/MXxFgji
 00ifM58PfW+yCIO3KKxdjawAyvicV9JKk69noLUmM3+kUBBhyCAKWev7B/garIEJDaTM
 +dZtyP2EjTwhdas2VY4egW8X4EcvgSkW6ueLOCXdkYBqE2iLuHBXzHsY5/L4tndExTvS
 BXCkTJaTcQxD80sJtvQ29SfZTE3wYd9jGT5J4DdsgIRAYJZccR9bFsVcYAp6btpZ1QoK
 9Zhw==
X-Gm-Message-State: ANhLgQ1tzgZtu9lROMu2MLAEKWKzvhCMfJRW0da5zf8pMmcEPUi/QedM
 dKi5M2ypWCpgjCLUUsBXZ4yM9Bi9yVJO4lgTRojTUQ==
X-Google-Smtp-Source: ADFU+vsvRJAkoY9tSm/YvY9KJDAamlS/1yZc97mJo3AvZlGqlQ5UsVsbpIbnqqFvY2cAvlAIenmTtm5HWSvRqXAo468=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr9580718ljm.258.1583768047245; 
 Mon, 09 Mar 2020 08:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200302203452.17977-5-ville.syrjala@linux.intel.com>
 <20200309133809.32585-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200309133809.32585-1-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Mar 2020 16:33:56 +0100
Message-ID: <CACRpkdY5VzFU7jEepcG7QZsyg_L6NCzFx-EDZ3Lvgx9Set1szg@mail.gmail.com>
Subject: Re: [PATCH v2 04/33] drm/panel-ilitek-ili9322: Fix dotclocks
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Thierry Reding <treding@nvidia.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCAyOjM4IFBNIFZpbGxlIFN5cmphbGEKPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBsaXN0ZWQgZG90Y2xvY2tzIGFyZSB0
d28gb3JkZXJzIG9mIG1hbmduaXR1ZGUgb3V0Lgo+IEZpeCB0aGVtLgo+Cj4gdjI6IEp1c3QgZGl2
aWRlIGV2ZXJ5dGhpbmcgYnkgMTAwIChMaW51cykKPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
