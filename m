Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E071B832FA1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E9B10EA59;
	Fri, 19 Jan 2024 20:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A9C10EA59
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 20:12:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so12159775e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705695060; x=1706299860; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2HJGSWxmybePtgKcI3MmToOkGnvcMa6AUJiXY/XIzXw=;
 b=PP08txFHh7AtJvVBsQ6EuJdtc8l8CsimCuWPHjBhp+cPrETelx5Ck6wwM1Gg2EgGDG
 tYxc4uBK1ONDziWZk6LOkZleU6/4DibgDZb+mGKWecY35hqEMX10PLEUDgfJkBHtxnl+
 hSU1kZhAj+SU8a0K1+2XwFSqOfzIjbWhTRO44DOCOVtFusAiMinVqtKN1mq9oSKIoxkw
 iCRBPPUAT7KDCZb26j+l0RmKS605u14Na6nvoLVzl/rYmfi1fib2/g5blcB4PXhx2GnX
 lPUNjGJ9Cpek1t40KPe/0TwDVya4sZiI11uKiou0zgUhR3M0g4+vLfl+s1GTzPMO9Z/V
 P4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705695060; x=1706299860;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2HJGSWxmybePtgKcI3MmToOkGnvcMa6AUJiXY/XIzXw=;
 b=hvyTGU1ILtx115o0LkoQQ7gvV3icJ28U5/IB3hXbvG2WifA5ao+dawuHAykrRPn6mX
 Hr/DdrH5RcuXXuWXnbyEvLpVrhJcdCdjdC4rTfVG+MDvGV4MxkRse2ciY1C95bWekkoh
 EUjsiy4/nVTfYqxHo3O1Ou1jAIJR7HdB0ufbz182cTxMMFQa1SjoepUIocWCWfjBEEfX
 e8/644tCyObGyiz/jkW/jronQPWLs8e7WnQ3Y0MMIqB8hpwrYIoLndyJIc53P6EZ7ZW6
 fsTWZrNucirxuiTWqLDyLakiptKtR9+BtKMB+lSQMI+wapEae3CT1Rd0oY9khduLENha
 EZgg==
X-Gm-Message-State: AOJu0Yx0Ir3c2JuD0adazFXynXXnuc7Mir8SWEFdZwcIm0wTboE7QE8i
 r98wXUGNaFlZNBFvGOdTl67JRf8AsLZFg1KterQlBbDy90+vsDr2LSId43NbT2zjw6Juni9WpDX
 vMjs=
X-Google-Smtp-Source: AGHT+IHtPtz3HT8Mid0BlcHGRzgo/SYTSyr+dmWTQNWOYc16HZaDRYZa9l8ASIONsAgzQDzxLv5k/w==
X-Received: by 2002:a05:600c:6026:b0:40e:81cf:57f5 with SMTP id
 az38-20020a05600c602600b0040e81cf57f5mr177602wmb.24.1705695059695; 
 Fri, 19 Jan 2024 12:10:59 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm34052619wmq.46.2024.01.19.12.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 12:10:59 -0800 (PST)
Date: Fri, 19 Jan 2024 21:10:58 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: Mesa >= 23.3.x no longer supporting python 3.6 ...
Message-ID: <20240119201058.famnixxfraghgar7@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
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
Cc: mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 01:37:52PM +0100, Stefan Dirsch wrote:
> Hi
> 
> I noticed that with version 23.3.x Mesa no longer can be built with python
> 2.6. It still worked with Mesa 23.2.1.

Of course I've meant python 3.6. Sorry for the confusion!

> It fails with
> 
> [   95s] Traceback (most recent call last):
> [   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
> [   95s]     import intel_genxml
> [   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
> genxml.py", line 5
> [   95s]     from __future__ import annotations
> [   95s]     ^
> [   95s] SyntaxError: future feature annotations is not defined
> 
> When removing __future__ line like this
> 
> --- mesa-23.3.3/src/intel/genxml/intel_genxml.py.orig   2024-01-12 10:26:26.314070540 +0100
> +++ mesa-23.3.3/src/intel/genxml/intel_genxml.py        2024-01-12 10:26:38.682317490 +0100
> @@ -2,7 +2,6 @@
>  # Copyright © 2019, 2022 Intel Corporation
>  # SPDX-License-Identifier: MIT
>  
> -from __future__ import annotations
>  from collections import OrderedDict
>  import copy
>  import io
> 
> this results in the following failure.
> 
> [  113s] Traceback (most recent call last):
> [  113s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
> [  113s]     import intel_genxml
> [  113s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
> genxml.py", line 51, in <module>
> [  113s]     def add_struct_refs(items: typing.OrderedDict[str, bool], node: et.
> Element) -> None:
> [  113s] AttributeError: module 'typing' has no attribute 'OrderedDict'
> 
> I'm wondering if Mesa developers are interested in still supporting python
> 3.6?
> 
> Unfortunately currently it's not an option for SUSE's enterprise product to
> update to a newer python (would be probably 3.12) (due to many customers still
> relying on python 3.6 and we lack the ressources of adding and maintaining a
> (full!) second python development stack). :-(
> 
> If the answer to the question above is a no. :-( How hard would it be to
> adjust the code to python 3.6? Any suggestions to how it could be done? Or is
> there any other workaround available?
> 
> I had a quick look between 23.2.1 and 23.3.3 and I've seen that
> 
>   from __future__ import annotations
> 
> and
> 
>   typing.OrderedDict
> 
> have already been used in 23.2.1 (although it was in gen_sort_tags.py and
> now has been moved to new intel_genxml.py). So not sure why this fails now
> or was working before ...
> 
> Any help here would be appreciated. SUSE is definitely interested in shipping
> the latest Mesa with our latest enterprise product.

Thanks,
Stefan

Public Key available
------------------------------------------------------
Stefan Dirsch (Res. & Dev.)   SUSE Software Solutions Germany GmbH
Tel: 0911-740 53 0            Frankenstraße 146
FAX: 0911-740 53 479          D-90461 Nürnberg
http://www.suse.de            Germany 
----------------------------------------------------------------
Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
(HRB 36809, AG Nürnberg)
----------------------------------------------------------------
