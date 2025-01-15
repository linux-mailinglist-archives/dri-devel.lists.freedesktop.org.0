Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5CA127E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E11F10E748;
	Wed, 15 Jan 2025 15:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Hj7gGOWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch
 [79.135.106.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB18610E761;
 Wed, 15 Jan 2025 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736956469; x=1737215669;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Hj7gGOWnrvt3GmaoyT4kGP0eHl0ZN6UI0E4mcJ7G1JCOQg+HJimGjBq5wjY5Y+4kc
 5is3lljJmawxKLO/eOOUjXE7T+jYzaOoccgIpqr9t1V1VBWKnkiANL6P9V636dZ0w2
 Li8SuBulnfUSPQne9448N+qi4F5D6Zroa05jm1//+rP5uwWjgslJENv4Is7no8fjmG
 PW5zR900QY8/xHbIBVkYQ5TcDR7tQmhvHDNNliLTZ/cataGNsVmXqwCG+r5y/4bM6l
 QtNQwI3jiaKK2p2ENRuQ+fDKszp6CfC9eUk4W06AavJmNVZ4IiaNK2/P9gAEEf8Gt5
 15vASCgGEcK5A==
Date: Wed, 15 Jan 2025 15:54:27 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 36/45] drm/colorop: Add mutliplier type
Message-ID: <-anZ-Kodj97pzzzPpBvLinqyhZ8E6TquGswKYKVqfzjjVj8ehc8tOITNjGGXFuxpOiT2CjRLKi6VxfSimqw48tlj1tTEVLBCVm2vukDjKSQ=@emersion.fr>
In-Reply-To: <20241220043410.416867-37-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-37-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: db8b661e4ca5e7716a081d5402d0c7387e8c0d30
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
