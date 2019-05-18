Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A922501
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 23:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003D89394;
	Sat, 18 May 2019 21:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1DA89394;
 Sat, 18 May 2019 21:04:52 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so9224947ljw.0;
 Sat, 18 May 2019 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZeAGhaHPiCqHtKFs6BtFHeJTGXiDcAWDo1rkHbOfKgk=;
 b=Wg8l0RKZyF0qLmWNfYHhM99yXCO6VmcYx+UV2FGImFWDBHaBPIeQGjCRL+5vSWcEx6
 ESmMFiiFDyoR1wAfZJcLzsFuAgfaPxLtkyzHNy9Gbi+5P3tr+18RVUgtJDvjP3nGZH8W
 YCttS6awO2twIBp2csiYgZ9O3AXDiFdpiFxwNrMwTSlx2Cwrrp5Tp22A2RMVEgCY+Qse
 YUoMoHfkc5qPhe8kuGa9Zb0Zn30GBxTQ6zL1AVQJg19UI1wXgHGVHKon8pIstOulp7Mz
 beealUpnQP+vs8gKqvMf0FRFO3YJeFrIyXPDcDXbQvsqwGiAU/Rf1GFhyWpGCiUe1Yyw
 xQHQ==
X-Gm-Message-State: APjAAAWkmy/i9s/j/U6xHS3StuDY4OWXTKkXx1wsLLrCUtkeW4aHkIJ2
 37gSNMr/XAdweKdxWBQBezkR4E+xelG7VtmV4Cs=
X-Google-Smtp-Source: APXvYqzDk2l+nB6ITRfEGTA+G/RNHFDqtAGMBfR5LAknKsqc74/bDcCpBZipLkrRJ6HkkxwBaWXIpBtta8jDavV2WA0=
X-Received: by 2002:a2e:5852:: with SMTP id x18mr19719639ljd.81.1558213490888; 
 Sat, 18 May 2019 14:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <E1gyDr8-0001cW-8d@rmk-PC.armlinux.org.uk>
 <20190225105423.jouccln33vj5xtyb@shell.armlinux.org.uk>
 <20190518175133.tpj255jzi7idhwxq@shell.armlinux.org.uk>
In-Reply-To: <20190518175133.tpj255jzi7idhwxq@shell.armlinux.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 18 May 2019 18:04:42 -0300
Message-ID: <CAOMZO5C_nAMQM=ODU+_v3XMhcEDg_U+wY8c0-yR-cq_BWN_tVw@mail.gmail.com>
Subject: Re: [PATCH] drm: etnaviv: avoid DMA API warning when importing buffers
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZeAGhaHPiCqHtKFs6BtFHeJTGXiDcAWDo1rkHbOfKgk=;
 b=uzaV1t5DsM44eVHvv19YSt+u/qWPsXg/Bju7qOaA+7ryc1eRt1Y8xZH7pmc5vLTc26
 B0mifnOxNWBoPwFkS2E5SWTY0zHw7A2Sk4mgYZRGYjFV/1v15OuF4yEzAvmmG/oyjG9L
 u13DmasVsZAHiMRc+yV+Ca2DnLGgfOtNe1aWrrahTWWBOumD2iNziAg2Vq5ucB8ix1X+
 HsFcqrRjXg7r7kSyeYeJV5pulJkq07IJGXdBoekOhefndCdFaiSE6bYXiB8OnxuWdUwW
 gqOpiaPWoxlvKmLUNqR/efrADhWRwKuzV8woewPrJ20Cf69fk9EVqyGiry5q3H3WoCOl
 O/6Q==
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
Cc: David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUnVzc2VsbCwKCk9uIFNhdCwgTWF5IDE4LCAyMDE5IGF0IDI6NTEgUE0gUnVzc2VsbCBLaW5n
IC0gQVJNIExpbnV4IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gUGlu
Zy4KClRoaXMgcGF0Y2ggaXMgcHJlc2VudCBpbiBMdWNhcycgcHVsbCByZXF1ZXN0OgpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9ldG5hdml2LzIwMTktTWF5LzAwMjQ5MC5o
dG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
