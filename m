Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FA971A40
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102710E3E8;
	Mon,  9 Sep 2024 13:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Z7sCffeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424410E3E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:02:53 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so4762399a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725886971; x=1726491771; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7mMqU87htuX/vKBzsNQkDBJ4RpNR7Zr8uFLI9xAQvGQ=;
 b=Z7sCffeOstMn3E0RvT+bG3AnB0HewPF4ylcheotPD5ccIVHQNOXmrcXxAmeeFkfZwx
 2sygjNfs9a/zzq7ZN9l9JFCxU2RYJ91vYwV4nLp2NmWaXzgalDg29kEU2SfhPkZb+xAb
 p/uEin+hrP22d2FkFweAYZLPr2IFxLv17Y1jxIpy31qRyfzDzFjz7Et7uWodUzXCPZDB
 hfub65hBeYVzhkdN5zJqECrZ6LPMvSz+T2thK5GeqdtPVlwlnSkItGiPKOAN4KgrBBcv
 IWh9m9daAomaEWV8Uia7BTKDgjQrWgEIUFQdgRLCzmP5ucprm4aC82ayj01bzsglyxM2
 zsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725886971; x=1726491771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mMqU87htuX/vKBzsNQkDBJ4RpNR7Zr8uFLI9xAQvGQ=;
 b=qQ5AuR6r4/e6wSQju8HbnkcupwhmQ1g/T4PDHaoTzY1cQpuVBuyihH/RpvJ6jXr5xD
 W44p3zzMOmZr+JV6HdsbDoISR6hD/oy3LUJdrKvybp4Kius3vf9KJkUXucDVMH6iuZ/l
 ZjKNN4WolPPIVMgejNPrXeF1lCmO8u+KHshrALgJs6UCWttV2urzR2wv3dZ1ohX2LhtY
 AAYwA87JrEbUd6L8gVg2ckzHg89vCCboBykFY9IihZLv1UKYQ0eTFqZHUIAYzuyaD6JB
 kI0JNIkb2olkU+p/BNTMoYLZiA5BNuioJXDq+9SoOWz/4gz1O6n4YjqoA926QfvKYNk+
 2mjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr3VZUB2fMIhT271Jw3i20leWxI8QIEvrDiSRF2fg3wqY+w7Yl2cXRHsgxuyjP5yXar8V8kdIjN0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPQ+hRceIn00wW0WSNly+PJSRkVGxQsO7RhdGCv4GqWBq896f8
 RUkmmfAwEhv155sLwSg3gk4mnFWxIlb/AMi5Ve+DPsNdlbT5LVaJrFiAx4KQmd0=
X-Google-Smtp-Source: AGHT+IGBCWEcHjOnjDa3tv0OU9sQsIWi0rYKMo1x8pgZwqnvO0g9WWezq8axRIpo3yitGDVIG7HaOA==
X-Received: by 2002:a17:907:368a:b0:a86:8953:e1fe with SMTP id
 a640c23a62f3a-a8a8884be2cmr906103366b.47.1725886971281; 
 Mon, 09 Sep 2024 06:02:51 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d54abbsm337715666b.203.2024.09.09.06.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:02:51 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:02:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND v2 16/19] lib/test_scanf: Include
 <linux/prandom.h> instead of <linux/random.h>
Message-ID: <Zt7x-dJF6RzEByBO@pathway.suse.cz>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-17-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-17-ubizjak@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 2024-09-09 09:53:59, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

I have just acked v1 and missed that there already is v2.
Just for record:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
