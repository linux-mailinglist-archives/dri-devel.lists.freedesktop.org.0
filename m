Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5071F58
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E806E392;
	Tue, 23 Jul 2019 18:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96536E37C;
 Tue, 23 Jul 2019 18:31:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so41019481wrm.8;
 Tue, 23 Jul 2019 11:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgcKZmsghA7oPWetYCkkd5OFkpIDAUtXqxPwI5yL+Wg=;
 b=nFzEinQjGpRIAhHsXRNfNN3/1sOisoJWm3BKhqMhggcTdH4TboNEPpECYIxrm/6Gi/
 9J9F+a7fVrYTzUNFc1vi7jNSmqa813INqm/68m8aNrowEh/g17AiwzGrlfapr/JMqDw2
 czPRs3OlZpFMWoD8CojejmA71Wi+8Gf0hfyqEKh45SHJWd6UBaTmtN+csdMISFaEiV0k
 xxOGY1MGkdQsP+80RPTczFyFDOmeYfBQKd8Own3tD1EX5hHtekH7WrFE6u7au22D9/g2
 aV3HmOwz/FD8atwxSYsxB1RnxykMXhuDNohusXyaTE58eF8hehc8gGKkf2Ml3BscbzlA
 YemQ==
X-Gm-Message-State: APjAAAVwrp5y+fT+Ur1ZzvyPsD23l0kdKRRso2Wu/0Y8OLnOHBi7K9BS
 isoVKwiPcEN0xNb/4j+uNPEVZHT/Tz3WaRtcPyCnlQ==
X-Google-Smtp-Source: APXvYqzcf7VVlisN4ApJwJuo1WLG159w70jMp/nn+JzNWNhFh18BmMNyNlHSd7DmXTIgO1Lgq/cP1jaqtzHIKpmOPsE=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr6395667wrw.323.1563906675402; 
 Tue, 23 Jul 2019 11:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190722223112.199769-1-ndesaulniers@google.com>
In-Reply-To: <20190722223112.199769-1-ndesaulniers@google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:31:03 -0400
Message-ID: <CADnq5_MA+oCYRWLyaJT+oQGwA2jDwfX554qNZoS6BtKmeSru1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: readd -msse2 to prevent Clang from
 emitting libcalls to undefined SW FP routines
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tgcKZmsghA7oPWetYCkkd5OFkpIDAUtXqxPwI5yL+Wg=;
 b=qztMIXUXEc7ugXHg+qskimr9KwnkptV6PHxHrzRGKmzLKNSohOo/is4ykh/78r1CeR
 XUefiNyGdV9CzkpG4IMjkzVLWClbbOp288d8sfE3DPEQgyAO/HCNNZxPKBqy+V66iBdR
 GLyky4Om5FWZAavqBKR8aFReAcNZM65dx0yBiXdItwyTFA+ckvQr2M6l1qhtzL6nx5lP
 N6LQKQdlbnNPr7V+hfzvf/XRylyjKhma+oSbw43oXteILlIrEZIGoQx3Al9AH1mHa1ak
 DGoNvbjrlTfRcJZoVbOJTxCNYouQvkz3HZasBId6edYTm5ciZWYuRWsOAtLJbHla89nS
 CR4Q==
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
Cc: Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@google.com>,
 David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux@googlegroups.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 samitolvanen@google.com, James Y Knight <jyknight@google.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMzoxNiBBTSBOaWNrIERlc2F1bG5pZXJzCjxuZGVzYXVs
bmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBhcmNoL3g4Ni9NYWtlZmlsZSBkaXNhYmxlcyBT
U0UgYW5kIFNTRTIgZm9yIHRoZSB3aG9sZSBrZXJuZWwuICBUaGUKPiBBTURHUFUgZHJpdmVycyBt
b2RpZmllZCBpbiB0aGlzIHBhdGNoIHJlLWVuYWJsZSBTU0UgYnV0IG5vdCBTU0UyLiAgVHVybgo+
IG9uIFNTRTIgdG8gc3VwcG9ydCBlbWl0dGluZyBkb3VibGUgcHJlY2lzaW9uIGZsb2F0aW5nIHBv
aW50IGluc3RydWN0aW9ucwo+IHJhdGhlciB0aGFuIGNhbGxzIHRvIG5vbi1leGlzdGVudCAodXN1
YWxseSBhdmFpbGFibGUgZnJvbSBnY2NfcyBvcgo+IGNvbXBpbGVyX3J0KSBmbG9hdGluZyBwb2lu
dCBoZWxwZXIgcm91dGluZXMgZm9yIENsYW5nLgo+Cj4gVGhpcyB3YXMgb3JpZ2luYWxseSBsYW5k
ZWQgaW46Cj4gY29tbWl0IDEwMTE3NDUwNzM1YyAoImRybS9hbWQvZGlzcGxheTogYWRkIC1tc3Nl
MiB0byBwcmV2ZW50IENsYW5nIGZyb20gZW1pdHRpbmcgbGliY2FsbHMgdG8gdW5kZWZpbmVkIFNX
IEZQIHJvdXRpbmVzIikKPiBidXQgcmV2ZXJ0ZWQgaW46Cj4gY29tbWl0IDE5MzM5MmVkOWY2OSAo
IlJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBhZGQgLW1zc2UyIHRvIHByZXZlbnQgQ2xhbmcgZnJv
bSBlbWl0dGluZyBsaWJjYWxscyB0byB1bmRlZmluZWQgU1cgRlAgcm91dGluZXMiIikKPiBkdWUg
dG8gYnVncmVwb3J0cyBmcm9tIEdDQyBidWlsZHMuIEFkZCBndWFyZHMgdG8gb25seSBkbyBzbyBm
b3IgQ2xhbmcuCj4KPiBMaW5rOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVn
LmNnaT9pZD0xMDk0ODcKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4
L2xpbnV4L2lzc3Vlcy8zMjcKPgo+IFN1Z2dlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0LmRp
bGVrQGdtYWlsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5l
bkBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxu
aWVyc0Bnb29nbGUuY29tPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9NYWtlZmlsZSB8IDQgKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvTWFrZWZpbGUgfCA0ICsrKysKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZSAgIHwgNCArKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZpbGUgICB8IDQgKysrKwo+ICA0
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY2FsY3MvTWFrZWZpbGUKPiBpbmRleCA5NWYzMzJlZTNlN2UuLjE2NjE0
ZDczYTVmYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2Fs
Y3MvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
TWFrZWZpbGUKPiBAQCAtMzIsNiArMzIsMTAgQEAgZW5kaWYKPgo+ICBjYWxjc19jY2ZsYWdzIDo9
IC1taGFyZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+Cj4gK2lmZGVmIENPTkZJR19D
Q19JU19DTEFORwo+ICtjYWxjc19jY2ZsYWdzICs9IC1tc3NlMgo+ICtlbmRpZgo+ICsKPiAgQ0ZM
QUdTX2Rjbl9jYWxjcy5vIDo9ICQoY2FsY3NfY2NmbGFncykKPiAgQ0ZMQUdTX2Rjbl9jYWxjX2F1
dG8ubyA6PSAkKGNhbGNzX2NjZmxhZ3MpCj4gIENGTEFHU19kY25fY2FsY19tYXRoLm8gOj0gJChj
YWxjc19jY2ZsYWdzKSAtV25vLXRhdXRvbG9naWNhbC1jb21wYXJlCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZQo+IGluZGV4IGU5NzIxYTkwNjU5Mi4u
ZjU3YTNiMjgxNDA4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9NYWtlZmlsZQo+IEBAIC0xOCw2ICsxOCwxMCBAQCBlbmRpZgo+Cj4gIENGTEFHU19kY24y
MF9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+Cj4g
K2lmZGVmIENPTkZJR19DQ19JU19DTEFORwo+ICtDRkxBR1NfZGNuMjBfcmVzb3VyY2UubyArPSAt
bXNzZTIKPiArZW5kaWYKPiArCj4gIEFNRF9EQUxfRENOMjAgPSAkKGFkZHByZWZpeCAkKEFNRERB
TFBBVEgpL2RjL2RjbjIwLywkKERDTjIwKSkKPgo+ICBBTURfRElTUExBWV9GSUxFUyArPSAkKEFN
RF9EQUxfRENOMjApCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbWwvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2Vm
aWxlCj4gaW5kZXggMGJiN2EyMDY3NWM0Li4xMzJhZGUxYTIzNGUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUKPiBAQCAtMzIsNiArMzIsMTAgQEAg
ZW5kaWYKPgo+ICBkbWxfY2NmbGFncyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChjY19zdGFja19h
bGlnbikKPgo+ICtpZmRlZiBDT05GSUdfQ0NfSVNfQ0xBTkcKPiArZG1sX2NjZmxhZ3MgKz0gLW1z
c2UyCj4gK2VuZGlmCj4gKwo+ICBDRkxBR1NfZGlzcGxheV9tb2RlX2xpYi5vIDo9ICQoZG1sX2Nj
ZmxhZ3MpCj4KPiAgaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZpbGUgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL01ha2VmaWxlCj4gaW5kZXggZTAxOWNkOTQ0N2U4Li4x
N2RiNjAzZjJkMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RzYy9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2Mv
TWFrZWZpbGUKPiBAQCAtOSw2ICs5LDEwIEBAIGVuZGlmCj4KPiAgZHNjX2NjZmxhZ3MgOj0gLW1o
YXJkLWZsb2F0IC1tc3NlICQoY2Nfc3RhY2tfYWxpZ24pCj4KPiAraWZkZWYgQ09ORklHX0NDX0lT
X0NMQU5HCj4gK2RzY19jY2ZsYWdzICs9IC1tc3NlMgo+ICtlbmRpZgo+ICsKPiAgQ0ZMQUdTX3Jj
X2NhbGMubyA6PSAkKGRzY19jY2ZsYWdzKQo+ICBDRkxBR1NfcmNfY2FsY19kcGkubyA6PSAkKGRz
Y19jY2ZsYWdzKQo+ICBDRkxBR1NfY29kZWNfbWFpbl9hbWQubyA6PSAkKGRzY19jY2ZsYWdzKQo+
IC0tCj4gMi4yMi4wLjY1Ny5nOTYwZTkyZDI0Zi1nb29nCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
