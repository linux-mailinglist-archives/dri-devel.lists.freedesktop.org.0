Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B1209CED
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 12:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F216EA43;
	Thu, 25 Jun 2020 10:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C346EA43
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 10:33:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so5034902wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cwS7iBZ35KlWA6jBEXe+RY7hU/oltm4mf+ZLVTmBHbg=;
 b=ckSbRH6Y9xOKw8TwFf5S6Fhk1vOPMMffz1PvAsd5fQkuEUwGeqv8ZMfu7b4VseJXq+
 Q+Zwl6jtJPG6b8nC0vUNjXsuJBAHkcblkb0pQgjxdlrWuvAO3vVH5EOdN8ykR1fFNkO2
 0Y3+9hQyIHdmKpwtONksi/eq/d8zwBaAwnMZiCl2cMapDRa21bVFWnrvJmrLcOy/lGA5
 r1jIAR/pLarr4nRMPCFRPDiBFXE3KVAPa2+iPKV0c4lCbi24fnFNTvU8a5C/BFnrqmFF
 NBvqmgslp9dIo5O2WX8S0qZbHFB5FnOKAffE3NigkrXiKcASZlQGDfgOFNp/1b16IVxq
 irbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cwS7iBZ35KlWA6jBEXe+RY7hU/oltm4mf+ZLVTmBHbg=;
 b=HBsTHHtUYLlP0l+Jb1yMXN8UFa3Gtpw+50UkNRRTBqy8RblPTlrirybMewAoCNlhxe
 d+Y7EQ4qDYr8hafWZvVtWA2Sk0SA6O4WghqFGLg7cu1B64xxZQ+OaBakpwcaEW8p0xG2
 5ke1j0WJAFVRz/yof6MJBlVCorpfl7yWVh/SdgKoagddKVsai3nGLcH8gSJNtsqbFjqK
 Unj170pZA9WnlXPE61udJhGfsUXEi7rZv+1m/HVuF9hL/Z+xKYSGhyqQaeS/p6Aowyvb
 Ix86Oopt7DGE181QU1PQd8LqP6vaQA73SgFJI4M/FgiPFy7KyjZ+xMhXnL6X7IRYO/TG
 2Gcw==
X-Gm-Message-State: AOAM5319NWwWSk+pFdT8onBloFSLaPKbN8HqPiPU6SYK4jBrNy/ytNdh
 IORk0NYf3rg36HbgXdjl6uIirw==
X-Google-Smtp-Source: ABdhPJxRQCCMvNxIjXjxszNKanKw0pTi4YzKhm6dZatNk1oJ81au17V7nolB179hYdVcODuntoi7tQ==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr2641581wmj.89.1593081217260; 
 Thu, 25 Jun 2020 03:33:37 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id t4sm5852497wmf.4.2020.06.25.03.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 03:33:36 -0700 (PDT)
Date: Thu, 25 Jun 2020 11:33:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200625103334.GO954398@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-4-lee.jones@linaro.org>
 <20200625094051.u4hanl3rycczlwiy@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625094051.u4hanl3rycczlwiy@holly.lan>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdW4gMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBXZWQsIEp1
biAyNCwgMjAyMCBhdCAwMzo1NzoxNlBNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBLZXJu
ZWxkb2Mgc3ludGF4IGlzIHVzZWQsIGJ1dCBub3QgY29tcGxldGUuICBEZXNjcmlwdGlvbnMgcmVx
dWlyZWQuCj4gPiAKPiA+IFByZXZlbnRzIHdhcm5pbmdzIGxpa2U6Cj4gPiAKPiA+ICBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmM6MTE2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdzJyBub3QgZGVzY3JpYmVkIGluICdDSEVDS19GUkVRX1JFRycKPiA+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmM6MTE2OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICd4JyBub3QgZGVzY3JpYmVkIGluICdDSEVDS19GUkVRX1JFRycK
PiA+IAo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gQ2M6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiA+IENjOiBTb2Z0d2Fy
ZSBFbmdpbmVlcmluZyA8c2JhYmljQGRlbnguZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvaWxpOTIyeC5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lsaTkyMngu
YyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lsaTkyMnguYwo+ID4gaW5kZXggOWM1YWEzZmJi
Mjg0Mi4uOGNiNGI5ZDNjM2JiYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2lsaTkyMnguYwo+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaWxpOTIyeC5j
Cj4gPiBAQCAtMTA3LDYgKzEwNyw4IEBACj4gPiAgICoJbG93ZXIgZnJlcXVlbmN5IHdoZW4gdGhl
IHJlZ2lzdGVycyBhcmUgcmVhZC93cml0dGVuLgo+ID4gICAqCVRoZSBtYWNybyBzZXRzIHRoZSBm
cmVxdWVuY3kgaW4gdGhlIHNwaV90cmFuc2ZlciBzdHJ1Y3R1cmUgaWYKPiA+ICAgKgl0aGUgZnJl
cXVlbmN5IGV4Y2VlZHMgdGhlIG1heGltdW0gdmFsdWUuCj4gPiArICogQHM6IHBvaW50ZXIgdG8g
Y29udHJvbGxlciBzaWRlIHByb3h5IGZvciBhbiBTUEkgc2xhdmUgZGV2aWNlCj4gCj4gV2hhdCdz
IHdyb25nIHdpdGggImEgcG9pbnRlciB0byBhbiBTUEkgZGV2aWNlIj8KPiAKPiBJIGFtIGF3YXJl
LCBoYXZpbmcgbG9va2VkIGl0IHVwIHRvIGZpbmQgb3V0IHdoYXQgdGhlIGFib3ZlIGFjdHVhbGx5
Cj4gbWVhbnMsIHRoYXQgdGhpcyBpcyBob3cgc3RydWN0IHNwaV9kZXZpY2UgaXMgZGVzY3JpYmVk
IGluIGl0cyBvd24ga2VybmVsCj4gZG9jIGJ1dCBxdW90aW5nIGF0IHRoYXQgbGV2ZWwgb2YgZGV0
YWlsIG9mIGJvdGggb3ZlcmtpbGwgYW5kIGNvbmZ1c2luZy4KCkkgZmlndXJlZCB0aGF0IHVzaW5n
IHRoZSBvZmZpY2lhbCBkZXNjcmlwdGlvbiB3b3VsZCBiZSBiZXR0ZXIgdGhhbgptYWtpbmcgc29t
ZXRoaW5nIHVwLiAgSG93ZXZlciBpZiB5b3UgdGhpbmsgaXQncyBiZXR0ZXIgdG8gS0lTUywgdGhl
biBJCmNhbiBjaGFuZ2UgaXQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNo
bmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
