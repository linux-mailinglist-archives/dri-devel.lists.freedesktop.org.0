Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAE2EFA47
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B78B89320;
	Fri,  8 Jan 2021 21:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D0989320;
 Fri,  8 Jan 2021 21:22:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id a109so11090501otc.1;
 Fri, 08 Jan 2021 13:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eGoGEbM4Kuo4zDKdZ7Y5vJVMzPL1lbpTN9+vCSCS16Y=;
 b=iwgkCp5hNYL1jru7mK9Ou7L5GkRKbtipDjwKYGPzk4a4qAwyUL2PrPsLNDLFOex9zc
 gEKa0JBfxIgeE5Es8l4100o8QLpAqEkNvhZox/Z9jeii05W7PxPF4kZDCPQqxREICK4g
 FkPWS/cj25HLzAPM+N8dn1MRs7ycXGpV0o5VEy/0y/3DT74/mLQYDXAFIb0a6cfUcfAC
 pul8pVNAKx+OE0RFN7qkNnMmG6fuw+acWnP9Py5PNOcAcwI3f+SVgW4BKUIaCSYHJD8K
 P69NB3K1QyIX/3nn6Iqpuim50W2B9TGem6u6yDsidSPa9dcpzF/b+goUjA9OBj7TodAW
 OsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eGoGEbM4Kuo4zDKdZ7Y5vJVMzPL1lbpTN9+vCSCS16Y=;
 b=hmVX67DPRIEmLsaAwTrD3oLTXnXX54RTl72+jNAAMxaPI0z867PSxaAtt3UjBhCqkB
 vvUetG3OmAdNDM1OKuLywcXvrRk/vH7djtjdJK1wSGYKl8faaaYgMcAKxRz4hZusJyjb
 2CEfPUVJuCQhcdjLrDM47HIjo30/Kz0XgtW5RZn8OCfUM9x0vkezG7hawRjgJfYYBsu5
 eFXd0zwvNs1yPMaBh8ky9XvWDqunsst94pZZS2y/IfK/nznM5/TEAOuzJ30lOgUXBfRP
 zS6BIh/kpJqd0LKQcG3T2qy7XZXFfo4rVEd0AgpmA3Nw+QBp02WScQaZnDl7GEEmZf42
 TezQ==
X-Gm-Message-State: AOAM531qzic+qrkwtkvjwxIQVlYzPzkhtm6hZLsvVUHZZZ8/zGL8D0oj
 Vbm47bffX0Hn7+ejYWt3Dlno5DKZTd7oqDxpWYA=
X-Google-Smtp-Source: ABdhPJzNSx+QP7P1tQILmHjAf4YBlXWsFGbapGW8eMFnXAyLPIsTBSUZOrAvKt3jszCLUeWHSpuHYBsbvZakkhIO9rw=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3898666oti.23.1610140924362; 
 Fri, 08 Jan 2021 13:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-35-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:21:53 -0500
Message-ID: <CADnq5_MkQRnX+KJkhmJ2-07iXG8TcLS9nq9jpqmRFpm5D=ydgA@mail.gmail.com>
Subject: Re: [PATCH 34/40] drm/amd/display/dc/bios/bios_parser: Fix
 misspelling of function parameter
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

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9i
aW9zL2Jpb3NfcGFyc2VyLmM6OTk3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdzc19pbmZvJyBub3QgZGVzY3JpYmVkIGluICdnZXRfc3NfaW5mb19mcm9tX3RibCcKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2Vy
LmM6OTk3OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdzc2luZm8nIGRlc2Ny
aXB0aW9uIGluICdnZXRfc3NfaW5mb19mcm9tX3RibCcKPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFw
cGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jCj4gaW5kZXggZDI2NTRjNTBiMGIyMC4u
YzY3ZDIxYTVlZTUyZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvYmlvcy9iaW9zX3BhcnNlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Jpb3MvYmlvc19wYXJzZXIuYwo+IEBAIC05ODcsOCArOTg3LDggQEAgc3RhdGljIGVudW0g
YnBfcmVzdWx0IGdldF9zc19pbmZvX2Zyb21faW50ZXJuYWxfc3NfaW5mb190YmxfVjJfMSgKPiAg
ICoKPiAgICogQGJwOiAgICAgIHBvaW50ZXIgdG8gdGhlIEJJT1MgcGFyc2VyCj4gICAqIEBpZDog
ICAgICBzcHJlYWQgc3ByZWN0cnVtIGluZm8gaW5kZXgKPiAtICogQHNzaW5mbzogIHNwcmVjdHJ1
bSBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmUsCj4gLSAqIHJldHVybjo6ICBCSU9TIHBhcnNlciByZXN1
bHQgY29kZQo+ICsgKiBAc3NfaW5mbzogc3ByZWN0cnVtIGluZm9ybWF0aW9uIHN0cnVjdHVyZSwK
PiArICogcmV0dXJuOiAgIEJJT1MgcGFyc2VyIHJlc3VsdCBjb2RlCj4gICAqLwo+ICBzdGF0aWMg
ZW51bSBicF9yZXN1bHQgZ2V0X3NzX2luZm9fZnJvbV90YmwoCj4gICAgICAgICBzdHJ1Y3QgYmlv
c19wYXJzZXIgKmJwLAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
