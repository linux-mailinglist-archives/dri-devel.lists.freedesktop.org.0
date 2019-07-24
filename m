Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A072F94
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 15:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ADF892FE;
	Wed, 24 Jul 2019 13:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3588E46
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:09:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id y4so46950328wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l/MInuKADY02uba2xaImUqpHwPagffucnoVNy8CTllY=;
 b=jYNQ1WIx7iL8Py5tG1KW08UULE5v898KjB75U/9fSe5UDlb3+qPnWYRVrk5P2ivbiI
 rl636qVfHlp5sVFIE3RQ09irP0WiG7Iwh0mDQfFI+oKy3BEfca+grH+Zkcen7qbAlANi
 Lb3ZJ0h+9bLvr3ktqPMti8GztRZRyGH18YKeDcUKwlCS0SwgNnY37qlmhesh0DUbx6+f
 4T+FlNIT9c1asTM3xEAlNHHATbWksLepC8hlJGCM4Osc6Te1s1zSwjeXnczWBH/ZP67Y
 c6jTWrM087er0nzpk5uqoC96ysUYe9xXCongBq5Gs+0HRHUSYcGpGKH4bk7gCMZUZf7d
 rpZA==
X-Gm-Message-State: APjAAAWRJTaNsAxzMkEWYjdQvOr9Umr7Bj8ELeNydtCiqYQuH+79bNUo
 wC16zMOWrxXVS6RrjEvbM6p23Y1A
X-Google-Smtp-Source: APXvYqxHRmQRqP/dgRIEa+BH3Db5MsNIedVnzGn36g/uCyu9C8/XVfalFSwamo127hjGL6M7r4+Acw==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr68499659wrv.146.1563973760074; 
 Wed, 24 Jul 2019 06:09:20 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id o4sm35416870wmh.35.2019.07.24.06.09.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:09:19 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:08:54 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190724130854.GA555@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-ZWvVm7TEHl@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-ZWvVm7TEHl@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l/MInuKADY02uba2xaImUqpHwPagffucnoVNy8CTllY=;
 b=SbWkVX/lKaDhHmkCJ9hOllRly8MuDOHGLTF4o6/Z72TVy0AXiJ20VShmHnLY/2baTB
 qiy7XEYEC22TtYh0mS3/oI+40Es6x0TGyP/24FfKSQKZiQK5Avj2RF/w147nNXznEnWP
 spGjvuY2d2wga7HVGDN/GKdox8k8mPI2OsS94OORZoZcrPmmStwD/upy7IXd4iDHAauA
 PL/Q2QzZiR8qLeIxd2cOJF/UFXEEHNy3FuOPgywAQ6tBxRb4XRBS5D8z08zqr+5h5GGD
 HpPrpUS6EaNijIlRBTcD7FRFxHbVHsmItUEyBXeJT0xsKMOXmALh41FfAOeNGQmFHKaG
 JNNg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJIGNhbm5vdCBzcGVhayBmb3Igb3RoZXJzLiBJbiBteSBjYXNlLFUgd291bGQgc2F5IG5vLiBJ
IGluc3RhbGxlZCB3aW5kb3dzMTAgaW4KPiBhIHNlcGFyYXRlIHNzZCwganVzdCB0byBjaGVjayB0
aGVyZSB3YXMgbm8gaGFyZHdhcmUgaXNzdWUgb2YgYW55IGtpbmQuIAo+IE9uIHdpbmRvd3MxMCB3
aXRoIGxhdGVzdCBhbWQgZHJpdmVycywgSSBoYXZlIG5vIGZyZWV6ZXMgb3IgYW55IG90aGVyIGlz
c3VlCj4gcnVubmluZyBzYW1lIGdhbWVzLgoKTmF0aXZlIGdudS9saW51eCBnYW1lIG9yIGdvaW5n
IHRocm91Z2ggd2luZS9keHZrPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
