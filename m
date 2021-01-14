Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB82F558B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 01:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26ED7891CE;
	Thu, 14 Jan 2021 00:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097BA891B4;
 Thu, 14 Jan 2021 00:22:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h205so5483330lfd.5;
 Wed, 13 Jan 2021 16:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NHx6cOmF9H+3oeO1NzvO+G1sr0qFE9WCAeIZ2WKr5OU=;
 b=jqmVgsX8RTXFXONNRRKx1wmvRnXZD1l3Vtt86Gw+2x7IRb+4doLuwHA88sH/CCCncj
 bQ/Mlgvi3V8K6FaQpkeyKaDBYFT5mWkhy5Ngvy64/RSftsDtzB5sbxAD7rQDBw2NiAC2
 Jnv+cGp4ZX30zFXssT0dafcrayXtJFtTk/17B2JXedwSByA6n8+YFz5JlEUBPR5sb9jt
 QJh3pWEiRxWXnywzSEILVOBZWg2dB5+lCPRQHbwlYKGutIFfTKzeA/jnFUKH126GHGmR
 ngpQQf44Q478cxtCIgrJBPvujAGp92VUVdUbCdCKl1YvzYy0aVdeP1w41Sua8L+trVSN
 5LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NHx6cOmF9H+3oeO1NzvO+G1sr0qFE9WCAeIZ2WKr5OU=;
 b=MjqpjHuSkYksf9RoYWzUuewirzwovzqRFO9Gc4HS3VfPcWtehuuw+BbcV4s7y2ELCU
 Q9dmyyL02CawrDZ69u5+w2M/pcb8tlSiPxXubkRzqCxL5MlWkJjdSIcABmsDQz0/Ooci
 7ECHsOmtHS59lUoK30GUjavFRXpSripfpYvxtUgr/77LZNIS9x2VBxJsUgfGmM+8AjMJ
 0k3EZhWx317A5M84f26QmJd/pKwenej3oo0/vQz8swUq7jUM/YesrGyKaRc0GEOQVXOc
 FlW+EXkN1vLSrCOLk6uBUrm4pa5jD+BKENgE+Gp0qB20qqZzdZCM1p6T/5PEfjgrujuJ
 fTXg==
X-Gm-Message-State: AOAM53376AdxbGCfV1nBk9ETIhG8YTrPFrLYxQ9SsKtlJ/Skem3PEdgh
 bnU+erLaw1A2se4pVvA3URSa3lZe5StGNDCO4yI=
X-Google-Smtp-Source: ABdhPJzKKKsjj7+sy2+hHoOsiI3jtp9uH+slbZWSLs368X4wm/8gU+UlmI/1PznIcmVxxOsLXWe54p30Xw400YlQE9k=
X-Received: by 2002:a19:890b:: with SMTP id l11mr2024934lfd.66.1610583770239; 
 Wed, 13 Jan 2021 16:22:50 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
 <816e944c-72bc-d94d-449f-bfb915382290@amd.com>
 <6e55d84c-7b9a-167c-34cf-9e980f8e2354@amd.com>
 <CABXGCsM8yYNz7gQW26a4hHwBR+MunXoopHEiyDJdC-muNrRxkQ@mail.gmail.com>
 <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
In-Reply-To: <77b696b9-3248-d329-4f7d-5e27a21eabff@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 14 Jan 2021 05:22:37 +0500
Message-ID: <CABXGCsOcBMT4rL-bb4K_TzK70YmQsgNX37sHEHiqp_1kK1_UEQ@mail.gmail.com>
Subject: Re: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBKYW4gMjAyMSBhdCAwMTo0NSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEJ1dCB3aGF0IHlvdSBoYXZlIGluIHlvdXIgbG9n
cyBzbyBmYXIgYXJlIG9ubHkgdW5yZWxhdGVkIHN5bXB0b21zLCB0aGUKPiByb290IG9mIHRoZSBw
cm9ibGVtIGlzIHRoYXQgc29tZWJvZHkgaXMgbGVha2luZyBtZW1vcnkuCj4KPiBXaGF0IHlvdSBj
b3VsZCBkbyBhcyB3ZWxsIGlzIHRvIHRyeSB0byBlbmFibGUga21lbWxlYWsKCkkgY2FwdHVyZWQg
c29tZSBtZW1sZWFrcy4KRG8gdGhleSBjb250YWluIGFueSB1c2VmdWwgaW5mb3JtYXRpb24/Cgpb
MV0gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vbjBGRTdIc3UKWzJdIGh0dHBzOi8vcGFzdGViaW4uY29t
L01VWDU1TDFrClszXSBodHRwczovL3Bhc3RlYmluLmNvbS9hM0ZUN0RWRwpbNF0gaHR0cHM6Ly9w
YXN0ZWJpbi5jb20vMUFMdkpLejcKCi0tCkJlc3QgUmVnYXJkcywKTWlrZSBHYXZyaWxvdi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
