Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE07912D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F4F10E2D7;
	Mon,  4 Sep 2023 07:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43510E2D9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:59:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B798DB80DB8;
 Mon,  4 Sep 2023 07:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9765C433C7;
 Mon,  4 Sep 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814337;
 bh=wshyRHP09R8yIfKuZEEfRI3UmWKQ5VuTL5f4lHcN7xs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=JIacjII79U2oHT6JEn5aP51LQjnGqqVrh2n6Y0A1PUpKsNQOoH/8sjAunOtu82Ksz
 2G4dA0ZjeHxiK/ie3Tn3l6zKafdB6yiOcbg399T/4UcQFTGsbkDBn9bCgCTdPYWRRc
 G/NWixIYMPCSplvDrwDin9lsV0sir/m7IF0Vd01cb8mvuF3QoxeZrmJ+j+jp38ynhK
 2Ib9PyYeOZLYKZJlkVUoN/+9E9ejfUm5yClAVhRUVC3+i5Jh4Ia/kTk7/dJJ+aSmpj
 chpSxgkCLQSh4U7twO9w6mkvzbKVFbYo7oQvhVGgBKxyZ0s807x76ZkciglyDZrWon
 r/zP86uF/Z+Ng==
Message-ID: <84acd2a9724fd45a5dff355b3b699b49.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:58:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 3/6] drm/vc4: Call drm_atomic_helper_shutdown() at
 shutdown time
In-Reply-To: <20230901163944.RFT.3.I10dbe099fb1059d304ba847d19fc45054f7ffe9f@changeid>
References: <20230901163944.RFT.3.I10dbe099fb1059d304ba847d19fc45054f7ffe9f@changeid>
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:54 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
