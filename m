Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B2D2D8F0E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 18:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6827689F07;
	Sun, 13 Dec 2020 17:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3DE89F07
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 17:23:07 +0000 (UTC)
Date: Sun, 13 Dec 2020 17:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607880185;
 bh=3lyUOONU7YFbM1Vrr6R7EXViemuG9mM/B+itu1MjRQg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=REkLFnvj9JVv6IrVuV91VVHMBFIyALV6lQn4RdKGicYaTV3ns1Bc7cZ1IIghhuDdn
 OCV9B71ANZrHweftS+vuv0bHpSepYx3V8witaDQZJW9bgvNCePiAUDRTxEuSsJwthd
 ik2WVB2HzhSzSjrNlaYld7OsG3UT/WdJzRgl1ZOXb/9mML2tgGcPJvSN12kAOF+xCk
 vVxowv/1j0Yrr8/bz0taOlxyZpNQNq4k9RKD1hQrGiWtM7vneUiqTWbB0IfOnYyn0j
 gbBfw1BMElbUsp5vXDWVLSPwnEptoGnQC7kkW+0J/7337w4s6cyoLDETZp0ctkKQSy
 xeMI0lgjQlyrQ==
To: =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/damage_helper: Check if damage clips has valid values
Message-ID: <N8LaQsFFQKXyJWEc_Abvsw7vF3HIkLo4H7wsMHwL0DoHw6zLpYEhvb7tb8AFpH_0fC8whnF_R8uBwlAHc2aBKcYhgHOZ-V76qhgS2L8YPfU=@emersion.fr>
In-Reply-To: <20201213170728.290406-1-jose.souza@intel.com>
References: <20201213170728.290406-1-jose.souza@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Deepak Rawat <drawat@vmware.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can you add some drm_dbg_atomic logs when the damage is invalid, to make it
easier for user-space to understand why an atomic commit failed?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
