Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B227726567
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01C310E52A;
	Wed,  7 Jun 2023 16:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C410E51F;
 Wed,  7 Jun 2023 16:05:02 +0000 (UTC)
Date: Wed, 07 Jun 2023 16:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686153898; x=1686413098;
 bh=8/JLwy12a5V/z94vGMw3A9XncxoP2Snt8NqsFpfO2DU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=rhWSxP/bm0sDRmRofWAxeLkZ4JqidkoLL3ZwpB4v8eF9jtwUpDz4f6PL1dvpjYXwX
 TYfzIunROzgb09KmD5Ns7tFcG/Gdvm0rGoFvYHhwwXYymejP9ACzv4/BLRdOMSqvCN
 P658XAzw/AL6QbyX2sEle5B27AwIE+GTrfwojqhY3vDKIrN3/cmmFz5QbnT4XKMJtH
 cK5ykfUx/HOmet2M7hUOGVHYosz9vME7YCeKggM+YMuQRy+vbJeHPQSucWUpwSJwyi
 T7sE6ZDr2D/EvCRi4jxcLnWW8iko1yPtCJqDgA2TnFTo5Fq1/FwgBIiqmGDNSKXu2Z
 xGIZoEmax3vfg==
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 00/13] Enable Colorspace connector property in amdgpu
Message-ID: <0zKjnX2EVbPmX6UrMOUTG9GB6_0h57LVyjoj5PL5XFiJnrWVSBbUBIjl6P-Ir1NsLuL8iDof9s1N_jwfNGgvVbe_I9J3ckO2RxJud8znL7M=@emersion.fr>
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks! All of the core DRM patches (1-6) are

Reviewed-by: Simon Ser <contact@emersion.fr>
