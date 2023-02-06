Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232068C2C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 17:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFED310E412;
	Mon,  6 Feb 2023 16:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9D610E412
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 16:14:53 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id e6so5226939qvp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ihwWvmM3PQe5ufFnOBU/DesfdhMbRFj4jfVbEy0lOpI=;
 b=XA/YKDBcVWQZbeVnqd8yc4/KsZWE4pJVA+T1us8o2xGjavL/JdSTMsQNm9/0w/G8qs
 arX+cUDFhFPzVTt2wHqggZ+ig7WZ59i59dbEXpAhuAAY7zy9HZDYv2Nstqr9ic6eweEx
 otPASZ7mX90Qk/p8UNSwCA4cmJA0z3aTS9w0ApzPERvebQ+jLB7iK4eXDAkwJ+YYhS84
 quQxNf0qtDXa9bYBSUCQAjZFcVbnz4KhndR+QHjgW1eHC+eIyKgijaOvN86ewKp/Yx4w
 SFb/TKWqyMcyckpwn0Y85X6QKKIzXLL2b5WunqEitBV/KpnAdCD30eogl9qwdJ1lyGaI
 BSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ihwWvmM3PQe5ufFnOBU/DesfdhMbRFj4jfVbEy0lOpI=;
 b=ISJrxp3NUDQBSspPyhkQ0jA1M/pKhINorClzOtqgiA8npc3p1bsYD8fiFvG+qkUJcL
 Erov6B59jpx82LXLBJvpBcekvWjy6P+rGugDmKbkONbSz+wfwXDk3Xpy0pG4UXVi1ANw
 76G94xKRsjkF4qBSkU5cm7z+nUnCKMuGRbB+2n+E3mt+vQsoQQklQl0kvzcgZFFqMoZj
 lP3Ytt0tut/jNaU55OcT/nUQqLOz08zO/E+i+QkfMMHV0dLj+wxz7j8yar8bctar8Bfv
 WxEF6rt3QjRIBd2Be+S+pYFAIIHPgUK3wsYfR5Ih5UX46EawKfVyGvxtZ6BCViHsgXUa
 wjcw==
X-Gm-Message-State: AO0yUKWvCcswWjScKTG5Y5CIFvUNVUatxVpcQBDX4XTVC6n3MiBCZ1k6
 lr7kG/Z02jo4+WdH78kgrNkOse+PTynuuyxcuoylWA==
X-Google-Smtp-Source: AK7set8NhcLpe0QqZeDlnb9EINzY4frNALG0zMMpRDnSjJpka5bHVlm/ebtEEG1wc0RHlH3n/Pu735bATg9Dbl/JDT8=
X-Received: by 2002:a0c:e0c8:0:b0:537:7741:5b13 with SMTP id
 x8-20020a0ce0c8000000b0053777415b13mr1132857qvk.82.1675700092421; Mon, 06 Feb
 2023 08:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20230118132213.2911418-1-s.hauer@pengutronix.de>
 <20230131080928.GG23347@pengutronix.de>
 <3C4B67628F8D73D6+63ea74ac-b8a2-45b1-5f92-8c7868906687@radxa.com>
 <20230206140448.GB10447@pengutronix.de>
 <20230206154851.GD10447@pengutronix.de>
In-Reply-To: <20230206154851.GD10447@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 6 Feb 2023 16:14:41 +0000
Message-ID: <CAPj87rM4dUbpy4qV3bnB3HgZ-Amui9f38MH87iGMBC4WXio2Lw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/rockchip: dw_hdmi: Add 4k@30 support
To: Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

On Mon, 6 Feb 2023 at 15:49, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Mon, Feb 06, 2023 at 03:04:48PM +0100, Sascha Hauer wrote:
> > I guess a first step would be to limit the maximum resolution of vopl
> > to what the hardware can do. We would likely end up with 1080p by
> > default then for the applications.
>
> I did that, but the result is not what I expected. Discarding a mode in
> the connector means it won't show up in the connectors list of modes.
> Discarding it in the CRTC though means the mode is still exposed by the
> connector, but actually trying to use it then fails.
>
> This means when discarding the mode in the CRTC the screen stays black.
>
> I am not sure where I should go from here.

You've done the right thing. Userspace should detect this and try with
alternative CRTC routing. The kernel shouldn't be trying to solve this
problem.

Cheers,
Daniel
