Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A659F4AE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 10:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE4610E0A1;
	Wed, 24 Aug 2022 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B14410E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 08:02:41 +0000 (UTC)
Date: Wed, 24 Aug 2022 08:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661328159; x=1661587359;
 bh=ZVuKNIhQtHPLxs7Vlbsgf8gvrDISBJJKVklAVx2wUgA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=P7QqH9EysCjHzVtqC6tPW7vUdmgWQpz4reGktchkNUTPpbFIyYAF5aeO/a0wmDF3r
 id/MSPLFwMeLGto/0Q3qtkHSjJwCXnc4do7uiGf/92RwcOZ82nEI48FQ3mTc2PlZi+
 h4/G0bAkRR994/Mv+T1P4Hxc0ndcSMUYXXfEN2kfnlZMkIR9RZATWnqBS8MiXB5hc6
 Ua9W7qttTY72EtJTmgTsj6hfXSmpR1NYgfXGzELvfU6Re3L6bnOpJ6fcDOCRkAajey
 Gb/DHjKpSWe7birA4x0qOH7lPS8RpXp4xLbflEZ8ZY3+69bOkItzuNX9Lz5VBIWcRk
 yiieDKOh7iXSA==
To: =?utf-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: Expand max DRM device number to full MINORBITS
Message-ID: <iZUuSfDNvqc_qcWivCeUNyKzQ91mykNMLfbE205fylYTMxTkh4mCNzftDhsBDZX3QJwEd9bG9RGHD5QnHlyfiOz4BJDCZUriwoT45S6eAJ8=@emersion.fr>
In-Reply-To: <20220823210612.296922-2-michal.winiarski@intel.com>
References: <20220823210612.296922-1-michal.winiarski@intel.com>
 <20220823210612.296922-2-michal.winiarski@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This approach will not break existing user-space AFAIK.

Acked-by: Simon Ser <contact@emersion.fr>
