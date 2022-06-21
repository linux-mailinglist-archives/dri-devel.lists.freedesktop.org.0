Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CECF55348E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 16:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B1610E49F;
	Tue, 21 Jun 2022 14:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C90E10E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:32:48 +0000 (UTC)
Received: from maud (unknown [184.175.41.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 989926601688;
 Tue, 21 Jun 2022 15:32:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655821967;
 bh=HrmsFAPllDZrxGBVK/29WwefT7hasp3eLS77mV3C43o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hadRZ1Fgs7MuSbl/2Zx1VWbF/9ftF1XNKremCSERagIZmt148STc6ym2GTCnieuhp
 AKQInsuCgazU9yMpckJibWwZ95uj5p5waDf+ikQhDpNJKqgDo1GyjBNu5yTdYSRQ/Y
 hwqNxVWT9QiSCuxRRhiRc/nIqW1zgRyxKx3o65D9y3p/Ielbaff4fltqMXbDk6m6V+
 D3f5J0sT8aHc8pZCJExMDbhuHnOV+YfzYn0eBY2rFZjklrRtGEX8pkVUgaQ8J4Q0qD
 8tCqKk7omcL1h8BkKOdKSRHV4WImHw1wA8wGRFW5TBUoQtESyFiVgvlFO+E7KUMfDc
 tAjbbWhQbeAww==
Date: Tue, 21 Jun 2022 10:32:38 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <YrHWhmNVJnIJ1iaT@maud>
References: <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <202206211114.PJcD2pJh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206211114.PJcD2pJh-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, tomeu.vizoso@collabora.com,
 Adri?n Larumbe <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>    drivers/gpu/drm/panfrost/panfrost_dump.c: In function 'panfrost_core_dump':
> >> drivers/gpu/drm/panfrost/panfrost_dump.c:115:20: error: 'struct panfrost_job' has no member named 'file_priv'
>      115 |         as_nr = job->file_priv->mmu->as;
>          |                    ^~

FWIW -- this is due to recent changes in panfrost, you should rebase on
the latest drm-misc-next which is where the patch will be applied
anyway.
