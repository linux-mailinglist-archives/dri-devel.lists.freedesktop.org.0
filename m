Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D92A99DE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6236E210;
	Fri,  6 Nov 2020 16:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915FE6E210
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:54:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id h22so1962045wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F+Vt+4TSvdy8WlC4sGQnfJ5XRS32FKrs7NXD/c6LwWA=;
 b=GlCcA6UHHoieTNyiZ1/cpN4zXsbXTEkHsxM1XA7Q2LT+o9L2id9zdc8DOKrVNPkOXq
 kLKz5JhU8YOpXKwoi9cGU0uj0VnmyTcZCHvx40WNG1ZcB0KCoHwvShL9rImWKk5Iblhw
 El/nFbCGs9eX082IlAs/kb9rM4cdmTxDUBRlvzsSeXFSLnKegLjma49IBFJiJFowsGx4
 IzoCpCAMJVCKAgqT6/CLtyUGg7xvhNGe2pFhgys4AE6gGewG/IVRx8uUrWwBILWbd7g6
 MpETBAuRT58+HArQvzU9CTY/HS3trxfU/fYRJb1Us7NyoMvLYypmrHrMMB9TleNnFfSr
 0MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F+Vt+4TSvdy8WlC4sGQnfJ5XRS32FKrs7NXD/c6LwWA=;
 b=eJhQ1DZYjqRxgKFnhsp8q+uskiVGmtUlEPT3Y3dmkhmNg/sliGxO+2+8LDcszo/RPH
 jbPO+tpr9Ubw0w+Lt5bHJru93MSTcZ8Taam8qca+Sw7h3jYlmg6cGZ6O3zwyG7qNWsMX
 g4w5RmoKweS8D4L/xCUnv02YvZICYGs2YZP6qZWuNLtXRqMrsiwXHr9DFn6ugf9LImm3
 nM2gvmYgIMUSmNqBO3gZTe2WPjIcAchWJLXdq0+pxU4vmjjFHrRBjm9LAXLqeNBQpXmp
 /iy2ggYh9MzHMtY2OEbRqQa9StZu31C1eVWrThLTeW5JSmuAZlsv7CYfSNrsH4q9577N
 50Gw==
X-Gm-Message-State: AOAM532G8BbTUDVUYwJEnAM0E0ZbUBKzswLmYKtb46sfkdvvDRXipadf
 a1nGUIrvf99Oe77ZrfFTzf52Mg==
X-Google-Smtp-Source: ABdhPJw7CI79ie5Q1Ax/Xf8IJpGNiVB6Pub1As6gH+nRUX3HuWeQ3zj6MELYc8olGfedqWMaIpCyMQ==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr465744wmi.131.1604681681197; 
 Fri, 06 Nov 2020 08:54:41 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id u6sm3107686wmj.40.2020.11.06.08.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:54:40 -0800 (PST)
Date: Fri, 6 Nov 2020 16:54:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 16/19] gpu: drm: panel: panel-ilitek-ili9322: Demote
 non-conformant kernel-doc header
Message-ID: <20201106165438.GN2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-17-lee.jones@linaro.org>
 <20201105211742.GD216923@ravnborg.org> <20201106074323.GV4488@dell>
 <20201106161109.GA625131@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106161109.GA625131@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gPiA+
IAo+ID4gPiBBcHBsaWVkIHRvIGRybS1taXNjLW5leHQuCj4gPiAKPiA+IFRoYW5rcyBmb3IgYWxs
IHRoZXNlIFNhbS4KPiA+IAo+ID4gQW55IGlkZWEgd2hhdCBoYXBwZW5zIHRvIHRoZSBvdGhlciBw
YXRjaGVzPwo+ID4gCj4gPiBEbyB0aGV5IGdvIGluIHZpYSBhIGRpZmZlcmVudCBNYWludGFpbmVy
Pwo+IAo+IEkgZXhwZWN0IHRoZSByZXNwZWN0aXZlIGRybSBtYWludGFpbmVzIHRvIHRha2UgdGhl
bS4KPiBHaXZlIHRoZW0gYSBmZXcgZGF5cyB0byB0YWtlIGFjdGlvbi4KPiAKPiBJIGxvb2sgZm9y
d2FyZCBmb3IgdGhlIG5leHQgc2V0IHRoYXQgeW91IHNhaWQgd291bGQga2lsbCAyMDAwKyB3YXJu
aW5ncy4KCkp1c3QgdGVzdGluZyBpdCBub3cuICBJIGhvcGUgdG8gc2VuZCBpdCB0aGlzIGV2ZW5p
bmcuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
