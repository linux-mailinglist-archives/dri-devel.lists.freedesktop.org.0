Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1A4ABB50
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F3610E522;
	Mon,  7 Feb 2022 11:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D13610E64B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:37:50 +0000 (UTC)
Date: Mon, 07 Feb 2022 11:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644233867;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=d94DxJZGMZxERowvCxCTpR9pr7+nCkFjWS13MhJ1N0KYI1poKsFhFHSHyx4ruHZxk
 A9NxTEEgJq+rxFZZycR2wlbTG01OW0e+sVphreJbFy7SlZesL6wItd1zxF9yzVBRdR
 QbzwFHOVnPLvgteqyJ21AAwluvBYeTiAyTgLRfs47/H9YIMeZTNpFG4r7FG3zzPM+K
 JPy3MJP2wekN6N2m3gzCX0l80dwC9Qew2K39BjwKA2OPh91eUZNU5L8Ff9Zf40dgR2
 HtJ0fRbZU8EqGU3pne/AdjpSrPqMISol/DdRhz+uytr9vd6YuJANeJwle93M1F+Dwo
 qgLG+FTVpbZPg==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
Message-ID: <b2uKM4hu2HeudPS1-qX16wSdpZX34TtBVBE0Tb1Rnf4XtB2WCDSaZ7tOzWhnIPWdij9_2MWjQyRWN6539u-zs-6kd58TDplvkC2cOpXTMM0=@emersion.fr>
In-Reply-To: <20220207113307.346281-1-hdegoede@redhat.com>
References: <20220207113307.346281-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
