Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235AE95884
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A026E5F8;
	Tue, 20 Aug 2019 07:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E9E6E272
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 19:20:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z17so2830642ljz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 12:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N1FJcWQF1tKSEgluxrWB6NkTiT1Cjd+gdeCsUdxZ1K4=;
 b=IoJeg0WdZUNNigifUeTlxaE5Njuz4+h2NQ8Vux8C5MVBe9+DDZXjKCJivgIZwUvQ/X
 GKrp24PYPH0BzZjkpuczBEJljbv6eVlwJTDHFvwN6vpyTlyB4eMv/LiI7rI1CZSo5Nxa
 0LJseo6hAZmkGXCO18zgT/RHEUxJvkCZEfhbP354eC6ywCDjvrYL83w49xk/tK6B19Y+
 mp2dRWmwmOwkElez+tETRv4CzSG+xVB/czCrHpNgRXNE/IsmA2jqWEPx4LDAZASjCh3x
 30z8sQC2cvFJFOhHX/Ad9B3hWuSDB888394dFCIU5CXB6i8HGhmuZZNAHrjsXj7mLIsS
 Pkfw==
X-Gm-Message-State: APjAAAU4qEeIRsbPCEt3O/J4PGJJLRAdFmBlrYavJdNOSSFzP65Wf/dU
 hWhMhDhnBfpfGcVqboXlV5exzWSOK2w4LfiCsZE=
X-Google-Smtp-Source: APXvYqxnzrHi/ifYk2Gm6ducLy7eJLjEJT/H5brIIBwTTPD/q1O1/wmN/CSmfwpdz3tvX9E0uCT5uQmos/W1HnoW0dM=
X-Received: by 2002:a2e:81cb:: with SMTP id s11mr13142236ljg.179.1566242410015; 
 Mon, 19 Aug 2019 12:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <5978761.uBj7R84RrF@jernej-laptop>
In-Reply-To: <5978761.uBj7R84RrF@jernej-laptop>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Mon, 19 Aug 2019 21:20:00 +0200
Message-ID: <CAOUEw13CCVhk9kt_z2VkguX0=TCeARkH-8+qSh_nF-J+r0Rscg@mail.gmail.com>
Subject: Re: [v5,05/12] drm/modes: Rewrite the command line parser
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N1FJcWQF1tKSEgluxrWB6NkTiT1Cjd+gdeCsUdxZ1K4=;
 b=hfrU9m2s/Dvghd7ZW5ecHUaFz92ArpQe/hBZrdRvGb4OaDy99gu1Yg4KFjtyracFHD
 QdnHHl/tMe6WZARq9FujHnTMPY6KRqvGl3DE55VgA1AknTln8FvO/7yjDciTzls6OOhX
 Ej5xBUXPZbX5QgvV7sGIR5rLBQC9f8bhhxbd0hs8FSTRbLEuStkgvjAoQXFShOm9XN9T
 iyrFwMECFpFgk/6J82yRkjYTxCYJl7dKRHT9u4NmMlRdRtZQrdPRQH62tTf4C/CFSlNB
 RzMOqCTIhHT8tJzHkuJTBDI9s/PYDJgCbzO9h6sH08124j0JJCB/RCA6wnVNmPpZ/tzs
 Kxrg==
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
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgODo1NCBQTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiArQ0M6IFRob21hcyBHcmFpY2hlbgo+Cj4gRG5l
IHBvbmVkZWxqZWssIDE3LiBqdW5paiAyMDE5IG9iIDE2OjUxOjMyIENFU1QgamUgTWF4aW1lIFJp
cGFyZCBuYXBpc2FsKGEpOgo+ID4gRnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBm
cmVlLWVsZWN0cm9ucy5jb20+Cj4gPgo+ID4gUmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNl
ciBpbiBvcmRlciB0byBnZXQgYXdheSBmcm9tIHRoZSBzdGF0ZSBtYWNoaW5lCj4gPiBwYXJzaW5n
IHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+ID4KPiA+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93
IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2lseSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4gPiBhbmQg
LyBvciBwcm9wZXJ0aWVzIHNldCBkaXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+ID4KPiA+
IFJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+IFNp
Z25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMu
Y29tPgo+Cj4gVGhvbWFzIHJlcG9ydGVkIHRvIG1lIHRoYXQgdGhpcyBwYXRjaCBicmVha3MgInZp
ZGVvPUNPTk5FQ1RPUjplIiBrZXJuZWwKPiBwYXJhbWV0ZXIgd2hpY2ggaGUgY3VycmVudGx5IHVz
ZXMgYXMgYSB3b3JrYXJvdW5kIGZvciBINiBIRE1JIG1vbml0b3IKPiBkZXRlY3Rpb24gaXNzdWUg
b24gb25lIFNUQi4KPgo+IEkgc3VwcG9zZSB0aGlzIGlzIHRoZSBzYW1lIGlzc3VlIHRoYXQgRG1p
dHJ5IG5vdGljZWQuCj4KPiBUaG9tYXMgR3JhaWNoZW4gKGluIENDKSBjYW4gcHJvdmlkZSBtb3Jl
IGluZm9ybWF0aW9uIGlmIG5lZWRlZC4KPgo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKCmFzIGpl
cm5laiBhbHJlYWR5IG1lbnRpb25lZCBpIGFtIGN1cnJlbnRseSBoYXZpbmcgdG8gdXNlIHRoZSBr
ZXJuZWwKY21kbGluZSBvcHRpb24gdmlkZW89SERNSS1BLTE6ZSB0byBnZXQgYSB3b3JraW5nIGhk
bWkgb3V0cHV0IG9uIGFuCmVhY2hsaW5rIGg2IG1pbmkgdHYgYm94IGFuZCB3YXMgd29uZGVyaW5n
IHRoYXQgaSBkaWQgbm90IGdldCBhbnkgaGRtaQpvdXRwdXQgZXZlbiB3aXRoIHRoaXMgb3B0aW9u
IHdoZW4gc3dpdGNoaW5nIGZyb20gdGhlCmh0dHBzOi8vZ2l0aHViLmNvbS9tZWdvdXMvbGludXgg
b3ByYW5nZS1waS01LjIgdG8gdGhlIG9yYW5nZS1waS01LjMKYnJhbmNoIHdoaWNoIHNlZW1zIHRv
IGNvbnRhaW4gdGhpcyBwYXRjaC4gYXMgaSBoYWQgbm8gaWRlYSB3aGF0IG1pZ2h0CmhhdmUgY2F1
c2VkIHRoZSBicmVha2FnZSBvZiB0aGUgaGRtaSBvdXRwdXQgYW5kIGRpZCBhIGZ1bGwgYmlzZWN0
IG9mCnRoZSBrZXJuZWwgYmV0d2VlbiB0aG9zZSB0d28gdmVyc2lvbnMsIHdoaWNoIGVuZGVkIHJl
bGlhYmx5IGF0IGV4YWN0bHkKdGhpcyBwYXRjaCAtIHNvIGkgZ3Vlc3MgdGhlcmUgaXMgYSByZWdy
ZXNzaW9uIGF0IGxlYXN0IHdpdGggdGhlCnZpZGVvPUNPTk5FQ1RPUjplIG9wdGlvbiAobWF5YmUg
b3RoZXJzIHRvbz8pIHdpdGggdGhpcyBwYXRjaGVzIGNvZGUKd2hpY2ggbWFrZXMgaXQgbm90IHdv
cmtpbmcgYW55bW9yZS4KCmJlc3Qgd2lzaGVzIC0gdGhvbWFzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
