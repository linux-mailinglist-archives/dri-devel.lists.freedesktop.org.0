Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FD35AB68
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 08:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06676E043;
	Sat, 10 Apr 2021 06:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6386E043;
 Sat, 10 Apr 2021 06:43:08 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id s2so2562362uap.1;
 Fri, 09 Apr 2021 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tD3sRW7MhXsgApKUhr5Trpqo6cxrYcmmNJGwF4gwOKs=;
 b=SMpl/+iLP9kKRhJyvI9ApCT/ke9K3JfR/FMTQOrKpakLLs3eG+Y0Pq3PKHMLhOP0Li
 eSfQb2mOUDWTUA0GwOilnhPpX5dFWi67LcC9RKDIaXZKZF7pzBFWN3ejY1Di78OpKG6Y
 sFrZTO0rHj3SFQaW6ZRlGEDBotGqQZg3+XJcGQ4Ux9QNdTcwQ86zaF/wq3QaZ1fUEzGG
 UYmQLkx1tqkirMfpMxTlCJGOBRKIc93XUHWCnxfk+g9Sl7j04PlbPVjl5kZ6U5fNWIx4
 b/nYY8RXawYcTPq9YzzWUiFwN+ghiHzJYk51SIVf1irKLa/L0j9oJ9fuSX9nROd+fROV
 KwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tD3sRW7MhXsgApKUhr5Trpqo6cxrYcmmNJGwF4gwOKs=;
 b=G+kcHf/jp12apsBCLB5d3hVkXWQRLt06cv4otD/QzhyI9gVe87bLgg7Ru61dLpBfi+
 DbasK98Nb9W7mea1PLqzfu7zH72lY+jpchHcGypUQQm9ijVKNpXD5nnM/41Q/VNhhcbA
 ba3F8yDdcjAzbV6qreoOf6YniHSlDLNoGUPg7X3J0htSGsNu/h2KL/oF5OUcxk7qCV55
 4RwfYrYiivkRbCI/wcn+dzk+fYbxwJIZFA+q0R6VIdufIayfJtkqluZDZNo6KuoyoZz/
 pt7TzrznElozDMbEA8DtV3+OaQR34wmMGaYMY6DVORpo1onTbwqLRh7vBN2DUB+tf2+x
 6GWA==
X-Gm-Message-State: AOAM532PBAaWy5Y4fxMCQHRiqAzn+EmEOXeEC0YzlVZEn4OHujuoBTTh
 nOiUGmn9GxwXafCdrQG8PbDGRwCExfaJIgrAu44=
X-Google-Smtp-Source: ABdhPJwgUEPopjijNm0Znbec+DapNcANQeEmTj4r9qYMN/XdzzPqq4JwU5kxkQMIg7uuy/hxk8tpCwRx4uu9YgIodUM=
X-Received: by 2002:ab0:7142:: with SMTP id k2mr14667467uao.124.1618036987493; 
 Fri, 09 Apr 2021 23:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <1616675636-27405-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1616675636-27405-1-git-send-email-tiantao6@hisilicon.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 10 Apr 2021 08:42:56 +0200
Message-ID: <CAH9NwWdew01Jc1JpupnX3nbNb7n_B3n6bNEQWL3sdGA5+KMnrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove useless error message
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG8uLCAyNS4gTcOkcnogMjAyMSB1bSAxMzozMyBVaHIgc2NocmllYiBUaWFuIFRhbyA8dGlh
bnRhbzZAaGlzaWxpY29uLmNvbT46Cj4KPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHJl
cG9ydDoKPgo+IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmM6MTc3NToyLTk6
Cj4gbGluZSAxNzc1IGlzIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBhbHJl
YWR5IHByaW50cyBhbiBlcnJvcgo+Cj4gUmVtb3ZlIGRldl9lcnIoKSBtZXNzYWdlcyBhZnRlciBw
bGF0Zm9ybV9nZXRfaXJxKCkgZmFpbHVyZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8
dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBaaWhhbyBUYW5nIDx0YW5n
emloYW8xQGhpc2lsaWNvbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmF5IEZhbmcgPGYuZmFuZ2pp
YW5AaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFu
LmdtZWluZXJAZ21haWwuY29tPgoKCi0tIApncmVldHMKLS0KQ2hyaXN0aWFuIEdtZWluZXIsIE1T
YwoKaHR0cHM6Ly9jaHJpc3RpYW4tZ21laW5lci5pbmZvL3ByaXZhY3lwb2xpY3kKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
