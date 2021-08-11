Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9B3E8F98
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 13:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797CF89DB5;
	Wed, 11 Aug 2021 11:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954CC89DB5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 11:40:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so2685848wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:references:in-reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=ksE4Yef7EXrAl6J+KdDiGZXmp8mWHX+sgp2DgQdhvGU=;
 b=hol06Leh/3I710iZ5xMyw2tS3JTqSyoJHuXJNwElDQboTqLUlZsIntqhIOp0dSXL9R
 E1J7MGCo+87sHjb54u8+EMj8uDHmwWuREmO+wtcb04onD8ty3Rd/XC2+5qRXi2Jl+5PB
 OEdWcP+2lMJ4V7typjy61t6saW5X5MNXg5TOJ45lWrdgdi2cxt70/qAzeQi2/Bh8n7rr
 /n+be+41FkZ9ic/HtKhOlxLBR9By+daIkr1/LtAqV/PWDYEA5/FH8RVHe64S9cwZX6Hy
 ozKQ3xDr3gla7LOl+iKmbJnCRIv36g466A+7AHBXO3EapiLAHaRgWHjSw1b7VV12jbDD
 NDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:references
 :in-reply-to:user-agent:mime-version:content-transfer-encoding;
 bh=ksE4Yef7EXrAl6J+KdDiGZXmp8mWHX+sgp2DgQdhvGU=;
 b=QgfJw4CUGzaJ+3x0Sg43FtQnExKrGhm11EJjacL6seQ7Q4LHtSEXDkSd9RDkBAaDaS
 xpB9d6AVBVacuPgxdl+beFUg9WhpVHTOibilqyykyPKTncZhD3VgBrKkt3gB1rflMvxo
 uGd9oF7zTcty7iNSSm4NBxjpd3n5wNxP2a259dorZmoGIMCKE8uwMHVlwgqE7Uj4DtRZ
 oj5YEyXDpt0pR/6VJhAHDzuk2u/g4mYZ2iCT/EJquhmNEcRhkPJoBZjA+SfF0WPUXQUW
 bentL5Sy1qGiLB3ru554Xc3LYhtAet/P2pTihpswHmghp/YveoAdlQynVRRv9gC5X/4e
 PsYw==
X-Gm-Message-State: AOAM530Vx1m/BbHpeNCG73wk0owgJzg0L0FeiJX4ghfuZ1iasQD6XmOU
 D4oFgtbZlVDzaDjRNeFnBruMcZzQz2DcB3cQ
X-Google-Smtp-Source: ABdhPJyb7J1BkhmyH/vBw5jxoTKahdwDEBuMWx/GmGeVQ+eVFx6gThhjMVIsWhR7sH21/JurcjZP9w==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr37080466wru.1.1628682047869;
 Wed, 11 Aug 2021 04:40:47 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id d8sm27087015wrv.20.2021.08.11.04.40.47
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Wed, 11 Aug 2021 04:40:47 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Date: Wed, 11 Aug 2021 12:40:47 +0100
Message-ID: <cmc7hghfjaekbsu6e15hbolbteanadmlla@4ax.com>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
 <Af-nitVw-cgVIRn4hPB53-PwBSuaSqzaoUQA5H6kUF6BXVYJ5noiTAE6E1K0Q_aL_PxpA08bNQuxOKbSfSHQtSR-OOUtMtyrkLfSFBT7hDE=@emersion.fr>
In-Reply-To: <Af-nitVw-cgVIRn4hPB53-PwBSuaSqzaoUQA5H6kUF6BXVYJ5noiTAE6E1K0Q_aL_PxpA08bNQuxOKbSfSHQtSR-OOUtMtyrkLfSFBT7hDE=@emersion.fr>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

>On Wednesday, August 11th, 2021 at 11:43, Daniel Vetter =
<daniel@ffwll.ch> wrote:
>
>> For wayland this is still in the works, so might be good if you check
>> there that your use-case is properly supported. Protocol MR is here:
>>
>> =
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests=
/67
>
>The client requests a connector, and the compositor will decide which
>resources to lease. This may or may not include overlay planes. The
>connector you're interested in may or may not be available for lease.

=46air point

>What's your use-case?

Raspberry Pi displaying video with subtitles or other controls.  I was
thinking of the fullscreen case but if zero copy video can be made to
work to the main desktop then that would even better.

If displaying 4k video the Pi does not have enough bandwidth left for a
single frame copy, convert or merge so I need hardware scaling,
composition & display taking the raw video frame (its in a dmabuf).  The
raw video is in a somewhat unique format, I'd expect the other layers to
be ARGB.  The Pi h/w can do this and I believe I can make it work via
DRM if I own the screen so that was where I started.

>Why not use an xdg_toplevel and wl_subsurface?

Probably because I am woefully underinformed about how I should be doing
stuff properly.  Please feel free to point me in the correct direction -
any example that takes NV12 video (it isn't NV12 but if NV12 works then
SAND can probably be made to too) would be a great start.  Also Wayland
hasn't yet come to the Pi though it will shortly be using mutter.

>DRM leases are not a good idea for regular applications. They don't
>properly integrate with the rest of the desktop, and won't get input
>events. Letting the compositor deal with KMS planes is the preferred
>approach.

If that can be made to work then I agree I would like to do it like
that.

Many thanks for the response.

John Cox
