Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5001DE06B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DBB6E993;
	Fri, 22 May 2020 06:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E516E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 11:30:26 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id y22so6831877qki.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=MqYN+vMiHTEaW4UwLRy16WRoYfu+LJ4pOncpItD4O1GRnxH8TmktN6T6b2PcHxyEwB
 /Ls2IApWVfXgN0RNquNulhQ49MIzfMO2KbQlpew/gmesTLhSAFACIhd9NN5hvF8aTXrJ
 9dGZyhMELfyMK2fbiMTxbSKpZ8EVlDN75FSZjN4lYOI29EfHTi0l6te+3DGNqlishUcI
 ufFCYzDFtCRCTDhyOG4tSbItgT3oIdpuWbG9YF8aGWnFAtPl3K8qizsCVOk3/weuXndt
 nd8yUP/5mHGC7HDR1cjV9fJCWbl4EUH4bqfDeIq+Fhmmrdj99nMfB4lAH2i7rVf5TT9v
 sLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=B9mdQPKn8rB6WObX6WV1aDbPXpKnXS/XZIvIkm4yO1bozBA63XQM9vDLsiLwMWji7U
 Um0GL7KErTS7ueKK5PtAk+7HUgzzPXwa/GDIKMYn8DRqeGiI51l7gKweEU457KuetguF
 K5Fhu7obaSZA5L/Ri3Ontx3+DAKROWVh14yRqjTh4n63j3Xtws4oIAiVi+73PuVsHzhe
 kzdlG6dbWB+/PJXtf6ttYYCuVp6JCiYLG5ooPOHZabtV7InK9KwyX6jHbk3bgHFh8uOz
 OzewKSSFbeM/jgauty3QnWrv9973hNJdIULXvSvuPmU/8PQLjITo/uFfTPVbMx/c6UaF
 YBmw==
X-Gm-Message-State: AOAM531xj9B4pstNdfCqtw0I9AKWrLpR86GBU9CnSTUrAkEWIrxzNitT
 zzWG64QAEe2Y6VR0PH5V1orNlv4cu/c1TXIf66Q=
X-Google-Smtp-Source: ABdhPJyt/PrPu0HyLCBNIAlcBPVwQP3EdSaZpX3l0+ThMZQ3Nc11G0djVdAg3aM+jm8BukBsG/8Iq0VgME50WXdM3Aw=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr9327701qke.121.1590060626064; 
 Thu, 21 May 2020 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
 <20200520123850.GE4823@sirena.org.uk>
In-Reply-To: <20200520123850.GE4823@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 May 2020 19:30:04 +0800
Message-ID: <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 shawnguo@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, perex@perex.cz,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-media@vger.kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgODozOCBQTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgMDc6MjI6MTlQTSArMDgw
MCwgU2hlbmdqaXUgV2FuZyB3cm90ZToKPgo+ID4gSSBzZWUgc29tZSBkcml2ZXIgYWxzbyByZXF1
ZXN0IGRtYSBjaGFubmVsIGluIG9wZW4oKSBvciBod19wYXJhbXMoKS4KPiA+IGhvdyBjYW4gdGhl
eSBhdm9pZCB0aGUgZGVmZXIgcHJvYmUgaXNzdWU/Cj4gPiBmb3IgZXhhbXBsZe+8mgo+ID4gc291
bmQvYXJtL3B4YTJ4eC1wY20tbGliLmMKPiA+IHNvdW5kL3NvYy9zcHJkL3NwcmQtcGNtLWRtYS5j
Cj4KPiBPdGhlciBkcml2ZXJzIGhhdmluZyBwcm9ibGVtcyBtZWFucyB0aG9zZSBkcml2ZXJzIHNo
b3VsZCBiZSBmaXhlZCwgbm90Cj4gdGhhdCB3ZSBzaG91bGQgY29weSB0aGUgcHJvYmxlbXMuICBJ
biB0aGUgY2FzZSBvZiB0aGUgUFhBIGRyaXZlciB0aGF0J3MKPiB2ZXJ5IG9sZCBjb2RlIHdoaWNo
IHByZWRhdGVzIGRlZmVycmVkIHByb2JlIGJ5IEknZCBndWVzcyBhIGRlY2FkZS4KClRoYW5rcy4K
CkZvciB0aGUgRkUtQkUgY2FzZSwgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gZm9yIGhvdyBm
aXggaXQ/CgpXaXRoIERNQTEtPkFTUkMtPkRNQTItPkVTQUkgY2FzZSwgdGhlIERNQTEtPkFTUkMt
PkRNQTIKaXMgaW4gRkUsICBFU0FJIGlzIGluIEJFLiAgV2hlbiBFU0FJIGRydmllciBwcm9iZSwg
IERNQTMgY2hhbm5lbCBpcwpjcmVhdGVkIHdpdGggRVNBSSdzICJkbWE6dHgiIChETUEzIGNoYW5u
ZWwKaXMgbm90IHVzZWQgaW4gdGhpcyBGRS1CRSBjYXNlKS4gICAgV2hlbiBGRS1CRSBzdGFydHVw
LCBETUEyCmNoYW5uZWwgaXMgY3JlYXRlZCwgaXQgbmVlZHMgdGhlIEVTQUkncyAiZG1hOnR4Iiwg
c28gdGhlIHdhcm5pbmcKY29tZXMgb3V0LgoKYmVzdCByZWdhcmRzCndhbmcgc2hlbmdqaXUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
