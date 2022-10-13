Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C525FE2B5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 21:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1203310E94D;
	Thu, 13 Oct 2022 19:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92D810E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:31:27 +0000 (UTC)
Date: Thu, 13 Oct 2022 19:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665689484; x=1665948684;
 bh=Ca3A6azgYVUhqCTGWggmJR2+U0rpOhVXgfCycSVKqag=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=avpcAhtW3xAD4nYP6xDuEDaxL+oahrve8KtPr9j+PoCqPDvu3gDJvoYuBPwo3izzX
 g9ybPZ5q5facEo4ZW5nczLnG14mKJwU/SMRggn0em2LCGeWtz4fUSJdZGcqHCgIpZw
 lX/5Q2V2EN9gFeesCrOH2EqenFzyth5rGbQWmOqYlmk15/xpC/rOajbOLMuLq5mxUd
 bsIxF0vhTX8Oq1rpg8jFC4c5Y4+Xo977Zt/gOGV3DVAfHEv6P0YgRm8+DCsvczZ/6/
 h7MYRKp5tb0m/HoS/eaVbikWrIXfvWqSScRyyNXev7/7zzCnrH4ZLUdqD8wTSAeh+g
 YycZkopvL/1kQ==
To: Sasha Levin <sashal@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH AUTOSEL 6.0 16/44] drm: hide unregistered connectors from
 GETCONNECTOR IOCTL
Message-ID: <0-fHhpvbGPf-w86Z7MGNoAe5uxHJy7vAdHcgjqqC2x8UWTZ7YY6wYORyxtrzDIf2pyPLt7z6dfFGOeUozmm7o0Qz0hpmhevj38g3Np3H1jI=@emersion.fr>
In-Reply-To: <20221009234932.1230196-16-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
 <20221009234932.1230196-16-sashal@kernel.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jonas has reported that this breaks Mutter. Sasha, can we remove this
from the stable queue?
