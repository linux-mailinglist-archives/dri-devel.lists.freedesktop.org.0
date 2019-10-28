Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09EE77EB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 18:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B67E6E9A8;
	Mon, 28 Oct 2019 17:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639C16E9A8;
 Mon, 28 Oct 2019 17:56:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t16so10896399wrr.1;
 Mon, 28 Oct 2019 10:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAgZMtf/VMvYmjG/BeZrCrg9OryuwBnaN7WoS0QCndo=;
 b=GXiGXRebjrN7TBlcxECzunUIjqxfpfAK5d2oLhYH0strv3jjVQcMnOlPPN8W3vDQBr
 EjbabRNtojOkQgS6hrOvojivMKqz/Wu8nvZxmsj0cEREzjAhJq8LKvcqhZcXD6IZu7me
 F5xNpm5yL0pD9rH6Vim8LIYf8VW/1goZpYpDiap3gAlitX1bbIh/lxKO1Q8Kf7+KDCss
 hNtkn7881w+q8aywa7YThDgsGwn+jJgTlq9hjGSZqhifYLozSyNVs5UD2qqXcIavkcYn
 8PVi5KFwj1Xt46aCNQKje50eV7p8fIh9iKZV2T+bwAqecOuHGdrTdZO3/RIy2S5pC8Az
 iIMg==
X-Gm-Message-State: APjAAAU4pvCCyhErgZ9EZp6k5z/9SV5534TW7kdV5aHL8T5IgmLDxF/w
 2dmqO8GQv8vb5VPxiSW4/JOBMG/r/mWppFGIFdU=
X-Google-Smtp-Source: APXvYqxnORJpDwc4s1jCy3Q5X+6OC0fEfKMsIR8ZweCFnT0Pjd7LJxMWaOSFSH1x4BZ/57s6J/Kd17r2Xg5+gEdaz8Q=
X-Received: by 2002:adf:ed02:: with SMTP id a2mr15784221wro.11.1572285399932; 
 Mon, 28 Oct 2019 10:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-4-geert+renesas@glider.be>
In-Reply-To: <20191021145149.31657-4-geert+renesas@glider.be>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2019 13:56:26 -0400
Message-ID: <CADnq5_Mcs1EzvETV=+XjWZcbJff-bfLycYZ3N+SVE9-KA7U-Sw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/amdgpu: Remove superfluous void * cast in
 debugfs_create_file() call
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yAgZMtf/VMvYmjG/BeZrCrg9OryuwBnaN7WoS0QCndo=;
 b=lsYd+IrBzjmG3qfteumSThkMdXzznfqx5E28vX8HNjBNCvlLPm2zTiCTD9/dTnIovI
 GzciN/1SNDxwcb3dI4c7inPDt3Hn1zePT9aEjzauaWC4X4XHzeI3iOssBTzebbmSBYbK
 iw9dq7cMOa+QfqT6oq7EeynrMbkg0UTIa0UaHj8aoHhyrOud3GUr+5wKjq+B52SUinmq
 rU2NppWWK8r0eepPXqrNWMhh2Byfl47OLXgNpnkgEHVaX8DxEXdrD26CeeGKb+5UpCaz
 +79sOdQIF+WoGFbd5JS8021/3NKCotJ6B/r3XblTC5bxhsVGT8XqxqSRJP6Tz2mgeWMp
 jECA==
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Casey Leedom <leedom@chelsio.com>, Linux PM <linux-pm@vger.kernel.org>,
 Pensando Drivers <drivers@pensando.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNjoyMyBQTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPiB3cm90ZToKPgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2FzdCBh
IHR5cGVkIHBvaW50ZXIgdG8gYSB2b2lkIHBvaW50ZXIgd2hlbiBjYWxsaW5nCj4gYSBmdW5jdGlv
biB0aGF0IGFjY2VwdHMgdGhlIGxhdHRlci4gIFJlbW92ZSBpdCwgYXMgdGhlIGNhc3QgcHJldmVu
dHMKPiBmdXJ0aGVyIGNvbXBpbGVyIGNoZWNrcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpBcHBsaWVkLiAgVGhhbmtzIQoK
QWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4g
aW5kZXggNTY1MmNjNzJlZDNhOWIzYS4uYjk3YTM4YjFlMDg5YjNkNiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwo+IEBAIC0xMDkwLDggKzEwOTAs
OCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgewo+ICAgICAgICAgYWRldi0+ZGVidWdmc19wcmVlbXB0ID0KPiAgICAgICAgICAgICAgICAg
ZGVidWdmc19jcmVhdGVfZmlsZSgiYW1kZ3B1X3ByZWVtcHRfaWIiLCAwNjAwLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmRkZXYtPnByaW1hcnktPmRlYnVnZnNf
cm9vdCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKWFkZXYs
ICZmb3BzX2liX3ByZWVtcHQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGFkZXYtPmRkZXYtPnByaW1hcnktPmRlYnVnZnNfcm9vdCwgYWRldiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZm9wc19pYl9wcmVlbXB0KTsKPiAgICAgICAgIGlmICgh
KGFkZXYtPmRlYnVnZnNfcHJlZW1wdCkpIHsKPiAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJ1
bmFibGUgdG8gY3JlYXRlIGFtZGdwdV9wcmVlbXB0X2liIGRlYnVnc2ZzIGZpbGVcbiIpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
