Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684110EE1D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB476E271;
	Mon,  2 Dec 2019 17:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1FE6E271;
 Mon,  2 Dec 2019 17:25:11 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v16so63659edy.6;
 Mon, 02 Dec 2019 09:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4O+42nj6WQtkwHnnTH5d0eFBz+C+RtcRMNzjQPHoew=;
 b=iaFmv6KzUiVA0PRrISAmyOEic0PVSi/sEpOak1wkNdygjs1RuVV/nmMfcoCGUJYQsa
 TmDxBRXhJRtAfImQLdLKYbG4QwvGoLrT90dkQgpLLM7q6HhUbBHPb9IFKlid2xs4qeik
 InzxphlgPF0v/6OIuSBECYWu1VJynrUeghiKI1UXKB5uwsraoDolM50Y4Tpq6z/Tplv7
 0+AsAt9oEsQaX8n/MM1TzErz2YxqBIMBaflQdIgVi4Q/oCLR72cgLN8iB/jFOwNnVxSs
 75Y6HgOtwjs7TLXl7tAgVAvS9Cg/xLea0vldk/5KKRjiU4Mvou7dvHafjSEJCRhXZnUJ
 89zA==
X-Gm-Message-State: APjAAAWbQkl3/CBLLKdvzreAmPwLjNUcOw/ZspuE9zhZGGofYHuA7HRl
 yyyTbVjGWuGty2EgSjEpN63qaGNsdr8X3cvnNgg=
X-Google-Smtp-Source: APXvYqx5V6lcPZTuomJqSKHNoDS1xVBXbozw8XA0Yrx/or1UCBJOYYlgrxI+az9vy26AV3H/ghuLvYZ21BhR5JtOBxk=
X-Received: by 2002:a50:f313:: with SMTP id p19mr22833392edm.57.1575307510378; 
 Mon, 02 Dec 2019 09:25:10 -0800 (PST)
MIME-Version: 1.0
References: <0101016eb61a0601-14bd7732-c07c-4674-899f-0e570c145195-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eb61a0601-14bd7732-c07c-4674-899f-0e570c145195-000000@us-west-2.amazonses.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Dec 2019 09:24:59 -0800
Message-ID: <CAF6AEGtMXOjZPG1_EwdwBGp7TOVrXwBKo6eG-ryT_-OhxrfQWg@mail.gmail.com>
Subject: Re: [PATCH] rnndb: Add GBIF registers for a6xx GPU
To: Sharat Masetty <smasetty@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J4O+42nj6WQtkwHnnTH5d0eFBz+C+RtcRMNzjQPHoew=;
 b=WbvO0vrU3iLgkCZOVFkeNk8+EtfxGKZIs2TOMVgcT4/Yr9RiY2FWk6c6p6wxZHUOgy
 frt6S/bZQZP28mR9gk4PKxqlOXrF+AIrkLaBds4UhQgDHLzGacs+nzAtjen0bvMJLUS2
 //2X5BADD9zdBDvLl4w9Hj5U3RyCoG4JfHXTJ9oTALx4blDCh/4MoJaFLMFvTbDMqrrA
 DjLgmQ8pT+LnGyxojhRh3ce2Pmcq+HQ71MfMqekwAuxM9/2FoVbzOqkINmJ0kwzwgCy2
 LJx/pH0Ea+uKIFLAVmBKz3Hdi2tcb7OQ6RDfdu1gWP4EZK2ZNyvWKTX509kc5lDFqFVU
 BhaQ==
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTE6NDEgUE0gU2hhcmF0IE1hc2V0dHkgPHNtYXNldHR5
QGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEFkZCBHQklGIHJlZ2lzdGVyIGRlZmluaXRpb25z
IHJlcXVpcmVkIHRvIGltcGxlbWVudCBhNjE4Cj4gR1BVIHJldmlzaW9uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBTaGFyYXQgTWFzZXR0eSA8c21hc2V0dHlAY29kZWF1cm9yYS5vcmc+Cgp0aGFua3MsIEkn
dmUgcHVzaGVkIHRoZSB4bWwgdG8gZW52eXRvb2xzCgpCUiwKLVIKCj4gLS0tCj4gIHJubmRiL2Fk
cmVuby9hNnh4LnhtbCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcm5uZGIvYWRyZW5vL2E2
eHgueG1sIGIvcm5uZGIvYWRyZW5vL2E2eHgueG1sCj4gaW5kZXggNzQ3ZjA3MS4uMmQyMDYzYSAx
MDA2NDQKPiAtLS0gYS9ybm5kYi9hZHJlbm8vYTZ4eC54bWwKPiArKysgYi9ybm5kYi9hZHJlbm8v
YTZ4eC54bWwKPiBAQCAtMTc0OCw2ICsxNzQ4LDMyIEBAIHRvIHVwY29udmVydCB0byAzMmIgZmxv
YXQgaW50ZXJuYWxseT8KPiAgICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4MzExOSIgbmFtZT0iVkJJ
Rl9QRVJGX1BXUl9DTlRfSElHSDEiLz4KPiAgICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4MzExYSIg
bmFtZT0iVkJJRl9QRVJGX1BXUl9DTlRfSElHSDIiLz4KPgo+ICsgICAgICAgPCEtLSBHQklGIHJl
Z2lzdGVycyAtLT4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2MwMiIgbmFtZT0iR0JJRl9T
Q0FDSEVfQ05UTDEiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2MwMyIgbmFtZT0iR0JJ
Rl9RU0JfU0lERTAiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2MwNCIgbmFtZT0iR0JJ
Rl9RU0JfU0lERTEiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2MwNSIgbmFtZT0iR0JJ
Rl9RU0JfU0lERTIiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2MwNiIgbmFtZT0iR0JJ
Rl9RU0JfU0lERTMiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2M0NSIgbmFtZT0iR0JJ
Rl9IQUxUIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjNDYiIG5hbWU9IkdCSUZfSEFM
VF9BQ0siLz4KPiArCj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjYzAiIG5hbWU9IkdCSUZf
UEVSRl9QV1JfQ05UX0VOIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjYzIiIG5hbWU9
IkdCSUZfUEVSRl9DTlRfU0VMIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjYzMiIG5h
bWU9IkdCSUZfUEVSRl9QV1JfQ05UX1NFTCIvPgo+ICsgICAgICAgPHJlZzMyIG9mZnNldD0iMHgz
Y2M0IiBuYW1lPSJHQklGX1BFUkZfQ05UX0xPVzAiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9
IjB4M2NjNSIgbmFtZT0iR0JJRl9QRVJGX0NOVF9MT1cxIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zm
c2V0PSIweDNjYzYiIG5hbWU9IkdCSUZfUEVSRl9DTlRfTE9XMiIvPgo+ICsgICAgICAgPHJlZzMy
IG9mZnNldD0iMHgzY2M3IiBuYW1lPSJHQklGX1BFUkZfQ05UX0xPVzMiLz4KPiArICAgICAgIDxy
ZWczMiBvZmZzZXQ9IjB4M2NjOCIgbmFtZT0iR0JJRl9QRVJGX0NOVF9ISUdIMCIvPgo+ICsgICAg
ICAgPHJlZzMyIG9mZnNldD0iMHgzY2M5IiBuYW1lPSJHQklGX1BFUkZfQ05UX0hJR0gxIi8+Cj4g
KyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjY2EiIG5hbWU9IkdCSUZfUEVSRl9DTlRfSElHSDIi
Lz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2NjYiIgbmFtZT0iR0JJRl9QRVJGX0NOVF9I
SUdIMyIvPgo+ICsgICAgICAgPHJlZzMyIG9mZnNldD0iMHgzY2NjIiBuYW1lPSJHQklGX1BXUl9D
TlRfTE9XMCIvPgo+ICsgICAgICAgPHJlZzMyIG9mZnNldD0iMHgzY2NkIiBuYW1lPSJHQklGX1BX
Ul9DTlRfTE9XMSIvPgo+ICsgICAgICAgPHJlZzMyIG9mZnNldD0iMHgzY2NlIiBuYW1lPSJHQklG
X1BXUl9DTlRfTE9XMiIvPgo+ICsgICAgICAgPHJlZzMyIG9mZnNldD0iMHgzY2NmIiBuYW1lPSJH
QklGX1BXUl9DTlRfSElHSDAiLz4KPiArICAgICAgIDxyZWczMiBvZmZzZXQ9IjB4M2NkMCIgbmFt
ZT0iR0JJRl9QV1JfQ05UX0hJR0gxIi8+Cj4gKyAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDNjZDEi
IG5hbWU9IkdCSUZfUFdSX0NOVF9ISUdIMiIvPgo+ICAgICAgICAgPCEtLSBtb3ZlL3JlbmFtZSB0
aGVzZS4uIC0tPgo+Cj4gICAgICAgICA8cmVnMzIgb2Zmc2V0PSIweDg4ZDQiIG5hbWU9IlJCX1dJ
TkRPV19PRkZTRVQyIiB0eXBlPSJhZHJlbm9fcmVnX3h5Ii8+Cj4gLS0KPiAxLjkuMQo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
