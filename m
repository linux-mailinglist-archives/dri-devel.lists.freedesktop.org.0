Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0AB1DEEA8
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 19:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681F96EA1E;
	Fri, 22 May 2020 17:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CA46EA1D;
 Fri, 22 May 2020 17:54:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so9780144wrw.1;
 Fri, 22 May 2020 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pf8ZbrNYhqExC9KlQDsW36HsSdXFIIPGxctjlqUhPhU=;
 b=u7RbKLwjVjVzyigBMehTZA8DZ8q5mbPJhVRZm6b5dfW8TZB/BDoYYQtn+kJTQVQooR
 tutjnmSCKhbXhltjZ47l7fpwMjaGwDOJ8PxvMMbkw5bjHWd+Rw+01hsi0MEJf6vDmYLf
 IkUETqM3VjFJIdTQ4W4vgTPcpjo4PcMPaAd4AeHfpuWlI8WwZneTofDEE8uaaaYUU2Zj
 qn0JHeEZ0RBiTCBmRCkPXS0A1XDwDgstTkU1rsnlzkm/y8QJPb250SCSKULGpmx9msW+
 9N1r7SruAt/HdxBXAsVX+FunUtJHSGLh91Y6nvUi9Kk1FPUHl1xB9tpsKXjKOyTrq95y
 zCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pf8ZbrNYhqExC9KlQDsW36HsSdXFIIPGxctjlqUhPhU=;
 b=VuRziMiA2EfyG3IeuG6aIpiJH/ftxqgnnztK5YlSBTbCOVJphbCDw9A39HeH3BTwLK
 iW4OPQSpdQ4KEYWSQ4ar9hNkgSDRmckpQxtaGf5Emwmnom02HupihCEOEIb0pu5AwgUj
 fmsmfhVsPkdcYFv1hafMEPBn/8nAbgj8nACUKxpC00nz0J2EKBraRJycwS4hp8cmpydD
 Stk9H6h1arbkqeivEzJMFh/EoJ/l8xMI7V0WPWwlwQ4LyQFqmRv55tkiJmT2Tjr9PWL3
 OuNFI3SeMiLXxPyuw88PnOtg4qFyu6rh/37Zrl0SgYgooXlHh8/57Tf1plnL52VdwkWO
 U32g==
X-Gm-Message-State: AOAM533uYEC1B2J+xyO0QiU9jWnle5sQnQA3miF7VipaJMOtFiOzjoGH
 v9oQZuc7ERBA0RK1AdWGNLW2XSCd3KPSkRXekWs=
X-Google-Smtp-Source: ABdhPJzvWdhRPfLMzR36gDh2x1ZCpNeC2MEquHBzD0O8Idsmsrs64y9LjzBbuf3andQmXrkZnIRYjU6VUv3tzxnzNtM=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr4535314wrp.419.1590170052313; 
 Fri, 22 May 2020 10:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200519225545.GA2066@embeddedor>
 <1065d63e-7959-e4b4-af4e-70607ba92296@amd.com>
 <20200522175142.GF29907@embeddedor>
In-Reply-To: <20200522175142.GF29907@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 May 2020 13:54:01 -0400
Message-ID: <CADnq5_NQRYkeHY-9733rqh1ykRbVXKyBa5+r8qzbavo240jjug@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/smu10: Replace one-element array and use
 struct_size() helper
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMTo0NiBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgMDk6
NDI6MjdBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+ID4K
PiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gPgo+ID4gTWF5IEkgc3VnZ2VzdCB0aGF0IHdlIGFkZCBhIHNlY3Rpb24gaG93IHRvIGNvcnJl
Y3RseSBkbyB0aGlzIHRvCj4gPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJz
dCBvciBzaW1pbGFyIGRvY3VtZW50Pwo+ID4KPgo+IFRoYXQncyBhbHJlYWR5IG9uIG15IGxpc3Qu
IDopCj4KPiA+IEkndmUgc2VlbiBhIGJ1bmNoIG9mIGRpZmZlcmVudCBhcHByb2FjaGVzIGFuZCBz
b21lIGV2ZW4gZG9lc24ndCB3b3JrIHdpdGgKPiA+IHNvbWUgZ2NjIHZlcnNpb25zIGFuZCByZXN1
bHQgaW4gYSBicm9rZW4gYmluYXJ5Lgo+ID4KPgo+IERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgb2Yg
dGhhdCBvbmUgdGhhdCBkb2Vzbid0IHdvcmsgd2l0aCBzb21lIEdDQwo+IHZlcnNpb25zPyBJdCdk
IGJlIGludGVyZXN0aW5nIHRvIHRha2UgYSBsb29rLi4uCgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmM/aWQ9YTdlZTgyNGE2MjU1ZTM0N2Vh
NzZlMmYwMDgyN2U4MWJiZTAxMDA0ZQoKQWxleAoKPgo+IFRoYW5rcwo+IC0tCj4gR3VzdGF2bwo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
