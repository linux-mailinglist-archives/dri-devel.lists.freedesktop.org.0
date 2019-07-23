Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C635C72098
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 22:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6F96E3B7;
	Tue, 23 Jul 2019 20:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6CD6E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 20:18:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f9so44453476wre.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N+r04g8BnjQ1Qd2I+XTkoV+NQ4Jl2QtzpSOknktozMM=;
 b=khUDo0B1bi1Rq816/8UOVEMvdLZJqFq73e75ARnMYKM5YNR9npeP7k9dyIzLgcY6ge
 q7RvFBjAwS4rIhxwdoPCL0eF4vhLWwfjGQ8qG/eWyA3MUgSh6HNZUsYd7TqV2h1OzP/y
 jTv1A+abSBTj3TwzMQQUbhy+qQijrfm0xI42NNvDthP9O13BeGCYwyzJiCNZDFLM3H6p
 gSPKGcatib0mn/7BX1rTgjtwcJ93FV0t/Zoy9gPJvUsKHoVlfcopX4YUMiCbp2raQVL+
 HE+yWP9X8DL4o7SRlfGBMlRMVVVwauHuCoMdzOG0nWC6HkUDjvyXoHtzuOt/VEk87Pre
 aKfA==
X-Gm-Message-State: APjAAAWLUlhIhkG11alBWQojF+au8+e+1lwFBV/7afr2LbUHwriKEF8X
 srcxd07r0VO3BX/94ALEjb8ezVCd
X-Google-Smtp-Source: APXvYqy59rYeuMZgQn1Jd5MCZloXdhdVJq+hLwNirv9jTSa9JrmkSjmWnL+xQ5e1eI31mQbW0meKhw==
X-Received: by 2002:adf:f851:: with SMTP id d17mr83378704wrq.77.1563913088454; 
 Tue, 23 Jul 2019 13:18:08 -0700 (PDT)
Received: from localhost ([78.124.78.108])
 by smtp.gmail.com with ESMTPSA id o20sm110646127wrh.8.2019.07.23.13.18.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 13:18:07 -0700 (PDT)
Date: Tue, 23 Jul 2019 20:17:42 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190723201742.GA26033@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-yb1oMl2Phj@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-yb1oMl2Phj@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N+r04g8BnjQ1Qd2I+XTkoV+NQ4Jl2QtzpSOknktozMM=;
 b=ap3ZIWTUigBb76d81IbyS8qr4rA7HlNsB3jpFVOvymcj83VwyZiWwd/+wA+gcz5yG1
 aX+gQEwhE8YKblg4SiOL0eCRUrIdNEGajMQrcUk6CpP7R6c/FBznUU+sDOsu1yhsR/r5
 JKy5MA0K6tvCZBQGHP1ePn0vfo4Oy1AptWw0UhOs5ovcA+I14AOqdyZK9Hruo8wHx/7p
 7lPLU+EXvQ38lljb/+eADget7Re8QnoJFgxLZRy3aQtQYbmuUugpGV2qBNpaBHkBaUmV
 DhfkfF7Vyb7ZXZbEEsQ/304mTrML9O33ZhqrQ8HAbjILwopi0fBbCBlTmEw58yT/v3FH
 PuLA==
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

dW5zdGFibGUgcG93ZXIgc3VwcGx5IGxpbmVzIHRvIHRoZSBncHUgaWYgb3ZlcmhlYXRpbmcgaXMg
ZXhjbHVkZWQ/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
