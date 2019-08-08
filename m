Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AD87399
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AB36ED17;
	Fri,  9 Aug 2019 08:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBC56E8AF;
 Thu,  8 Aug 2019 19:20:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p184so44634389pfp.7;
 Thu, 08 Aug 2019 12:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WofIjniXiwNzxEUaGFVhZ+h83Wcut+hzdIT3wo6e7YM=;
 b=r4w/6e7O1F2Ununx1Wq0FUM2N+CRLJiTZyLU0p9roWvuRqPUmLWURL2I8SFqPER5t4
 wlVSPrGVbSTLtsvXySBdC6i3R+ro97qxazG8xKN0J389RQwRiZSYDkveHEw7YCfNmcFs
 yLxqEIpCO0U6f+LrSdK6MfpnAlt2X1wRd29DweqBmDm3anSSAMdoDH/us36cWiPVoiio
 URgtAIBc9+yOekPYF6I8hFy6diaOL25fH0XVIR8a06vHRY2UB9srgiERMHpN0IFgbJ9X
 gTYF4ubEq1kmIUgKiL57bHBgKFPrH9IiNmblvSQtdyW9YSmboTkGB8VKvDmWz+yprSLu
 A1vQ==
X-Gm-Message-State: APjAAAXhE3aNG3m8+FASfLwAti5AIJC4fly2xIV9jQBwNiuGVPL6IZV5
 2W/UfzPC0lSZbEfiYB+6GwU=
X-Google-Smtp-Source: APXvYqy1nAMROP2tNRjP90YcDjSjfw5g7Jxmg/KRzY27RLDmMUbzlnugppsGaJIAUrvztZ+VMG7E7A==
X-Received: by 2002:a62:16:: with SMTP id 22mr17745874pfa.151.1565292055001;
 Thu, 08 Aug 2019 12:20:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e189sm83108353pgc.15.2019.08.08.12.20.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 12:20:54 -0700 (PDT)
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
To: Alex Deucher <alexdeucher@gmail.com>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
 <20190805111205.GB6432@sirena.org.uk> <20190808184149.GA441@roeck-us.net>
 <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <768ee31a-c870-4237-f38a-b176378072b6@roeck-us.net>
Date: Thu, 8 Aug 2019 12:20:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WofIjniXiwNzxEUaGFVhZ+h83Wcut+hzdIT3wo6e7YM=;
 b=KQljckW9Gh7h2hSk+gLggObASU2CPWRIxV7VyUuCJvL2RUAx4WqtitmD7N7cnp6dtx
 1bSKBO7I2OZorVgWYzMkpzO3B6BIsB42z6GOkLb2mpjCUwtjti3t8QKP5k7He1Tig9zq
 jOrsP1LmiRh9m+6/QM88HoXQXRZChQKxEYeIqxzFY4CjN+0DkRbI9FFENeF/VtQ91ibj
 wjycfbIZ18hEDhEpzFP+koh8U+KaZGz/YRV29a9TWvOBJkhP59Scv9Pq8Z9GeAaM2uo2
 /VeEZDsaWHSxcNBQfDgNTCOxY5hj5P58fSPg4jLgLEhbYwyCybIq1fc4MMvmXkj1JekE
 WURg==
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
Cc: kernel-build-reports@lists.linaro.org, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dennis Li <dennis.li@amd.com>, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC84LzE5IDExOjUzIEFNLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gVGh1LCBBdWcgOCwg
MjAxOSBhdCAyOjUzIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6
Cj4+Cj4+IE9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDEyOjEyOjA1UE0gKzAxMDAsIE1hcmsgQnJv
d24gd3JvdGU6Cj4+PiBPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwMjo0MDozMkFNIC0wNzAwLCBr
ZXJuZWxjaS5vcmcgYm90IHdyb3RlOgo+Pj4KPj4+IFRvZGF5J3MgLW5leHQgZmFpbHMgdG8gYnVp
bGQgYW4gYXJtIGFsbG1vZGNvbmZpZyBkdWUgdG86Cj4+Pgo+Pj4+IGFsbG1vZGNvbmZpZyAoYXJt
LCBnY2MtOCkg4oCUIEZBSUwsIDIgZXJyb3JzLCAxNiB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKPj4+Pgo+Pj4+IEVycm9yczoKPj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYzoyNzk6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uICdyZWFkcSc7IGRpZCB5b3UgbWVhbiAncmVhZGInPyBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYzoyOTg6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uICd3cml0ZXEnOyBkaWQgeW91IG1lYW4gJ3dyaXRlYic/IFstV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+Pj4KPj4+IGR1ZSB0byA0ZmExYzZhNjc5YmIwIChk
cm0vYW1kZ3B1OiBhZGQgUlJFRzY0L1dSRUc2NChfUENJRSkgb3BlcmF0aW9ucykKPj4+IHdoaWNo
IGludHJvZHVjZXMgdXNlIG9mIHJlYWRxKCkgYW5kIHdyaXRlcSgpLgo+Pgo+PiBBRkFJQ1MgdGhp
cyBwcm9ibGVtIGFmZmVjdHMgYWxsIDMyLWJpdCBidWlsZHMsIGluY2x1ZGluZyBpMzg2Lgo+PiBJ
cyBpdCBpbiB0aGUgcHJvY2VzcyBvZiBiZWluZyBmaXhlZCwgb3Igc2hvdWxkIHdlIHN1Ym1pdCBh
Cj4+IHBhdGNoIGxpbWl0aW5nIERSTV9BTURHUFUgdG8gNjQtYml0IGJ1aWxkcyA/Cj4gCj4gWWVz
LCB0aGUgZml4IGlzIGJlaW5nIGRpc2N1c3NlZCBoZXJlOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjIyMTMvCj4gCgpQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgZG9l
cyBmYWlsIGZvciBpMzg2ICgzMi1iaXQgeDg2KSBidWlsZHMsIGNvbnRyYXJ5IHRvIHRoZSBpbmZv
cm1hdGlvbgppbiB0aGF0IGRpc2N1c3Npb24uIEFsc28sIGZyb20gbG9va2luZyBpbnRvIHRoZSBr
ZXJuZWwsIEkgb25seSBzZWUgcmVhZHEvd3JpdGVxIGRlZmluZWQKZm9yIGFyY2gveDg2IGluIDY0
LWJpdCBtb2RlOyBzZWUgYXJjaC94ODYvaW5jbHVkZS9hc20vaW8uaC4KCkd1ZW50ZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
