Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F883193E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 13:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B565B10E7DD;
	Thu, 18 Jan 2024 12:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806BE10E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 12:38:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40e90163be1so6127225e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 04:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705581474; x=1706186274; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CI/XuvKpVd7DxxIkmZ12hfXL6LSiiek00P/Hbr0oqtI=;
 b=dDJYHU3ER0K07pyJoWxJe/n61wL5MRhC5bsr04n3sAS8EXopTIn+FmR4yHn7a60hM8
 LgZwU9LzwqJGladuapPI5L0TnEQSeLEupR82dJd96RwmYCcrb8Az/cHTD6fH4F+L7Nj9
 8Cpxaec4z5CS0wBFs7Fvil1BkZpSZ9cSxq2izpO86P5psH0GB/LXMeG9U9wz+jSfni/f
 NzlT0OsVqaLDKwzMFQcYnoEUW0nF5HRmBQ6nNSKArORxrj1eohHRQDDsFKPw5eKAMJ0/
 nifwAGz1rkVEwJoQOQQ0g5tBgmcpdF8cK6fGr1M7Ww2dJ12ggLyBDIOQvmzdUh3VlITW
 PyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705581474; x=1706186274;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CI/XuvKpVd7DxxIkmZ12hfXL6LSiiek00P/Hbr0oqtI=;
 b=l2rHk1vbuvN2f786RdElKzv2PR3U5UUH2GXawVuigHRZ6SKu1h35fAuHiAMdpeBYtI
 sSHfLiGPrNGgnrvo0SZhrkkeshoEqpAjYuqJP0Q4sCta8Ju7x7kX+UO7Ed7/2ZCsgRiS
 B+6fc9oBOyoNGZBnFhrnI9DMgg8ASzOxZWCWhuMPzGoGJbQupPgqXugVht8ij6UipwL/
 +g7aSoJZZtkfGxgGhqY3aFXRFwyYlziSyE08AxiX8rWsUfPibhrYNGEFOpNtHFS+eSDj
 FjtQ0VG5u4PTeoP7Mt5imDTBQJXQC4AJRQLN2gqHQPXjuT/PDAlygdRApIuJCdwUJIP0
 Lk8A==
X-Gm-Message-State: AOJu0YzlTbqvyucEixNgDsKZH0Rs60mcIGGhGpC+pyCDf44j5YJJsq8H
 1d3scVJdlE+nmcWm/kXEdv3WUSWmIXt47GJjjdZB7sMEJxju0SiKyX3MV0BXiFT0a5OmQAdoqFk
 /bKM=
X-Google-Smtp-Source: AGHT+IGhJ7+4LXWwEgdE/uTIUKpZwoPh0W5HsuRDxXLxROLPosjQSdhtZs7HsXgGyu+g0anqR9mW9w==
X-Received: by 2002:a05:600c:430c:b0:40e:6665:79a7 with SMTP id
 p12-20020a05600c430c00b0040e666579a7mr255425wme.179.1705581473829; 
 Thu, 18 Jan 2024 04:37:53 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c314500b0040e5e21cd7bsm25328953wmo.11.2024.01.18.04.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 04:37:53 -0800 (PST)
Date: Thu, 18 Jan 2024 13:37:52 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: dri-devel@lists.freedesktop.org
Subject: Mesa >= 23.3.x and python 2.6 ...
Message-ID: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi

I noticed that with version 23.3.x Mesa no longer can be built with python
2.6. It still worked with Mesa 23.2.1.

It fails with

[   95s] Traceback (most recent call last):
[   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
[   95s]     import intel_genxml
[   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
genxml.py", line 5
[   95s]     from __future__ import annotations
[   95s]     ^
[   95s] SyntaxError: future feature annotations is not defined

When removing __future__ line like this

--- mesa-23.3.3/src/intel/genxml/intel_genxml.py.orig   2024-01-12 10:26:26.314070540 +0100
+++ mesa-23.3.3/src/intel/genxml/intel_genxml.py        2024-01-12 10:26:38.682317490 +0100
@@ -2,7 +2,6 @@
 # Copyright © 2019, 2022 Intel Corporation
 # SPDX-License-Identifier: MIT
 
-from __future__ import annotations
 from collections import OrderedDict
 import copy
 import io

this results in the following failure.

[  113s] Traceback (most recent call last):
[  113s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
[  113s]     import intel_genxml
[  113s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
genxml.py", line 51, in <module>
[  113s]     def add_struct_refs(items: typing.OrderedDict[str, bool], node: et.
Element) -> None:
[  113s] AttributeError: module 'typing' has no attribute 'OrderedDict'

I'm wondering if Mesa developers are interested in still supporting python
3.6?

Unfortunately currently it's not an option for SUSE's enterprise product to
update to a newer python (would be probably 3.12) (due to many customers still
relying on python 3.6 and we lack the ressources of adding and maintaining a
(full!) second python development stack). :-(

If the answer to the question above is a no. :-( How hard would it be to
adjust the code to python 3.6? Any suggestions to how it could be done? Or is
there any other workaround available?

I had a quick look between 23.2.1 and 23.3.3 and I've seen that

  from __future__ import annotations

and

  typing.OrderedDict

have already been used in 23.2.1 (although it was in gen_sort_tags.py and
now has been moved to new intel_genxml.py). So not sure why this fails now
or was working before ...

Any help here would be appreciated. SUSE is definitely interested in shipping
the latest Mesa with our latest enterprise product.

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
