Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D362AE482
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5CA89D60;
	Tue, 10 Nov 2020 23:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771A989D5E;
 Tue, 10 Nov 2020 23:57:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so427817wrp.3;
 Tue, 10 Nov 2020 15:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LE0afzOkIj/zw0NBe6e0ObJGwDPaqDvyeJKttoSBeoM=;
 b=WtSIs1xD+MaXeb4ffhufvVlCIwYGYGl3mt6GnySmJpVCXy5bBDmq+7ZXsWg3iG8Rp/
 gdEDCYi+ni0pe3NodHC0IZ0pKlWwiuA/Htn995ZPkOosIEVz9Sj/Ui8N4XZ+9nLKw1/e
 OqSmVIUrZvbNsiCqB4t2kV/o183c6ZRCPVV8TQOYYKdeSk/oamorEmFGsNLnr5YVnAjG
 qWVpvtldJORI1nYMNUu6Ih15+efFTYnqy+YX8Ly0nC5Ahb0bvnEur4AJIFtlmdLaKJBW
 /7q4rf8oVpVbr0YdzAkbr6dnCpGlMUlY6NvCWZL+bFaEk2ah9aCqamm2zRH8+FPUyZmH
 S34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LE0afzOkIj/zw0NBe6e0ObJGwDPaqDvyeJKttoSBeoM=;
 b=c2q9RNEwoQNF+HQemXwovgeO95IZqFnF7LWyEvHg8l863iU9TlCzlj7SK07130o8HO
 X1BsXhbmIYSM/u6pXODnjZg+qVqqoXnavm92UzJiBaipV8GMv3GIn0H4Dkp9bqlflzHi
 LtWILJnsZbcAfHf1PqNNecthsS8a44j4tbvagSFJDFAqqjhLgjKksgstNLMmKJn8Jyyn
 3/6ME6nZy1yFKkWN5KS3SyoAH6hMSyhp3USJRIyg+U16d3iIH5GhXsNk+juzCSnM/nwn
 twcj5aLJUW+bnvaqzavoMYA5UqaITUF7zTNXPAgvbajxxBsyQeAD/LT5n8vv7zYCXraL
 74BQ==
X-Gm-Message-State: AOAM533iWGcyS0zrZgJtnP1vElT4JCmQM9jMOnV/y7sAbrx1U1vNoIIN
 yJo4tNkAL3XwJcB8yNAGr3jFbYgB1fz5WBIhPXo=
X-Google-Smtp-Source: ABdhPJx3T38wEbSDtMYgkoopvqAG8NVHXxX+0Z2QyanoquRAnGIg4EhxIojZyJp498+74haST3uNYCspixYe2oDURp8=
X-Received: by 2002:adf:e551:: with SMTP id z17mr27350227wrm.374.1605052637210; 
 Tue, 10 Nov 2020 15:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-19-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-19-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:57:05 -0500
Message-ID: <CADnq5_OH9n+7gVUhUXJ5gHPtAMpimDLY8QmjNyDS0S+h=Q3xRw@mail.gmail.com>
Subject: Re: [PATCH 18/30] drm/radeon/evergreen_cs: Fix misnaming issues
 surrounding 'p' param
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmM6MTAy
Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncCcgbm90IGRlc2NyaWJl
ZCBpbiAnZXZlcmdyZWVuX2NzX3BhY2tldF9wYXJzZV92bGluZScKPiAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ldmVyZ3JlZW5fY3MuYzoxMDI2OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFy
YW1ldGVyICdwYXJzZXInIGRlc2NyaXB0aW9uIGluICdldmVyZ3JlZW5fY3NfcGFja2V0X3BhcnNl
X3ZsaW5lJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jOjEwOTU6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3AnIG5vdCBkZXNjcmliZWQgaW4g
J2V2ZXJncmVlbl9jc19oYW5kbGVfcmVnJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJn
cmVlbl9jcy5jOjEwOTU6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3BhcnNl
cicgZGVzY3JpcHRpb24gaW4gJ2V2ZXJncmVlbl9jc19oYW5kbGVfcmVnJwo+ICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jOjE3NTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3AnIG5vdCBkZXNjcmliZWQgaW4gJ2V2ZXJncmVlbl9pc19zYWZlX3Jl
ZycKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYzoxNzU3OiB3YXJuaW5n
OiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdwYXJzZXInIGRlc2NyaXB0aW9uIGluICdldmVy
Z3JlZW5faXNfc2FmZV9yZWcnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFs
ZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgfCA2ICsr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jCj4gaW5kZXggYzQxMGNhZDI4ZjE5
Zi4uNTNiNzVjZjIwMTk1OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2
ZXJncmVlbl9jcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3Mu
Ywo+IEBAIC0xMDE1LDcgKzEwMTUsNyBAQCBzdGF0aWMgaW50IGV2ZXJncmVlbl9jc190cmFja19j
aGVjayhzdHJ1Y3QgcmFkZW9uX2NzX3BhcnNlciAqcCkKPgo+ICAvKioKPiAgICogZXZlcmdyZWVu
X2NzX3BhY2tldF9wYXJzZV92bGluZSgpIC0gcGFyc2UgdXNlcnNwYWNlIFZMSU5FIHBhY2tldAo+
IC0gKiBAcGFyc2VyOiAgICAgICAgICAgIHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5n
IGNvbnRleHQuCj4gKyAqIEBwOiAgICAgICAgIHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJz
aW5nIGNvbnRleHQuCj4gICAqCj4gICAqIFRoaXMgaXMgYW4gRXZlcmdyZWVuKCspLXNwZWNpZmlj
IGZ1bmN0aW9uIGZvciBwYXJzaW5nIFZMSU5FIHBhY2tldHMuCj4gICAqIFJlYWwgd29yayBpcyBk
b25lIGJ5IHI2MDBfY3NfY29tbW9uX3ZsaW5lX3BhcnNlIGZ1bmN0aW9uLgo+IEBAIC0xMDg3LDcg
KzEwODcsNyBAQCBzdGF0aWMgaW50IGV2ZXJncmVlbl9jc19wYXJzZV9wYWNrZXQwKHN0cnVjdCBy
YWRlb25fY3NfcGFyc2VyICpwLAo+Cj4gIC8qKgo+ICAgKiBldmVyZ3JlZW5fY3NfaGFuZGxlX3Jl
ZygpIC0gcHJvY2VzcyByZWdpc3RlcnMgdGhhdCBuZWVkIHNwZWNpYWwgaGFuZGxpbmcuCj4gLSAq
IEBwYXJzZXI6IHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5nIGNvbnRleHQKPiArICog
QHA6IHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5nIGNvbnRleHQKPiAgICogQHJlZzog
cmVnaXN0ZXIgd2UgYXJlIHRlc3RpbmcKPiAgICogQGlkeDogaW5kZXggaW50byB0aGUgY3MgYnVm
ZmVyCj4gICAqLwo+IEBAIC0xNzQ3LDcgKzE3NDcsNyBAQCBzdGF0aWMgaW50IGV2ZXJncmVlbl9j
c19oYW5kbGVfcmVnKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLCB1MzIgcmVnLCB1MzIgaWR4
KQo+Cj4gIC8qKgo+ICAgKiBldmVyZ3JlZW5faXNfc2FmZV9yZWcoKSAtIGNoZWNrIGlmIHJlZ2lz
dGVyIGlzIGF1dGhvcml6ZWQgb3Igbm90Cj4gLSAqIEBwYXJzZXI6IHBhcnNlciBzdHJ1Y3R1cmUg
aG9sZGluZyBwYXJzaW5nIGNvbnRleHQKPiArICogQHA6IHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGlu
ZyBwYXJzaW5nIGNvbnRleHQKPiAgICogQHJlZzogcmVnaXN0ZXIgd2UgYXJlIHRlc3RpbmcKPiAg
ICoKPiAgICogVGhpcyBmdW5jdGlvbiB3aWxsIHRlc3QgYWdhaW5zdCByZWdfc2FmZV9ibSBhbmQg
cmV0dXJuIHRydWUKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
