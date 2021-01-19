Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AF2FB54D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 11:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AAA6E147;
	Tue, 19 Jan 2021 10:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D936E147
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:25:30 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611051928;
 bh=dGTiJERg2zrXOU4dpZd3X9IAeQN+fZzG/gcS0Jtabiw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dcx3TG5KQ33Iaqa7uRJ8WYc+NlJKsFibIrf4N5/TzMEYbwwoegvrJzh8SKu5iCy45
 KDRtMbu8qQaMN5fzUy37zMEmRCMUowm+SiaIRvtGZSnf4XB24CAh+nek0CjTMZf2Rw
 a+HPgKoPKZVZNSs03KKb/QGPfeKTQ5pnb4Pssiu60piRu5GUjy+VDH2AeuboX7atG1
 3L48bCon/WSj70Uq5mE0xC52elPkhYLs6oXim0d3IxU7qACf+82DdpTN+Fpk/3asc3
 Nqzs1DP/OxVJUdgU9QiBA+9QuAPp1qGXnpQxFM+ZxF5UZTfzkt8Jidwt3UPWuDIioK
 v2Q2oAtoT7C2A==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/5] drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
Message-ID: <2QHYyJzLbrCUmrL_JECoVAa2stPs0keGJC0bBudh70My2JI9zjZFlh_aL-uRe5cGDZv4Pt8sI3mEoPG1Nw8liNzYPuMm4yLbRQqmg5SL5MI=@emersion.fr>
In-Reply-To: <20210119014849.2509965-2-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
 <20210119014849.2509965-2-lyude@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Code LGTM:

Reviewed-by: Simon Ser <contact@emersion.fr>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
