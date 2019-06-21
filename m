Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B04E45E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52D26E85A;
	Fri, 21 Jun 2019 09:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDE76E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:42:46 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so6218664qto.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=voXOjCDKaWVYdLTWFMcEZUkDxmgR0CxuF6yexARSuUY=;
 b=PQZBJSsEz+oclUMC4KGnsr1vukh69xif7x+5SYh+XZWttzcYPf7XfPRhI/g9ycRQV8
 F0Fw6nIgNzzJ08zp5muQMS433HSULoYR2jX1+C9Hd9hiL2h44dIDp0I4pd/8cpKylrw7
 ZoB+8sFTJEfjkXf/mvzhOFQHlFYYoiXDOsMHiQubI6La0q5OjjfiQQOj8XyLxeyw2XAN
 NmjEzmp+R2zyzMpIdNgSpoV7UYaQ5ksg5267sHfw/fLUGGMe0iCQEPK90cWbH+JnIKrn
 xRJkc9e0V4dD/mP8NUnbdZAVBqI/ZgIPXukrmXnEv+XBsT6FOtyTUzDHoIPRPzq6IOLh
 +Hrg==
X-Gm-Message-State: APjAAAXV8qQDRXeFoZCGdlxNx9xf+1owG/xvb6NYQIsc8C2S6hY3rxyj
 yxEjp7Jrix4SxGpO30ijzcpEXct/40T85eOfkcK9ng==
X-Google-Smtp-Source: APXvYqxG/ETQk1E8/TUYPfflkh7ZrDwEi3NeU1BW/bV+XNteZsnNKMWTbT4FgYaJzDfH6YCpg7S38j2Dzf3ZtixqdyQ=
X-Received: by 2002:a0c:99d5:: with SMTP id y21mr43534451qve.106.1561110165510; 
 Fri, 21 Jun 2019 02:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190620150306.124839-1-yuehaibing@huawei.com>
In-Reply-To: <20190620150306.124839-1-yuehaibing@huawei.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 21 Jun 2019 11:42:34 +0200
Message-ID: <CA+M3ks69T+Eh0Hd_OgCfT_VP=S_ouUwU+dawueJw9fzWO=LzmA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/sti: Remove duplicated include from sti_drv.c
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=voXOjCDKaWVYdLTWFMcEZUkDxmgR0CxuF6yexARSuUY=;
 b=EHtwzXV9ag4SceJsJSACSOeeNk35bKg24uObths0QcZgvsQNeZwiX9MbzsoIrzqHB8
 PmDx+jEaygonb3ZbpcvywsCMlWAh2LIdKxbzgI3ENIjF4e+hQ4AJ96WjNosw0LDZcEqD
 d27h/VFLj7CkGf0/NikIaE/fU+5kGhdnC/Bjdmp7SDNj8ComKdAaSoAGY0CcPOCvZ5Jf
 MHn/Z2lRNuJ1u7/onIxivRkSI3wf0jDjVCak9YjwHs8YG0njxbsT+5EB2VyRl9cnIUJk
 612Oji/k97NlbeZrhIsT3TMfGzEjQKBwsSTDG880f7cBovak8rhAqAelO5n1VBfcGD3A
 645A==
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
Cc: David Airlie <airlied@linux.ie>, Vincent Abriou <vincent.abriou@st.com>,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAyMCBqdWluIDIwMTkgw6AgMTY6NTYsIFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4gYSDDqWNyaXQgOgo+Cj4gUmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KCkFwcGxpZWQg
b24gZHJtLW1pc2MtbmV4dCwKVGhhbmtzIGZvciB0aGUgcGF0Y2guCgpCZW5qYW1pbgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCj4gaW5kZXggYmI2YWU2ZGQ2NmM5
Li4yZWRkNjY2ZmI0NGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYwo+IEBAIC0yMyw3ICsyMyw2
IEBACj4KPiAgI2luY2x1ZGUgInN0aV9jcnRjLmgiCj4gICNpbmNsdWRlICJzdGlfZHJ2LmgiCj4g
LSNpbmNsdWRlICJzdGlfZHJ2LmgiCj4gICNpbmNsdWRlICJzdGlfcGxhbmUuaCIKPgo+ICAjZGVm
aW5lIERSSVZFUl9OQU1FICAgICJzdGkiCj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
