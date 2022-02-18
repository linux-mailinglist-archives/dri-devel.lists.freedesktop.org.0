Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1F4BBB9E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 16:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002E10EE19;
	Fri, 18 Feb 2022 15:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264810EE1B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 15:01:55 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id n6so15192028qvk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qQOuPloDj1FDvrT18I7yp3YumR1JEJ9ojjlV/rcHoPw=;
 b=RoS0gyblqR/tsGfQ7lArc8WXX3kNZMvPTfZET3nsnl+Rr8n361EoMRIfa1S+T8g8oc
 NmAlJEUUOZ5XHaM5YrjNSr5VsFbJTayGS5be9bu+8ZuTGnnxnkPavDlHAMpATFRtc11K
 fiKwKgEOqF+51vJxLCJG62RY8EQ2KpYmP7mAntkiGoPgLp6RQG9Lz93DB55QoyA5iy4K
 jD0aW9yE0JKDtqB8vCY2rRZ02xMADfrBesx1EB/DYj+qq78BrufP6AkXF4xsqmELAlVq
 1FXz/tX3UyRzucAxKzmHRYKSZZAyzlWABCgkRcxEK/GH/tUhjJjJ7pXdKtahQ8czEgJj
 SqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQOuPloDj1FDvrT18I7yp3YumR1JEJ9ojjlV/rcHoPw=;
 b=fcfBMsWZTYXpCC7BXxlNMBIcUR+rKP23GT8Sq9xoM/h3vdwaZXrKK4zOKi4b/OKARV
 NqfuOA1oQeHi3czyjH3/X5049o30iWHqFJiJEw58ocgmeGqfvmTBLNImnbVTlurf4jX6
 MWuyfOgVoSdpQy8GU8YxQOYuIv5DZCyIxwIDy+2KCztqiUsAeZeKe4hWClwtP2XHyPUW
 CndkvcxnvEqgnHTOAf2zBZzyz5viLbNChWcTv4OEPxMbGLbLhGv+gQWLVRLGNdLPaq80
 o+N4+CVve4Wwoio1Y8EbRey6l0djTKxKkHHUVeYFOJsacDIwsYWRk3/9uweocgk1bGda
 PxPw==
X-Gm-Message-State: AOAM5324XCnOuMeIqQOsmC29OLohHT21fFB9A8Cx9I5sEfA63vnxkgmC
 5N+bKS4EUc8oO/6Kw5mZqZBODg==
X-Google-Smtp-Source: ABdhPJxj9yyCZvW5c4Ugzq0ieNoelSzlHZ5AUX07DsgnGoll6g+QZTPyJ2Fq/jgnUxsgsAq5KC011A==
X-Received: by 2002:ac8:7fd5:0:b0:2cf:93ff:5638 with SMTP id
 b21-20020ac87fd5000000b002cf93ff5638mr7063274qtk.435.1645196514006; 
 Fri, 18 Feb 2022 07:01:54 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id s4sm23008395qko.113.2022.02.18.07.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 07:01:52 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nL4lb-006cts-Vr; Fri, 18 Feb 2022 11:01:51 -0400
Date: Fri, 18 Feb 2022 11:01:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH 4/4] kunit: tool: Disable broken options for --alltests
Message-ID: <20220218150151.GD1037534@ziepe.ca>
References: <20220218075727.2737623-1-davidgow@google.com>
 <20220218075727.2737623-5-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218075727.2737623-5-davidgow@google.com>
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
Cc: x86@kernel.org, linux-rdma@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-um@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 felix.kuehling@amd.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 03:57:27PM +0800, David Gow wrote:
> There are a number of Kconfig options which break compilation under UML with
> allyesconfig.  As kunit_tool's --alltests option is based on allyesconfig and
> UML, we need to update the list of broken options to make --alltests build
> again.
> 
> Note that, while this does build again, it still segfaults on startup,
> so more work remains to be done.
> 
> They are:
> - CONFIG_VFIO_PCI: Needs ioport_map/ioport_unmap.
> - CONFIG_INFINIBAND_RDMAVT: Needs cpuinfo_x86 and __copy_user_nocache

It doesn't make sense to patch qib and then turn this option off, it
is required to build qib.

Jason
