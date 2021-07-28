Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEE3D855D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4896EC30;
	Wed, 28 Jul 2021 01:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653CB6EC30
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 01:30:13 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t21so695100plr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F/W78E3w8bd3psxYX0IIxref8Eo+wzHY8m4KRkXjPMs=;
 b=fSpVrx2KFTwbTxZxaxYBjKJ9a3HRRpiHfBG8wD07VjuWC7mdbYEQ/7GkiPoSY+/g36
 +TtB+dCcoMKG1TPpgjH+W/O2nqputas/NPxb5d/iKCDtXteeWA5Muau5Hiw7k0rZrmBp
 XaotHXeRLZbN2gC+C3tJaqkKc+t5iWRCRbObY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F/W78E3w8bd3psxYX0IIxref8Eo+wzHY8m4KRkXjPMs=;
 b=okKYqYW09NlbcYytC7QDGZRyBi9XbOFFKUKSt/iCf36r320bU0UR9DJhrumpoBzzER
 GuhWVptV+hYPXQ2DtabsDI/IJm2gIucWdGtwKDUQoqAXVp/A4uk6mbChBOmtMuOBfg1d
 cbIkrU1EpD8WUEowLuUTVTiTfV+P396ihMIsDSJtceUkV/IWMG47wV8japr/w9MRxHSf
 3goLELzInLdw96JYRz9M9dbiTeV7i84W4Sv2wf9q8dBVdqDxlmhHjaJVSmaqZluK8Ssv
 H0k+F2eqI4utNn55C2SqQhcQdP0GNiqZdinGNKcJeauGcr1Sp9zXoCwp17TAKXFjrsY3
 Z3QA==
X-Gm-Message-State: AOAM533yT+hyFED10nLCkZzrMTDCsfX1WXm33GoEpia8KdW/8IzqK2i3
 aTXaiHNccTUSbTcv+R2Gaz0rTw==
X-Google-Smtp-Source: ABdhPJwJtaC/+3L1bVkg9P8zv+anpCg9BvvGSgBVtWnX3lLVWENuhM7S6jL/vTi/ew8TMCXVE//XxA==
X-Received: by 2002:a17:90a:ca93:: with SMTP id
 y19mr7226022pjt.142.1627435813032; 
 Tue, 27 Jul 2021 18:30:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r13sm5628761pgi.78.2021.07.27.18.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:30:12 -0700 (PDT)
Date: Tue, 27 Jul 2021 18:30:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 33/64] lib: Introduce CONFIG_TEST_MEMCPY
Message-ID: <202107271829.CE9BADDB@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-34-keescook@chromium.org>
 <9827144a-dacf-61dc-d554-6c69434708de@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9827144a-dacf-61dc-d554-6c69434708de@acm.org>
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 04:31:03PM -0700, Bart Van Assche wrote:
> On 7/27/21 1:58 PM, Kees Cook wrote:
> > +static int __init test_memcpy_init(void)
> > +{
> > +	int err = 0;
> > +
> > +	err |= test_memcpy();
> > +	err |= test_memmove();
> > +	err |= test_memset();
> > +
> > +	if (err) {
> > +		pr_warn("FAIL!\n");
> > +		err = -EINVAL;
> > +	} else {
> > +		pr_info("all tests passed\n");
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static void __exit test_memcpy_exit(void)
> > +{ }
> > +
> > +module_init(test_memcpy_init);
> > +module_exit(test_memcpy_exit);
> > +MODULE_LICENSE("GPL");
> 
> Has it been considered to implement this test using the Kunit framework?

Good point! I will see if that works here; it would make sense to make
this KUnit from the start.

-- 
Kees Cook
