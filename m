Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D2A0B09C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BA910E484;
	Mon, 13 Jan 2025 08:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="JKk1qxqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594C10E420;
 Mon, 13 Jan 2025 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736755628; x=1737014828;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=JKk1qxqsChv3tz/9oCATFdb/gjg6WwsnHD/hkziYkS9/5jRSc0aXkoXI+xsee7J4C
 mkV4DPSy20Gen4pM2NERSbzJGtnE1y38i7xA+hCy9WzJdBnE4Wf3bZhIIprXFigH+X
 NydWKEbR13M7CTdq1P1BE7hqzgBF8wWhC4v5Puiqv6F4SJI62YoUEwYuxDHlbi9hgX
 L5vHkDdpmMmhM5qy3Zl6EgQAu5tWPTYCm1p0oixVB2u6sM0L6U0j4B7Qgt1gpgOikn
 3xn6Kt+dqoGoavN3BtxHgChkLxrXkBXZ46LswjM5tpVfhEV3DdIgWUXGwqcOEhOWu8
 j83WiWrSAle/w==
Date: Mon, 13 Jan 2025 08:07:03 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 07/45] drm/colorop: Add 1D Curve subtype
Message-ID: <08ZAONAsAAyGiNLj1-tmB7YeJRYPqWFBxnOLIipVCvig37L1TwBKBiuOrotcHtYWO7-JN6wwrj19QZzaEuapiECmIYGsYX7Ul3Qr8pBuAxk=@emersion.fr>
In-Reply-To: <20241220043410.416867-8-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-8-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9033b743e070ec9bd4808ce224177c27b2bffedc
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

Reviewed-by: Simon Ser <contact@emersion.fr>
