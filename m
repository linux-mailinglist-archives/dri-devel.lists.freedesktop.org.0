Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9F2F66F3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB7B6E112;
	Thu, 14 Jan 2021 17:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0800F6E08C;
 Thu, 14 Jan 2021 17:14:27 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id p5so6643185oif.7;
 Thu, 14 Jan 2021 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e7vZuwAZxOzw7k3z2H8f9KSY3axfstY9BDBHnIavRnE=;
 b=RN5+M9lpNliEOTNMklKwY6LHtvuJsya9Uc/dy/mGm3KAwc05wCogoTr/pjJaIhRVP4
 b5Tb+d/wJt4eeAEJrBjMKAYvhDMY3IpVbiHznD/Hlp1Jcuz+iRlNKYOD5Keew81dosuU
 CBsUQWb+M0kT6g4YLofdBELwx4XiaTOtiCqyOWD3Rled53KE30xMcabHk3PRZz3Fcinq
 bkYANhD3b2+OH21wjwkwui2GNyg+FbgetUvQQk0quB/nbb54Sey/ILjMuZ2TT6DeCo7r
 xbjOS9dDCWbC/RlWx6aStBFweznHeoxX5KixEAtJucoiRGRExycJ2Uw0p4gguSoW2/7F
 8lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e7vZuwAZxOzw7k3z2H8f9KSY3axfstY9BDBHnIavRnE=;
 b=V0ak+IIUcQSZ4PnCJg4/ZarGwvzlUefJnhfakp0q4HSw/0rYt+vhjvGZYcdWmPSp5H
 ao2btMfXp6lgd+Q2CU2K+glfEeAWpjghGuZCsiGokVwWO4cwN4xBAWONdUjDGmkNfIpJ
 EZPNQiggjoFLe8WVUKRkvdm30pl8iTSGkpAKIPzofuqRt158R8OQK9g1edRcawAKl8PT
 b2tFDx53kxXO1NKyKCWsaS4iBsn6gecqP3b8/kD8EDqOaOd3R31ZjyUXAkhwXyvMO7gd
 3KVfrnKpyR/HROrHsd4eJHHWGVp3+jeqEcKvrXZkHhmKx+d5Mv6DIl4kI7okYKzSPc9H
 Y5cA==
X-Gm-Message-State: AOAM530P8tjQA29aSH+nyUMQSK8vtMRIZbqRC+5cJ6iiGR0AysCumzD+
 KF3+OMYeMc2aM9NEjAPZ3AU6+sXZXplULYaCQiE=
X-Google-Smtp-Source: ABdhPJwXvyBARwrHLkPgvHf2KHUp5Ur/KNm5pr0Yn5UE+RmnA3ZK1TwSNq0Nw38P81h3AK84uh2LA9pw+8Obwtxu2xY=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3100502oib.123.1610644466387; 
 Thu, 14 Jan 2021 09:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-15-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:14:15 -0500
Message-ID: <CADnq5_OyiqqnHaZh8s00SN4tSiVh4TYTXj5DK6Vuv-FmNXKY_A@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/amd/display/dc/dce80/Makefile: Ignore
 -Woverride-init warning
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmM6Mjk6Cj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV84XzBfc2hf
bWFzay5oOjk1NDY6NTg6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFst
V292ZXJyaWRlLWluaXRdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hdXguaDoyMTM6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhB
VVhfU1dfREFUQV9fQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRV9fU0hJRlTigJkKPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oOjEwMjoy
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVYX1NG4oCZCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYzozMDU6
Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERDRTEwX0FVWF9NQVNLX1NIX0xJU1Ti
gJkKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2Uv
ZGNlXzhfMF9zaF9tYXNrLmg6OTU0Njo1ODogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9y
IOKAmGF1eF9zaGlmdC5BVVhfU1dfQVVUT0lOQ1JFTUVOVF9ESVNBQkxF4oCZKQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4Lmg6MjEzOjE2OiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVYX1NXX0RBVEFfX0FVWF9TV19BVVRPSU5D
UkVNRU5UX0RJU0FCTEVfX1NISUZU4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMDI6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmEFVWF9TRuKAmQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmM6MzA1OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhEQ0UxMF9BVVhfTUFTS19TSF9MSVNU4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV84XzBfc2hfbWFzay5oOjk1NDU6NTY6
IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRd
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXgu
aDoyMTM6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBVVhfU1dfREFUQV9fQVVY
X1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRV9NQVNL4oCZCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMDI6Mjogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmEFVWF9TRuKAmQo+Cj4gTkI6IFNuaXBwZWQgbG90cyBmb3IgdGhlIHNh
a2Ugb2YgYnJldml0eQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2U4MC9NYWtlZmlsZSB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4
MC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9NYWtlZmls
ZQo+IGluZGV4IDY2NmZjYjJiZGJiYTAuLjBhOWQxYTM1MGQ4YmQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL01ha2VmaWxlCj4gQEAgLTIzLDYgKzIzLDgg
QEAKPiAgIyBNYWtlZmlsZSBmb3IgdGhlICdjb250cm9sbGVyJyBzdWItY29tcG9uZW50IG9mIERB
TC4KPiAgIyBJdCBwcm92aWRlcyB0aGUgY29udHJvbCBhbmQgc3RhdHVzIG9mIEhXIENSVEMgYmxv
Y2suCj4KPiArQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UubyA9
ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIG92ZXJyaWRlLWluaXQpCj4gKwo+ICBEQ0U4MCA9
IGRjZTgwX3RpbWluZ19nZW5lcmF0b3IubyBkY2U4MF9od19zZXF1ZW5jZXIubyBcCj4gICAgICAg
ICBkY2U4MF9yZXNvdXJjZS5vCj4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
