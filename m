Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0885D64A71
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 18:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B16E113;
	Wed, 10 Jul 2019 16:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE616E113;
 Wed, 10 Jul 2019 16:05:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v15so2696180eds.9;
 Wed, 10 Jul 2019 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9lITRSzypmyFPUaKxrAh0HrfvCaK/Gn5vpP+ktrEf0=;
 b=LID0GjPpw2WIYLa28fJ63KTQiEpbCm9qPuG4CZWVPfcHRcc8ff6eRZqKRcVXXWBq7H
 WTCdKVwFSPbFQgFUGsyluAQmcHNfrRFaKNW9NdsFp3/PQN3XTTrUGCwmK3NSrQD8w3LA
 Kj59oQFQlx+OSDFra0SMyLJqdpyRDZAKFDwJHFg2tUtuOEyQUXeBCQCNnw1+gZ0gTTgD
 3LUCTrtL49Wb43GDyjV/rE8s4d3lzB6m2DaEwzi7LC8fSzLaud3Pfy665Tiab5MCXBns
 x3eoUddHWvruQ5tJfUG21wFicVJldTT1R50xv+YeZTCts2raCda4xX3/L7nkKrA2ACPg
 DnjA==
X-Gm-Message-State: APjAAAVbO9CFzAgQO04r0/qn5/MDAbZsyb9g4x+7HokKeKOLrkXh5SwP
 vHQwjKd/5n6Kl1Sf2EaKqOONnOzbrhqzMZqTsGU=
X-Google-Smtp-Source: APXvYqxeO9GUyADWX05HW3k95+ygftQ/xTrvw3s+8plnEYpZJ6vNgAjgilhG3fsx/KHNX/LAVKNGJfr1+ZnrRxoPI98=
X-Received: by 2002:a50:9177:: with SMTP id f52mr31340174eda.294.1562774719928; 
 Wed, 10 Jul 2019 09:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190703140055.26300-1-robdclark@gmail.com>
 <20190708181840.GD30636@minitux>
In-Reply-To: <20190708181840.GD30636@minitux>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Jul 2019 09:05:08 -0700
Message-ID: <CAF6AEGsGbOOssmTB0WUJUPJRkhvhwLpe81fYVa0PSXLPKDSLZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v9lITRSzypmyFPUaKxrAh0HrfvCaK/Gn5vpP+ktrEf0=;
 b=muLQ2P0NXlrQVBmHx152XvttZNcGJ4KdJMjn6ZbfA2k1eiiB42Ec+DciKp8o5ThWA6
 lE1KpdW3J7fgvjMCtTW0L4R9LjOJ+TuP9iRx/kYzBewwHtoXQJyjUuwn9qZthgSHKJpW
 DKZmYvEjTSqZL+LB2jm3NZY9iug6FISRqlEFZ/kdDVz1SKIi6ZfM/f0X1kgFc6nStBJS
 tnUNL17aYmJ8O2triX5oesdpw+9yna9aeb+IwZrocnmeHuZwcFLCO10emMrTbEvZqYFt
 AtO0euTVSX6WhuEmXC1qnUXMt7XX5H6aSvd7Mdyby+JXFJ/f+V0AAK5XWZq5wydTwJ9g
 dStA==
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxMToxOCBBTSBCam9ybiBBbmRlcnNzb24KPGJqb3JuLmFu
ZGVyc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCAwMyBKdWwgMDc6MDAgUERUIDIw
MTksIFJvYiBDbGFyayB3cm90ZToKPgo+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hy
b21pdW0ub3JnPgo+ID4KPiA+IEZvciBwbGF0Zm9ybXMgdGhhdCByZXF1aXJlIHRoZSAiemFwIHNo
YWRlciIgdG8gdGFrZSB0aGUgR1BVIG91dCBvZgo+ID4gc2VjdXJlIG1vZGUgYXQgYm9vdCwgd2Ug
YWxzbyBuZWVkIHRoZSB6YXAgZncgdG8gZW5kIHVwIGluIHRoZSBpbml0cmQuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+Cj4gTXkgdXBj
b21pbmcgcHVsbCByZXF1ZXN0IGZvciB0aGlzIG1lcmdlIHdpbmRvdyBpbmNsdWRlcyB0aGUgc3Vw
cG9ydCBmb3IKPiB0aGUgbWR0X2xvYWRlciB0byByZWFkIHVuc3BsaXQgZmlybXdhcmUgZmlsZXMu
IFNvIGhvdyBhYm91dCBydW5uaW5nIHRoZQo+IGZpcm13YXJlIHRocm91Z2ggWzFdIChwaWwtc3F1
YXNoZXIgYTYzMF96YXAubWJuIGE2MzBfemFwLm1kdCkgYW5kCj4gcG9pbnRpbmcgdGhlIGRyaXZl
ciB0byB1c2UgdGhlIHNpbmdsZSAubWJuIGZpbGUgaW5zdGVhZD8KPgoKSSB3b25kZXIgaWYgaXQg
d291bGQganVzdCBtYWtlIHNlbnNlIHRvIGxpc3QgYm90aCwgYXQgbGVhc3QgdW50aWwgd2UKY2hh
bmdlIHRoZSBhNnh4IGNvZGUgdG8gKnJlcXVpcmUqIHphcCBmdyBpZiB0aGUgemFwIG5vZGUgaW4g
ZHQgaXNuJ3QKcmVtb3ZlZCAoc2luY2UgdGhlIG91dGNvbWUgb2YgZ3B1IGRyaXZlciBhc3N1bWlu
ZyBtaXNzaW5nIHphcCBmdyBtZWFucwp6YXAgaXMgbm90IHJlcXVpcmVkIGlzIHNsaWdodGx5IGJy
dXRhbCkKCkJSLAotUgoKPgo+IElmIG5vdCwgeW91IGhhdmUgbXk6Cj4gUmV2aWV3ZWQtYnk6IEJq
b3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4KPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL2FuZGVyc3Nvbi9waWwtc3F1YXNoZXIKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
