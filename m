Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DA249592
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794716E1D2;
	Wed, 19 Aug 2020 06:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4DA89AEA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 09:52:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so17659165wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ipDKz5g1D0S+2ZDMowsxv3Wi3vQOCFMnWF8JkRRYICk=;
 b=jvwfVyfhN8w0TONtswrK+GiKQsmHt/iWEMCMOsUaFciLd9R2O69kCnn4TvpKendjen
 Motfa/oPNNXmJjVtbbGXmFdmnUy0TGznc7NiNnz2KRzH43UDkXWqYxb04YqYm7kqah9p
 k5DF0erG3ZmlwRBdCtpVUCR57/ifOBiAwdr2gQNJzAyE6zgfvpYAfPgy1NvQDNl3RDzC
 ZgkTqr/N/AGE0E28mFhteMTqzXEJNQ478wB4xFoZeTjw0SsnhkAQGw8kCJfY28A7vfcg
 Gyk/k6b1CA81mBcj8v1wZ6G+Tgxn77frmfiPs5nRxPG3gXUlsG/3aIFkhoJ5auz/nXqu
 klyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ipDKz5g1D0S+2ZDMowsxv3Wi3vQOCFMnWF8JkRRYICk=;
 b=SuD4Agmvn17S2W0n02Jqo6HRALfqE17GGulkE6st/qZ/jfZDHzBHsi3oBp+vmxeuKe
 L4Sb+R7Zo1ANAtTM2sLj65TnvuMugT4A9rgkWpex4fKa79o+r+Jfn4zcdzMczZA276zm
 1bZ205vv+ZSMx2iU1g1A0HOVAAvJax7Ejz2QlAI9CBav4xdPEQBfEPulwoSsNd8/Kznr
 s4ZCn1u0CMZ1c6/jzo1ubMRzALBeyoU9xFNC8ZstKBsjXi+hBCFksGVje8HS5ZnOipZC
 yogkIkFdFEhBBHPKZGqt7+ZvCwrlG13Z6O8FA/9B4Q8S+Zxkz0H6xxqufgjzK+cLO/GN
 usMg==
X-Gm-Message-State: AOAM532r4mOtO6O12b8gEyBtlTfbkE60iOR3kFEFi7SZNn5J29+CteqM
 Ta1AujLgfCMHssH9mEGoSqc=
X-Google-Smtp-Source: ABdhPJxo82TEyMKUpw1MRRmNpYVm5KU0966dG/z9nADSZn2Aph3kAPhN4BhoFSrPfEp3Qg0paUYCeg==
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr18529022wrf.94.1597744362803; 
 Tue, 18 Aug 2020 02:52:42 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id v16sm32302023wmj.14.2020.08.18.02.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 02:52:42 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:52:35 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/4] *** SUBJECT HERE ***
Message-ID: <20200818095235.GA354542@tsnow>
References: <cover.1597742228.git.tomersamara98@gmail.com>
 <20200818095035.GA56916@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818095035.GA56916@kroah.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 11:50:35AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 18, 2020 at 12:17:08PM +0300, Tomer Samara wrote:
> > *** BLURB HERE ***
> 
> Really?
> 
> And your subject line could use some work too :(
>

sorry for that, i've made a script for sending patchset and accidently 
it sents mails without contorl.
Fixed that
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
