Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151EA8CC250
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4022910EA87;
	Wed, 22 May 2024 13:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="yvIGFZrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8197110EA87
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1716385240; x=1716644440;
 bh=wtv5GehB0RNRrwKNMSpWWR1rBRSVtWsYLFCegIScuU4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=yvIGFZrSL3iRU85LAzfwzh+uq0jLCjADU6LMEGnjMcGt++u5/NLIlJG88CSeTIRcf
 GPHdN9aBbDdIBmDReF13JTw6whWLxrYdcN0y0DLD7b2XyIHFcoIZu112gaPWkTiop9
 9N/28V7OxshKIW5zjoaUo7dYNXP58prPUvRtEW7bF2Byi1O5XQxLpTE7v+vsMmhMsj
 S37g+lawcenjPzcgC6vZF2FwovTw1QBhHXJfxIhw+z3hFV3y2SxlBqrYoipBcVUhNg
 OI0R4GzDpatz7CDja0Q6bd8q7alaWZx2gzFAzSx0rMeyvVOMOJdesZW+WO+q2m2yRg
 cCT7AA126qLgA==
Date: Wed, 22 May 2024 13:40:36 +0000
To: Mario Limonciello <mario.limonciello@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Rino_Andr=C3=A9_Johnsen?= <rinoandrejohnsen@gmail.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <wayne.lin@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
Message-ID: <1XiLpoWd2E_COrHNl9BYkmCXkUKK6Bv1wibdFxiw3Vi6AQOPAIhrIMPNEZmmKAp9yxC8Er4DEMqOqjshMgRqtpV3UkS7MN2OjCsDjllvdRE=@emersion.fr>
In-Reply-To: <666e36b7-5379-46ef-a16b-00ec499fb42c@amd.com>
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
 <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
 <CAACkh=-B-jH6g7KY7Nn_7Y_+gHPQ7G5Z5AZ0=a=_ifjcmsorcw@mail.gmail.com>
 <86410711-9b88-448c-9148-109f81b1ca55@amd.com>
 <CAACkh=9hY7eg_uuH7Psm=XJfSzwQTvzs8bvOXQ=wwkMPrC44SA@mail.gmail.com>
 <666e36b7-5379-46ef-a16b-00ec499fb42c@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b585325d54e6bc294fd23a41f27306f095acabbc
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, May 22nd, 2024 at 15:36, Mario Limonciello <mario.limonciello=
@amd.com> wrote:

> > To be perfectly honest with you, I haven't given that much though. I
> > used the 'bpc' and 'colorspace' property in debugfs, since I could not
> > find that information anywhere else. And since I also needed to verify
> > the pixel encoding being used, I added it where those other values
> > were. That made for a simple and easy addition for this property.
> >=20
> > If you want me to do this differently, let me know. And please point
> > me to the standardized DRM property where I should expose the values.

FWIW, there is a patch from Andri to add a similar (?) property:
https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is=
/

The patch also allows user-space to set the "pixel encoding".
