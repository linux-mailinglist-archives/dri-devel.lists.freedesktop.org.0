Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D42DBA7
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC86E2D5;
	Wed, 29 May 2019 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F06E086
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:08:44 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z19so1143104qtz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 23:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9m6XmpcV32pBGRaKWaAZOu/nkbXf9RLY5czIdmVMIiE=;
 b=E4eki6S2dpon+PxQaKs/jBZVIiqVxvIMhlUw0mOgcH+QVs4K0yETRsUbPPhqLLv0qB
 EfOkDyFtEfd5qA9+6vr13KTDXYnKoqJn80nmfCMvejY2e2l8wYL1n7fRQjJC3t7QVb2V
 RoDYGONUX6PQEAY+9kHbVfjq1DtY09KGXgAeEzu5RJwe71MYDXWzPihSH+gNdC/bATOD
 HKRuvVFRMMDSdtsQ6ynGicGllqZv9hOx0uXwN/eY4RJJwVh8EaGlkMs3RWf+bMqKYYaN
 N/PJpk6h8GmuzxJ7S90C9vU95yo1jZdu5mT+fMZ4SkI7fw+lppx4s/+XWl1fzC+Vg8TJ
 jWHw==
X-Gm-Message-State: APjAAAVTMGjYRRxc7LKqK1A9x5SgfJ5gP0v2sOXoVEMmHbNwpIMrI3Ty
 mHY+QUbd5JcYOmsGH1dTz89I6JNYirowjn6KLIwp/g==
X-Google-Smtp-Source: APXvYqy1lIVHOTaLcihvMF7zGLF3pmNL3AVewtEF/CAwLER2Lc1MzHGPozPVQVC8HRo0kHV7SIzbmTEe6U0L3SD3dn4=
X-Received: by 2002:a0c:b621:: with SMTP id f33mr68502313qve.199.1559110123624; 
 Tue, 28 May 2019 23:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-3-hsinyi@chromium.org>
 <1559109490.15592.6.camel@mtksdaap41>
In-Reply-To: <1559109490.15592.6.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 14:08:17 +0800
Message-ID: <CAJMQK-gQ_j4ma_EjGbFJOz6WGXy3UZA0F9JZYnFHPZ0F08rXog@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: mediatek: remove clk_unprepare() in
 mtk_drm_crtc_destroy()
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9m6XmpcV32pBGRaKWaAZOu/nkbXf9RLY5czIdmVMIiE=;
 b=Vk/pDafXgg2bzDpfTFeKjsIp8WdKd3TNKbs23N/It+yi/CVfzyhiySQJ8J4jtLszAi
 LFiveV8PEpd6y+Dsh/gNPfB9fYQ5zv+RrOkISmmXalE+GzteLeypk6R36MTVSR1m/T6a
 wfTXpmePwdYxnvW4o3FzOIubaWyRpDgNwMyP8=
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTo1OCBQTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPgo+IEhpLCBIc2luLVlpOgo+Cj4gT24gTW9uLCAyMDE5LTA1LTI3IGF0IDEyOjUw
ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6Cj4gPiBUaGVyZSBpcyBubyBjbGtfcHJlcGFyZSgp
IGNhbGxlZCBpbiBtdGtfZHJtX2NydGNfcmVzZXQoKSwgd2hlbiB1bmJpbmRpbmcKPiA+IGRybSBk
ZXZpY2UsIG10a19kcm1fY3J0Y19kZXN0cm95KCkgd2lsbCBiZSB0cmlnZ2VyZWQsIGFuZCB0aGUg
Y2xvY2tzIHdpbGwKPiA+IGJlIGRpc2FibGVkIGFuZCB1bnByZXBhcmVkIGluIG10a19jcnRjX2Rk
cF9jbGtfZGlzYWJsZS4gSWYgY2xrX3VucHJlcGFyZSgpCj4gPiBpcyBjYWxsZWQgaGVyZSwgd2Un
bGwgZ2V0IHdhcm5pbmdzWzFdLCBzbyByZW1vdmUgY2xrX3VucHJlcGFyZSgpIGhlcmUuCj4KPiBJ
biBvcmlnaW5hbCBjb2RlLCBjbGtfcHJlcGFyZSgpIGlzIGNhbGxlZCBpbiBtdGtfZHJtX2NydGNf
Y3JlYXRlKCkgYW5kCj4gY2xrX3VucHJlcGFyZSgpIGlzIGNhbGxlZCBpbiBtdGtfZHJtX2NydGNf
ZGVzdHJveSgpLiBUaGlzIGxvb2tzIGNvcnJlY3QuCgpjbGtfcHJlcGFyZSgpIGlzIHJlbW92ZWQg
aW4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDg3Mjc3Ny8uCgo+IEkgZG9u
J3Qga25vdyB3aHkgd2Ugc2hvdWxkIGRvIGFueSB0aGluZyBhYm91dCBjbG9jayBpbgo+IG10a19k
cm1fY3J0Y19yZXNldCgpLiBUbyBkZWJ1ZyB0aGlzLCB0aGUgZmlyc3Qgc3RlcCBpcyB0byBwcmlu
dCBtZXNzYWdlCj4gd2hlbiBtZWRpYXRlayBkcm0gY2FsbCBjbGtfcHJlcGFyZSgpIGFuZCBjbGtf
dW5wcmVwYXJlKCkuIElmIHRoZXNlIHR3bwo+IGludGVyZmFjZSBpcyBjYWxsZWQgaW4gcGFpciwg
SSB0aGluayB3ZSBzaG91bGQgbm90IG1vZGlmeSBtZWRpYXRlayBkcm0KPiBkcml2ZXIsIHRoZSBi
dWcgbWF5YmUgaW4gY2xvY2sgZHJpdmVyLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
