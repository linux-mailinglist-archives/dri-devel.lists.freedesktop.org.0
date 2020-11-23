Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2E2C05C4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 13:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F3C89CF2;
	Mon, 23 Nov 2020 12:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218B89D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:30:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d142so17707978wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
 b=loC7jwFZZxCVRUrWK3gkEV+nGPQO8gNgJHe9CO8Ho/sjQ+3TR3d9I8PAGUmT32DpLd
 XF45t36teSRWCy5rRGkpKWWKho4bfob6jVR4z87QtSvdZY+PWwuEG6552uCFfZYGYwWM
 TeYvw5BHHdArvuLvMR6+jWWE7Gf3wl5/CHG1ip4kmRu8V0NI08HHBZtzJx2Nzs78Lifm
 ofQpQZSHatSAZOcoxUFcKOu45nQW820RNRa6+iq0oOol4VBdbXPNzbW6QVWqZLRfRJMu
 8X1JkcflXcrN8J8rJ2VsTx30DouJ3eTevyQcQc/epohTycYBeGuQ+QjUC2P7tdgAjjFH
 IThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hQ9274cJRcisj/k1DnNRPg/AWzSpXOLuASkzuQMMEJk=;
 b=TeJEV8bmqy4XwCkO+DwTKDIs6Tqxj3icP7NqoAO2lTEe3lCzSjKDyVXskNbpKjgEbD
 rzaZCUO7qNINsQ8SlwXaMixjdgHaxjCMKvORiePxb96V94HnNQfxDnqgU6VegzQMOxql
 UE6F7teTyrwJcC4XiOZogaM0iYl/AOiHZNRHtb8WTXAGaOC3yLISNJ5KuHIjqGLf3cDk
 M41jYsZ0feyW2YyvhMSyC8uFP3FX1iDvOl3mR2MYPm5ynrVU+1oRiy8Zzneub9WyVabH
 8IwRz9CD86zPoHD9tnfQOjNNC/HxGjKb86UQ408RFJWVB+RcQAjfkpk2J+4H7KpomFx1
 nTJw==
X-Gm-Message-State: AOAM530UaV3dMiKAP92F3cRoZuiPRW8oSF3Gd7XjObBqrRAOc6nWFmAL
 rIs8yqTsOwNEJ0jyA/Zr2Wle5A==
X-Google-Smtp-Source: ABdhPJyDOBP0tlstfPSopOHwDgmQuvftD21pkr092ilv2i4DAaBWKV4gEPJF2xEJaLrKvkQTiu1XiQ==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr23315406wme.158.1606134619163; 
 Mon, 23 Nov 2020 04:30:19 -0800 (PST)
Received: from dell ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id q16sm19309395wrn.13.2020.11.23.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 04:30:18 -0800 (PST)
Date: Mon, 23 Nov 2020 12:30:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
Message-ID: <20201123123016.GA4716@dell>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Tao Zhou <tao.zhou1@amd.com>, dri-devel@lists.freedesktop.org,
 Sonny Jiang <sonny.jiang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Likun Gao <Likun.Gao@amd.com>,
 Jonathan Marek <jonathan@marek.ca>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>, linux-media@vger.kernel.org,
 Fritz Koenig <frkoenig@google.com>, linux-arm-msm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <alexander.deucher@amd.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBOb3YgMjAyMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKCj4gT25seSBza2lt
bWVkIG92ZXIgdGhlbSwgYnV0IG92ZXIgYWxsIGxvb2tzIHNhbmUgdG8gbWUuCj4gCj4gU2VyaWVz
IGlzIEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CgpUaGFua3MgQ2hyaXN0aWFuLCBtdWNoIGFwcHJlY2lhdGVkLgoKPiBBbSAyMy4xMS4yMCB1bSAx
MjoxOCBzY2hyaWViIExlZSBKb25lczoKPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIg
ZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiBrZXJuZWwgYnVpbGRzLCB3aGlj
aCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+ID4gbmlnZ2x5IGxp
dHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gT25seSA5MDAgKGZyb20gNTAwMCkgdG8gZ28hCj4gPiAK
PiA+IExlZSBKb25lcyAoNDApOgo+ID4gICAgZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlOiBDb25z
dW1lIG91ciBvd24gaGVhZGVyIHdoZXJlIHRoZSBwcm90b3R5cGVzCj4gPiAgICAgIGFyZSBsb2Nh
dGVkCj4gPiAgICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtOiBBZGQgZGVzY3JpcHRpb24gZm9y
ICdwYWdlX2ZsYWdzJwo+ID4gICAgZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liOiBQcm92aWRlIGRv
Y3MgZm9yICdhbWRncHVfaWJfc2NoZWR1bGUoKSdzCj4gPiAgICAgICdqb2InIHBhcmFtCj4gPiAg
ICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydDogQ29ycmVjdCBwb3NzaWJsZSBjb3B5L3Bhc3Rl
IG9yIGRvYy1yb3QKPiA+ICAgICAgbWlzbmFtaW5nIGlzc3VlCj4gPiAgICBkcm0vYW1kL2FtZGdw
dS9jaWtfaWg6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IgJ2loJyBpbgoKWy4uLl0KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
