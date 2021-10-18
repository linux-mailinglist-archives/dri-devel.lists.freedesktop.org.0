Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EBF431257
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AF16E994;
	Mon, 18 Oct 2021 08:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065CF6E994
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:43:33 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546611;
 bh=xVzxSThwuCYxypRO1noS3dTiTmZZ0TSHC3n/XxTz7FU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rrRopEMiEhIVYvT4U79RBMWJoR9hcSgAFG/otryCD7+YPOeDlhnFFaS6zo6zl9VGU
 q4Mz14+la6WpUoexYyXUqEfnulLXPK4nJz0QS9UspfKNj4nnvy6BmoHH78PHmridjP
 tpOEwd6Umh+N5e2s4/ywhaUYaes2oUBDbZC2DcU8CzYnTcFYRdQTY2wLdt4s2r4TD7
 1KLgF02rMfIB3OIHKDX1sdkQvBZlmlvpFWo1pnrDuZWSTgikdjTcjX1+cJRx3NxSh/
 kOtswLwDv59s7u1EKFwTgcFe+YSaE1r6cPJqRQWIvLNQO6SH6yKvwfh71+BJZEM9N4
 kfy+Mv0EfIyPA==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <6T7qqa9JzVILp5JyhTC6jR6_pBys3tn46H-haqMLPe1HPpfZdPH0_lNlZTLvKr8A2k1rJ7QKbdW3YBUN-e3v1Oelo0BWgkBhnkYPDVwc-v0=@emersion.fr>
In-Reply-To: <YWnZhWxamYafxNd2@intel.com>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr> <YWnZhWxamYafxNd2@intel.com>
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

On Friday, October 15th, 2021 at 21:41, Ville Syrj=C3=A4l=C3=A4 <ville.syrj=
ala@linux.intel.com> wrote:

> So many things that "changed". Would it not be simpler to just grab the
> first changed connector always, and count how many there were in total?

Indeed, sounds much better. Will do that in the next version.
