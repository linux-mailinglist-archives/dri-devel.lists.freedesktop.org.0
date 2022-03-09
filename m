Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D814D2CCF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 11:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2F610E363;
	Wed,  9 Mar 2022 10:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A0210E35D;
 Wed,  9 Mar 2022 10:10:16 +0000 (UTC)
Date: Wed, 09 Mar 2022 10:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1646820614;
 bh=diiH8z7EVWatK+gnOaFBCzd/t6Xh+RHDZt6Ea+upVP4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=cTDLdIZZ/UeNnj/l9Fvyk5vTr0QIuScPbWk5fX2Dz/0xOkNetNhoRCw6YZHWDlPLE
 yp702ey8Vyx0Mkhe4w/tOwqM5rmmKxbaGUWUwr9bdCq+xtoI4Sk4ah/8WkaQHcr0N5
 dwxKiPAcIGESJr5QsFJE7FfJ3tD4UmyLlhepz2YiT1WkB3pjj7nar9lULnF/9HJr9r
 89ou/RLPzvOouIpeADyutObowAYT8oACgkgU9uCQb2blgJjAmI15v3i41CsutSa2Ef
 Q6rBEqj5LCoj1dyCPimYX7cdljtCiiRzWqQnjIcyEgMa0ayXkt6VxwN1BGwYZsdhid
 Tx0wmYbUckOgA==
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <DQGKSkEjxg-p9oBYX3hMa6fmY3Am2mAT4KBSQL_qsLGK0m85wehKp54s1IbobLSc5-FGbY67HrlWfQYO876bGgeObzY5eJF5UXJ1BktPilA=@emersion.fr>
In-Reply-To: <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 9th, 2022 at 10:56, Pierre-Eric Pelloux-Prayer <pierre-=
eric.pelloux-prayer@amd.com> wrote:

> Would it be possible to include the app parameters as well?

Can all processes read sysfs events?

There might be security implications here. The app parameters might
contain sensitive information, like passwords or tokens.

Can't the uevent receiver query the kernel to get that info from the
PID?
