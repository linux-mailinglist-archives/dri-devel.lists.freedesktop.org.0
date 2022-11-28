Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395A63A513
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 10:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1D10E2BF;
	Mon, 28 Nov 2022 09:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5362C10E2BF;
 Mon, 28 Nov 2022 09:30:23 +0000 (UTC)
Date: Mon, 28 Nov 2022 09:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669627820; x=1669887020;
 bh=7YoBzNpn8HKIEqf+GljIP7pMTP3BAzak4g4w5EjkCW8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=e6a0Q7kgfsIvwRrd7s0mNPezfQpbp4hVhdCqDnh7t8Bbs4uyrZedfPUiw4/x/fzlI
 ufQNrEHr0By4oYqkAm+bq6m/PNWqf0iFug+JjiLi2HKAB3S5T/cCE1Jo/VZJpyUaNV
 O3VnDLwk2PEpOyl+X/D1aE1tbMkAke7l8dglTV34mjjoaVli6qJkX4BJvJtE+9InQs
 J+36WETr//i2UuLRQ3JcJk+io6gDAcGH/Zcre4b6NW0QFBxyTEelDwkP1CwpFEnxVL
 ATm6rfZTjThM7rl4Hpa3fgzto02K5pkiaSQtXyXrf8DL4OvQJa7fsFwwgFrMHJlLPz
 ICxbR/Kb4vLfg==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
Message-ID: <584UdQAqoPr4vSxCTJg70LFQm--HpHH-EhnAo78lRAZ89OnrDkUeKlTnDGT_DMzDT3PeEtmXNsrqB6GuiV4TsZv3pBU8kFWjyPLWGrevIMw=@emersion.fr>
In-Reply-To: <20221128112528.1206b1f5@eldfell>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <20221128112528.1206b1f5@eldfell>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PID is racy, the user-space daemon could end up killing an
unrelated process=E2=80=A6 Is there any way we could use a pidfd instead?
