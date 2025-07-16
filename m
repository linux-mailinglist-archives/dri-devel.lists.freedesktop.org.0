Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8EB072E3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7588710E26E;
	Wed, 16 Jul 2025 10:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="akg/1Ibp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0C410E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:13:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98D845C5BD4;
 Wed, 16 Jul 2025 10:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD124C4CEFB;
 Wed, 16 Jul 2025 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752660823;
 bh=zmDlJEcCkAItmsN91VxH+Y6Za18HjPTr6bGwSTCinHY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=akg/1IbpGQsucT58cuZhLdB2RRERE4XZIWg5O5PiZ+6//1gCDoRPpkm5P/YePBBP7
 NInKGnoyerSChhUxsWtv4CeZ5g/7KCvelVIdt0BpHm2gQrbhnu65MjdXWI+QfE4xZ+
 yNg0zIquPPEzhow9WQtLCw3Rv/h+b/hr0e6uguMarBKz4eXVHo98xVPX7QC5glBL/b
 PTceu4QBRWeidkAFDFGlOUw/92Ly1GBcjWNwNy6IB5cx1gf7gzBtHl/tP/Gm2M19tC
 0V+ePTPs7Q8dyOrKKQZKXzGHKI3QzY3p9oiitOpC5FvQUDcqT7If2qOytwRAwKFSDb
 DZ9Cu/SSJ0BfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 12:13:40 +0200
Message-Id: <DBDEEPDKQAX2.261COQD2QRTVF@kernel.org>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "phasta@kernel.org" <phasta@kernel.org>, "Yin, ZhenGuo (Chris)"
 <ZhenGuo.Yin@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>
To: "cao, lin" <lin.cao@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <CO6PR12MB5491D8AC9F0920FA75D2CD6AF556A@CO6PR12MB5491.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB5491D8AC9F0920FA75D2CD6AF556A@CO6PR12MB5491.namprd12.prod.outlook.com>
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

On Wed Jul 16, 2025 at 12:05 PM CEST, lin cao wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

Two small off-topic remarks from my side. :)

Can you please remove "AMD Official Use Only" header when sending to public
mailing lists? Otherwise people may have to delete your mails unread.

Please try to avoid top-post replies [1].

Thanks!

- Danilo

[1] https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replyin=
g
