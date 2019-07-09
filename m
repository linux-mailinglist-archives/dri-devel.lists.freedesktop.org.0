Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6D63A88
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 20:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468966E086;
	Tue,  9 Jul 2019 18:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8F6E086
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 18:06:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id x15so4000554wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 11:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xLzy52D1i+Kos68Fy1ZWvZU5okccbr7d5OwubOI5jDI=;
 b=D6Lw6dH/zxz+BRtYjdn3xHIv3yQq+sc1WbJkqKdmLdMavrlB8KbgiZJZrBtga0W16H
 T4Zz/jArwK3iTO2wW+VffUf0U16ODn4yFZK3N/E4rbhlCrPyBpswF0CzbuMYQKZtEEV7
 /e7072YZw2r2wcYuRaz6OgehLk8r8RJuG9g5tyJqAnDXY37fr+x3/4KlOD26iH+WtyPs
 CbAeLh+tum6jGSTXOT9p7XOaiPalCpeuiGZXrMnHPIp2/Y1vJt4w9ugxNICTkaNNyJ/g
 NkRVUrpb/GTgrpJuPow02c/HS10Q8hSyXW85Anujt2U7g3cguQsxoDu1QQPdfcx3dhK9
 QPHQ==
X-Gm-Message-State: APjAAAXoSpnSKmhY4GBjc9rsZ1Xi88tNlPZ16gK217OmK0d8mhHuYuYT
 7LHN5fAsKBVW2T4W6HxmNyrOgTfb8Ms=
X-Google-Smtp-Source: APXvYqxi8bUov6PhF/AdQ2ujBZpqC7JMraofarROECkSuFlDHLrMyMZM0kN/eBOJZ5lcf7huOXxJzQ==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr971772wme.95.1562695577529;
 Tue, 09 Jul 2019 11:06:17 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id t24sm4219948wmj.14.2019.07.09.11.06.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 11:06:17 -0700 (PDT)
Date: Tue, 9 Jul 2019 18:05:27 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190709180527.GA547@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-YOP8D83JwQ@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-YOP8D83JwQ@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xLzy52D1i+Kos68Fy1ZWvZU5okccbr7d5OwubOI5jDI=;
 b=ARgj5UZ5W8ViYUxoIxG60muEaOG2Hf8yiTvzlsrp4H3NT2ke5WxGFTlzvqi138I1wB
 g9gfw6hRWdjrOmDvNR9WzX7mLFKSEFlx4iGubBvLqKC/b8KyyNUo4h3R7m0scKu9iQIg
 8NGv1JOl5Y1sMNAX8XuBGRSrI4DHEnfp54e8M4TTEmJfv1BShUvxbGS76oj2V9LYu9gG
 rKtUUKW0ILUdkCSlB03FOrMteZ+twz/ByHHxpxpADsZqdFod3k0WQxqikNoASS1cHpu7
 8pIwxsc061/kPjiqC1/UGiDS6QeFA0Xhuz+At/H/5fufY3kvCA9J6hLMncJcBwaAJ+Ll
 5tDw==
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

R3V5cywKCkkgYW0gZ2V0dGluZyBmcmVlemVzIG9uIHRhaGl0aSB4dC9meDk1OTAgcmVjZW50bHku
Li4gQnV0IEkgYW0gbm90IGxvZ2dpbmcgYSBidWcgeWV0CmJlY2F1c2UgSSB0aGluayB0aGUgcmVh
c29uIGlzIHN1bW1lciBoZWF0LgoKVHJ5IHRvIGdhbWUgd2l0aCBhbiBvcGVuZWQgY29tcHV0ZXIg
Y2FzZSB3aXRoIGEgYmlnIGZhbiBibG93aW5nCmludG8gaXQuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
