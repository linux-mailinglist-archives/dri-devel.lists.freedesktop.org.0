Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CE788429
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673D10E64A;
	Fri, 25 Aug 2023 09:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFC210E64A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:58:48 +0000 (UTC)
Date: Fri, 25 Aug 2023 09:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692957526; x=1693216726;
 bh=IOyRvyGW1bizS3h9MOpibQQhsEwjGmRyxigZcp4G76o=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CSegkBhj0H0Yhs1l4kBxMfADoPZNU2bxqG4aJsAVLjE0wxcHDADMZdhXoWxUDFxKP
 VB6OFwFYWrSiGuJr0PsiTBDPDeIh8XMduP7MrQ/+EHUMJqJwY8+Xh1t9aLolSNA3lB
 bQ9N2rGga5gHedmCJvo3yR2NkhPQJrtY3UUFnigsSleT2AKdsS3sDzQ6RpXbkYkh02
 GBvjuSoWn+MI1IJpxs4dCSuovlsxOWPePgsL/bsMaA720JnMgZLZa3mpjEEr7A/ESg
 yeWjNasKRiF/6pty1TEwwRuKLn+ms79eTV3n+kWx0S4FAcXZd4P0cXdNSttbFIUQM7
 GowC63KJ1r+zg==
To: Jocelyn Falempe <jfalempe@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/plane: Add documentation about software color
 conversion.
Message-ID: <esdo6FmCtNqLIkz8sGEO0jew6CrN_aA1QyhsfHaOFKMnuMqkV8vh0w-GdMYRR0UOgiqKg7ayPCIaTXrk2Co6ghVS_6D6u39diAKmisQ8vok=@emersion.fr>
In-Reply-To: <20230825085545.168290-1-jfalempe@redhat.com>
References: <20230825085545.168290-1-jfalempe@redhat.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It would be nicer to have the linked email as proper docs, but that
sounds like a bunch more work. In any case:

Acked-by: Simon Ser <contact@emersion.fr>
