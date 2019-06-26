Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E656BE5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D3F6E44A;
	Wed, 26 Jun 2019 14:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7B6E44A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:28:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so3684179eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=RDzxId5d0cWk+Og3KjWmTmUc93/gQfEJUMFySwZomG0=;
 b=drRYzX5QJELLyDDTQc0JIR7qLDbIzPPnKXaabtbyCpPCsBvy1kySOFH7ZrwQEH7Y17
 QYWsOpHHDQ/55Ov8PVrIESvxrXDlNaHDY5+I2N3kzS1J90bG88AK4btZv+1GKj3FeJdT
 BwPuXa2HDW11+hHtlBN28/Hp3hLmBmkypj65daPVgdonQx4RZWHZIzfaojHxnfZt7lhU
 iZPxd322JB8DdpEEF4BvuBRrQsYdn33UGG77qFWmGsto27XyJiKvXJd+IBw0mhpqmy1P
 T7QdeuaD4TLFIDuzAW1A51Abe8BsT1qboSgxhzZGgSnKh2s4w+rDzck1BiQ6bORzSach
 nq6g==
X-Gm-Message-State: APjAAAX++N6cqj45xt+ypT1JlT+bXVrXmS0snYwbPfYBUNP8HliSpaR7
 hiHICdCHbhNr3lcTniP8y+YU/w==
X-Google-Smtp-Source: APXvYqyHvtMQ1Lf+heBq8BjwPrx2FB7C/LXB6Iy0Y7C76qtBhDrUXHnqzdv+4phmpNRAYv0YzOY5Cw==
X-Received: by 2002:aa7:c619:: with SMTP id h25mr5603958edq.295.1561559298723; 
 Wed, 26 Jun 2019 07:28:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a8sm5564492edt.56.2019.06.26.07.28.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 07:28:17 -0700 (PDT)
Date: Wed, 26 Jun 2019 16:28:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] docs: gpu: add msm-crash-dump.rst to the index.rst file
Message-ID: <20190626142815.GM12905@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <e22a340cf94240094cfb38f8c62f6916ea99394a.1561556169.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e22a340cf94240094cfb38f8c62f6916ea99394a.1561556169.git.mchehab+samsung@kernel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RDzxId5d0cWk+Og3KjWmTmUc93/gQfEJUMFySwZomG0=;
 b=QEOzXwN4cDsvAl3fnj/WI0Yyq8XoY5VQ/1ZZo0YTXcPQaz7t7hzaRKCaRnRHIHiPGt
 zp3wPqP1RRIVvxImSiDl6NhJBgMjgo496X0ZA+o/q+gwPvwhoP6USmJAkOZsWfB7DEqS
 y2jLjM7JyZMFztMCPpCoUhWNkkAoVfNtxTL34=
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6MzY6MTFBTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IFRoaXMgZmlsZSBpcyBjdXJyZW50bHkgb3JwaGFuZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVs
Lm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvaW5kZXgucnN0IHwgMSArCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2dwdS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS9pbmRleC5yc3QKPiBpbmRleCAxZmNm
OGU4NTFlMTUuLjU1ZjNmNDI5NDY4NiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9p
bmRleC5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9pbmRleC5yc3QKPiBAQCAtMTIsNiAr
MTIsNyBAQCBMaW51eCBHUFUgRHJpdmVyIERldmVsb3BlcidzIEd1aWRlCj4gICAgIGRybS11YXBp
Cj4gICAgIGRybS1jbGllbnQKPiAgICAgZHJpdmVycwo+ICsgICBtc20tY3Jhc2gtZHVtcAoKU2hv
dWxkIGJlIGFkZGVkIHRvIGRyaXZlcnMucnN0IEkgdGhpbmssIHNpbmNlIGl0J3MgZHJpdmVyLXNw
ZWNpZmljCmRvY3VtZW50YXRpb24uCi1EYW5pZWwKCj4gICAgIHZnYS1zd2l0Y2hlcm9vCj4gICAg
IHZnYWFyYml0ZXIKPiAgICAgdG9kbwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
