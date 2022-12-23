Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE784654FB0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 12:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76B710E186;
	Fri, 23 Dec 2022 11:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2AD10E186
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 11:27:04 +0000 (UTC)
Date: Fri, 23 Dec 2022 11:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1671794819; x=1672054019;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ShK61hi+2l3zZ3cXFE1BsWTOsdJt3PGyB385e0NeZGbeiKNNTIAo4cJdMg4xooxId
 jL3tMbKKP+tffdAYR+6K7P1GAKRQYDlUOtTzT2xls7W7dy9CxkCmPantw+8ae+HCDj
 UrGSr0x9EPWdzv+SqcVYqXoa2gFEjJFQFAtuWBFR0+8WVa/EbTMcZwc8xU2yKMw1oc
 oqTKMuFlUlAbk40T5X8YUfvAg9gQUfuThl/7Vtqez4+H7eQX+aqxIWU4huTjITvtuV
 wcbLnOksiu8SnxL0HCn/6aSfFoesRQ63L9C1uGUl3SOtpqoS4GczK/gQk+NP7+t97o
 VCCaJV7TYOljw==
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Message-ID: <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
In-Reply-To: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
References: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
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
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
