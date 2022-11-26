Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483F639293
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 01:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2110E7BD;
	Sat, 26 Nov 2022 00:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B68510E7BD;
 Sat, 26 Nov 2022 00:18:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D57CB82BD7;
 Sat, 26 Nov 2022 00:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381A8C433C1;
 Sat, 26 Nov 2022 00:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1669421878;
 bh=N0BkCIonzZFjorKsjBaLOWHmBGWXxgq4vQOHZYYI+QM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u0dmufMBeU/Hge17mRXBmPGXWvfk84ictiDbNzdkhYWzCJka/K8Y897LxUKz7Vj3z
 U1yJUtWHtoZFdoY4wBcpYuMB3DmBgMpNNHUtIQgiLA4Nb1IDJvLIqamUoTUitgl9U8
 USOEXxWnBItN7/5B+3liMkAy2ysF02xGzrkMnRvk=
Date: Fri, 25 Nov 2022 16:17:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 0/2] Fix a bunch of allmodconfig errors
Message-Id: <20221125161757.73f96b3b90f4884509097352@linux-foundation.org>
In-Reply-To: <20221125120750.3537134-1-lee@kernel.org>
References: <20221125120750.3537134-1-lee@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, sunpeng.li@amd.com,
 ndesaulniers@google.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, amd-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, trix@redhat.com, alexander.deucher@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022 12:07:48 +0000 Lee Jones <lee@kernel.org> wrote:

> Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST") WERROR 
> now defaults to COMPILE_TEST meaning that it's enabled for allmodconfig        
> builds.  This leads to some interesting failures, each resolved in this set.   

Oh, I get it.  Clang.  I'll tweak the above para to make that clearer.

cc:stable question still applies?  How much trouble will these build
errors be causing people for the next N years?

> With this set applied, I am able to obtain a successful allmodconfig Arm build.
