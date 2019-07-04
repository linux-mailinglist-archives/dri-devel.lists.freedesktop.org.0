Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DF5F9CD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8226E352;
	Thu,  4 Jul 2019 14:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D76E352
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:12:40 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id m23so2029671vso.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zhr4cixuRTBTN966zcZ68eRUDO7WFunkHmiv567a75g=;
 b=i/AGAV9cTh3bhakZJLw2poeJWlDEw4jQL7OBfiNoYVxZc11NdeimlOUX/0uqsaweZ2
 vkcrRsX8R7ZopzI0afgR8ggU6vx+57fqVccD64FcuGa2URJKEuomXVWzpsMG9/d53kHV
 CMQUcaJtLYVUhmwpYO2CkYjVlRtkh/N5yP0hCGqnyR5+qGRHxra6cjSsHZTl1O4hSSEQ
 RZpFbtpC0CRALP2hExCDKosMjaG92Y42FZtL4BRCuYMIyK4QMvwmAOxNM6AyaSfh0ujM
 aQQBjs34sfQgc7Fuz+bR4EU2RC9najaVoBNkVEBCbjg+Fu0mtDLz+iII8aQexxORZkmg
 fqqQ==
X-Gm-Message-State: APjAAAWwjN1oGk3unzw+qImPkBxFC2w0mCqEaoNbzw1olwjfcZcGGr0N
 3148berRNYIDrE6HEi1cXpKC8Ne2Bps++AnNxKc=
X-Google-Smtp-Source: APXvYqwysHqcSk6OBWA5nrnPWDe+dTzxKAb2FkKdc/UsIm58e3Iy55DpkUHTDKOCW1UXoMZv0n2rh9SVA9GHaV6Q0yM=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr21727445vsd.85.1562249559886; 
 Thu, 04 Jul 2019 07:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190704023557.4551-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190704023557.4551-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:12:47 +0100
Message-ID: <CACvgo52zd4iMR1v3AbNh8XP3jmFOueOoFvqr9ZWTX4pe_Ev5AQ@mail.gmail.com>
Subject: Re: [Patch v2 03/10] drm/omapdrm: using dev_get_drvdata directly
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Zhr4cixuRTBTN966zcZ68eRUDO7WFunkHmiv567a75g=;
 b=j0F+4oXtCh5A/o1Dj8gJj53mDHaVaomzRArVsODj7s/CHA+uLK9BvcGF8ts15y8Vys
 CwaAT+a4QCsukfPUDxbAjIDOiltSkMglVhN4xE3VJs6GpdhtHdP5UhgHBSg65fCFyAFY
 EhV8rJeuG38LU8+dQmSGbmOVFDE4nyhrN/uHd5la2w4PxGtUP0FZnJ+HQBKe1Y1Hktsa
 MgOpmHsqhr/b3MN6jlFxQN9HHjB+zC+sO8ClCTMKw4qgYfZuE8Sz53w8jbqMb+nchXPE
 UY4DSO5UQ00R8T9ifoFKyD/lM7jX7u6IOna3TBkhbkUh6HgN6LTJdskRGz49tqi35sCP
 e3mA==
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA4OjI2LCBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTZXZlcmFsIGRyaXZlcnMgY2FzdCBhIHN0cnVjdCBkZXZp
Y2UgcG9pbnRlciB0byBhIHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSBwb2ludGVyIG9ubHkgdG8g
dGhlbiBjYWxsIHBsYXRmb3JtX2dldF9kcnZkYXRhKCkuCj4gVG8gaW1wcm92ZSByZWFkYWJpbGl0
eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUgc2ltcGxpZmllZAo+IGJ5IHVzaW5nIGRldl9nZXRf
ZHJ2ZGF0YSgpIGRpcmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFu
Z2ZxLmRheGlhbkBnbWFpbC5jb20+ClRoaXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
