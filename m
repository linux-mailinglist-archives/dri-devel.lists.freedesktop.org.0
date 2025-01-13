Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4AA0B077
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5C710E41A;
	Mon, 13 Jan 2025 08:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="d7Oc2/sQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C5E10E411;
 Mon, 13 Jan 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736755463; x=1737014663;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=d7Oc2/sQNguUOEhdzvZYVxDiKrM4BJuVRMXvQOUvAreU3L0rj2dYcbk9Slk5X20A/
 gKIOWK3LXdo26jPtMTfvkG0S+8quRNls3Ng/WUOzsWia5EAfsoVNBDGNCRxwTKkMBD
 5KglZOIYsbUswIWvo2JTEOrrD1jR0F7CxN9viuE9Gvfu+fnZtC/e4mYYou6CBCMD03
 MlicLak9UKNNTvqjYIVmtEo2dsLPIvwUJwxcn1IDxo2hh8ucmGtgMgwcusalLFcUSj
 Ryoz3OHv6PWQVSzPhLuBGS7zWngqTCSNd/tbyC9tQYwgFpjqYAtzuHUjIABmZo6+yu
 2tz6I4XTJ7W1g==
Date: Mon, 13 Jan 2025 08:04:18 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 05/45] drm/colorop: Introduce new drm_colorop mode object
Message-ID: <hq4nPla2uP2uqqGubOrumRjmk5xECxlwNo9yZOInsl78UtKCIbv44CW_0DDoyCxJwsjCK0TqmhC4T_LikQCk3BoXLuH8TEQIY8ZASD2zE3I=@emersion.fr>
In-Reply-To: <20241220043410.416867-6-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-6-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: ac6c3b78f96527f1514692974d825813a57fd794
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
