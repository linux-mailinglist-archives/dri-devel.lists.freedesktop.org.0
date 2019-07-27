Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C3778E6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 15:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD0C6EEB1;
	Sat, 27 Jul 2019 13:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890536EEB1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 13:19:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id s15so28437849wmj.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 06:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yk+cMRWzA0uAHhZt45I2mtf4vlqJxE1YPLsHVdJ+7rc=;
 b=HxGsIYK5wFIhAz1pJsD2BvOlDJpVTPluu6Jqyh8w76td2feT6YY2DN1z8t3XRLF5RV
 j9PLM/UimMVcI7YWs+ytMmrYGESscN9rxvDJf4xqBykZhp1a0Noew/zZ36ILmrd/SXI3
 bq+c64ZmcKQ5oigXE5bE7jcrpI7yiKZ8qRicpfW6ovpdhJCBulSIgJQiIqJRMWZNWgGc
 uJTY043LXlmL97QCiTyEuXHXlJeuhztM60hULE6Ve7f75ou3mNZPh23284DKhpzxZrj3
 PiLi91vyuIh2nfgtOtQto8o1fq/bbFAkKvec5O9v637GpLdGLlua7Y5dL2oBcDtOknWY
 mNEg==
X-Gm-Message-State: APjAAAUJHBTwWCITT46bB2ZuqXln98DcCXMRR/I0xR7L2+cPo8Gjbfub
 QB7sr7fyYVqtWWMV/rz18nwfvnie
X-Google-Smtp-Source: APXvYqyxfHWWmctzKB6QEi9WHM5NNKU95jm+RzncmF2NuuSaDl+UqitVF1cHyiBnKfMy20VnLCdgSQ==
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr70734353wml.64.1564233595228; 
 Sat, 27 Jul 2019 06:19:55 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id f3sm38900886wrt.56.2019.07.27.06.19.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 06:19:54 -0700 (PDT)
Date: Sat, 27 Jul 2019 13:19:22 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190727131922.GA370@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-JxFJJfwbxk@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-JxFJJfwbxk@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yk+cMRWzA0uAHhZt45I2mtf4vlqJxE1YPLsHVdJ+7rc=;
 b=pMR9DfFlOTYxwErA8+hLUw99yfEGfvX8k1JlYXHWUPLSD5b7g++TvNIwOgDIbUbbSP
 lZHeTqwLCM456vyqog3hj2emQjgSE6XlfiPJZ9fw/ASGQCt+DZkz4c9KcxzW92FswIPO
 rQyJCvPXMnZjp7wUID21b5n1LlpDBXk4NbinGLaA3R7JkRF6vQdVfTQHv3rtDi8MuR/h
 T7a2UCqcBCW8Ea+Rd2TtjjWJtrY8W4R6Z3sNDoL52Ts9BIFN0XCqLuSXLsD1Lwik8YVM
 3dtTV1X/yDg0Z4esKWc29aqrVE6EaOydCObEvTyJZni1fjj13JhorN7MnyReAzwj4gbh
 1Jmg==
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

RG9uJ3QgZm9yZ2V0IHRvIHByb3ZpZGUgdGhlIHNvZnR3YXJlIHN0YWNrIHVzZWQ6Cgp3aGljaCBz
b2Z3YXJlIChnYW1lLCBjYWQuLi4pPyB3aW5lL2R4dms/IG5hdGl2ZT8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
