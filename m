Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DE832FB9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F810EA7D;
	Fri, 19 Jan 2024 20:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3E10EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 20:25:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40e8801221cso10541075e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1705695866; x=1706300666; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fSAdYcVcYW7TXec/S+ueznqklHNNuo2sBKfuUZVuOhA=;
 b=fRdI0UIWE9IOWqDtVSC9tQLY6IG7gLFOxI77WRkdk03Tzwdhdhi25u5YUVAJwcluWA
 UIcJhybXu1Sdm/2K3h3dXg0D4ktDfAKvjKi2qYcEf0Z0AAIqq1VWNXnpvUC0rAPavnHV
 zgAaEH6ArouTlknyE27wCxjZo3iHuhGX3Crw+Id/F+tuDtZ+G250ZPnRAHbxdorVmgYz
 gMYJCPaEnGjTDAcAm2E+g47e0niCy0+lQ06sLcVkMiuY3jh6Gz666fXfVh3g5E1aHJMO
 eMRE/cGVVobdY3WkbP9oDrlCbAfh9i1S3CAf99SlMC/uxbc+m6HmrZWqenycTIrLfvDT
 QNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705695866; x=1706300666;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fSAdYcVcYW7TXec/S+ueznqklHNNuo2sBKfuUZVuOhA=;
 b=X6G0OlX80AWXPWerbQG3/oeEId2+GM9n15dVOxUJE7PzWW66J6C3gta9ys1MaxMngm
 mZrxd/u1P/8+VPNY/AjspRsfVr/o8Obmpxxx5TYgcPhG2s9We1M4LJQ0mXINakTqojPK
 FC2AiM55aXfeqUKvUV6AK9g4+YkXQvvzRTGhMnIH21X68Odxtp+8fUuCezVjR1vhFl7L
 kl4fdjP7QmtOcf23bdkyPRK5x0pA9fQ0LBbMZqZtVqW6Pa/eP0gkMwWwtV20zJLYSA4U
 ltQKqIYRdJYB323nUhrw+5+W8UOmS1F9d1e9xdeNYRd8KMD/qzk96E4IGcgFClhYh8RE
 hI7Q==
X-Gm-Message-State: AOJu0YwDjFQfAB2MVgHpgVRXCX+ud+ufpV5y3BenbXClMvdC8rxmDKPx
 HG9/C6S6Shxkub3IxNTsfy3/aN8c1S8iDK7dZ3UKhAJznPOLCkEJibexgl31yQs=
X-Google-Smtp-Source: AGHT+IFtA7BSqlgCfiGu7wk0AZvLnnTQtHRsQADJPz9GIjEbAIoCgsRz0g5JV4tPQlwXkJq42N6o6w==
X-Received: by 2002:a05:600c:2e16:b0:40d:376b:c640 with SMTP id
 o22-20020a05600c2e1600b0040d376bc640mr197433wmf.102.1705695865794; 
 Fri, 19 Jan 2024 12:24:25 -0800 (PST)
Received: from suse.de ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 c9-20020adfe749000000b003368d2e729bsm7284566wrn.43.2024.01.19.12.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 12:24:25 -0800 (PST)
Date: Fri, 19 Jan 2024 21:24:24 +0100
From: Stefan Dirsch <sndirsch@suse.com>
To: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: Mesa >= 23.3.x and python 2.6 ...
Message-ID: <20240119202424.ronbrs5dts3bn5n6@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
 <170569503795.494457.15400783572444467039@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170569503795.494457.15400783572444467039@jljusten-skl>
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dylan Baker <dylan@pnwbakers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan

Thanks for digging into this!

On Fri, Jan 19, 2024 at 12:10:37PM -0800, Jordan Justen wrote:
> On 2024-01-18 04:37:52, Stefan Dirsch wrote:
> > Hi
> > 
> > I noticed that with version 23.3.x Mesa no longer can be built with python
> > 2.6. It still worked with Mesa 23.2.1.
> 
> As mentioned in other emails, this was typo where 3.6 was intended.
> 
> > 
> > It fails with
> > 
> > [   95s] Traceback (most recent call last):
> > [   95s]   File "../src/intel/genxml/gen_bits_header.py", line 23, in <module>
> > [   95s]     import intel_genxml
> > [   95s]   File "/home/abuild/rpmbuild/BUILD/mesa-23.3.3/src/intel/genxml/intel_
> > genxml.py", line 5
> > [   95s]     from __future__ import annotations
> > [   95s]     ^
> > [   95s] SyntaxError: future feature annotations is not defined
> > 
> 
> I guess this code first appeared in Dylan's:
> 
> 4fd2e15855d ("intel/genxml: add type annotations to gen_sort_tags.py")
> 
> and then became part of the standard tests a few commits later in:
> 
> 1f0a0a46d97 ("meson: run genxml sort tests")
> 
> back in Oct 2022. So, I guess at that point 'ninja test' would have
> failed with Python 3.6.
> 
> Then, I suppose I propagated this to being used on every build in:
> 
> 0495f952d48 ("intel/genxml: Add genxml_import.py script")
> 
> in Sept 2023.

Thanks. This explains why I've found this code already in older releases, but
it didn't fail for me yet. You said tests. Is this just a test, I could
disable (as dirty hack)? I was assuming it would generate code ...

> Maybe Dylan knows how we might make this compatible with Python 3.6,
> assuming we want to. :)
> 
> https://devguide.python.org/versions/

Yes, I know. It's EOL since a long time now ... sigh

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
