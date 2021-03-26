Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01634A3F2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 10:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A744A6F39C;
	Fri, 26 Mar 2021 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A4D6F39C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 09:16:39 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id y2so609960plg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 02:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJU8eQTrHMk3jqYitTK0s9c/y4olgE5eR7itETLxMTs=;
 b=Pd0ExQXC3mxg2j0U3TrIN62e91Ss1UD89tIF6YsQtKtbQOwyFBGLxDCHiQC4mfcFpB
 CqAuCghwR99X9CaWGfNHYJoacATVqOVye3ARLpHFuOrsK8mOQC+NLSKztkvLgfPD3zRz
 4qUZ9TApnuXmNT+c58G9yi3Hrz2L9N+VdGsyMANuDBh1AdoQA59K5Tymrwr+8YVFNSr6
 iOdxcfmfpohdRQ8vHcK4kEFi7685+YBbDWio7YQwJOMJgT26K6/X66eTIcCHAYG3aG5M
 AIn2xWZR5ZtNJide87rLoxUEr842vXcXk3qe0wNLVRHyxdeo4jZfS5TkZpR/xZPFNXbx
 2TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJU8eQTrHMk3jqYitTK0s9c/y4olgE5eR7itETLxMTs=;
 b=H48PWvpLMFossTlQgbSAZRqtfa9UiTFOHYj4AHsPl0QF6IqA5e6v+ZS8cJlSctBdin
 cvvRqkd3A1Todv9Ky2ihFD8i9PVmwPb+3P7y8tQtwhXnFJGk1w+VxYCS56+52qmMMcd6
 5uvUwunXK2FoZfMF7xTpMPI+fNsTna4Z9iSUzrHzsKCEKPkhNB/af9JX3guzCAJD/deo
 tnXt3OA9USYHwAbKakpONhUDtJ1iwdFLDwp7PIWX8+jQ6xErZtKhS115yFjKuVZXB+Uw
 LXHpTt1Iz+iSYh19CWlTIaTHOTPPF4FzE/UVuWn0w38jm0++QbEqBXP76g639+TtBs9A
 C3XQ==
X-Gm-Message-State: AOAM530DaJdKhTlpJqmUuchJ969ewwzo/vqXvCVL7lqQA6RBuM3GsLx8
 nWDOOIupvaul0rdoPbaKNhSZAr8dUw3KbqMJ
X-Google-Smtp-Source: ABdhPJxGEMfaZ0tGnNRtBHpxDycvnPtIYnQH7soeehKdm3LHDGp6mAVVr2luWLqKf0DPBBmngmQXyQ==
X-Received: by 2002:a17:90b:3553:: with SMTP id
 lt19mr12707460pjb.222.1616750199589; 
 Fri, 26 Mar 2021 02:16:39 -0700 (PDT)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id d8sm8930729pfq.27.2021.03.26.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 02:16:39 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:16:34 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <20210326171634.000011f5@gmail.com>
In-Reply-To: <YF2dXIxMOUyLzfnQ@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF2dXIxMOUyLzfnQ@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
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
Cc: zhangxuezhi1@yulong.com, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 09:37:48 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> > From: "Carlis" <zhangxuezhi1@yulong.com>
> > 
> > Change 'tft' to 'TFT'  
> 
> Why?  What is wrong with "tft"?
> 
I think abbreviations should be capitalized.
> > 
> > Signed-off-by: Carlis <zhangxuezhi1@yulong.com>  
> 
> Full name please.
> 
OK, i will use my full name next patch
> thanks,
> 
> greg k-h

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
