Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703F383CDF
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A586EA43;
	Mon, 17 May 2021 19:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D586E152;
 Mon, 17 May 2021 19:04:01 +0000 (UTC)
Date: Mon, 17 May 2021 19:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1621278239;
 bh=4f3zNv8cE0R+SyvaUvSaVpF56feCJdGYZD95hanx+ZI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=RgPNJdtojatvP7LWvbqdxCU4AaoBvPf1pR0fvIei0j8+Hc1ECr9IzEklmqfO/6hVI
 FXzNNemVeBeQle+Lr7VeaG9NChXYQW0YcE4amwcldz9O20xkVh+PAocPPBG/uPngIi
 ZPA/om1PQPq8wU6bc9j0mdBlqDZ/cXKwdf4qefdobOGitT/rieKIa+hSReHQFRTwA9
 aF4j4xNLcLSlSIAL7aqhoHyRoMwPnA0esv+sHBz0ZouXeRFVSei5ToOKveLiT71qlb
 WZrr9ERjPf8umx9Imca1O4DOfGb824hXIW7qcpN9fVgd9a2GEtRu9FzcyVfnUQ1pPA
 edbKXQTwfWa5w==
To: "Nieto, David M" <David.Nieto@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/7] Per client engine busyness
Message-ID: <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
In-Reply-To: <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, May 17th, 2021 at 8:16 PM, Nieto, David M <David.Nieto@amd.com> =
wrote:

> Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.

It's not in the headers, but it's de facto uAPI, as seen in libdrm:

    > git grep 226
    xf86drm.c
    99:#define DRM_MAJOR 226 /* Linux */
