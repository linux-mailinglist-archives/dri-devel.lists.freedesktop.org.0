Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28883385
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15B89AC3;
	Tue,  6 Aug 2019 14:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A40489AC3;
 Tue,  6 Aug 2019 14:04:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p17so88024839wrf.11;
 Tue, 06 Aug 2019 07:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmcJWVEpEPtuq51rQa3PysAqXBTFaGDudgNwWewCnB0=;
 b=lAJl8BbaiIKNGBtmPvTXqIM8jaXcTrdwJ2f7UvcRGlgGZuFQwvDX4Dozbpdj4fA5KG
 lYXpddaEx5gjzFdb1Ly/iklDTmVTwg7sjPPbGRXOOeu4wSyLTcAjsIzpqVuqMpjFz8r0
 ihvpFHVeC9SICbh/g+MhtgHmKwrTC9NDXjzU0Q00Y8srmauWKwwUKHtE2l3GdOKViurF
 Mr+ph3AclBWwxA3GZiczLkXXCgzXxehnqMgzUN4UWbfgBJI/IPlecQpEQdLqDeem57B9
 cyGBp4gVweesLCB43Qu6ecV4IISHbxZNUxN0HYNjLSnvI5N8AKgaNVRm14V4GhYLRDix
 wpVQ==
X-Gm-Message-State: APjAAAWgoG7IVzjb4T58awCbORw05CNsoj55IY5x5yohhf8Az9P/UdMW
 inl7q3xey2Cpreo6tgN1rtoRAKc79elNYC27rsc=
X-Google-Smtp-Source: APXvYqwfnictYRbYBmrF7TNe8rBMjnPDB347HH4iMDw6RFdkqryAQ2ApRjvZ92eEZ3nb/TN2z3s0Dy+pdTvnPR/MnNQ=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr5328135wrc.4.1565100282994;
 Tue, 06 Aug 2019 07:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190805173257.GA4917@hari-Inspiron-1545>
In-Reply-To: <20190805173257.GA4917@hari-Inspiron-1545>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 10:04:31 -0400
Message-ID: <CADnq5_OL1+bJUGh44AY48DP=G=xTtdrf+kO2233qjJzudWhw_Q@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: display: dc: dcn20: Remove redudant
 condition
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VmcJWVEpEPtuq51rQa3PysAqXBTFaGDudgNwWewCnB0=;
 b=SGltPae4XNh4Q+UGWFbguwHk7b6jQ96uA1pyBjf+QImbi5hjWu6foT2yyu4Ef8S8VZ
 WVQ/5cNOi1rMbGhKWXrTeVLUKI/CtBgs7M84SRhAkqoLujGnITkbj/6saLmBHMuyXgah
 1uxOPOVV+919HPTggX95bSKrIeFfCrmDszvuFRqP8jK181DQVJjKWOOI/1hD0kXJr4lG
 +7kraMbIBnVIQ+BP31bPjafkdXRA+DVhas327iLAgmFsq8Jj+8I8K0bUnDl8w8MsCIAe
 j0ZTVdQotWW9cFsZ4JUpO8uV3/Rg9576/5I1tlswQdQN30IqIy6JATvtdpkoS8zwvtAf
 +U6A==
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAzOjAxIFBNIEhhcmlwcmFzYWQgS2VsYW0KPGhhcmlwcmFz
YWQua2VsYW1AZ21haWwuY29tPiB3cm90ZToKPgo+IFJlbW92ZSByZWR1ZGFudCBjb2RpdGlvbiAi
ZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YiLgo+Cj4gZml4ZXMgY292ZXJpdHkgZGVm
ZWN0IDE0NTE4NTMKPgo+IFNpZ25lZC1vZmYtYnk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFz
YWQua2VsYW1AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfZHNjLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9kc2MuYwo+IGluZGV4IGU4NzBjYWEuLjQyMTMzYmQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCj4g
QEAgLTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgYm9vbCBkc2NfcHJlcGFyZV9jb25maWcoc3RydWN0
IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3IgKmRzYywgY29uc3Qgc3RydQo+ICAgICAgICAgICAg
ICAgICAgICAgZHNjX2NmZy0+ZGNfZHNjX2NmZy5saW5lYnVmX2RlcHRoID09IDApKSk7Cj4gICAg
ICAgICBBU1NFUlQoOTYgPD0gZHNjX2NmZy0+ZGNfZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAmJiBk
c2NfY2ZnLT5kY19kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsIDw9IDB4M2ZmKTsgLy8gNi4wIDw9IGJp
dHNfcGVyX3BpeGVsIDw9IDYzLjkzNzUKPgo+IC0gICAgICAgaWYgKCFkc2NfY2ZnLT5kY19kc2Nf
Y2ZnLm51bV9zbGljZXNfdiB8fCAhZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YgfHwK
PiArICAgICAgIGlmICghZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YgfHwKCkhhcnJ5
LCBjYW4geW91IG9yIE5pY2sgY2hlY2sgaWYgdGhpcyBzaG91bGQgYmUgc29tZXRoaW5nIGVsc2U/
ICBtYXliZQphIGNvcHkgcGFzdGUgdHlwby4KCkFsZXgKCj4gICAgICAgICAgICAgICAgICEoZHNj
X2NmZy0+ZGNfZHNjX2NmZy52ZXJzaW9uX21pbm9yID09IDEgfHwgZHNjX2NmZy0+ZGNfZHNjX2Nm
Zy52ZXJzaW9uX21pbm9yID09IDIpIHx8Cj4gICAgICAgICAgICAgICAgICFkc2NfY2ZnLT5waWNf
d2lkdGggfHwgIWRzY19jZmctPnBpY19oZWlnaHQgfHwKPiAgICAgICAgICAgICAgICAgISgoZHNj
X2NmZy0+ZGNfZHNjX2NmZy52ZXJzaW9uX21pbm9yID09IDEgJiYgLy8gdjEuMSBsaW5lIGJ1ZmZl
ciBkZXB0aCByYW5nZToKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
