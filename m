Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79A2152E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7360B6E0B7;
	Mon,  6 Jul 2020 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915026E0B7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 07:12:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a6so39614278wrm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 00:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FoSjIG3VRw8M9fOU/dfLMuLezeTkp5UAh0BxNMHAjSU=;
 b=if9HBlA9VQz/DooWA8KmSxJ1gwN0Z/+q/abPRsudszDLAPA5Sax63WJuxR/o0W7YRW
 pY3+BOTmv9n1glV/nSTkzluey/r9TND8/Um1sbKlF7gaOJyxNkt3qpbkSHwhnPt2fgvA
 PrhvSA8l2QPunnrnOJDw73eRQ+4iGvqYbzEDWJziNcpx3AH93pN474NFD5hNkR34Avfq
 L4BIuECug2LTD7En9WA6bmt9HuCDKrCzb2FwCrCAH3wEUGUiENhaLPGCX2fuvKxC0OD9
 s5DsLrUA93+Of8tTSSH4UjB1bRwCruHx5RgHBrpx2bvmK3cJDhrrequ1c+JCNU6MxS2u
 EJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FoSjIG3VRw8M9fOU/dfLMuLezeTkp5UAh0BxNMHAjSU=;
 b=fFZmmO7tF6kOwA8EfL9Uyd7IIE6ZFphhTiEhoSy+JOq4HGtjuNKvXlTA9Bm7xjT6wb
 YVvahqAMOmqhUCpfazl6zbYjVGNJmO0PuMr+42OUqHp7GYrCv6KTxYIUJf8p0tf9M8Mz
 RtPShv9sakL14r2Cig3rUoTx1yGxnbSBBMkozMtMtAKr2VOIu7FHH9sAQygLJ1e6tovj
 u/glNANizpTM508wTo9MwzKahMLV3v7EVx5/x2tmiL6aVcr5l/sQQe3mNQBiPNSTikJk
 /sA1AWJUIpF8nuNh6KyLQybFNsDuS2z+kZpFMcMlgszu6J95roB6XZ9D4vcw/3uI4FMP
 qK1Q==
X-Gm-Message-State: AOAM531LfKxcqJIYuUTu22l3HXrxx8Zw7KljKFxFNoZ5HDKxNPmqbXVC
 gnxG/KwRQH6uiHnQSGuo1JP9qw==
X-Google-Smtp-Source: ABdhPJwLhBlFAKN26FXGsrKJ2/3ld4/TUj5IudfdjzM/ZuZS/dr7xAKMChCzQ/pTpQ6ikPiMmParcw==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr46895795wrt.108.1594019576099; 
 Mon, 06 Jul 2020 00:12:56 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id 65sm22090235wmd.20.2020.07.06.00.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:12:55 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:12:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200706071253.GA2821869@dell>
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
IHdyb25nIHdpdGggImEgcG9pbnRlciB0byBhbiBTUEkgZGV2aWNlIj8KCkkndmUgZml4ZWQgdGhp
cyBhbmQgYXBwbGllZCB0aGUgcGF0Y2guCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
