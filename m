Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6218690ECE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 18:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9010E0DE;
	Thu,  9 Feb 2023 17:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4D10E056
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 17:03:34 +0000 (UTC)
Date: Thu, 09 Feb 2023 17:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1675962212; x=1676221412;
 bh=vCvCm4zvHaVmosobR79bwhctMyOD5K8CGlU9v/VJu9U=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HGPyzlb1BPEknFv+W2hpg71t4z5EBGULNXNVh7P6gwS+L5tTLt0AIN+D027fcdo/W
 g1RBEeyG9LovHy9pe1561/Itdbjr4rJMoukAqGXbRrhhw8T0ZkqBrKTmN3lHLuC/JE
 OgizxGdncZVDhb1ahQ6UqQtqyr9SzjQhteIxQpdF2UeFxz8/hY9TIygyfaMjI7H7ke
 ytmDMkOJgaC37coHzH85nIuO8YUUhxk335Va8YCHmYeRjPnY1aaJQiD8XUYTq9429M
 iBG3wKZyk/pFAFsm8n/IynjrL0rgmUCd3wRlan0arFoSab12OsOHX1WHN5aBy/sh0n
 +6v1z6/qGIJlQ==
To: Joshua Ashton <joshua@froggi.es>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
In-Reply-To: <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <20230208113041.70691449@eldfell>
 <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 9th, 2023 at 17:38, Joshua Ashton <joshua@froggi.es> =
wrote:

> > I mean, the strings are the uAPI, not the integers, right?
>
> Both are uAPI these days.

Yes. The integers are uAPI, if you change them you'll break libliftoff
users. There is an old thread discussing this somewhere. The tl;dr was
that there is no use-case for exposing the same string with a different
integer, so no good reason to justify the substantial complexity of
handling this case.
