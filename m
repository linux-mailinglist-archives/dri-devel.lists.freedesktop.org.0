Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0E99D9DF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 00:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A4F10E370;
	Mon, 14 Oct 2024 22:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="trlF7r/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73813890B2;
 Mon, 14 Oct 2024 22:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28ED05C5B25;
 Mon, 14 Oct 2024 22:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60A4C4CEC3;
 Mon, 14 Oct 2024 22:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728945843;
 bh=sxJBnWVh7J6MjJ9oBAwciomAVXeFtNxyj3zLblO2gi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trlF7r/c+Q5H+ZJnQO4jMY33LRU5hksjgwCaMfrLDzpF7s1Vsvz82s8lpzL+S5rw3
 F2rsweRP7bzXrv4gJ8yxp/KLJmQP+pIVMLoc+GGY2HwvnywGPqJb31S6SxTlGNW8UA
 JFBpZmGyjS3i01CpgkEIVQsgpcdyobNKCdSxVj4NmqOgy4j+rpSrTewPmBNQjFWUjR
 715SCZmoJLlD2Kctej5qnDUVROGkEZ91BATrE4rSsdRA9+GcB/fFPl1CalRHXpHTgE
 n4g5z2ZHDqbDWKmt7LLjx8VEvzuQtalzi/IOEFlvEmNVX1YoiGcMG/HGRegQvz+AKD
 WjmQH45G1w3Ww==
Date: Tue, 15 Oct 2024 00:43:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <Zw2erZCs2aX_pCRh@pollux>
References: <ZsZLFS1CsHkKjw+C@elsanto>
 <ef5a8e6d-cb97-4872-901c-cf4bbec23be6@embeddedor.com>
 <30530165-0ea9-4f02-9d8c-e8abc9eda5a7@kernel.org>
 <035ae74b-5df5-493f-9835-02c1c30ccfcc@kernel.org>
 <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
 <81E112F0-51CA-4171-8DA7-59EC8AE14510@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81E112F0-51CA-4171-8DA7-59EC8AE14510@kernel.org>
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

On Sat, Oct 05, 2024 at 09:04:11AM -0700, Kees Cook wrote:
> 
> 
> 
> >On 03/10/24 12:36, Danilo Krummrich wrote:
> >> On 9/13/24 12:23 PM, Danilo Krummrich wrote:
> 
> I am reminded that I should check all my MUAs to render the date as YYYY-MM-DD so my brain doesn't explode when I see people "time traveling". ;)
> 
> (BTW, what MUAs do you both use? I use Mutt and K-9 Mail, and I need to check the quote prefix settings in both...)

Mutt, and (unfortunately) Thunderbird for HTML stuff and a few other rare cases.

> 
> -Kees
> 
> -- 
> Kees Cook
> 
