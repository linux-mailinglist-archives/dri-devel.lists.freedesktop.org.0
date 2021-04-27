Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90536CF9F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 01:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09AE6EA0B;
	Tue, 27 Apr 2021 23:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0F6EA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 23:44:12 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o16so70141263ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YMIKC4vGdsxVos4+dsOTGyTHqSG6nUUAUOhU3oyN/ps=;
 b=bE/qvBzvsqd13cF2iCpY7hfzDbKrnY6CNusCIOktVq1TlPDP5ySyTrXE4scETMF1Yk
 RZF/mcPHW/b4gjNOkyS0/vu3e8EdOAITFv0Mz4JXtF1+7YGK6vUAavmRL96jW2Dq0OTk
 48M/UC638Q9pU9+j6yatiqAseW9vI30ZWExPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YMIKC4vGdsxVos4+dsOTGyTHqSG6nUUAUOhU3oyN/ps=;
 b=a/j4TpE9HNKGZbYLpcAf7/f8/KNjHysaQ8/3xUJnKJKAhIKRTUunvKpJxEFWWJKyJm
 NDuA2+GNuEfJl536zDrH4d3HZmrOYVQLPHQxyjEdQOwW2X0+F50Vgd4zewVYs47LGoZO
 ExCBvuXgSMqultiBYV89NstoHJ+WpsqogmVAicqHjTk6YK5dJn48h2lGufBQkhwyMS9h
 6lsn1Iaoc0YMxixMp9TiYHHSDxWVpA58RoVGWTbkMwFBZhZCfs2PhAnlDwsQMGz+4yAO
 RSpDCfBZmYfiLi6Y3w26wKTYmFprGD1lUMn77HcZ2m3IKqkP/off2Jj2uC/hJ1nynUVs
 qkEw==
X-Gm-Message-State: AOAM532V69Mj2M7OoVYs+sU6oBiiNq6CLxO31shozOGkcgoVOZWOAaR9
 vKwEtSZTdWGIqPTOax9dPrqay2L0eTOSbXFQ
X-Google-Smtp-Source: ABdhPJxhIXLZ8RmDvlBazXeobXwYZcRkB4v8P3S19QOPPSxM76r1EdslVcDmEseQrHawjimOiyTy8Q==
X-Received: by 2002:a05:651c:399:: with SMTP id
 e25mr18638928ljp.187.1619567050576; 
 Tue, 27 Apr 2021 16:44:10 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id m10sm285660lfr.189.2021.04.27.16.44.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 16:44:10 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2so3547033lft.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 16:44:10 -0700 (PDT)
X-Received: by 2002:a19:7504:: with SMTP id y4mr2737571lfe.41.1619567049911;
 Tue, 27 Apr 2021 16:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Apr 2021 16:43:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
Message-ID: <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
Subject: New warnings with gcc-11
To: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSd2ZSB1cGRhdGVkIHRvIEZlZG9yYSAzNCBvbiBvbmUgb2YgbXkgbWFjaGluZXMsIGFuZCBpdCBj
YXVzZXMgYSBsb3QKb2YgaTkxNSB3YXJuaW5ncyBsaWtlCgogIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX3BtLmM6IEluIGZ1bmN0aW9uIOKAmGlsa19zZXR1cF93bV9sYXRlbmN54oCZOgogIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1OTo5OiBub3RlOiByZWZlcmVuY2luZyBh
cmd1bWVudCAzCm9mIHR5cGUg4oCYY29uc3QgdTE2ICrigJkge2FrYSDigJhjb25zdCBzaG9ydCB1
bnNpZ25lZCBpbnQgKuKAmX0KICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjI5OTQ6
MTM6IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbgrigJhpbnRlbF9wcmludF93bV9sYXRlbmN5
4oCZCgphbmQgdGhlIHJlYXNvbiBpcyB0aGF0IGdjYyBub3cgc2VlbXMgdG8gbG9vayBhdCB0aGUg
YXJndW1lbnQgYXJyYXkKc2l6ZSBtb3JlLCBhbmQgbm90aWNlcyB0aGF0CgogKGEpIGludGVsX3By
aW50X3dtX2xhdGVuY3koKSB0YWtlcyBhICJjb25zdCB1MTYgd21bOF0iIGFyZ3VtZW50CgpidXQK
CiAoYikgbW9zdCBvZiB0aGUgYXJyYXlzIHBhc3NlZCBpbiB0ZW5kIHRvIGxvb2sgbGlrZSAndTE2
IHByaV9sYXRlbmN5WzVdJwoKSSB0aGluayBJIHdpbGwgbWFrZSB0aGUgYXJndW1lbnQgdHlwZSB0
byBpbnRlbF9wcmludF93bV9sYXRlbmN5KCkgYmUKanVzdCAiY29uc3QgdTE2IHdtW10iIGZvciBu
b3csIGp1c3QgdG8gYXZvaWQgc2VlaW5nIGEgdG9uIG9mIHNpbGx5Cndhcm5pbmdzLgoKSSdtIG5v
dCBzdXJlIGlmIHRoZXJlIGlzIGEgYmV0dGVyIHNvbHV0aW9uIChsaWtlIG1ha2luZyBhbGwgb2Yg
dGhvc2UKbGF0ZW5jeSBhcnJheXMgYmUgOCBlbnRyaWVzIGluIHNpemUpLCBzbyBJJ20ganVzdCBs
ZXR0aW5nIHlvdSBrbm93CmFib3V0IG15IGNoYW5nZSBpbiB0aGlzIGFyZWEgaW4gY2FzZSBhbnli
b2R5IGhhcyBhIGJldHRlciBpZGVhLgoKICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
