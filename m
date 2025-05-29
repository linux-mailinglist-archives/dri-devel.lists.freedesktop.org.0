Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1373AC826B
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 21:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4356A10E255;
	Thu, 29 May 2025 19:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="DjpkBPLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1B310E252
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 19:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748545315; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UUMZLlnRUDLT2F+gCOS7DOfLMIBm7vfmp8feKdPZIENg0CurtjjI73lDFQGhSs3qcWOoAd2XIznxujWw4sAtnEJL3yY9Sws8pzK7OZl3Jx6xNUDog7tY7E6xeAzglwFnEJaeeffUOX9lBHN5fUnO7L9MLiKPKiqWKkmM5mLOOtU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748545315;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=; 
 b=j89o+a5reYkL04eoC+jOCpNTTdQhs8KKqtxHNOleJzYfGuC4Bcv5fz2M9R84UY8yH5qjw3V3P2pX2LRf0xCTVkHyNDI/4wdRYEb2L0KeuYJJnZZRXHj2E7P97JRKqKrcD23SOoDflXywcifZzjxmkWe5ftCOjtvaTd1qoQ+9h/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748545315; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=;
 b=DjpkBPLm5wDzr70krPoBgqUB2DwVmOH1sf16hQsPkkrpigAqDABwNuNEsoOcoXym
 BVmQp+yyi2rXaH+AuUePY0jlUk4mKNdWfUrxRnDuEAwJ7NWzOwroVut0bPntvARhVyX
 8lsEZddad/bQf+jWmhjx5t/9vtpxHJp1zBmBP/yI=
Received: by mx.zohomail.com with SMTPS id 17485453142061020.9208427851237;
 Thu, 29 May 2025 12:01:54 -0700 (PDT)
Message-ID: <21315465904c4378298a21acf19f2a38b9bb27be.camel@collabora.com>
Subject: XDC 2025: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 29 May 2025 15:01:53 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Hello!

Registration & Call for Proposals are now open for XDC 2025, which will
take place at the  TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

    https://xdc2025.x.org
 =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/10/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
