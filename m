Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74226CF09
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382826E3C7;
	Thu, 18 Jul 2019 13:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFE76E3C7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:44:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r1so28750909wrl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 06:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i4VFhB+hycnUHulIuK0MZ1Sig6q+PGdWllAbHYsT8nE=;
 b=P9VemTNl2nQSUx+XkK8+xo727FaMQccr74tNEy/i8tSZKr4RvTBzDJqseDMmGfBoWx
 t4iV3MWXLYo7bM3ppAPsOeZwdu+aq5jRd14o8Pe6KKTXem7vhVpcpoE7TCWz/XPYsm0K
 SgKaIDYN+r3uy9Mn8z8Ps6bsuT6JQW9sMk+2zZpbkm61MhLdbirx+56XGbrvNUmjzX9D
 RRDJ8wwe7opgjGrQPR6N+TWcKNj9aHZxTKhp5tAU1DNUh8zH0CXLmmtkn/UuoC249HTO
 TMRCF4MyFkumylNW32vtEIS3EhmxlQeTWFGHlMrJGdaqierW/otFvnBVJnnHtB/c16I2
 PN5g==
X-Gm-Message-State: APjAAAVlr8EM+/vVTS5MBW1X6nuZXFn1eTB3xYmRXnjDwYdyAcSX6Foh
 beWznAjbr0fwqtqwBwJdJ5MJtBFeKNE=
X-Google-Smtp-Source: APXvYqw1oUj3w11dXWvMSUasFmliMDM3xDsxHeTedpoF9/aLuPCky+g0IBuUnZ7dZCrBX7j979vbBg==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr53337797wro.284.1563457465845; 
 Thu, 18 Jul 2019 06:44:25 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i6sm19092139wrv.47.2019.07.18.06.44.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 06:44:25 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:44:17 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190718134417.GA496@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-uvgQ4uO5uO@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-uvgQ4uO5uO@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i4VFhB+hycnUHulIuK0MZ1Sig6q+PGdWllAbHYsT8nE=;
 b=vaI7vDGV+ZH6Epzc6e2GYoK2y6RrP53XDwpE91lBbi+cpTjkhiPKK5Iiw8FG7/z7Iq
 9Xww3ZbOrGQXLN/8jY+X6FsawSUj0lTkhuku07YDT1BVL3mcmDpwsFfZS1e7RcRVISBJ
 rQaEnyvpHQ4/zW18HOF/UqvNQExEWddyQHspUhA7Juuo6yHbqCl+lyPNi8d31C3faYcL
 Uc8Zh6dxxS2HWXFNjJud5whl818hsEyPFBsx4BlgpHeLfle2fSYsmV+CLf9s6cYzqw/v
 BsxV8JAJfATBRJC3rQoJaHEgtbakK30A1XtSay6PBYKyOtyB1aQnhQA7LQbIzTaCYCKi
 Rfpg==
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

UGxheWluZyBkb3RhMiB2dWxrYW4gb3IgR0w/CgpJIGd1ZXNzIGl0J3MgdnVsa2FuOiBhbmQgdGhl
cmUgSSBkb24ndCBrbm93IGhvdyB2dWxrYW4gZGVhbCB3aXRoIG11bHRpcGxlIFdTSXMsCmFuZCBo
b3cgZG90YTIgc2VsZWN0cyB0aGUgb25lIGl0IHdpbGwgdXNlLgoKVGhlIGlkZWEgaXMgdG8gY2xl
YXJseSBpZGVudGlmeSB0aGUgY29kZSBwYXRocyB3aGljaCB3b3VsZCBiZSAiYnVnZ3kiLgoKKG15
IGN1c3RvbSBkaXN0cm8gaXMgeDExIG5hdGl2ZSkKClRoYXQgc2FpZCwgSSBkb24ndCBrbm93IHRo
ZSBzdGF0dXMgb2Ygd2F5bGFuZDogZGlkIHRoZXkgcmVhY2ggdGhlIHNhbWUgImNsdXN0ZXIKZipj
ayIgbGV2ZWwgdGhhdCB4MTEgaXMgYXQ/IChpcm9ueSwgc2luY2Ugd2F5bGFuZCByZWFzb24gdG8g
ZXhpc3QgaXMgdG8gYmUKb3JkZXJzIG9mIG1hZ25pdHVkZSBsZXNzIGtsdWRneSB0aGFuIHgxMSkK
Ci0tIApTeWx2YWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
