Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C2CB80F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 12:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555B96EB11;
	Fri,  4 Oct 2019 10:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AF36EB11
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 10:18:09 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id p13so3786425vso.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 03:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FR8/a0jMod/hGsojz+LGnIr8+PyKD68xBHORYzblMNk=;
 b=mZ3aS6jLmu2xAjfMW6Qz4z089kYSfX/JGktjXI53KBLM4lbvzxdTmjcAHKZ4sA053u
 GeJSbCNzFaSDxZSH8+NhgpXJE0iR4ugbzLwdG3cpaKTa0EXyw3YOOdyqJKFpybkxqz+O
 Gh5OT9EcJBRRVQfsECn3R02IHF9/gFiPBXW7y8grJ6T4VdUjYYckoTD4Zf4zIGY4qh71
 PQBIGI+BB6J4T3eMY62Zz2yGx33pkwlddh1LNc/ZnKolGUVCUNjcVxMl9a9lPFxxsvnR
 LvNQAsTo3gjYrCgA3t+A0OqO6+FDsXezFdbp0UTJ7FdcBXdjFsLGXon6+vB0Zi/wv2LE
 GLVA==
X-Gm-Message-State: APjAAAWqs5wMKgCCoKBTFys7btaa1Hw3vgnpPMEbaI6K3LrFhsL1hfaj
 tvpWYCNxlRxKlyG0R1lh4U5NEz9rN25otqP4cG12BSEM
X-Google-Smtp-Source: APXvYqzoJg533BuJP8X9hanZyDP0L9alk4DwLrlKbxlCtR/Dh3mBh8FRwtP02LUsZBLr2AmV84eZG7uiFXxZAQO1QWo=
X-Received: by 2002:a67:e40a:: with SMTP id d10mr7102858vsf.196.1570184288590; 
 Fri, 04 Oct 2019 03:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgH=JQeT3=tZ_AdBsV0e-S_JNEe4CtpFW8Wj5NfYW5PsA@mail.gmail.com>
 <CAOuPNLjqm+Dv5RARP6dzZRKSttCvqoLe7MNYOeChAGUWX1krRA@mail.gmail.com>
 <CAOuPNLgZ3kjBaCmXkXHZrncYqUxsNYKiXQqptoDBT_EWfjpNqg@mail.gmail.com>
In-Reply-To: <CAOuPNLgZ3kjBaCmXkXHZrncYqUxsNYKiXQqptoDBT_EWfjpNqg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 4 Oct 2019 15:47:57 +0530
Message-ID: <CAOuPNLjMFPn5WLcotG26wy_ROhJZn39iywwOYG0imzjqeQ3jeg@mail.gmail.com>
Subject: Re: imx6: hdmi black screen issue after resume
To: p.zabel@pengutronix.de, bob.beckett@collabora.com, 
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FR8/a0jMod/hGsojz+LGnIr8+PyKD68xBHORYzblMNk=;
 b=RJmgbSUmpYIPMnsXW4fiFNIs/nVsdpLxuh/2Jl/WgsZA02vC1tEOopTRcwbYPHM5L0
 r2vkElO9koITv+QRvcZ7eWPw4X/99IQsFa1qglm8P6X6HCy8xXv5WsVfamS72xN5rYMw
 TzISRhXTwgV1pJXSjocdgc8XLqm8jZ0owy4hJmRMYenI8QXCmerUwPEafvg9lM1tQ8rU
 Qk/XRRYHCoYpI+Ufi5B0LMqpNs4TCnVpdD8rYcqHCS6I24R+H1Y9wCVsoXmceg1+1g3L
 r8ijid7u8AvvOR9BsWsNr/+nlo7QPKNheFq4GAPHjhDsRX06CmrmT9PEi5YQJ+EeCMzQ
 wUmg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTdW4sIFNlcCAyOSwgMjAxOSBhdCAxMDoyNCBQTSBQaW50dSBBZ2Fyd2FsIDxwaW50
dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+Cj4gPiBPbiBNb24sIFNlcCAyMywgMjAxOSBh
dCAxOjI4IFBNIFBpbnR1IEFnYXJ3YWwgPHBpbnR1LnBpbmdAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gRGVhciBQaGlsaXBwLAo+ID4gPgo+ID4gPiBJIGhhdmUgYSBpTVg2ZGwgY3VzdG9t
IGJvYXJkIHdpdGggY3VzdG9tIExpbnV4IEtlcm5lbCA0LjguCj4gPiA+IEkgaGF2ZSBib3RoIExD
RCBhbmQgSERNSSBjb25uZWN0ZWQgdG8gdGhlIGJvYXJkLgo+ID4gPiBBbmQgd2UgYXJlIHVzaW5n
IHdlc3Rvbi93YXlsYW5kIGFzIHRoZSBkaXNwbGF5IGludGVyZmFjZS4KPiA+ID4gSW4gbm9ybWFs
IGJvb3QsIGJvdGggTENEIGFuZCBIRE1JIGRpc3BsYXkgaXMgd29ya2luZyBmaW5lLgo+ID4gPgo+
ID4gPiBCdXQsIGN1cnJlbnRseSwgZm9yIG9uZSBvZiB0aGUgcmVxdWlyZW1lbnQsIEkgYW0gdHJ5
aW5nIHRvIGV4cGxvcmUgYW5kCj4gPiA+IHN1cHBvcnQgaGliZXJuYXRpb24gaW1hZ2UgYm9vdGlu
ZyBvbiBpdC4KPiA+ID4gQ3VycmVudGx5LCB3ZSBhcmUgYWJsZSB0byByZXN1bWUgdGhlIHN5c3Rl
bSB3aXRob3V0IGRpc3BsYXkuCj4gPiA+IEFsc28sIGlmIHdlIG1ha2UgdGhlIGVudGlyZSBpbXgt
ZHJtIGFzIG1vZHVsZXMsIGFuZCB0aGVuIGluc3RhbGwgdGhlCj4gPiA+IG1vZHVsZXMgYWZ0ZXIg
cmVzdW1lLCBldmVuIExDRCBpcyBhbHNvIGNvbWluZyB1cC4KPiA+ID4gQnV0IEhETUkgZGlzcGxh
eSBpcyBibGFjayBvdXQuCj4gPiA+CgpJIGp1c3QgZm91bmQgdGhlIG1haW4gcm9vdCBjYXVzZSBv
ZiB0aGUgSERNSSBzY3JlZW4gYmxhY2tvdXQgaXNzdWUKYWZ0ZXIgc3lzdGVtIHJlc3VtZS4KKiBI
RE1JIGlzIHRyeWluZyB0byBnZXQgRURJRCBkYXRhIGZyb20gdGhlIG1vbml0b3IgdXNpbmcgSTJD
IGludGVyZmFjZS4KKiBCdXQgaXRzIHNlZW1zIGkyY190cmFuc2ZlciBpcyBnZXR0aW5nIHRpbWVv
dXQgYWZ0ZXIgNSByZXRyaWVzLgoqIFRodXMgRURJRCBkYXRhIGlzIGZhaWxpbmcsIGFuZCBIRE1J
IGNvdWxkIG5vdCBhYmxlIHRvIGRldGVjdCB0aGUgbW9uaXRvci4KClRoaXMgaXMgdGhlIGxvZ3M6
CgpbICA0NDEuMTA0OTg5XSBbZHJtOmRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9t
b2Rlc10KW0NPTk5FQ1RPUjoyOTpIRE1JLUEtMV0gc3RhdHVzIHVwZGF0ZWQgZnJvbSB1bmtub3du
IHRvIGNvbm5lY3RlZApbICA0NDEuMTE2MDgwXTogZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29u
bmVjdG9yX21vZGVzIC0gaW5zaWRlIC0KZWxzZSBvdmVycmlkZV9lZGlkClsgIDQ0MS4xMjQ0MTZd
OiBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMgLSBpbnNpZGUgLQplbHNl
IC0gZHJtX2xvYWRfZWRpZF9maXJtd2FyZTogY291bnQ6IDAKWyAgNDQxLjEzNDU0Nl06IGRybV9o
ZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcyAtIGNhbGxpbmcgLSBnZXRfbW9kZXMK
WyAgNDQxLjE0MjE1N106IGR3X2hkbWlfY29ubmVjdG9yX2dldF9tb2RlcyA6IGNhbGxlZApbICA0
NDEuMTQ3NjUyXTogZHdfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzIDogY2FsbGVkIC0gY2FsbGlu
ZyAtPiBkcm1fZ2V0X2VkaWQKWyAgNDQxLjE1NTM0Nl06IGRybV9kb19wcm9iZV9kZGNfZWRpZCA6
IGNhbGxlZCEKWyAgNDQxLjY2MDc1OV06IGRybV9kb19wcm9iZV9kZGNfZWRpZCA6IGkyY190cmFu
c2ZlcjogcmV0OiAtMTEwLCByZXRyeTogNQpbICA0NDIuMTcwNzU4XTogZHJtX2RvX3Byb2JlX2Rk
Y19lZGlkIDogaTJjX3RyYW5zZmVyOiByZXQ6IC0xMTAsIHJldHJ5OiA0ClsgIDQ0Mi42ODA3NTVd
OiBkcm1fZG9fcHJvYmVfZGRjX2VkaWQgOiBpMmNfdHJhbnNmZXI6IHJldDogLTExMCwgcmV0cnk6
IDMKWyAgNDQzLjE5MDc1NV06IGRybV9kb19wcm9iZV9kZGNfZWRpZCA6IGkyY190cmFuc2Zlcjog
cmV0OiAtMTEwLCByZXRyeTogMgpbICA0NDMuNzAwNzU0XTogZHJtX2RvX3Byb2JlX2RkY19lZGlk
IDogaTJjX3RyYW5zZmVyOiByZXQ6IC0xMTAsIHJldHJ5OiAxClsgIDQ0My43MDc5ODldOiBkcm1f
Z2V0X2VkaWQgOiBjYWxsZWQgLSBkcm1fcHJvYmVfZGRjIC0gZmFpbGVkClsgIDQ0My43MTQzMDNd
IGR3aGRtaS1pbXggMTIwMDAwLmhkbWk6IGZhaWxlZCB0byBnZXQgZWRpZAoKSXMgdGhlcmUgYW55
IGNsdWUsIGhvdyB0byByZXNvbHZlIHRoaXMgaTJjIGZhaWx1cmUgaXNzdWUsIGFmdGVyIHJlc3Vt
ZT8KVGhpcyBkb2VzIG5vdCBoYXBwZW4gaW4gbm9ybWFsIGJvb3RpbmcgY2FzZS4KClRoZXNlIGFy
ZSB0aGUgc3RlcHMgSSBmb2xsb3c6CiogQm9vdCB0aGUgc3lzdGVtIG5vcm1hbGx5ICh3aXRob3V0
IGRpc3BsYXkpIGFuZCBpbnN0YWxsIGFsbCBpbXgtZHJtIGFzIG1vZHVsZXMuCiogVGhlbiB1bmlu
c3RhbGwgdGhlIG1vZHVsZXMgaW4gcmV2ZXJzZSBvcmRlci4KKiBUYWtlIHRoZSBzbmFwc2hvdCBv
ZiB0aGUgc3lzdGVtIChzdXNwZW5kIHRvIGRpc2spLgoqIFJlYm9vdCB0aGUgc3lzdGVtIGFuZCBi
b290IHdpdGggdGhlIGltYWdlLgoqIEluc3RhbGwgYWxsIHRoZSBtb2R1bGVzIGFnYWluLgoqIFRo
ZW4gbGF1bmNoIHRoZSBXZXN0b24uCiogRHVyaW5nIHRoZSB3ZXN0b24gbGF1bmNoIGluIHRoZSBi
ZWdpbm5pbmcgd2Ugb2JzZXJ2ZSB0aGlzIGVycm9yLgoKClJlZ2FyZHMsClBpbnR1Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
