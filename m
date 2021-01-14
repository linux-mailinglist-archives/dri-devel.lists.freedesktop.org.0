Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA12F66E9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE936E0F7;
	Thu, 14 Jan 2021 17:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDC26E0F7;
 Thu, 14 Jan 2021 17:12:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 15so6628752oix.8;
 Thu, 14 Jan 2021 09:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5nzwxmDDL8KoR6FUdEDHJ+6iXx4WrUEgeA2us+HBBg=;
 b=JnACE68nragtnK2wSws6wgqbx1u3nM2KwBgQMrbZf0m/eZPqP2M/pvzXXw16i/trnb
 2gVO5SJ+p1B1x2MAcRhOX4vBcirxMCHg2S6AgnP3H6cCsa/3v3NDfEQR2gzdPww5eamn
 gCTdD5CRGKPq/eSr+Qpnw/pNpnuKPOirgI5o/VMOvcC4hB7NFnscHxAL5t75EvKwk3RP
 BzuRYqsRPCDYATOyDWdXFoHeM7GmABNqPRAyVial0p4QBa3pw4adafd/75jzkkLfu3xL
 er0N4yszk8zLG1IvpwGh9wlEWo0NWJgxv3l+g/eEkoVyAd+3qBFzNrwG+LIvDSWx+96m
 mfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5nzwxmDDL8KoR6FUdEDHJ+6iXx4WrUEgeA2us+HBBg=;
 b=MDLqDp+kp7hfk520yRfLlu01w2wpcxOS1It39Vcav1mSe22k+NUKuijnI/GcqEiJZy
 5EtZWIP9aBy7uQiHBOjgi9RhFRQ8j00ft2JZ80cctMcxuEAgbqOMjpNULpowxzdXAv81
 DV+Gse85EVYaPxnkgspqJfx1w8Mgr0sBX2YMyV2AhH83LZRGvntoPoxjLtPHHrGe9mIA
 Ec/dCxb7HJAKQwUrVDFR/HzWig8O4kxScvFBBybvEvj0Q7IfFInkW3t3qOWeaRNOEGNX
 p67aCVBWUBWVOVBuuHe+aKHYM36tNyZb6yTFiSLhgZww5an6C/7eFmHntlgreCUqRJrG
 twjQ==
X-Gm-Message-State: AOAM531ZUlr8PoWsJY/R8RRca2nFfHvf1w/xOIwbVgtRR+ATJ14PJfSY
 CcCsHlbSBALdmo8n3i8Vyut2CM/6g3C50z+HePk=
X-Google-Smtp-Source: ABdhPJwsyt2ceX5V5TWAh6XqwKrlbqZ0hwfqJdifmjPxMJTdBHCLOPkLsQ0U16bA2IEvBjfBEaMI8UowJArYNwrZt8c=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3125212oii.120.1610644363569; 
 Thu, 14 Jan 2021 09:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-13-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-13-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:12:32 -0500
Message-ID: <CADnq5_O4vTf45LPxLGQdKj=nQdk4aegF=mciQV8=rK3ahTvVdg@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/amd/display/dc/dce100/dce100_resource: Include
 our own header containing prototypes
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYzo1NDoKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291
cmNlLmM6NTM3OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhNSV9EQ0U4X01BU0tf
U0hfTElTVOKAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZTEwMC9kY2UxMDBfcmVzb3VyY2UuYzo1Mzc6Mzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmE1JX0RDRThfTUFTS19TSF9MSVNU4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jOjU0MjozOiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYTUlfRENFOF9NQVNLX1NIX0xJU1TigJkKPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6
NTQyOjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhNSV9EQ0U4X01BU0tfU0hfTElT
VOKAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9k
Y2UxMDBfcmVzb3VyY2UuYzo1NDc6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERD
RTEwX0FVWF9NQVNLX1NIX0xJU1TigJkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6NTQ3OjI6IG5vdGU6IGluIGV4cGFu
c2lvbiBvZiBtYWNybyDigJhEQ0UxMF9BVVhfTUFTS19TSF9MSVNU4oCZCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jOjU1
MToyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYRENFMTBfQVVYX01BU0tfU0hfTElT
VOKAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEwMC9k
Y2UxMDBfcmVzb3VyY2UuYzo1NTE6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERD
RTEwX0FVWF9NQVNLX1NIX0xJU1TigJkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6ODg5OjE2OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEwMF9hZGRfc3RyZWFtX3RvX2N0eOKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jOjkxNjoxNjogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhkY2UxMDBfdmFsaWRhdGVfcGxhbmXigJkgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
ZTEwMC9kY2UxMDBfcmVzb3VyY2UuYzo5MjU6MjQ6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYZGNlMTAwX2ZpbmRfZmlyc3RfZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9s
aW5r4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmM6MTE1NjoyMzogd2Fybmlu
Zzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UxMDBfY3JlYXRlX3Jlc291cmNlX3Bv
b2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxp
ZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKPiBpbmRleCA2NDgxNjkwODZiY2Y4Li42MzVl
ZjBlN2M3ODI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jCj4gQEAgLTU4LDYgKzU4LDggQEAKPiAgI2lu
Y2x1ZGUgImRjZS9kY2VfYWJtLmgiCj4gICNpbmNsdWRlICJkY2UvZGNlX2kyYy5oIgo+Cj4gKyNp
bmNsdWRlICJkY2UxMDBfcmVzb3VyY2UuaCIKPiArCj4gICNpZm5kZWYgbW1NQ19IVUJfUkRSRVFf
RE1JRl9MSU1JVAo+ICAjaW5jbHVkZSAiZ21jL2dtY184XzJfZC5oIgo+ICAjaW5jbHVkZSAiZ21j
L2dtY184XzJfc2hfbWFzay5oIgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
