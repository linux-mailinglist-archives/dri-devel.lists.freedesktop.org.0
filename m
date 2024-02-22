Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62E85F8EA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E912B10E3FD;
	Thu, 22 Feb 2024 12:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ZzYsKQAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EA010E3FD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1708606518; x=1708865718;
 bh=8na7hEtfgACat7icd3aYHEMfqUfNdVKO4d2pZQS6uD0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ZzYsKQAUqanarpZ1BI7WLSlVBNGeIoFUyoo+/GLIhI5L9UXdGN8dKgI4EjO8VwuQC
 h7Pp5OJ4qAnMjAX7FncXteHj1XiIZN3S5zb3ZwanTdt0aEmHyw7RFtQgRg1hMq4iN5
 on42OEY0mny98/uvvhjE2iuibGFs4T367Ruit5dfi2nvNbn0xbDHzW+0TQHVESkuDB
 StQk2iclsshGu0k5Tl2xdVGvCck3Wr5CByXVxZ1SkaGaffka8Z80EpvYpJ/XlOBi4o
 ZtIDJ407VewaDPh37ExaNRNNcRDKLFghylzv4WGwaYtVbj1FLxOyAXrihr+Gx4Gy6Z
 Q8/ZE39j9HU1g==
Date: Thu, 22 Feb 2024 12:54:53 +0000
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl,
 ashafer@nvidia.com, jajones@nvidia.com, kbrenneman@nvidia.com
Subject: Re: [PATCH RESEND v2] drm/syncobj: handle NULL fence in
 syncobj_eventfd_entry_func
Message-ID: <whijhe9d02GiizwFaXaY0dOg7MpcTTIQhlB-5SBGJ_ZfLawHeuFRuhh3g1XwxfoASZ7lMCx3SVi6EL5QcM0sm-W1yCJ8GgRzDMe9Ml23vOY=@emersion.fr>
In-Reply-To: <20240221184527.37667-1-ekurzinger@nvidia.com>
References: <20240221184527.37667-1-ekurzinger@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Pushed to drm-misc-fixes with two minor edits to make scripts/checkpatch.pl
happy (commit reference cut off a final dot, and comment needs "*/" on its =
own
line).
