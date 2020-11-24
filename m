Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F72C3059
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17D56E519;
	Tue, 24 Nov 2020 19:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776D16E519
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:02:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so25021wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Iqfo9keS2TpK9GfS0c0b6OiBQlmC8pD8aAHf7OaR9CI=;
 b=HpLbM+V0jq7UNWv0s31h85bdrOxL/5xJyr4X+waMFda7d4JHut00b11AorcytoyUtN
 yc05zp19+B6hk0tcP5+pMqJW6JswuODpPbEiJIrRNS8f3syEKd3rfr/jJJso5oMeC8U6
 toNcyx5kAUZ0sZwYUj1VDTelp9sf1KXX8OWxt5lMwnhDHg9NB+XkCDYJFBaDtvrUIIJn
 lkAjiRQKIgi6BESygC6wxEjIv+fHTgdVrbELD+HhjlZTR0NcST3xGIweqIg3nxffRm2m
 8H6X49MT1ec7hpZFwM1o2lNu1czV1fdnifqMxZ1ofEc2KOSHxeT6myWUPRhjnAI9EfND
 LVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Iqfo9keS2TpK9GfS0c0b6OiBQlmC8pD8aAHf7OaR9CI=;
 b=DhwHV8DnQ++Io6RAfJTS/QS6QkIF0KP4tyhpTUey7rWq6MASiirHn1/ijq1wN3YQ99
 lPS+zcaumXgFYhGw5Hnk/wwn7vHzqJ8m6mW9UpCqEynrdgYG2tB+tJlQYQppVmYPo3we
 gaI76PerhBm4ZdvTkLm3ZeH91DXgpyTytUnzQcV6uc5/ZROnPVl7qcUTtFPYBovuC3e8
 EaW5FXzXLx7ZV7swl9V1nnJWxLsxzGQRFVIwW9u94QcBDBCwAexZHNqEnjlLoeOJz5x+
 dWZsaARPNS7D1aRZX2mehNTvHfG24MOZ9UPVvyt7uKHfXlQUnGthdjpdKsvegG+pDjIo
 y85Q==
X-Gm-Message-State: AOAM531uIx4r2AsPEtHFYyabvcBKjEpYsFCvk2s8Mvo0zYcQN0fOq7ZC
 avaStmXufJ2IRbkHgb0QULIDBg==
X-Google-Smtp-Source: ABdhPJw/HJ98oz834LeZOvm1TSSpQe1fptg/MS2M8idKTbhtYAnFb4PUY3/ynRryGMQT1piVK1X2KQ==
X-Received: by 2002:a1c:b787:: with SMTP id h129mr5980131wmf.67.1606244527085; 
 Tue, 24 Nov 2020 11:02:07 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id 6sm33311328wrn.72.2020.11.24.11.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:02:06 -0800 (PST)
Date: Tue, 24 Nov 2020 19:02:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 01/40] drm/radeon/radeon_device: Consume our own header
 where the prototypes are located
Message-ID: <20201124190204.GC4716@dell>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-2-lee.jones@linaro.org>
 <CADnq5_PaFeyNAc3a8e0MmZRKzPxPQCxGyhD_7TP+jcuPvRt9NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PaFeyNAc3a8e0MmZRKzPxPQCxGyhD_7TP+jcuPvRt9NQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBNb24sIE5vdiAy
MywgMjAyMCBhdCA2OjE5IEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYzo2Mzc6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fZGV2aWNlX2lzX3Zp
cnR1YWzigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ID4KPiA+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Cj4gCj4gQXBwbGllZC4gIFRoYW5rcyEKClRoYW5rcyBhZ2FpbiBBbGV4LiAgR3JlYXQg
d29yayEKCkFsbW9zdCB0aGVyZSBub3cgLi4uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
