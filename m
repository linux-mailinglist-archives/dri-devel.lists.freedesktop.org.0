Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F261F098
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2481A10E2AD;
	Mon,  7 Nov 2022 10:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184D10E2AD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 10:27:09 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p184so8412161iof.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 02:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oj27jMBYImcEgK1ti/jFGyMv4msqcOaJmd+TiHUll9U=;
 b=jO5TaSfKzGIVJuX1MgLZDs5V0yCdjIRbQRBr7Ro6DqImhv8tGFDQ56w36Mdx3nBIcN
 askVI4M213TD6ln+9lmoO64SbbTfJjrHpGJ3bZURGUha1e67Pxn81vbCFfxtlGwLV8im
 4ny93h2npR2Gkc50J5eyqDDlTzsXOTdlg6msc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oj27jMBYImcEgK1ti/jFGyMv4msqcOaJmd+TiHUll9U=;
 b=ySZg3dxkGn0awWCwfEw0+k7JRaxKfZ8cVfDbkzJteWskU29rK19GMXtwHLa44Xwa0e
 HWZPxdUkGcgHphF6aHeVbOXavTfVEFCi0exEGuGX19tpaom1GINMG1V8qtwP0lSbBuxD
 NEyTILVc2cEbR4Aj2wq8WES0LPGK4FRuvDn4SxbG4jV48rPHyX+42nYPcL46xtVxjMIz
 ziARV1IA4z+HJFpCCmcAj777XiP/7rwk4FrRT3XmQlg/Eojse68DyuvXcKiRK1wIOP+l
 mGTlNSyZUhSOPIj8OukkKGApY922rfg2j771vKonQ4yWbapASP1jze4GZIn+EvIXjbd8
 uw/g==
X-Gm-Message-State: ACrzQf18oigvLsdAIecGBUisyUwIeoZOPqPDJIUIAdodoO2S5DE8A0eP
 s2Sw4EWsyys/hY1wlhHAKu8LErJLFyYq7cbPGaTMfg==
X-Google-Smtp-Source: AMsMyM4OwacsZO+65wkB4qezwmRn7UvLD08VvEFQBTRVLREZ/Daevo9D9XVgFTZ//JE9lWzx13Ce000QYaQWd2ZS8Eg=
X-Received: by 2002:a05:6638:e8a:b0:374:f6c5:cff6 with SMTP id
 p10-20020a0566380e8a00b00374f6c5cff6mr29952404jas.187.1667816828536; Mon, 07
 Nov 2022 02:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
 <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
In-Reply-To: <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 7 Nov 2022 11:26:57 +0100
Message-ID: <CAKMK7uFWv98_miqCAVWYVnZZ_V_fL0FSBc6uv0x48ZMrzLQhbA@mail.gmail.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 10:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.11.22 um 10:30 schrieb Maxime Ripard:
> > Hi Thomas,
> >
> > On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> >> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> >>> I've discussing the idea for the past year to add an IGT test suite t=
hat
> >>> all well-behaved KMS drivers must pass.
> >>>
> >>> The main idea behind it comes from v4l2-compliance and cec-compliance=
,
> >>> that are being used to validate that the drivers are sane.
> >>>
> >>> We should probably start building up the test list, and eventually
> >>> mandate that all tests pass for all the new KMS drivers we would merg=
e
> >>> in the kernel, and be run by KCi or similar.
> >>>
> >>> I did a first pass to create a draft of such a test-suite, which woul=
d
> >>> contain:
> >>>
> >>> igt@core_auth@basic-auth
> >>> igt@core_auth@getclient-master-drop
> >>> igt@core_auth@getclient-simple
> >>> igt@core_auth@many-magics
> >>> igt@core_getclient
> >>> igt@core_getstats
> >>> igt@core_getversion
> >>> igt@core_hotunplug@hotrebind-lateclose
> >>> igt@core_hotunplug@hotunbind-rebind
> >>> igt@core_hotunplug@unbind-rebind
> >>> igt@core_setmaster
> >>> igt@core_setmaster_vs_auth
> >>> igt@device_reset@unbind-reset-rebind
> >>> igt@drm_read
> >>> igt@dumb_buffer
> >>> igt@fbdev
> >>
> >> Maybe we make this test optional? At least sprd decided to not support=
 fbdev
> >> at all.
> >
> > I'm not sure we need to make that test optional, or at least, we should
> > run it all the time, but skip it if there's no fbdev emulation, and not
> > report it as a failure?
>
> Sure. I just meant that fbdev support shouldn't be a blocker. If there,
> it should work of course.

Not supporting fbdev looks more like an accident than intention here,
and maybe a good reason to have these kind of must-past lists.
Eventually, once the i915-ism is worked out of igt well enough for a
set of tests at least. The drm/ci effort should help in building up
that list (by essentially extracting the common set of tests that
everyone passes and graduating that to the must-pass list for kms
conformance or whatever we'll call it).
-Daniel

>
> Best regards
> Thomas
>
> >
> > Maxime
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
