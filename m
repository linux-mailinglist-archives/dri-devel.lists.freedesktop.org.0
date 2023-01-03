Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F865C31F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 16:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5678F10E207;
	Tue,  3 Jan 2023 15:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8510E200
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 15:39:08 +0000 (UTC)
Date: Tue, 03 Jan 2023 15:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672760346; x=1673019546;
 bh=mKtdn/g/y1ZjH96ZHEQJNDCDHIwvlFIZ8KkfgrjeGo0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ftEWwJ8G+V315uGAQ018ki2HVwrXuN7z65wJMz6+/q8Kjo77Lfb1sRJ1crDNqkk2+
 SGfz8czGDUigtlXUyLII+NFrMYdscVCj5nxsTvRb0AhWRgw722kMcoRkqYp8BOg+Gj
 BaSGNP4as8r+t9gNOjWYlRLb09wlJDtu9a29cZm3UWCWMl+lQfgukqRI872YhbM5k7
 Sr5JUV3RHrCAL13E9HbGa0YmeqNSTgE1OTGJfpZc039ov8T9wf7ESB1LSF72toV2wW
 P82HodTINX3wG7cnVZ+AdmUCD5qeODUBDwvxcfvDb6Ff1u8tyYBn/ZD2UQCTUnr5DU
 ZRYWVJzc10kOw==
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Message-ID: <xnufxH1XoaGhgn-6c2f0sIWqdDktkVmzwOVZqN5R_W5elPxJnzD3ZIXOzUd3vg7RcatrWvxFvElw9JF7MdduIdpAkvT4iilppyO43KEr-no=@emersion.fr>
In-Reply-To: <c7337539-9d75-49c5-286a-d94e3e78c4df@linux.intel.com>
References: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
 <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
 <c7337539-9d75-49c5-286a-d94e3e78c4df@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 3rd, 2023 at 16:37, Tvrtko Ursulin <tvrtko.ursulin@linu=
x.intel.com> wrote:

> On 23/12/2022 11:26, Simon Ser wrote:
>=20
> > Reviewed-by: Simon Ser contact@emersion.fr
>=20
> Thanks - adding some drm-misc maintainers to consider pulling the patch i=
n.

I can push the patches if you don't have commit rights.
