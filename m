Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A443125D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F2D6E992;
	Mon, 18 Oct 2021 08:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C876E992
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:44:35 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546673;
 bh=qGUM41flb5+gBAWMD4QgtUTe+pTfnzjpVf0tktGETZA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mbjXEl+P47E+ZUV9NaTTQn+8GImOTsdTAYPlJrAIUElcYPZGA2yJzKiWOmakfgLBh
 RPTLYhQE8hdDIKVn1kAKifnnEEEgFjjHi/D1qmDAPxyoQyvw8NSU49VYnD+qZY7oVL
 g+NBOxTSV47rIhCXnHmkLpW8V0vGIE8uyeei+mJm+82w73uNVfL+/4F+60/CUzszjO
 vKAc5q+19M0MViqVSFL1H/gwxLLayJV7Xhs1v2M8OXPD6U6EpDQv/tw8cF/SKgT2zH
 1ajdKLNU6Z/QNVc3IVpD+8sbAF5k1Y7v6A3cpizUY9Ohk6PyjLsMBYgT++QbqrR4ih
 +2NwR6fpc7vvA==
To: Maxime Ripard <maxime@cerno.tech>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <fYz9fUN9q8YpyyIbD3tg7IJQ6hKLoi0nTSOrdO2L4dk_y8SxNVcv_dCJwfzM7WYR2Cm6UtmGhPtE69JWGyhWsuzg-F0KKiaKOgeiOoX2JNQ=@emersion.fr>
In-Reply-To: <20211018081509.bnvagntxwa6qk3fr@gilmour>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr>
 <20211018081509.bnvagntxwa6qk3fr@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 18th, 2021 at 10:15, Maxime Ripard <maxime@cerno.tech> w=
rote:

> I guess we'd also need to update drm_connector_helper_hpd_irq_event ?

Good catch! IIRC this function didn't exist when I first wrote the
patchset.
