Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034BA83210F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 22:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025110E8FE;
	Thu, 18 Jan 2024 21:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C64210E754;
 Thu, 18 Jan 2024 21:49:46 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5f0c0ca5ef1so1058377b3.2; 
 Thu, 18 Jan 2024 13:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705614525; x=1706219325; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zGdgVUyAK1aAflsT7iZ9NPgtBe4T35/dr8bobRRTOjs=;
 b=PG5BsbiZELVWeR8nKkjl/XVpri7NWBZqm/ANjdNNMnyDTzpXKr3HyOY1lC6hILSVix
 zIG2Bkc74gFtCR/wv2e/Di4w7/5Z9cMOGJH9Afqif2OnjgY5oH+yYJU+DNfE/xyQ91kR
 Go+sht9Cbi1T/UIfe9gZhY5P7IuvyHUyweg2+/s8NP9xxxAnnGj7NUqiZZpUINuIKrnw
 9HHqGsvI2jjy51B4oI0KhigrUSzPDFZmsUUFDCa4faveq26LuwbbVefmylmvg9CmBUFB
 Foa+FdMjIcWNIRrNw5iiGk9TwT3fZ3LfI8WFqSPY/7utVRLsyIfiJ8JgLzJhS0XTkQT3
 PROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705614525; x=1706219325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGdgVUyAK1aAflsT7iZ9NPgtBe4T35/dr8bobRRTOjs=;
 b=qcL7hIWN9fkNEcjXnvq6EmABx5UNfmtpODrgJ038I3SnE0uFwVjY+6298909obPOI8
 3cE1VerM+hDuT0NX+I+nJWaEIQu6POjD45yQ1r3OlQCeGPTDhcmq8EJKsTz7s6l9lhlZ
 PWPpJaOIh/gfd5tvViQ3p2w8RJFBRmEXSDirU2sco+Uxytb7hF6uLjt/Rv34/0S6nsv3
 pXM+8dYUxHaFpdFIyrLgTT2bKenuuVRQW6lTByQGVm9yG1+xfjZjyAIOZ08fYrfhIYjR
 VYnAO4CEFiWyg4WkGMrIfZrycg9cA3il1w3KAQpZV4BEZ5koIVEQfI7WVk7CzMrutSwe
 TcUQ==
X-Gm-Message-State: AOJu0YxAe9BSWmBxPMvTCsjXAmMgcLPv2Ded2omkMNA45aQIpPtbqZmv
 N7FoZWsCQrCf3FMQB0OeFavITrfqMc8SY3HGsJl5hbXRxKgKi4gV
X-Google-Smtp-Source: AGHT+IGVMDVZxgqMFbHQywDUbtvVUzwbz++sS9yXUzkKQh4cCDaE3ihLfZ8Q5uFdp6tk6+OzvG/wuQ==
X-Received: by 2002:a81:c20e:0:b0:5ff:958d:5b2 with SMTP id
 z14-20020a81c20e000000b005ff958d05b2mr955427ywc.51.1705614525244; 
 Thu, 18 Jan 2024 13:48:45 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:b45f:9648:c2e:2e36])
 by smtp.gmail.com with ESMTPSA id
 p207-20020a8198d8000000b005ff60d85d1bsm2147803ywg.80.2024.01.18.13.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 13:48:44 -0800 (PST)
Date: Thu, 18 Jan 2024 13:48:43 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK
 and BIT macros
Message-ID: <Zamcu7tts8mqX0b4@yury-ThinkPad>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
 <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 02:42:12PM -0600, Lucas De Marchi wrote:
> Hi,
> 
> Reviving this thread as now with xe driver merged we have 2 users for
> a fixed-width BIT/GENMASK.

Can you point where and why?
 
> On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
> > Hi Lucas, all!
> > 
> > (Thanks, Andy, for pointing to this thread.)
> > 
> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> > > Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> > > masks for fixed-width types and also the corresponding BIT_U32(),
> > > BIT_U16() and BIT_U8().
> > 
> > Can you split BIT() and GENMASK() material to separate patches?
> > 
> > > All of those depend on a new "U" suffix added to the integer constant.
> > > Due to naming clashes it's better to call the macro U32. Since C doesn't
> > > have a proper suffix for short and char types, the U16 and U18 variants
> > > just use U32 with one additional check in the BIT_* macros to make
> > > sure the compiler gives an error when the those types overflow.
> > 
> > I feel like I don't understand the sentence...
> > 
> > > The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
> > > as otherwise they would allow an invalid bit to be passed. Hence
> > > implement them in include/linux/bits.h rather than together with
> > > the other BIT* variants.
> > 
> > I don't think it's a good way to go because BIT() belongs to a more basic
> > level than GENMASK(). Not mentioning possible header dependency issues.
> > If you need to test against tighter numeric region, I'd suggest to
> > do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
> > directly. Something like:
> >        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))
> 
> but then make uapi/linux/const.h include linux/build_bug.h?
> I was thinking about leaving BIT() define where it is, and add the
> fixed-width versions in this header. I was thinking uapi/linux/const.h
> was more about allowing the U/ULL suffixes for things shared with asm.

You can't include kernel headers in uapi code. But you can try doing
vice-versa: implement or move the pieces you need to share to the
uapi/linux/const.h, and use them in the kernel code.

In the worst case, you can just implement the macro you need in the
uapi header, and make it working that way.

Can you confirm that my proposal increases the kernel size? If so, is
there any way to fix it? If it doesn't, I'd prefer to use the
__GENMASK() approach.

Thanks,
Yury
