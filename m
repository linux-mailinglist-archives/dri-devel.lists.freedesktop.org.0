Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E34B9ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6FA6E3DF;
	Wed, 19 Jun 2019 13:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06E06E3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:27:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so12094340lfh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLdN0ETsTns+dZs6DKliEgFh9OL/ylVkF+bq8ufBcyM=;
 b=QfZeN3QeQeuNpPRzPMhquHZVDMiOSDUNu2Jyrc3HpJqLbY1Ol3H+D6GV8Y0iRWQs/+
 lk17a7x19MR+Ro+KuYm+uPnF8XLuTRED9qOx85U9mBKp9PiG+3CHGjYBveUXckgJcR3v
 9AhuUyr1dPDsQ+UrNgQ5cctUWSzk87BqWujBiiJ8MrNfN5pOhzTAMgRfbbU1guJLt95Q
 yxoq7u0hbc4+e5Hd/uAYf8Fn5va2SHy3CpPm1I8K0n/0zA1T4aQ7QVENOSoWEqFBlZRY
 nxyB3DBObZSw2IUwzQJRZeuBB7Ud+8HOF+ByTGzermk/kHKQLQ/MlCWisZCsah4VtMP3
 JZDg==
X-Gm-Message-State: APjAAAUv56+G5Zkh2jdhSp7fewdf6ZFjpNy5wv6ib7e+1zku81h4YNWC
 APS4fxoX0u0bjUep14xrhxAycs+M+l36+ccUV5A=
X-Google-Smtp-Source: APXvYqxut0jGXYnHUHWRv5exjD18glXwg/4LLtkINuNKm47kn0WiC3XuzDKL/3Rf31Idbf0hTMmRP8e2v6I90koglFw=
X-Received: by 2002:ac2:4303:: with SMTP id l3mr6008405lfh.107.1560950873078; 
 Wed, 19 Jun 2019 06:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
 <1560864646-1468-3-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1560864646-1468-3-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jun 2019 10:28:05 -0300
Message-ID: <CAOMZO5C_4QxioSx4JEAV+1dDxYJgdTCzmBLZyUCB4dWeRqLFng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WLdN0ETsTns+dZs6DKliEgFh9OL/ylVkF+bq8ufBcyM=;
 b=GmkC7RYJkON0ALUMtKgH2gM5xUOoLg9yKMZPDrhQgh675JhIF5GiBOMPHn6FKGc2R1
 VA1L7FLv+M+owW5JSsAP+D2lbp9goB92wEiu2BeXPjIRbutyBjFbxSqGC7CIGftPRGz4
 N06BOYoWDuVwXxAhFgqscXMf7/wr67Cnd5kgh10xstwS1vaipNIzQJ4xi3Qa0XikISKS
 6kr9gsE0C+TvdR9EyCuGpdHOeWGCnF9NgAxBkTgnJ6+Z0LyyWBnFDdlN64ZM52YplIif
 3wxKSuC8rUqyOH87RNPyzM9OXapx5ym3eGFRZ/467U902446tetXoLxrdr8I9/KtPQgR
 zs3Q==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MzEgQU0gUm9iZXJ0IENoaXJh
cyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGlzcGxheV90aW1pbmcgcmFkX2RlZmF1bHRfdGltaW5nID0gewo+ICsgICAgICAgLnBpeGVsY2xv
Y2sgPSB7IDY2MDAwMDAwLCAxMzIwMDAwMDAsIDEzMjAwMDAwMCB9LAo+ICsgICAgICAgLmhhY3Rp
dmUgPSB7IDEwODAsIDEwODAsIDEwODAgfSwKPiArICAgICAgIC5oZnJvbnRfcG9yY2ggPSB7IDIw
LCAyMCwgMjAgfSwKPiArICAgICAgIC5oc3luY19sZW4gPSB7IDIsIDIsIDIgfSwKPiArICAgICAg
IC5oYmFja19wb3JjaCA9IHsgMzQsIDM0LCAzNCB9LAo+ICsgICAgICAgLnZhY3RpdmUgPSB7IDE5
MjAsIDE5MjAsIDE5MjAgfSwKPiArICAgICAgIC52ZnJvbnRfcG9yY2ggPSB7IDEwLCAxMCwgMTAg
fSwKPiArICAgICAgIC52c3luY19sZW4gPSB7IDIsIDIsIDIgfSwKPiArICAgICAgIC52YmFja19w
b3JjaCA9IHsgNCwgNCwgNCB9LAoKQXJlIHlvdSBzdXJlIHRoYXQgdGhlIHN5bmNfbGVuIGFuZCBw
b3JjaCBwYXJhbWV0ZXJzIGFyZSB0aGUgc2FtZSBmb3IKYm90aCA2Nk1IeiBhbmQgMTMyTUh6Pwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
