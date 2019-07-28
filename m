Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1677F26
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 13:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2489C97;
	Sun, 28 Jul 2019 11:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA6289C97
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 11:15:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t28so55675073lje.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 04:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gtQXd/4O6gf5LGn1S+EVihJmFwsXCf04l9JeAZPNSzo=;
 b=uMgDYBJJd4a4SPUTWp9urzDmKCtEBJZ5l4Q1jrXHFwzX8i+5C+S/A0za/oW7mFZQeu
 OSGCAsXqJrGSPMI7LlMTsBz1TFceNmZwPJNBeGGrrYp6mFMm9dBqa4ctXzaHNzYS18b5
 9WT78+vug7n90a2ulxgwTlUe+FW6vN4GzQRuPRgteve9yKhvkAg8s0koO6zm3h6s5xul
 tU5YV3XBuJlXY31azkJq3PslgPQu7cyW1EzQTrfN07fFV8zPPjDIEpgjlrD0NoDxMZZS
 IZppX6MJoNysTuo3DnnOPBCcw6Qdc97de2E4GJm7opXVNJgC7wsGdYqfIxvBwGFbDAhC
 GQoQ==
X-Gm-Message-State: APjAAAXo00NfpU7AuaIiw7Ddr5pgcW/hlsuYPp+5vNntkp8bDhbWBUGF
 yElgAfId3oLpnG5k5o8+NZiG3o+AuBZk6v2VlUFK6g==
X-Google-Smtp-Source: APXvYqz5Yh15O8MsDybKRmSxlgXUH4zS+l/W2/MIPWoyp+Pd+2B8FAUwSgxT1qVm3yj8MFamrRwKDf0FwSv0WXTdk/c=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr52020569ljg.62.1564312517936; 
 Sun, 28 Jul 2019 04:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190728105223.4966-1-linus.walleij@linaro.org>
In-Reply-To: <20190728105223.4966-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jul 2019 13:15:06 +0200
Message-ID: <CACRpkdbG2=mKm6oDwfcSdU28u2ju1b7XdJ=wCDZQ0Cg0MCWLKw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: s6d16d0: Support rotation
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=gtQXd/4O6gf5LGn1S+EVihJmFwsXCf04l9JeAZPNSzo=;
 b=Ey3Ax/PeCgKFCKcjrGtBbqC2IcyL2CzExzc027VzgL4DyZ7aQ4T3FLGlk2kWeR+G4Q
 k102v+ASvEbLsqnRM95ER11q248qkkEJcnKd15+AMosRn4YEsRIguHfVgeUHtJ69tAZ/
 ShEDeDscD8Gfo6dQQ4CcaJrLL5GY3cfgx5EU33v9a9wxkSByD4olzFRAMXSNC7KLCKqt
 t8H7FTF8qtIoP8gblTk/XiJk34ZChJpK6OiEhUH3N+WUhiIZhN5gz7YuztYxo8PXB8E8
 ssOPbFza80klzDSawuavfVb8OSsPWigm5LhfucDBqVBIt21C6ZsSqT9720UaKbZ9NaH/
 Eugw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjgsIDIwMTkgYXQgMTI6NTIgUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4gVXNlIHRoZSBzdGFuZGFyZCBEVCAicm90YXRpb24i
IGF0dHJpYnV0ZSBmcm9tCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwudHh0Cj4gdG8gaGFuZGxlIGRlc2lnbnMgd2hlcmUgdGhlIHBhbmVsIGlz
IG1vdW50ZWQgcm90YXRlZAo+IDkwIChvciAyNzApIGRlZ3JlZXMgYXMgaW4gdGhlIFNULUVyaWNz
c29uIEhSRUY1MjAKPiByZWZlcmVuY2UgZGVzaWduLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKQmFoIGZvcmdldCB0aGlzIC4uLiB0
aGlzIHR1cm5lZCBvdXQgdG8gYmUgYSBzb255IEFDWDQyNEFLUCBwYW5lbC4KSXQganVzdCBoYXBw
ZW5lZCB0byB3b3JrIHZlcnkgc2ltaWxhcmx5IGluIGNvbW1hbmQgbW9kZSEKCkkgd2lsbCB3cml0
ZSBhIHByb3BlciBwYW5lbCBkcml2ZXIgZm9yIHRoZSBTb255IEFDWDQyNEFLUC4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
