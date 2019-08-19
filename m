Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8EF9256F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 15:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21316E111;
	Mon, 19 Aug 2019 13:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AA86E111
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 13:46:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c7so1697328otp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxuAOsH0gITRNJN9OBpJxbvDlqYTby07AVpQXXeyCGI=;
 b=Cb+iNyCCeQ954zwRmgdf1pHfQ3C+HobVTGCWlNx2u1MLB6xFX6QivMo7ikwTvLHnrK
 ccADv9baBrPA6R+NjSDECI71JkC5FWIVLLCpeshpI6xQCLE+fvZSsHtpJ7n09ssk8hqj
 1ldq34l/CWoV9dVTT9u4lMiY29w3iK6Murh1RVsTBPOe1NtT/b8CE2VGSUFfooOUIXhF
 MZbHaby6IIxtZVZbXPHSiC3DAedYeNus/D5IjXICPC4M4RfWA17o9Oxaf5yzEG0t0Lg6
 OLTr/3Ibiq769TRvHNvirNJk1DATbOt3SU2OLRDX68pTE9FB3CoXs6EwuxXeLsG+okQY
 XWPw==
X-Gm-Message-State: APjAAAUew1MRPovfJrNup11NOmG9oAf6P8l/+HPlby4svFP6iv1SP9Os
 vCbMSXAM0ZHfj0FU3vg2rMWGBgjzUX63V39h4+E=
X-Google-Smtp-Source: APXvYqzgYstlVA652TlqSPbEjGg5VRStiuwas2W4EMQF6pqOxYXBuRXCDn2aIXatACWciHFWW+VeDtlXD+c2OkPoXLQ=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr18936397otn.297.1566222365556; 
 Mon, 19 Aug 2019 06:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
In-Reply-To: <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 15:45:54 +0200
Message-ID: <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gTW9uLCBKdWwgOCwgMjAxOSBhdCA5OjU4IEFNIEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIFNhdCwgSnVsIDYsIDIwMTkg
YXQgNDowNyBQTSBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3Rl
Ogo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5l
c2FzIFItQ2FyIERpc3BsYXkKPiA+IFVuaXQgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUuCj4gPgo+
ID4gQ01NIGlzIHRoZSBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgYXZhaWxhYmxlIG9uIGVhY2gg
Ui1DYXIgRFUgdmlkZW8KPiA+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChW
M0ggYW5kIFYzTSBleGNsdWRlZCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPgo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCEKPgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gPiBAQCAtMCwwICsx
LDI1IEBACj4gPiArKiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0p
Cj4gPiArCj4gPiArUmVuZXNhcyBSLUNhciBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgY29ubmVj
dGVkIHRvIFItQ2FyIERVIHZpZGVvIGNoYW5uZWxzLgo+ID4gKwo+ID4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gPiArIC0gY29tcGF0aWJsZTogc2hhbGwgYmUgb25lIG9mOgo+ID4gKyAgIC0gInJl
bmVzYXMscmNhci1nZW4zLWNtbSIKPiA+ICsgICAtICJyZW5lc2FzLHJjYXItZ2VuMi1jbW0iCj4K
PiBXaHkgZG8geW91IHRoaW5rIHlvdSBkbyBub3QgbmVlZCBTb0Mtc3BlY2lmaWMgY29tcGF0aWJs
ZSB2YWx1ZXM/Cj4gV2hhdCBpZiB5b3UgZGlzY292ZXIgYSBkaWZmZXJlbnQgYWNyb3NzIHRoZSBS
LUNhciBHZW4zIGxpbmUgdG9tb3Jyb3c/Cj4gRG9lcyB0aGUgSVAgYmxvY2sgaGF2ZSBhIHZlcnNp
b24gcmVnaXN0ZXI/CgpEbyB5b3UgaGF2ZSBhbiBhbnN3ZXIgdG8gdGhlc2UgcXVlc3Rpb25zPwpU
aGFua3MhCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
