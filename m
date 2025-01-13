Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A70A0BF2D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7719310E75F;
	Mon, 13 Jan 2025 17:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="c7cXP3fR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 35139 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 17:50:06 UTC
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF4110E75F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736790603; x=1737049803;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=c7cXP3fR5mLxlHKXOdApExXkzBX9ovBX0r9HBK2WUo1nMcfT1DNpDZrMhe9oK+Lz8
 GwWEWgd6hGJ1NViWTr+5K3JOWpkHbCFlGOlOkuP2iKnclLWOuMOE6cIA7C+GUeuBoZ
 NzbCmg4LSWqdUJQZiFvMHYpzeiPFmmvhAwsUnYkq8qmAnlm07WTqgf0HxlJCsVKfJR
 TSUz86i7fr2PKef4gwz0j/iuvC1yjN6ZMnP2X2NMbunI2CNGbp+mbQp8SwPfuOiZHE
 +ox6FHyCK5UVS/4vzURjyXAKjmVtOmSmgrCsMU9b3yderZ65+OzVm6LovcWFmo4pia
 tsqexFft3KsOA==
Date: Mon, 13 Jan 2025 17:49:58 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 09/45] drm/colorop: Add BYPASS property
Message-ID: <GLU-IG3JEzIdQqmDxAwhuMpP-ETTYkVBCzQk3nyjEkjJFwoB_gODNd_VeNF5viGDoUBCOXTgQ1Z8eDjVSqq2oQ7U7QKihx1N300q17dbDrw=@emersion.fr>
In-Reply-To: <20241220043410.416867-10-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-10-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 70ff4f333a1da35d24b3ab5cdd2037a335b02111
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
