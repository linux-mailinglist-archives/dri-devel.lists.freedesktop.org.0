Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D628374E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AF389CCE;
	Mon,  5 Oct 2020 14:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE6089CCE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:05:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n18so1915217wrs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rYgwu/tsb6hqZBI1Z2tL8xDFx5slTZgCuj1UmwV+264=;
 b=CTB3t9HGVokgEOA3jolJ7ACDLs2ngsZCF7EaI13IHHQzva/DwYCi/n9j6GSDldLMKA
 WdyH9vanMUZ96PtuSw2eGBuXWYDlRiN8d2rBC2cxzVO2sUIub0tdKaMY8SXiVum0DR6b
 7JYvH8fRACBp77gNIGx9YiphHbDGcHPRYoYR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rYgwu/tsb6hqZBI1Z2tL8xDFx5slTZgCuj1UmwV+264=;
 b=rR+A/vwXnZ+C4zhwH4wXLyhl6V6dWwy566XHf7XWbf8/QeReMAtc9UL3Zibv8gSfqo
 FcK5tO4V18P7t8wkmv0dawdw06NHfpy4/jvvj1OtuzlePTOPaCCvD3VfcI3R/tjFSH4O
 n6BX2Nn7y/sut03NIuq630fyfwHX6xoXc0V1ju5EVfVAqneha5Y7r0kjq9oL+tNnw+x/
 qssgmTDhTZcASCUgboXX19sKp3PABOnH2TDdpNEwnFpoXwLiVTy/VMyS8/cmoqT0vzj1
 Cm18cyfneoQyVEjFL7KqQEGrD4rG4PHK3mIb5e2zg3Crfokmeq1rngkz95pxlSS0iUgQ
 ZSSQ==
X-Gm-Message-State: AOAM531Csk6fpuQkLoAig9cuQzglTn+uzk1l6SE26MG/ncX/C5F4NkHT
 kj/ZTqLdQpL7krAsmanSAiJp195brKjBrNYe
X-Google-Smtp-Source: ABdhPJxMi1nfPkfOLmjDQdRZMHgZdbkFC/+JLPXFZ9DTO+fLouH+y58TOZSpuAE0JIFp8TB0TQHTug==
X-Received: by 2002:adf:c3c2:: with SMTP id d2mr3520496wrg.191.1601906737472; 
 Mon, 05 Oct 2020 07:05:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z19sm12730698wmi.3.2020.10.05.07.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 07:05:36 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:05:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers
 cached"
Message-ID: <20201005140534.GT438822@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org>
 <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005230150.5637fa42@canb.auug.org.au>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: od@zcrc.me, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 11:01:50PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> wrote:
> >
> > Pushed to drm-misc-next with the changelog fix, thanks.
> > 
> > Stephen:
> > Now it should build fine again. Could you remove the BROKEN flag?
> 
> Thanks for letting me know, but the fix has not appeared in any drm
> tree included in linux-next yet ...
> 
> If it doesn't show up by the time I will merge the drm tree tomorrow, I
> will apply this revert patch myself (instead of the patch marking the
> driver BROKEN).

Yeah it should have been pushed to drm-misc-next-fixes per

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

Paul, can you pls git cherry-pick -x this over to drm-misc-next-fixes?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
