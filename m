Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C900C955963
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 21:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9121710E0D2;
	Sat, 17 Aug 2024 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=howett.net header.i=@howett.net header.b="zSvDKq8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F9B10E0E6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 19:23:55 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e1157e88bc9so3374054276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=howett.net; s=google; t=1723922634; x=1724527434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FyQINhQPCirsSYgI/BHpwpUDCbcDb6H8eZzj5rbq+c=;
 b=zSvDKq8pPUuWcCEFJno0TGRKMTSsYCQCIgs0w0HlRiEam3tDbXttbWHZZdaQ2/HRJ8
 4xosxDjENqfIyXOMqNn6WejFgJ9l3yw+Ao+DfDCTn3pXC2yxPH2dDa4Sb+p4wRV3ddUT
 mObcGR6YVmWnWGLHyQRSj+Gm+FF7cMT3AKAVt/rOIHjm/ybUEqZD9nxarQyNKdYpqFO7
 UpAMKqsq18Q884glyOU3uLX/sepsLQ3zoqtsIoKLajKHWhAMkq4/4w7RydahHMMGaRYg
 XlYoAYav8kQGZt8JI7E6PhyVQwEejIzceza6B+YdLaP8qKfomqoRgVfxTkFGsyYRqNGd
 1tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723922634; x=1724527434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FyQINhQPCirsSYgI/BHpwpUDCbcDb6H8eZzj5rbq+c=;
 b=ErnAvMx8aQG/ZPNty1YrPpRYEk9YqTh8upLSHe9Vw2TsWUlHbOOU3bS5f9Cdak+mVM
 UvVmgtG68qGecy2MgyUcPjHjONi85GK4ctQ5o6MEKlY2MISFemFKaIxfFDPFdXvCkOww
 Uca64BSjb9rtGVWS4V5CVa6IM+9nSTw9Zz1ICugtz+UEhKgVNJF5zK8cHh72F444S0q3
 XpNpVbTpAWLSNmdP5uNyIxP0nn4PNMoxIU19jP8AvnzOECeGRHg1/Dh7QtkO71BPo3/H
 O5oRRSaCST3SKXGhV3n+VX0r/pqDo00uzACd+vUzrOr+frw39vKPuYRV1YUS3siQzWNi
 X1HQ==
X-Gm-Message-State: AOJu0Yz7eIn4HiZs2SssPGLqIHOJ8cxy0o8b31Tnhi0scRoJq0hGo1Kp
 a/C6WgYwhU315qrUSka6nKI3fQukcvQ/InVoafyyqx56K4JqYe9RTLRdMZxjjDQCo89k2+BuTpQ
 6I9OP2XyW55hZM+Fk7Jykp2RIEg8qJpuj39KD
X-Google-Smtp-Source: AGHT+IFxnlIgkFr84OeRJ8oiSVn8hoiYx79ww1a+q4oEMCPZ69AuUTfuG22NDtP+s0OqXkOHpjtpMUfOEzFvswWtKQE=
X-Received: by 2002:a05:6902:a08:b0:e13:83fd:cf01 with SMTP id
 3f1490d57ef6-e1383fdda45mr5567723276.49.1723922633924; Sat, 17 Aug 2024
 12:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240817-drm-add-additional-framework-laptop-displays-to-panel-backlight-quirks-v1-1-cfdd5dbbffc8@howett.net>
In-Reply-To: <20240817-drm-add-additional-framework-laptop-displays-to-panel-backlight-quirks-v1-1-cfdd5dbbffc8@howett.net>
From: Dustin Howett <dustin@howett.net>
Date: Sat, 17 Aug 2024 14:23:42 -0500
Message-ID: <CA+BfgNK9PEspi8=M2YDC4Kc43+JcEo2iej4Q2K7O2r9X1=X=OA@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-backlight-quirks: Add Framework 13 glossy and
 2.8k panels
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 17 Aug 2024 19:28:20 +0000
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

On Sat, Aug 17, 2024 at 1:59=E2=80=AFPM Dustin L. Howett <dustin@howett.net=
> wrote:
>
> This patch depends on
> 20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
>
> I have tested these panels on the Framework Laptop 13 AMD with firmware
> revision 3.05 (latest at time of submission).

I apologize for the noise. I built this against Thomas' earlier patch
version and obviously did inadequate testing when he submitted v4.

I will follow up with a new revision after a little while.

>
> +               .quirk.pwm_min_brightness =3D 0,
                   ^^^^^^
This is clearly incorrect for the updated quirks infrastructure.

Dustin
