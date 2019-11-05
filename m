Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7910F067B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF686EA1D;
	Tue,  5 Nov 2019 19:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB526EA1D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:56:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e9so10003999ljp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 11:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aniIC/J44IUhn2cFl6VZg+IiJv9dKL/8QT6kzib2/DU=;
 b=WU5UqrOJ1c6yUqHWd09H6EdtWm0R7b5T1O0dlVBaHaBAucGIvqlkmd6DyfrXBrU3BN
 oAcusM65uBqxI1y20VnD5LIv2/VKm84pnXShrAlpzufjn8Lt7TFgzvJ1F6QFFntWg1/x
 4CQ5zsFhbuFVj+vr/w6pEIIhzsVRihXxKmmXoUWgntYv3MnshP1q7PFvsJLVIq6QLgdj
 g/39pOZYHCO+sacquxlWpbkPOpbbinyFBbo38DkuVY45J4hZHOqDUp28P5pj7TuJ+OVV
 07eRmc3M1y+iZUBLKrzFfUN/tAtEcKrOYNeRSuOUidtA7IC/xB+v9p3IvLmLLfXPN9LU
 JRAg==
X-Gm-Message-State: APjAAAUj+tTWPyAubG74qTC9QKr77a6v+e5Yck8UrMOeA92Kw4m4Y5JU
 GEAEha+Xq/89G7WoGb1SpzNUffBC3x6E+gtT3Fo=
X-Google-Smtp-Source: APXvYqwqJT+VC+t5hmZcIrOHbWSYTVGxb46MxiUzudokZWZbFxolPg+JnqYaKIHjv8+trLFjclHUFRCAzTh4HeSmvWg=
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr4321236ljq.20.1572983810842; 
 Tue, 05 Nov 2019 11:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
In-Reply-To: <20191105194902.GA8235@pendragon.ideasonboard.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Nov 2019 05:56:39 +1000
Message-ID: <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aniIC/J44IUhn2cFl6VZg+IiJv9dKL/8QT6kzib2/DU=;
 b=bzY167THgWkBMDwYtJbGPNa8iwQsR1kbCwW8GDlW2q0K836ip0jWi82QaF/MMgf5Q8
 b/7QjO49qjeiFELVtUkOuujhxLbiyMdXWzzIaPcRTZCLAjYmh55P2+UqqkCYx7Vw+FrR
 K23+NiOS9DO9FJAk1hv3yx+nlIbnerneHjfu5yGqslian/5Gr46xL5NJMBi8RyyrBDaE
 IXxBPkM+i0hXau9jzHN0C0K+wOshOmXLCh3aAtmH5xQG6Q6pbDwq0+taFSdHXwFm90W9
 Se1wkwvXO750fuhI4sZR9tUDK5XHmIK9Ot+eCO4Gf6He89qYCRiETH0GGBbShFk1g+dY
 PTpQ==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1OjQ5LCBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwKPgo+IEhhcyB0aGlz
IHB1bGwgcmVxdWVzdCBmYWxsZW4gdGhyb3VnaCB0aGUgY3JhY2tzID8KCkl0IGZlbGwgZG93biBh
IGRpZmZlcmVudCBjcmFjayB0aGFuIHVzdWFsLCBpdCBtYWRlIGl0IGZyb20gcGF0Y2h3b3JrCm9u
dG8gbXkgaGFyZCBkcml2ZSwgYnV0IHRoZW4gSSBkaWRuJ3QgZXhlY3V0ZSB0aGUgcHVsbC4KCkkn
dmUgcHVsbGVkIGl0IGRvd24sIHRoYW5rcyBmb3IgcmVtaW5kZXIuCgpEYXZlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
