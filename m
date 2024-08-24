Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308495DDEE
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 14:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3E10E0BB;
	Sat, 24 Aug 2024 12:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="HbexeRTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547910E0BB
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1724503811; x=1724763011;
 bh=D1CAi3XROPoF4DAwfP7km1pImE9E+4HMJedifqRWA+s=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HbexeRTjzv6URsUdkKJHyNacrqiu2FRfyd0o0Uv+FLwPmQXAtprTkE1X7axPYbNll
 FD3RuIi4/3jH36ZQglb5MopfTmqmlmAU1QNyhqCRj1InyWeL8o2rTvteobORUA5Ikp
 Vn2rTe+X9BKXRm8ALQqIch8+krHRCtB/wfWehq6+ANRmI4rgLLcRLOw7opdvBD2JjN
 0SR51maBk/3eXPahoflYTxZk3TiMock+O2XZaqJOr3xlnG3DCYVx2pa6AdnM6jwVHP
 PkNHv9t715hgcovfhk0wlHfUhhJ+hHL+Kl6OrTA3gAgMaUqNc9ft6Bp0Mz0zYQ92pg
 PQaRgUZbIcTcg==
Date: Sat, 24 Aug 2024 12:50:06 +0000
To: "Olsak, Marek" <Marek.Olsak@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: AMD GFX12 modifiers
Message-ID: <zLoqTS44feeKBoTvgYi2qDOX46w5D27-asZxg032Qm1BrA-MxRXp56DEsJztTmzhtNsCZhYqoOMz5fmCZqNmt4zPg1Pcai_VLqPsn6Dh-9Q=@emersion.fr>
In-Reply-To: <DM6PR12MB4731348940A72B82B32B575BF9D92@DM6PR12MB4731.namprd12.prod.outlook.com>
References: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
 <CADnq5_NgzVn4AOekFQ1xYqkdhuZhTE1QVqxO1WJtp-Bchx6dcw@mail.gmail.com>
 <DM6PR12MB47312197417DE10FB70EA8B1F9DC2@DM6PR12MB4731.namprd12.prod.outlook.com>
 <puRC6uFBtCVBzB86vMEYSr2EEy6ByN5dSXIJH1ePIcIckTFo1xw2r0GUMx39uPMnOGYf6DxpjGEfGRwyVRHSezhX_NIIwKUQD8MGlhXewuk=@emersion.fr>
 <DM6PR12MB4731C6A4ED42471BA85EB75FF9DD2@DM6PR12MB4731.namprd12.prod.outlook.com>
 <vj4fiAeZ6gKbGp3-Pc4VTWsrXVakEw4qVAFWvSwuInGFav8XX51muU57abjq5t5xIsjlLivoUXyiVqT_X_sP2ufgnzoDx6uJotCvl10Tczk=@emersion.fr>
 <DM6PR12MB4731348940A72B82B32B575BF9D92@DM6PR12MB4731.namprd12.prod.outlook.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 14d065a26f0c152fdb9274155d593499cf783aed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh well, if AMD modifiers are documented via "read Mesa source code",
then I'll just leave everything as-is and libdrm/drm_info/drmdb will
just print "who knows" instead of something actually useful when hitting
such modifiers. Sorry, I have no more free time to donate here.
