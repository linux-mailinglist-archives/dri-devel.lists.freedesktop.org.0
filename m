Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C542A5713C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27DE91DF8;
	Tue, 12 Jul 2022 08:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE21291DD2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:00:45 +0000 (UTC)
Date: Tue, 12 Jul 2022 08:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1657612844; x=1657872044;
 bh=hsjB0w3abVFbM7sBdNu0zvh6u5Q5qjSJs3td7e14BY8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=fY0Ls+Qnq06VSJRACsEwCe5Dzu94ZWYCMullC/9DtCLQ3YJPcOLRWk1Km3Lgx7Dlq
 geH7zx9IppBMwqDzRZNy5vw4dIld7K4awlqwD9ytq/Vv1aTc3rmd+8T5oUeGNiCF/s
 2Ll+sWwmLMLD+R+7zr/6dfn0k6Antg7asQMZQf8ZBzjD3M32VuhE+4BDQN75BI+d4M
 Ot/pJrdCtMWUf62KWlxFro0nulpqta16oPqlRvkc4aZ60M8ftL6S7V8PIzxVBelOxl
 xWi/dhPVK2EcOTlPctOtghO5JGcjB4aIGAobqyp2WSqILEQpzuJGRPckPLOcR18+3T
 z1bZ1BGPC787g==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/8] Fix cursor planes with virtualized drivers
Message-ID: <VJ0e2Fx2oEjrcdOikq3qmmYKEe71cvwYA1VC-HExY88perExPMS8VmCw1mtJkCWsx8iK-QR1E41q03ghBjLjdMjZf89P7X25I1xez3R8-EQ=@emersion.fr>
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: krastevm@vmware.com, ppaalanen@gmail.com, mombasawalam@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overall this looks pretty good to me, thanks for working on this!

Acked-by: Simon Ser <contact@emersion.fr>
