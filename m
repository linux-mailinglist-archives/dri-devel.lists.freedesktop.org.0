Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70952348F0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 15:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF91898C7;
	Tue,  4 Jun 2019 13:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777A898C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 13:35:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g135so73939wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 06:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0rxWiDS7gpUSmRLiQjK4w/FfUorLcAv9VSiS1hF9VWE=;
 b=CLjlAUC/86qNQPD0AeKzz8hkHfs/PFsu6MMttQzlKdM/vPZOSYN5JjZjuKw+C9agmI
 SC9sdke+c01jYr6qMAc4O/nWH1A0Fn2iNJKt1t4g0aJfkQRvRlZ1W0DI9JtKOFNUwaRH
 l+eRJ8MMDrrI+kxhPgOwb5OxjXicxxKnpigoIu9I6ldsjzjTn84N34U86429euKIeA1q
 tIxHH0ea4ENRS5z/FYW2YUOGFYgbqjcGojPnsy+ZxYwBVsobuv1+BsKSA3McGUAZDg4e
 sa+ssN/3WIk3htvzCz2viMyZfNpty8qtvoQGBXb6jazFUeowixtYaF4At5mVciAKdhJ3
 AmDQ==
X-Gm-Message-State: APjAAAXVjIw3dYj9s8Zb3FAVWnzrTOBkZ0Acz9Gpw0CzCmJD1Gfg/B03
 e4fy3knxMTFf41d/pQvNZxqfD5pSeic=
X-Google-Smtp-Source: APXvYqwjt2pZ1Qpkgey4nZvvtoNMWNTNOMzd+uSC3T6KKKXW2+zQOLZdz4uQlm/kcHrMGqWtT/TAuw==
X-Received: by 2002:a1c:a7ca:: with SMTP id
 q193mr19491784wme.150.1559655319427; 
 Tue, 04 Jun 2019 06:35:19 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id f2sm18227608wrq.48.2019.06.04.06.35.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 04 Jun 2019 06:35:19 -0700 (PDT)
Date: Tue, 4 Jun 2019 13:35:11 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 110822] booting with kernel version 5.1.0 or higher on RX
 580 hangs
Message-ID: <20190604133511.GA574@freedom>
References: <bug-110822-502@http.bugs.freedesktop.org/>
 <bug-110822-502-7marQ2G77X@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-110822-502-7marQ2G77X@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0rxWiDS7gpUSmRLiQjK4w/FfUorLcAv9VSiS1hF9VWE=;
 b=Ujyh7gQao87GcWvkSpjQJswPKl/O5DJbiGBpZBa7kB1e/pQecYLl+Vr4JgFL15WiN5
 B/kZut3cKYLYCOL8qYdeUSdGJ2bYqZOpRGdSF5BItwD+5cLC5oyILN6CeD5h9g1N/L8d
 G3dx6xjK6J7WtWUWyoNo/NhjSLI2R2tFqV8XX91Wt6BKeAxgc+6SR3YMBlKnrHAeUGqa
 QVaAY89Heh+mylXxVluVOIIXB1Qa6Z5siOg1XVkUpqkOKPtgff73Bw4l8vAjn+E6O/z4
 ZaYYRbcj0+TlwiKpVdG9s6QlCr7Nus/kCuBPgIHXV722fmvjyrxuQEjlvLjcyLbW+9OC
 oN8Q==
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

YmlzZWN0IGlzIHF1aXRlIGNvbW1vbiBpbiB0aGUgZ2l0IHdvcmxkLiBZb3UnbGwgZmluZCB0b25z
IG9mIHR1dG9yaWFscyBvbiB0aGUKd2ViLCBuYW1lbHkgeW91J3JlIGdvb2QgZm9yIGEgbGl0dGxl
IGJpdCBvZiByZWFkaW5nLgpKdXN0IGRvbid0IGZvcmdldCB0byAiZ2l0IHJlc2V0IC0taGFyZCIg
YmVmb3JlIGNhbGxpbmcgImdpdCBiaXNlY3QgZ29vZHxiYWQiLgooanVzdCBwZXJmb3JtZWQgYSBi
aXNlY3Rpb24gb24gbGludXggeWVzdGVyZGF5KS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
