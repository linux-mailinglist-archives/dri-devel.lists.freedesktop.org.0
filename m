Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01687DC615
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4BA10E401;
	Tue, 31 Oct 2023 05:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF0110E402
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:48:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA3C360C2C;
 Tue, 31 Oct 2023 05:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AB9C433CA;
 Tue, 31 Oct 2023 05:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698731312;
 bh=ZL86179SQNnH59nO9ZdsjOEwSLJlQ/T8PyWZqwTE7cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rl2xXr8n+alSL/G+gmf7W7osy2QKqZ/XO2v0vxwyI1mgZzbPlnmeavVHcWzMVQTZ1
 boFAFoTtuz/nV6SJ49p0TSyf5SsSQw7rXf6Zg/6xhbAXqvDQ3vZmkQoBlUkRDkSHkK
 2GyYv5I7h6c3ZBh+IWHlOc42jk8oRV4ESdsAIcA8=
Date: Tue, 31 Oct 2023 06:48:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Message-ID: <2023103115-obstruct-smudgy-6cc6@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
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
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 aurabindo.pillai@amd.com, samson.tam@amd.com, skhan@linuxfoundation.org,
 SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 07:17:48PM +0200, José Pekkarinen wrote:
> This patch addresses the following warning spotted by
> using coccinelle where the case checked does the same
> than the else case.
> 
> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10: WARNING: possible condition with no effect (if == else)
> 
> Fixes: 974ce181 ("drm/amd/display: Add check for PState change in DCN32")
> 
> Cc: stable@vger.kernel.org

Why is this relevant for stable?

