Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B046257B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000E289F6E;
	Mon,  8 Jul 2019 15:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A289F63;
 Mon,  8 Jul 2019 15:59:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so13095939wru.13;
 Mon, 08 Jul 2019 08:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rhoYdVDhN5ydgxX1VLJkMlHV7XsW0UoNaJF64lVsGBk=;
 b=kW+Nbjvd6dbLMus64rOYH+8SSBDpS4x62IE9TfZ9j8dYGH71fxHPm9ljcf8xC45KUA
 9Xfdcmb8B/A1XmzHH4qSoolWUqyB73aOeI/mVgjHIuSn+C9cwGo8rDjRbSrdE6DcchMN
 puf+M/CvEur5p25NQK7zISZFCl+IKy/inmtfLkimvQKiF9F9a923AIOVzsl6y6XAQACj
 D1RLXbf2XCSRRGd3KzSQTRQAeh8IHXvDSmgoO/UHQSGhVAZXVBVI05PGWj1iHNKrvgA7
 J0K3E7AspE1tf0iVmPQ8MK+osmx5HsSRLGefgYej8tRvEsQfJKaovaMTinHjXrcjmqhL
 TFYA==
X-Gm-Message-State: APjAAAUQ1XYsHAxEU7YA5r65/hj4Lfb7qV2N/Du4m5MTmtjlts26fYjJ
 /mYk8w06ydQxT3aO0I2vJkjGxqsmVdscnDP6R+Q=
X-Google-Smtp-Source: APXvYqzOWGyb0Raf4FDZ29HUA5m1lTCjYaZUm5S9loe+lEPW8cJi0cTQLV9I1lj73jWGDid/rYCzvpSKiVZ31ITPSUg=
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr14725529wrm.341.1562601541504; 
 Mon, 08 Jul 2019 08:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190708144205.2770771-1-arnd@arndb.de>
In-Reply-To: <20190708144205.2770771-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 11:58:50 -0400
Message-ID: <CADnq5_PT8HyLUi-tSNdXbJVJiVWV-f_io8gOabiPxDfDONEfKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] amdgpu: make pmu support optional
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rhoYdVDhN5ydgxX1VLJkMlHV7XsW0UoNaJF64lVsGBk=;
 b=DAmRxpxTPdcbbcK+O3HYTUcs16PFJYrX3FKsYaQ8ARene0pNY7/VYxMv28MiHrqKSd
 ziP7FSehowz+XtnvIhfzqDnMnaxcFtTI8UizF1Iai4nYy8dN8hZli9keuRW3qiFfc+U6
 bgeHUXMK7EWN/b8r2MPcUIED8wbkJ48HdvVh/WpoU3u5d0Qob191RGyPOha/ZS0C4AZU
 YBhHK286Xs/Jp3372/44rw6WNTmWLzgBc0VCAaQr9nhz9+xoUwYDZ6JK2sOvO2iUfNHT
 EbUx7t013TFxsXI+irQxn+QXARfvPOnCX0u0yZbPerk1sIZX0E/wrTubt7SPEuFwq57r
 qvSw==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Jonathan Kim <Jonathan.Kim@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>, Emily Deng <Emily.Deng@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxMDo0MiBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IFdoZW4gQ09ORklHX1BFUkZfRVZFTlRTIGlzIGRpc2FibGVkLCB3ZSBj
YW5ub3QgY29tcGlsZSB0aGUgcG11Cj4gcG9ydGlvbiBvZiB0aGUgYW1kZ3B1IGRyaXZlcjoKPgo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzo0ODozODogZXJyb3I6IG5v
IG1lbWJlciBuYW1lZCAnaHcnIGluICdzdHJ1Y3QgcGVyZl9ldmVudCcKPiAgICAgICAgIHN0cnVj
dCBod19wZXJmX2V2ZW50ICpod2MgPSAmZXZlbnQtPmh3Owo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB+fn5+fiAgXgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbXUuYzo1MToxMzogZXJyb3I6IG5vIG1lbWJlciBuYW1lZCAnYXR0cicgaW4gJ3N0cnVj
dCBwZXJmX2V2ZW50Jwo+ICAgICAgICAgaWYgKGV2ZW50LT5hdHRyLnR5cGUgIT0gZXZlbnQtPnBt
dS0+dHlwZSkKPiAgICAgICAgICAgICB+fn5+fiAgXgo+IC4uLgo+Cj4gVXNlIGNvbmRpdGlvbmFs
IGNvbXBpbGF0aW9uIGZvciB0aGlzIGZpbGUuCj4KPiBGaXhlczogOWM3Yzg1ZjdlYTFmICgiZHJt
L2FtZGdwdTogYWRkIHBtdSBjb3VudGVycyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KCkFwcGxpZWQgdGhpcyBwYXRjaC4KClRoYW5rcyEKCkFsZXgKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgICB8IDQgKysr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKyst
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gaW5kZXggM2ExNWE0NmI0ZWNiLi4zZjUz
Mjk5MDZmY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZp
bGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQo+IEBAIC01NCw3
ICs1NCw5IEBAIGFtZGdwdS15ICs9IGFtZGdwdV9kZXZpY2UubyBhbWRncHVfa21zLm8gXAo+ICAg
ICAgICAgYW1kZ3B1X2d0dF9tZ3IubyBhbWRncHVfdnJhbV9tZ3IubyBhbWRncHVfdmlydC5vIGFt
ZGdwdV9hdG9tZmlybXdhcmUubyBcCj4gICAgICAgICBhbWRncHVfdmZfZXJyb3IubyBhbWRncHVf
c2NoZWQubyBhbWRncHVfZGVidWdmcy5vIGFtZGdwdV9pZHMubyBcCj4gICAgICAgICBhbWRncHVf
Z21jLm8gYW1kZ3B1X3hnbWkubyBhbWRncHVfY3NhLm8gYW1kZ3B1X3Jhcy5vIGFtZGdwdV92bV9j
cHUubyBcCj4gLSAgICAgICBhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9wbXUubyBhbWRncHVfZGlz
Y292ZXJ5Lm8KPiArICAgICAgIGFtZGdwdV92bV9zZG1hLm8gYW1kZ3B1X2Rpc2NvdmVyeS5vCj4g
Kwo+ICthbWRncHUtJChDT05GSUdfUEVSRl9FVkVOVFMpICs9IGFtZGdwdV9wbXUubwo+Cj4gICMg
YWRkIGFzaWMgc3BlY2lmaWMgYmxvY2sKPiAgYW1kZ3B1LSQoQ09ORklHX0RSTV9BTURHUFVfQ0lL
KSs9IGNpay5vIGNpa19paC5vIGt2X3NtYy5vIGt2X2RwbS5vIFwKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggMzA5ODliNDU1MDQ3Li5hMDJjY2Nl
N2JmNTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
Cj4gQEAgLTI4MTYsNyArMjgxNiw4IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgIHJldHVybiByOwo+ICAgICAgICAg
fQo+Cj4gLSAgICAgICByID0gYW1kZ3B1X3BtdV9pbml0KGFkZXYpOwo+ICsgICAgICAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX1BFUkZfRVZFTlRTKSkKPiArICAgICAgICAgICAgICAgciA9IGFtZGdw
dV9wbXVfaW5pdChhZGV2KTsKPiAgICAgICAgIGlmIChyKQo+ICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGFkZXYtPmRldiwgImFtZGdwdV9wbXVfaW5pdCBmYWlsZWRcbiIpOwo+Cj4gQEAgLTI4ODgs
NyArMjg4OSw4IEBAIHZvaWQgYW1kZ3B1X2RldmljZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+ICAgICAgICAgYW1kZ3B1X2RlYnVnZnNfcmVnc19jbGVhbnVwKGFkZXYpOwo+ICAg
ICAgICAgZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BjaWVfcmVwbGF5
X2NvdW50KTsKPiAgICAgICAgIGFtZGdwdV91Y29kZV9zeXNmc19maW5pKGFkZXYpOwo+IC0gICAg
ICAgYW1kZ3B1X3BtdV9maW5pKGFkZXYpOwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X1BFUkZfRVZFTlRTKSkKPiArICAgICAgICAgICAgICAgYW1kZ3B1X3BtdV9maW5pKGFkZXYpOwo+
ICAgICAgICAgYW1kZ3B1X2RlYnVnZnNfcHJlZW1wdF9jbGVhbnVwKGFkZXYpOwo+ICAgICAgICAg
aWYgKGFtZGdwdV9kaXNjb3ZlcnkpCj4gICAgICAgICAgICAgICAgIGFtZGdwdV9kaXNjb3Zlcnlf
ZmluaShhZGV2KTsKPiAtLQo+IDIuMjAuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
