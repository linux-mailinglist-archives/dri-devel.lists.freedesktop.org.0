Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855F7F63E0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 17:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1DB10E182;
	Thu, 23 Nov 2023 16:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2A10E182
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700756692; x=1701015892;
 bh=UtahpTMUIkzRRkLLl/RDgccHpG8+Tv/LRGhCg/01Fe8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KFKx8LXc6AFb6BvzMma3qYOE4eoj8SHnsCn8MEICv6IajMp7hSDIs0omOsTCGSesW
 ku0WtE3pWlIQLMaiJiPZDclndKyxkJTG+wgRCG0VMFMmWT+pWQQyrpelITxeoWyGW2
 nNgm+cSSOqXNEU21VW3sR7uk2SQbPm4zao3spvUYTcvJc1MZRSHUL5HOW+GkB9w9nd
 x/4UzvPVq2Zot6S1SzyCvRHNcn6vPfB2uH1TpyHs+vbd3DmZpfRCx0Tc3hewHlZwvd
 9OE3tqbPBJM4gEzUqTz5+NKMdZBHicZ8qRUQ9SN09YmrDcWd5h2r2dECYEgeap7CnC
 C5cGpakrBNnsQ==
Date: Thu, 23 Nov 2023 16:24:36 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v9 0/4] drm: Add support for atomic async page-flip
Message-ID: <WG-nBy-xqSEAQQX1ASB9Gw7Ra0aZ-qFYDQq1mXjQdOTwxlM1wEROginNiWbnM9CZE9idUyE6P5urNZ8q8kFMswbPt5ewbk3ocuIVnajQpAQ=@emersion.fr>
In-Reply-To: <50ff86d4-5ce1-4ae5-aafb-ce3bc0069629@igalia.com>
References: <20231122161941.320564-1-andrealmeid@igalia.com>
 <cc10f6b0-e26e-4021-85ca-33cb1e58e937@amd.com>
 <50ff86d4-5ce1-4ae5-aafb-ce3bc0069629@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 xaver.hugl@gmail.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks! This iteration of the first 3 patches LGTM, I've pushed them to
drm-misc-next. I've made two adjustments to make checkpatch.pl happy:

- s/uint64_t/u64/
- Fix indentation for a drm_dbg_atomic()
