Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6282B3B7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE9D10E03F;
	Thu, 11 Jan 2024 17:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255FA10E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1704993220; x=1705252420;
 bh=kU2zjiA4amj0vhKYSPZi3b5PI4lZfuEYRWmirtC4Bf4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=UxK9tjjXzQks5VPT+xHDKJtFNUSW4Wak9zkBmz20ezDUX0FLROzsCDX26JAu7U7Xf
 66Pc/y3KW9gGCqTcL8Q+ss28I5ikhWjRkEO/IbAAO8OUd6Fow5dDGll17a017T+Kee
 Kexzw2Ph7Vo/dt7eni74lyVDUX1scoMlThVuX7DfZJmBSgf6gQCVurNDXOqx3fHQPa
 gdHTCVpUh4QFxRYINUxnzqGDJpXMy33il4Ff0uBPeNH+RmswKlA4lgxkZ7GU9z5AYb
 oboCWr5m2BeFMSD4lmdBWE43r0hH8MCBwTroRGGILibrgu21qnNoDRGFJA06WycKSu
 wUUzuhNUZY8qg==
Date: Thu, 11 Jan 2024 17:13:33 +0000
To: Xaver Hugl <xaver.hugl@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed
 with async commits
Message-ID: <ID9ZgIO-0g8gNMKtaQFJTKRl5uh6UBgKViGwKB8634Pa4d6c8a-EQD4aaTiIbIqkqFiVChj4SLN2Ufs5PEF3F084HHLGn8gK-2-onYXES4g=@emersion.fr>
In-Reply-To: <20240111165615.27587-1-xaver.hugl@gmail.com>
References: <20240111165615.27587-1-xaver.hugl@gmail.com>
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Are we sure that all drivers handle these two props properly with async
page-flips? This is a new codepath not taken by the legacy uAPI.

Style nit: the indentation is a bit off, the continuation lines don't
align with the parenthesis.
