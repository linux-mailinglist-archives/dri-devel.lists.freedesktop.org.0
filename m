Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EC9C6203
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 20:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9CB10E639;
	Tue, 12 Nov 2024 19:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7QRnyUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7403B10E1E6;
 Tue, 12 Nov 2024 19:59:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53d8c08cfc4so3496270e87.3; 
 Tue, 12 Nov 2024 11:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731441555; x=1732046355; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XwZYkRsX6YfbHFG1wqjaJ7mBPncYDizCUMOUgXXp8/w=;
 b=A7QRnyUekt9g62H36wU43f2j0FOpsc7i9xHdFFcMBGjmZ5JSbdU9rXNitvA5tys/Lx
 SPDg4h4BennO3OKPPP2fwPL7NJmdJXfIfe7BakxzGOD44eNPr+uQtf4r8/MtDwv2MDlP
 6ZBBJFjpskAA7P4lYpxctgK5mBjVNd6SoJ1g093wT838hJbubwCAADw0s7ZkZj/NNgWs
 Cn10YKoGaZCG0r5xg/X3kLn4EynUchyJqw1c+PfrtM45m4BoMK1q9+PHdmlZCFtsnesa
 O3mgfiKItCwfZidMyDTKQuTLIzgpVqNFwncoqbCNDX5GLZhqpaAF28v5UQJNuFMhkGY8
 Rppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731441555; x=1732046355;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XwZYkRsX6YfbHFG1wqjaJ7mBPncYDizCUMOUgXXp8/w=;
 b=XJP8cwl+79pXX5/QqSe3bTvMM6mgbsL5eOwVjkg6edGitk6dPh2cKGMqTWy6BuT01p
 in9dXXkt85iZOzQhv9WuOA7Mb3hV+JqipD9PRDm8hPa1DQ+kIpUru5j5a9wX6quR2Y5c
 fsGyRPuHP2eo7Ljk42xbC1Bmi4Ob6aC0C24xmw1m1LoxZ0DQLQDdajTh/BUl9rXjgbXS
 QgPn5TEFqNdCCOAKc3dyn9oHWBaLz00gZxXL/tNLPnms000rqm6752X+/JODE09jE/gl
 IqFlv+Zh5FzxucfDRfa9wQtSwVVrbSSSxm5vsRaDMG9gBxx2wuwzXRSQ2gifbwFVrygn
 R2AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYdGPEeHpm3x6WTo8OaCWIkBxk7HtchLMiR0Y9G2XB6ZFyncNUjOaBYF2YK3WArqtJxsAPAAT2s4o=@lists.freedesktop.org,
 AJvYcCX5sWk83UGIZJNCErs9ZYG7by/0RSfMSpQAu2qlQmHo6Ejid47c4fWlLlj3KulNA7DX/c1u5xxywQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz77pxplYW+6xdo9Zsxqd5DBn3TH8ru0cRJY2cJ3FMwrc045vbT
 okwQPtEvrJEM2RPHGyyAO6bu7f6BV4gGDAMnZykcGrwvdbxI2LPwOivERaovFlI7ZnWucTbH6hX
 GgelMwJDwejSCLtZgpKmsFWlrAXE=
X-Google-Smtp-Source: AGHT+IFbIllrfwGO0FHSAMmQGvZalC2B71K7rphbyHwgZ89xdxqrXmhCIojBrbJ1KXYBreY85U66dvhWmtBRR3bweu8=
X-Received: by 2002:a05:6512:ea8:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-53d862cd25bmr8266588e87.9.1731441555207; Tue, 12 Nov 2024
 11:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
 <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
 <D5DDUQJOZ4HW.1XDOASECJR714@tecnico.ulisboa.pt>
 <44c39c87-90e2-4a74-a185-752c14f6d711@leemhuis.info>
In-Reply-To: <44c39c87-90e2-4a74-a185-752c14f6d711@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 13 Nov 2024 05:59:03 +1000
Message-ID: <CAPM=9txeL+WxYuuGYyhGouXYC0=Y=YS=k=-4G74JbfT2mvkn2g@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B pmu timeout
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: kherbst@redhat.com, linux-kernel@vger.kernel.org, dakr@redhat.com, 
 lyude@redhat.com, bskeggs@nvidia.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Danilo Krummrich <dakr@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000d9c7020626bca665"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d9c7020626bca665
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 22:34, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing Danilo, who committed the culprit]
>
> On 04.11.24 13:11, Diogo Ivo wrote:
> > On Tue Oct 15, 2024 at 7:13 PM WEST, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 10.10.24 15:32, Diogo Ivo wrote:
> >>>
> >>> Somewhere between 6.11-rc4 and 6.11-rc5 the following error message is displayed
> >>> when trying to initialize a nvc0_screen on the Tegra X1's GM20B:
> >>>
> >>> [ 34.431210] nouveau 57000000.gpu: pmu:hpq: timeout waiting for queue ready
> >>> [ 34.438145] nouveau 57000000.gpu: gr: init failed, -110
> >>> nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF: -110
> >>> failed to create GPU screen
> >>
> >> Thx for the report. Hmmm. No reply so far. :-/

Apologies for the delay and thanks to Thorsten for bringing it up again,

Does the attached patch fix it?

if you say it does I'll send it out properly.

Dave.

--000000000000d9c7020626bca665
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-nouveau-sync-dma-after-setup-is-called.patch"
Content-Disposition: attachment; 
	filename="0001-nouveau-sync-dma-after-setup-is-called.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m3evkw6p0>
X-Attachment-Id: f_m3evkw6p0

RnJvbSBjMGY3OGIyMjZkYTQxNzczNTk0NTAwNjllNGExYWYyNDQyNTNmZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpEYXRl
OiBXZWQsIDEzIE5vdiAyMDI0IDA1OjU3OjAzICsxMDAwClN1YmplY3Q6IFtQQVRDSF0gbm91dmVh
dTogc3luYyBkbWEgYWZ0ZXIgc2V0dXAgaXMgY2FsbGVkLgoKc2V0dXAgc2VlbXMgdG8gY2hhbmdl
IHNvbWUgb2YgdGhlIGZ3IGNvbnRlbnRzLCBzbyBzeW5jIGFmdGVyIGl0LgoKU2lnbmVkLW9mZi1i
eTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL2ZhbGNvbi9mdy5jIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vZncuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vZmFsY29uL2Z3LmMKaW5kZXggYTFjODU0NWYxMjQ5Li5jYWM2ZDY0YWI2N2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZmFsY29uL2Z3LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9mYWxjb24vZncuYwpAQCAtODksMTEgKzg5LDYgQEAg
bnZrbV9mYWxjb25fZndfYm9vdChzdHJ1Y3QgbnZrbV9mYWxjb25fZncgKmZ3LCBzdHJ1Y3QgbnZr
bV9zdWJkZXYgKnVzZXIsCiAJCW52a21fZmFsY29uX2Z3X2R0b3Jfc2lncyhmdyk7CiAJfQogCi0J
LyogYWZ0ZXIgbGFzdCB3cml0ZSB0byB0aGUgaW1nLCBzeW5jIGRtYSBtYXBwaW5ncyAqLwotCWRt
YV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKGZ3LT5mdy5kZXZpY2UtPmRldiwKLQkJCQkgICBmdy0+
ZncucGh5cywKLQkJCQkgICBzZ19kbWFfbGVuKCZmdy0+ZncubWVtLnNnbCksCi0JCQkJICAgRE1B
X1RPX0RFVklDRSk7CiAKIAlGTENORldfREJHKGZ3LCAicmVzZXR0aW5nIik7CiAJZnctPmZ1bmMt
PnJlc2V0KGZ3KTsKQEAgLTEwNSw2ICsxMDAsMTIgQEAgbnZrbV9mYWxjb25fZndfYm9vdChzdHJ1
Y3QgbnZrbV9mYWxjb25fZncgKmZ3LCBzdHJ1Y3QgbnZrbV9zdWJkZXYgKnVzZXIsCiAJCQlnb3Rv
IGRvbmU7CiAJfQogCisJLyogYWZ0ZXIgbGFzdCB3cml0ZSB0byB0aGUgaW1nLCBzeW5jIGRtYSBt
YXBwaW5ncyAqLworCWRtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKGZ3LT5mdy5kZXZpY2UtPmRl
diwKKwkJCQkgICBmdy0+ZncucGh5cywKKwkJCQkgICBzZ19kbWFfbGVuKCZmdy0+ZncubWVtLnNn
bCksCisJCQkJICAgRE1BX1RPX0RFVklDRSk7CisKIAlyZXQgPSBmdy0+ZnVuYy0+bG9hZChmdyk7
CiAJaWYgKHJldCkKIAkJZ290byBkb25lOwotLSAKMi40Ny4wCgo=
--000000000000d9c7020626bca665--
