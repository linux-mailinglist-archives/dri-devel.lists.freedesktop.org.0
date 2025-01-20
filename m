Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF0A16796
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 08:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386E10E33A;
	Mon, 20 Jan 2025 07:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="g+VkeCrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch
 [79.135.106.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6102710E341
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737359319; x=1737618519;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=g+VkeCrKrJMJBx6MsYH0Gpjg3w/wY2gqeo6Z+cHH2THw2P4haYLecMn2TYXR+aMZB
 vRrzgDpfyyjhEDQ2YlCzYDYxVICTM5w9TXfk+uu7qHoc7+wcrO46XPeABMPSuGEFx9
 PHMeIDlnXOqZ6K56XFQlzoYzYl4iKx5CJ+0b/G4KzIYJPWryGBoSdA+giJZe7a9XQG
 KKu/ntbqFaV/EeO29m9sCVOqYQYjLhXeGBaxaZsWTL6L+rzFuOFjEpR5B5DeLTAH+J
 E0QL5QtTgd8mwfAVheLQFBEeIqDpkedRyPdQJjN6yJSZSTLf/ZbmeWGSg0rAw01l2f
 8Up3OcpkrLxBw==
Date: Mon, 20 Jan 2025 07:48:35 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 39/45] drm/colorop: Define LUT_1D interpolation
Message-ID: <CME-EpnEJHl2zzYsno91e3ZHtHT9cBCCfXb-WPbUzKzdLWg8agu79ZqkjjF9Ncawl3_YoIrUYHioH_bQd8u2kknOyjLzQjh3ftX-a0Re12k=@emersion.fr>
In-Reply-To: <20241220043410.416867-40-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-40-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: af607c56be6d75a242474f153cbe6d4da248a893
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
