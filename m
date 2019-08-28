Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547CA08C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 19:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E003F89DFA;
	Wed, 28 Aug 2019 17:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3922C89DFA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 17:39:26 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id z64so178438ywe.7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 10:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qFpGxWkuqJvzGEyaIhW5jLfEJosqdgJDRUmrRBBeYNs=;
 b=O9GMm2kiCNDadrHdcF6iHssYm8xbfwUyazM0gP9Zfepp019lHPtTD8Alr0DiC0QROv
 fKJiCqiCWZqowtNzFUc68hX/SnYIQ5WT9DJ5+56jgbUl9j9dXbUs9ObRMAFvJumsSTnY
 bIH+GxkloTlCGE6kLShyd5Ay9BfvPZI5pmMpnjZ/n+fW0xkEaX1ecEqFkC3i00bKL8Nq
 fiUA4+G8CIATfBH4ysMx7NKH2rvafj8wt8VbPpGlbXmx4ecv9Y7rLCwvrQbs5DBPE67Q
 iwmRdoLlGRJSHcilQtbZlM8USjJ9hWT5vwNWPZFaEGQPR3jjAtx1c+bysjszA0b1+S+c
 bOGQ==
X-Gm-Message-State: APjAAAU3vMVjA317be0oZi2xEBiAwNokU1TZfQHXsDrtvfLstMAdE57x
 J+DACx0lHRWS3QZD2luxOIErdQ==
X-Google-Smtp-Source: APXvYqyrVae82GONg6G6xNXh2GuQpBKNgcXrFoQjXLJtaTK9ENwDFPeV9rgnIhlfcztUqTBdkROW9Q==
X-Received: by 2002:a81:2e0b:: with SMTP id u11mr3819761ywu.219.1567013965380; 
 Wed, 28 Aug 2019 10:39:25 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d186sm614964ywf.28.2019.08.28.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 10:39:24 -0700 (PDT)
Date: Wed, 28 Aug 2019 13:39:24 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove stray "\n"
Message-ID: <20190828173924.GD218215@art_vandelay>
References: <20190827211016.18070-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827211016.18070-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qFpGxWkuqJvzGEyaIhW5jLfEJosqdgJDRUmrRBBeYNs=;
 b=MA7imn2ncsnCHudQTmqQ5VNmGP5xmFYdXGG3IQLhQSRJBwKfS7igz5Tj3J25Zl9xza
 KU3CGRXXNayp++1iMedSJO1s4CBH6XYix460Ds56VGq3d0ZwGI9EzPhh9sUG6keZGuLx
 rm+4kkgsTNggulY9ExRns+6vzU/YZE/bfWtXM6GUBPHYmbbMbHwEcNlCVNhMrxXGQyek
 jeNBueGjMnKw9Pri3cmDJAiLZPSVg6XfDKQuq7UGs46jHubFTsyYZVGC1d4LYX0ubV0C
 Nf0nom5s1riI86vEeEhTPzf3lNPNtewKpqTGthpXeceEptS+Pv92dEukR9Va11d7uU/V
 irIg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bruce Wang <bzwang@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDI6MTA6MDlQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBUaGUgZXh0
cmEgbGluZS1icmVhayBpbiB0cmFjZXMgd2FzIGFubm95aW5nIG1lLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KClJldmlld2VkLWJ5OiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV90cmFjZS5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
dHJhY2UuaAo+IGluZGV4IDc2NTQ4NDQzN2QxMS4uZWVjZmU5YjMxOTllIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV90cmFjZS5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3RyYWNlLmgKPiBAQCAtMzkyLDcgKzM5Miw3IEBA
IFRSQUNFX0VWRU5UKGRwdV9lbmNfcmMsCj4gIAkJX19lbnRyeS0+cmNfc3RhdGUgPSByY19zdGF0
ZTsKPiAgCQlfX2Fzc2lnbl9zdHIoc3RhZ2Vfc3RyLCBzdGFnZSk7Cj4gIAkpLAo+IC0JVFBfcHJp
bnRrKCIlczogaWQ6JXUsIHN3X2V2ZW50OiVkLCBpZGxlX3BjX3N1cHBvcnRlZDolcywgcmNfc3Rh
dGU6JWRcbiIsCj4gKwlUUF9wcmludGsoIiVzOiBpZDoldSwgc3dfZXZlbnQ6JWQsIGlkbGVfcGNf
c3VwcG9ydGVkOiVzLCByY19zdGF0ZTolZCIsCj4gIAkJICBfX2dldF9zdHIoc3RhZ2Vfc3RyKSwg
X19lbnRyeS0+ZHJtX2lkLCBfX2VudHJ5LT5zd19ldmVudCwKPiAgCQkgIF9fZW50cnktPmlkbGVf
cGNfc3VwcG9ydGVkID8gInRydWUiIDogImZhbHNlIiwKPiAgCQkgIF9fZW50cnktPnJjX3N0YXRl
KQo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdv
b2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
