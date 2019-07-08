Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECA626C5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 19:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13889E23;
	Mon,  8 Jul 2019 17:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB789E23
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 17:00:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n4so17986427wrs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 10:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UuC5IM6IjL1c5UMDOOc6b9EtW41U2n6aYfsPTLmzo50=;
 b=gTCDCX2+SBM0A8v18ePWsBiC24f1jhTBIOAx20JV0aXd3rDc6n0hGqW2BY7aFL0/mc
 fcy3usWRRwaKfmGM+45DMUrMl7aIfyox4yRKCH61kj+9z4Oxmcr1nT2mrCstmllPSubm
 fktwQb9OT3C3Ah6tuyVDczOhibzH/RUIy02Zbh7NMPvei5duLJIMLNsLIUdJcTxtTqPy
 KP0VnyZOVcP5lM2NWS0c0pZbVMqi0SMFyLzzkiAgwI9lE4YK0fvA2ZmMJscCwzEtp2jl
 pHe8sSuU4SufH2FadQ5Rpn57j7FxV/ARZdmZE5pHhFyavTYbHTWWkbkZ5gxH+J8pu/aO
 3nsA==
X-Gm-Message-State: APjAAAWy18chFjvPPtvE3D7DyQ5/iuJ09f60FsPvvtMgoRS2b2GF5pG9
 1lKJlcXqlVjNZfkutrz714Nsw9lX+kQ=
X-Google-Smtp-Source: APXvYqyI6s3qSO7kKq/R8Iipjl3XknA5mBg0Yg0Vn4+VcfDogFFQ4OQ7zvetE1GLFj7tRsw8uZ0ykw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr14591813wrp.50.1562605246658; 
 Mon, 08 Jul 2019 10:00:46 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id w67sm186783wma.24.2019.07.08.10.00.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 10:00:46 -0700 (PDT)
Date: Mon, 8 Jul 2019 16:59:58 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Message-ID: <20190708165958.GA13413@freedom>
References: <bug-111082-502@http.bugs.freedesktop.org/>
 <bug-111082-502-YUuhQOxQPb@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-111082-502-YUuhQOxQPb@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UuC5IM6IjL1c5UMDOOc6b9EtW41U2n6aYfsPTLmzo50=;
 b=CrPvR+YZbFXsUqFQsZIRLlTaZkq8PG7yjmTu84VY2QT0aRlCLokhRL3+sRGN0zBH4G
 KR7B6CfxBOcIiQuRTHFvjgX70NWgY+scpMEAD8GD2VQ5/DaJUR+CGIMc4IU17I13zuX2
 5NUhzpmuWItptAjP7XrAQrUlvEUkyui+9xDF7/fdStJeM5fR0Lq0FYks3iJVhqzn4pwy
 TYYdp70RC8EWZOfHWa/7gPhHd/oISiBGHmtx/35TE1nePrIMwYseZE7/02CW4imbSNmO
 taiFQ3MqXOps272TOsfAmiilvlszdAmxUQJJp7Eizl6Qd+3pEz1QSTHfudkGekj1EDyI
 rAbw==
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

SSBkaWQgcmVwb3J0IG15IENTR08gcGVyZm9ybWFuY2UgcGIgdG8gdmFsdmUgZGV2czoKaHR0cHM6
Ly9naXRodWIuY29tL1ZhbHZlU29mdHdhcmUvY3Nnby1vc3gtbGludXgvaXNzdWVzLzExMTEKCkkg
aGF2ZSBubyBpZGVhIGlmIG15IENQVSBib3VuZCBwZXJmb3JtYW5jZSBwYiBpcyBpbiB0aGUgZHJp
dmVyICh3aGljaCBpcyB2ZXJ5Cmxpa2VseSBzaW5jZSBpdCdzIG9wZW5nbCksIG9yIHRoZSAzRCBl
bmdpbmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
