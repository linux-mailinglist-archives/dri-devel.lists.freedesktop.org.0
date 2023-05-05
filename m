Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54056F8A48
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 22:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEDF10E673;
	Fri,  5 May 2023 20:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3D10E671;
 Fri,  5 May 2023 20:40:36 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so30688385a12.1; 
 Fri, 05 May 2023 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683319233; x=1685911233;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9QsNDou7mlHaj85ZlDFPBKRiMv9IerPle+CduOEa3z8=;
 b=cGuJ/lwrG5xg6vNNQLTKPKXdICNoonsdqT+9FkgkNSnoyDQBWcZUFOcNI5MINts5AG
 v8W4CaciD6zP30PsNMPBiopIcN8FYueVR/uAPt7QA3wklorrmN6qZF5gZM6i8T7FOOGi
 9bJFDrXOSzdVURaTyFqKXFyTfMKZv+HlLC3lhX+B0pzVDVgS97a+vr7TZ0UMKYWCUv5B
 7L7BcTdM9HnNL87byR0aeY0QZr8s8MIsPsHDN+Zj11QSwwakOeCIjtmACu6ufTLXIZOs
 NLV7t5QT6BDuMTXPIXvFKz2mqpunzJmf3BlGeh0ptyIthO9FPzHn6HCx6/Yol4pgY8IV
 IYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683319233; x=1685911233;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9QsNDou7mlHaj85ZlDFPBKRiMv9IerPle+CduOEa3z8=;
 b=cWRV/nkTaNqauxIpDhqqOfZYljNZrglqlsEkFSWUrH1LdUJL9ED+wXPRKK5TAUKFlm
 RsUAnRQVlV7aobIyZ3X3RB8gXpOQEvItqCs7yvnc26jDyzbaK+zPKyDk64Ws/pqqFf2v
 fSPn2KzzMCwN7QGQ1aMa/R/CaQkB91e1YWBIX2dhxsAowrFhp/czz70vK1M5v6SJSusv
 WMs4bTG9nNq7Q+N8NWhMKWYfx3IbPgV/1wSfcjG/pYeI0dMnziiuylyP/PB67zpSHl+3
 4K4SOvuGATb1Qyjr2zhRCfqoOpZTknCIvWfeNyQDjWodyKJpzZrjMu9L425rfhk/Jk8Y
 neHQ==
X-Gm-Message-State: AC+VfDzq+p9p51QdR6rkT4Wvh40nSi/reADWSUYy3rJDZsjLfceWPtlJ
 IM4B1vdCrUC1+xPq6US8cZjsZkojvpW75gof1IA=
X-Google-Smtp-Source: ACHHUZ6HG1HmDRGqaz1AzKB6SKomGyV5dBfjni9DTXv4mPiCB3Wiy3Kj4Xf3qSb8E/GltWQP+KYU7yqGTHG71dAyvWo=
X-Received: by 2002:a17:907:1c10:b0:965:6a32:4511 with SMTP id
 nc16-20020a1709071c1000b009656a324511mr3364701ejc.17.1683319233009; Fri, 05
 May 2023 13:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
In-Reply-To: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 6 May 2023 06:40:20 +1000
Message-ID: <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
>
> Hi all,
>
> The goal of this RFC is to expose a generic KMS uAPI to configure the color
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new uAPI we
> aim to reduce the battery life impact of color management and HDR on mobile
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.
>
> This proposal takes a prescriptive approach instead of a descriptive approach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate exactly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color management
> policy.

I'm not 100% sold on the prescriptive here, let's see if someone can
get me over the line with some questions later.

My feeling is color pipeline hw is not a done deal, and that hw
vendors will be revising/evolving/churning the hw blocks for a while
longer, as there is no real standards in the area to aim for, all the
vendors are mostly just doing whatever gets Windows over the line and
keeps hw engineers happy. So I have some concerns here around forwards
compatibility and hence the API design.

I guess my main concern is if you expose a bunch of hw blocks and
someone comes up with a novel new thing, will all existing userspace
work, without falling back to shaders?
Do we have minimum guarantees on what hardware blocks have to be
exposed to build a useable pipeline?
If a hardware block goes away in a new silicon revision, do I have to
rewrite my compositor? or will it be expected that the kernel will
emulate the old pipelines on top of whatever new fancy thing exists.

We are not Android, or even Steam OS on a Steamdeck, we have to be
able to independently update the kernel for new hardware and not
require every compositor currently providing HDR to need to support
new hardware blocks and models at the same time.

Dave.
