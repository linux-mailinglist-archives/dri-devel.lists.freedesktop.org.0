Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E06A5868
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE9D10E050;
	Tue, 28 Feb 2023 11:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772E510E050
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:36:29 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677584187; x=1677843387;
 bh=gh0xrIdgfumEvHxIXni7sGD6rNcgr9uCbRCrTgTSFl4=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=rTHxCLpSUf8DwxxyLuSRZNT+jxYDsXjhiEn8pCpM5jI7EZ8LRRC3CqA0TOL60l8OB
 9YGKQfg2fer2giBzI3Da67Onmc6MyESJ0zCenMYlAKmGGXoiatW+CmOlhd9fTYYddH
 QE65oBSsi/SbP9OsvOLRoPc9Hmx+mPhOMFM3IuouX8KQyMDBWQsnlEJhJ7CZI/752f
 VcUOjfXZ+GtAv5/GAz/BvqpTJ1qxedtIqIOevvr7RZaO115088XrQHL6ThnPf+F7IO
 dQHtMGuwW4EEwma+uiO02Np8EdXYVtexd5+Ab2aqnhT2Kgsm6PBAJD+wt3hYIn2+yy
 6apCxUY8pLwwA==
To: DRI Development <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
From: Simon Ser <contact@emersion.fr>
Subject: gud: set PATH connector property
Message-ID: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
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

Hi Noralf,

Would it be possible to set the PATH connector property based on the
USB port used by gud?

This would give user-space a persistent identifier for the connector:
if the user plugs in a USB display on a given port, the PATH would be
the same even if the machine rebooted or the displays were plugged in
in a different order.

DP-MST already sets this. User-space can use this property to store
output configuration metadata.

Thanks,

Simon
