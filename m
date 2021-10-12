Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5742A236
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4D96E8E2;
	Tue, 12 Oct 2021 10:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEAB6E8E2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 10:35:43 +0000 (UTC)
Date: Tue, 12 Oct 2021 10:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634034940;
 bh=Se2A40hn6I4G+AuhxZClaT3FV18pJ0SfX4EJ5oqmlpA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=IkGogsBlGDiz3l3ArV7s7FpBRvFCFdOLIm0aHBri7MSkraYQECr9XjeXnvEYaX29G
 HhXf6QPSX2Sv/YV2gaS1lQMRQMe26+c/eVuyDY3i4AnGF22jb8u5epCLpn9IoMKMVa
 dJFyU/f4I3K8cMDVHSljUZnJU53v2vh3JWd8LhzQ/VFf1h2GPdGOkqZe0N0MBQJRCd
 hqQ8Gn9xMUFwgpWeCmczxiEkxBWVRsiUF3qyJ6uVo+HFGFrHGRaU3BnXx0YBk0LAKX
 jF6IBuheB4ZwgLuyRH0RrMQCZbb8EZUsFNV8dDXaYkAEnkOsJth0rURPJvOOQiwExf
 3s2W+nOFWf26A==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 ville.syrjala@linux.intel.com, brian.starkey@arm.com,
 sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <vBmviRgvVBT-q8HSsJLnRc5CfOMr5rFRj6oeIqwh8QJSicQzQxu8_ORxE3OffANSSyF3wUF9_QFRk1uzrggdx_dcI-1WGzmruI4kIFdZQcU=@emersion.fr>
In-Reply-To: <20211006155559.606521de@eldfell>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
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

On Tuesday, October 12th, 2021 at 12:30, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> is there a practise of landing proposal documents in the kernel? How
> does that work, will a kernel tree carry the patch files?
> Or should this document be worded like documentation for an accepted
> feature, and then the patches either land or don't?

Once everyone agrees, the RFC can land. I don't think a kernel tree is
necessary. See:

https://dri.freedesktop.org/docs/drm/gpu/rfc/index.html
