Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F069BAA5784
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 23:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6310E808;
	Wed, 30 Apr 2025 21:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="jERhsXyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF6710E808
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1746049022; x=1746308222;
 bh=SCRdqYu/X+JlKwPLq1M2s6KsWP3afb1Fv8d1g4YI73I=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=jERhsXyXCcExDFKwcZVZFAAIow1VE/VZrlD73CHq/pTkVDe5LbP1O5wrWxEI/MvSM
 YC3kDGsM4UPLZSp9PGvbPXMSnddpqj4ahG6N27rw83a3T6VXkBq/bi5ptoq45L5xuj
 D7BT2s306YS08GzPYIEHLWKSQxu8yXKhMVptbFLUqL5QR5I5WBeDm2EIopUhYjZGtB
 hPd9JCzW3yHvfst2Xg5t4nmMXjObOdNMV5INZjAG9FIsd92NlnJ2rUroMWe+C4bNU5
 onfI/4rpwIZ3HVjikYKpYKKvBCwvIZUs4PgAiygmUe7urvG7cYTtqyi1PJJmyVkqCb
 JDO5UbK4N5giQ==
Date: Wed, 30 Apr 2025 21:37:01 +0000
To: Pekka Paalanen <pekka.paalanen@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <FlwYk4tL265ouojXtKg48aHJWBimXZ8e4aWLlDeuZtBf_9ckZ262KwqByNDLr7JzMIS3VKa3460elZf8pSShm1DMkRV0wEqFB2SexIo61Z0=@emersion.fr>
In-Reply-To: <20250422140534.0e190952@eldfell>
References: <20250414085652.43904-1-contact@emersion.fr>
 <20250414140638.49fa3f08@eldfell>
 <q0ezd1X8PHW2dfDHoBBZWxXpLIljcrPxQhYOB8p_N0lL0KTvolylcEJUAFlvlNn_S0gKtlkkp4dKfTOdx-O5Q84oX65BwNYMgNpHzXhKRQk=@emersion.fr>
 <20250422140534.0e190952@eldfell>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0eab4414d45962a648ce9d9814d49634f5aec43b
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

Pushed, thanks!
