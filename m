Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968D6A99CE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C6710E622;
	Fri,  3 Mar 2023 14:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268E10E622
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:49:20 +0000 (UTC)
Date: Fri, 03 Mar 2023 14:49:06 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=dylanle.dev header.i=@dylanle.dev
 header.b="IqwEbFJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanle.dev;
 s=protonmail; t=1677854954; x=1678114154;
 bh=GE82kdhVniwQCHmSI+W3zZPQ84XQA0TdOMeq+pnRWDE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=IqwEbFJRh8Kx0oQWHp9cVQcj8La/lHRA3HdeeTq3cg3FsIeeitkFmaE1sduTdvxj1
 7AGsyZ3iXdXs+d2ZovIUjhUXJAO9zKCSBPRFiojK91Hxe7C2nyY+XIm5QJqj0/Ns6r
 8bE8kwL/sy1GOpTnqcnUScOMceOb6EBfOEH4ij95MPGm5t6Xte/EdQN1pmYY9/14s/
 0TBtuRLcfAGRdWWOvlpVrsoIv2lF4CXSmVdoM5z80XgR4cuY40kKyppNKvPYDip0Jx
 PqtJD2YW251KfLXiWqoZXBt29+F8Mq1gkP8S4kwJP06cdkUM25zQ2V2sOIVv7nnDBY
 uhYCnWcZBRrNQ==
To: Bagas Sanjaya <bagasdotme@gmail.com>
From: Dylan Le <self@dylanle.dev>
Subject: Re: [PATCH] Documentation: gpu: add acceleration node section
Message-ID: <mnLCBvF9cqw1NSMEMHVM86FfcFsr63NEB1V1q0uUFUv70_ZBHgOLgtY-qIDiolOKclKFLfcBOpWfF1Q6PpWXNqRx0mI0yoWfBD7zLPM6HXc=@dylanle.dev>
In-Reply-To: <Y/bqtlbnWkKMIJI4@debian.me>
References: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
 <Y/bqtlbnWkKMIJI4@debian.me>
Feedback-ID: 68106091:user:proton
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 22nd, 2023 at 11:25 PM, Bagas Sanjaya <bagasdotme@gm=
ail.com> wrote:
>=20
>=20
> On Thu, Feb 23, 2023 at 02:52:52AM +0000, Dylan Le wrote:
>=20
> > This patch was initially written for the Linux Kernel Bug Fixing Mentor=
ship
> > program. The patch adds a temporarily stubbed section on Acceleration N=
odes
> > to resolve a documentation warning.
> >=20
> > This resolves the warning:
> > ./Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WA=
RNING: undefined label: drm_accel_node
>=20
>=20
> Please write the patch description in imperative mood ("Do foo" instead
> of "This patch does foo").
>=20
> > I would appreciate any feedback on what should be documented here.
>=20
>=20
> I think above is better placed between the three dashes and diffstat ...
>=20
> > ---
>=20
>=20
> like here.
>=20
> > Documentation/gpu/drm-uapi.rst | 9 +++++++++
> > 1 file changed, 9 insertions(+)
>=20
> > +.. _drm_accel_node:
> > +
> > +Acceleration nodes
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. note::
> > + There is not any documentation yet need to figure out what this is.
>=20
>=20
> I'd like to write this stub as generic .. admonition:: block [1] instead,
> with the content which is "This section is empty, add appropriate
> documentation here." or similar.
>=20
> [1]: https://docutils.sourceforge.io/docs/ref/rst/directives.html#generic=
-admonition
>=20
> Thanks.
>=20
> --
> An old man doll... just what I always wanted! - Clara

Thank you Bagas for the feedback,

I prematurely sent a v2 of this patch taking into account your feedback, bu=
t I will hold off on other changes. Since there seems to be another discuss=
ion about a broken reference in drm_file.h.

If there is something I can look at in the meantime let me know.

Thanks,
Dylan Le
