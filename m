Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C297789864
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D1689298;
	Mon, 12 Aug 2019 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FE889298
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:04:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e8so10024263wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 01:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wjNEuymamId9pBrE0t9Jv7n+ZoyE6GIwiG26F4pY9IY=;
 b=QbxxunouPgLwXHJC+80hT0q97PNoIOm4Cup1FoUH3UJIxIr2j+C7sgwJQTWzE+z+2n
 uyKOYst8Av4zeCbqDgvSr8KOMb6C4SRT/+AGF8nD8hrGCo5XI6s487BXM0Ma6L7f6slr
 MIFlUfgQSg/Diq/5GlhuWk/GDp4EKK/xxJkd7Sem0E/+RR30M3fmmxlIygappkLb3Ly9
 tL/OhBoV4idqmqcQAoXFBIDKkoaFeaira+Y+unUJyp1T8lXpo5tUVDY1fd45917vqZaM
 O9H1aYwIHRU+TFKF5lUj1jZfOFQdpe7w2fdStDwpDYkdE+If4QR4ipJUDJvy0E4wh23e
 eT7g==
X-Gm-Message-State: APjAAAUvmxlvFtKMCgFxRiAYIOkmCWMQ4gKx7IowZvChPMPEuWkqKFxT
 AOSR5/h5oSwgIrlefi5GhsomVw==
X-Google-Smtp-Source: APXvYqwQyQT7y9KW1746rGOUkQIliXRbrThzvwE2AlJmv6pZsqMwmxsrrNkWv6H5uU1Cleg/mLnx2w==
X-Received: by 2002:a1c:64c5:: with SMTP id
 y188mr10508736wmb.154.1565597086871; 
 Mon, 12 Aug 2019 01:04:46 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id c1sm231471657wrh.1.2019.08.12.01.04.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 01:04:46 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:04:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] backlight: lm3630a: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190812080444.GG4594@dell>
References: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=wjNEuymamId9pBrE0t9Jv7n+ZoyE6GIwiG26F4pY9IY=;
 b=M+H9pQlp8W2jcanGP4CSdah5dBJ5UREqNyTcUhuFOK7BMMGMw5aR/yxk7QhujpZcVD
 j0M7AMfshvcIRed/WCggxnzQL+NM/mH0aCttJDP1uR1tlxdxFF1pfCGRz6q0cLyLrsS4
 lmOddb52uoD+Q0zZ1dVr/jFKZnJ3HCSYsl4afZkhsuzyYxXeK1rqEpDuhICeKOKb2L2H
 vxb5D7XtJhqg3sW51PV7t2oY38dwNvMDhc/zTdEIUXJvTuQ8xWUihtnUj5vcJiY9e8g7
 Dz2r0wLZSc+RK98XfvyMzRjKOulw53Kn6i6oa3kgb5tmYB1qAB5k35gq6oFIgd8Tmyl8
 gfhw==
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKPiBVc2UgdXNlIGZ3
bm9kZV9wcm9wZXJ0eV9jb3VudF91WFgoKSBkaXJlY3RseSwgdGhhdCBtYWtlcyBjb2RlIG5lYXRl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMw
YV9ibC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5h
cm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
