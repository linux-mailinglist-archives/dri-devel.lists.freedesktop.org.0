Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21547BFC01
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA0510E346;
	Tue, 10 Oct 2023 12:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A510E343
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1696942791; x=1697201991;
 bh=1gScGyMxniq9kl8h3+4rUdE0h04+NIujVVAltALUBi4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bVrqFYJycl415vGCs4d358G7GK0m6DekEwR9MWts6YOBBcYOAAonWtoAgoocMb4Ec
 cdyeSV1VKaSPbMJ9pYitIzPMTGgcuK1WGiUFCBm49gFe5E0TKWBlKbbPgHMcNUsis9
 33XukjlqYBaHwkMvdhDurf5FSNjPXtdkYiIphQHYE3BlDfm4B9M0Kf4hV7QQeOHm6B
 rogCTtXGJk4tODtABTPk1zIHuww9HLfqO4QHtGSA+ioajGaur+C/9IRcEu83uvJDkL
 SJ6pokeJ60HkE+iAgX1cRslVjsmBLTcXmeLowNMeX4ENaJCTRTlRu18bgNhbMktvEL
 gKz1mHyclTuCQ==
Date: Tue, 10 Oct 2023 12:59:40 +0000
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic-helper: relax unregistered connector check
Message-ID: <p0p3gIeKK_MOR_mwPBCydPuCmhb2dH9INeusIYaZ0e3wbBR2hb793Ji6A7bVhT0r-AFa2thALBLAaaDpwTXtWrpxu8A6G5AwrcmJ3ab9HiI=@emersion.fr>
In-Reply-To: <ZSBzfLY2X7IL7Y9j@intel.com>
References: <20231005131623.114379-1-contact@emersion.fr>
 <ZSBzfLY2X7IL7Y9j@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you both for the reviews! Some wlroots users have confirmed it
fixes their issues. I've pushed the patch.
