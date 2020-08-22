Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1F24F2C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13CA6EC6B;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E26E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 09:34:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so4032636wrs.8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5asITRPbZ4NXMNWi/OhKvzA0M2sqXcJbRzcSLzCCfjk=;
 b=RF17qP3GY8mp7qU0/TPPiqpCST8KS4prrK/lnpCGl6+Tp3j5/bA5JgROyRABPnwXTd
 Oo+TbHkdQy83KrZ4Y7LqWegqk66PTOuh8jomsBsFJYJARM3zSbPsv8pnmk1m6XvkorpQ
 wEzTTFL0p8vUOXyuFUIrPZWe2FQ0WPz8hCNR7yZzE3UKUWXP0cLeDTyXuOc4xsf8TCMT
 vNGUQqlWeZl8Nwro6KJibKQt2GfoWZ6HRgMpOMNVoIScfot/maT3Wf4e7mIcl3RkJ5Ro
 84kSHTQMP3QkB+mPskMUlmhj3eyQ/0gYvPIeCnzxqfcB/2CQ8XyUbgvYXJw4omgbYRPn
 skKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5asITRPbZ4NXMNWi/OhKvzA0M2sqXcJbRzcSLzCCfjk=;
 b=odaoHoLbqVn5hMYBNVEcJmxV074zX8FjMbbCQI1MAqcg8Remi6JlWTgthOxO/+7RJ7
 Asu2507Vebb7esKXg/f188shgCVlbUbazCfZD4tKdp09dtSxT1uarlhhCAVs3FrlWQf/
 qt/erXV/rfQh4LvLQ8RB2gF/PbZ/7AG2QedUCI56+CozCUsgH4Gcns4wwrPZENVeNhWx
 AxBAC4Fgr/TO1SZuJNNPeGDJ1Ht7MX77ECs2HZwhVyvtUcyMXjyplMn0HKnYf2vzrxxQ
 3VLHIbDsZ9So18Ru/Aqmh9F7ZlWCsrGlh5SlA7ol+P9YudhHITsdTPJxQurdvDeMlqFh
 3q6Q==
X-Gm-Message-State: AOAM5305Hk7K7znwQ5CADyIJS9pWKSiMt2Z07mLyVLsM6qV3SiwXyEPb
 eouF30dKXqjq0/YwbdI/LU8=
X-Google-Smtp-Source: ABdhPJxuFiH+UmReuhcyyAyGrbWmKlWBl59GiciDXztDjxRwUb3dqBB2To4CpBLSVy8/FdsKID2EOA==
X-Received: by 2002:a5d:6505:: with SMTP id x5mr6242528wru.336.1598088866260; 
 Sat, 22 Aug 2020 02:34:26 -0700 (PDT)
Received: from tsnow ([176.231.38.53])
 by smtp.gmail.com with ESMTPSA id j2sm9662473wrp.46.2020.08.22.02.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 02:34:25 -0700 (PDT)
Date: Sat, 22 Aug 2020 12:34:21 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4 2/2] staging: android: Remove BUG from ion_system_heap.c
Message-ID: <20200822093421.GA6631@tsnow>
References: <cover.1598023523.git.tomersamara98@gmail.com>
 <a39407f84031eaeed5e65a7aab515a079edf5fcc.1598023524.git.tomersamara98@gmail.com>
 <3eba90dc-128f-49da-41a6-81494653d535@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3eba90dc-128f-49da-41a6-81494653d535@infradead.org>
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Riley Andrews <riandrews@android.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 09:25:26AM -0700, Randy Dunlap wrote:
> On 8/21/20 8:28 AM, Tomer Samara wrote:
> > Remove BUG() from ion_sytem_heap.c
> > 
> > this fix the following checkpatch issue:
> > Avoid crashing the kernel - try using WARN_ON &
> > recovery code ratherthan BUG() or BUG_ON().
> > 
> > Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> > ---
> >  drivers/staging/android/ion/ion_system_heap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
> > index eac0632ab4e8..00d6154aec34 100644
> > --- a/drivers/staging/android/ion/ion_system_heap.c
> > +++ b/drivers/staging/android/ion/ion_system_heap.c
> > @@ -30,7 +30,7 @@ static int order_to_index(unsigned int order)
> >  	for (i = 0; i < NUM_ORDERS; i++)
> >  		if (order == orders[i])
> >  			return i;
> > -	BUG();
> > +	/* This is impossible. */
> >  	return -1;
> >  }
> 
> Hi,
> Please explain why this is impossible.
> 
> If some caller calls order_to_index(5), it will return -1, yes?
> 
> -- 
> ~Randy
> 

As Dan Carpenter says here https://lkml.kernel.org/lkml/cover.1597865771.git.tomersamara98@gmail.com/T/#mc790b91029565b1bb0cb87997b39007d9edb6e04.
After looking at callers we see that order_to_index called from 2 functions:
- alloc_buffer_page called from alloc_largest_available which 
  loop over all legit order nubmers
  ( Flow:
   alloc_largest_available-->alloc_buffer_page-->order_to_index
  )

- free_buffer_page takes the order using compound_order, which return 0 or
  the order number for the page, this function has 2 callers too,
  ion_system_heap_allocate (which called it in case of failure at sg_alloc_table,
  thus calling from this flow will no casue error) and ion_system_heap_free
  (which will be called on every sg table in the buffer that allocated good,
  meaning from this flow also error will not be created).
  ( Flows:
   ion_system_heap_free     --> free_buffer_page --> order_to_index
   ion_system_heap_allocate --> free_buffer_page --> order_to_index
  )

Of course if some user will use this function with wrong order number he will be able to get this -1.
So should I remove this comment and resotre the error checks?
Btw, this is the same reason that I dropped the error check at ion_page_pool_shrink, so should I restore here also?

Thanks,
	Tomer Samara

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
