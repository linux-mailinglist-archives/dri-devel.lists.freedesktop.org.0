Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF9663D54
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9254D10E57F;
	Tue, 10 Jan 2023 09:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39410E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:54:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z5so10057789wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8dWz3Bw/8Dx1o8lzjGQ/SUGtAgnM/38tvfKWIYD5U+E=;
 b=ls2Vi5BhzflUnWP42GRkGEUVRNIRC94Wh1pThwJEpc/kW3RhyzWMPNvby9S8Vs/ot6
 sJgBxmAyNMHx8zMJ/S2Pz9vItFUfC3eiKuc7+wD80U+AnHTfI7qP4G/WsEFKDqQpsfkJ
 pPWWdrHWIOp1WS6CVcbiTZJsfh5lcskPIoFVWpkPcWzgzI0oRF+WP+aPGqR1An+HkX6D
 JB/3Twy6tz1xCCLc/VGr0mY5AAhC0eepb79cEHQMZsiv8+poUkuzoCQ5Ik1ZejGXec7A
 Xc5jsjBFIDfkhGOpGjL6H1xDNvQOB5xXDFYYyuf6HTAbqFbgGr3V7BJ+dPc+Ov9P3SFk
 i+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dWz3Bw/8Dx1o8lzjGQ/SUGtAgnM/38tvfKWIYD5U+E=;
 b=L4UUYwmTFL/+/5JHu0+N5I3VGBpX/TqdXv1vDQYfpLiEAEgyfKv6n87ohrGIiUxfe0
 2CpEMeMUvAyJXqH6I7XxBb+fM29/oGGuXZjq5UUKl3w+2VBAJkUp4q0xtkXUDgQ+rc8n
 SU2t8aho7aRr37RKQccQ/J7fjurms60+nLbdo9cJa7FAYzPwoDGJi9VsWQ3fhLay8lUe
 3j6NaEzAnCDiphVKgHgh7215wFsFNsaN3vaCBK0pKUEbl98b7UOYIsHuwYLnFlvhbyix
 rgFcl7EWYdbmIY+E+j/C5x0MiyKz4czVu4HXcELKJCrLDpyFavmVS83xXDXnj/UbOoyt
 qApg==
X-Gm-Message-State: AFqh2kqwWql73JVxMEeVNK4BHmU4XqChXzywy7nfzjpMMspwHTCWQLPC
 pDn32jGGopr2+LSnXgrxiQs=
X-Google-Smtp-Source: AMrXdXvbutZItyxV8E0o1qZYuXrp6nxYFx1ayS9x5MgvbHX9BBJulfG6O5JuvIFK86sr8ekOmgDdHg==
X-Received: by 2002:adf:e2c9:0:b0:26a:3eee:dde4 with SMTP id
 d9-20020adfe2c9000000b0026a3eeedde4mr41359259wrj.8.1673344466463; 
 Tue, 10 Jan 2023 01:54:26 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm10899974wrz.56.2023.01.10.01.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 01:54:25 -0800 (PST)
Date: Tue, 10 Jan 2023 12:54:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Farah Kassabri <fkassabri@habana.ai>
Subject: Re: [bug report] habanalabs: Timestamps buffers registration
Message-ID: <Y701zVEvafJdWgOL@kadam>
References: <Y7fctbXR9oPd7K3J@kili>
 <AM0PR02MB52357E1350CD36360D2E91F8ADFE9@AM0PR02MB5235.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR02MB52357E1350CD36360D2E91F8ADFE9@AM0PR02MB5235.eurprd02.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 03:07:33PM +0000, Farah Kassabri wrote:
> >     2171 {
> >     2172         struct hl_ts_buff *ts_buff = NULL;
> >     2173         u32 size, num_elements;
> >     2174         void *p;
> >     2175
> >     2176         num_elements = *(u32 *)args;
> > 
> > This business of passing void pointers and pretending that
> > hl_cb_mmap_mem_alloc() and hl_ts_alloc_buf() are the same function is a
> > nightmare.
> > 
> > Create two ->alloc functions.  Split hl_mmap_mem_buf_alloc() into one
> > function that allocates idr stuff.  Create a function to free/remove the idr
> > stuff.  Create two new helper function that call the idr function and then the
> > appropriate alloc() function.
> > 
> > It will be much cleaner than using a void pointer.
> 
> I'm not sure I understood your intention.
> What void pointers are you referring to ? the args in this line rc = buf->behavior->alloc(buf, gfp, args); ?
> If yes what's so bad about it, it much simpler to have one common function  and call specific implementation through pointers.
> BTW same goes to the map function also, not just the alloc (each behavior has alloc and map method)
> 

Yeah, you're right.  I didn't look at this carefully.  I'm sorry.

> > 
> >     2177
> > --> 2178         ts_buff = kzalloc(sizeof(*ts_buff), GFP_KERNEL);
> >                                                      ^^^^^^^^^^ Smatch is correct that it should be
> > used here.
> 
> Sure will be fixed.
> 
> > 
> >     2179         if (!ts_buff)
> >     2180                 return -ENOMEM;
> >     2181
> >     2182         /* Allocate the user buffer */
> >     2183         size = num_elements * sizeof(u64);
> > 
> > Can this have an integer overflow on 32bit systems?
> 
> I'll define "size" as size_t instead of u32.
> 

This can't actually overflow because it's checked in the caller.

Perhaps the careful way to write this is to change size to size_t as you
suggest which fixes the issue for 64bit systems and use size_mul() so it
doesn't overflow on 32bit systems either.

	size = size_mul(num_elements, sizeof(u64));

But it doesn't really matter either way because num_elements is capped
in the caller.

regards,
dan carpenter

