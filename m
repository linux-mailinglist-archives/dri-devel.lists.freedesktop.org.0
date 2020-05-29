Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA11E8042
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CC96E917;
	Fri, 29 May 2020 14:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6029E6E917
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:32:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so3955966wru.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JbyC5fAny41QCeJYDfzTd1lCPMNmqG0k0vh2RwlY7Xs=;
 b=HPNWhSN6lzZ85s6fgB2okc5CL5qQ+5VTo028Ze7wUA6jOxkZlS0BLISNmSNJ4Nzxws
 IiYC4UpOlKcXmmFJYU1aorLprb8kXx/EzjyEVdZIuQd0nAJAgthY0LTKW5RA1ok1J3Lq
 ufew3Yy0Wao3alK2eFrwaHweRRPXzb8Q1adDlPK0MIqB80nJd/5GgsnYSgeLtR0GdvuV
 Rmz+sfnFh12MLYXQoRHJK4/IYANvyQoMDb4Fr/ESSLS+LppaRsuxuOW4w9xiOUbU5JOi
 +4OmkVJY2nWnXRTgyCs+x/rk8et/VkXXDQJ66wM2t39NGTx7aF2RRhSJKdI484xgh5Tg
 6p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JbyC5fAny41QCeJYDfzTd1lCPMNmqG0k0vh2RwlY7Xs=;
 b=NZzOAwmyzOR1EVzvIBIU8+YtQYRYX3cjyi/sIjfgtcQjOQlKFcOudXJxXkru5K6kVQ
 l+Di2JqfBGbHMaga935TMYyQnKqbM02cHwZFYZXrkPTaqjXdbFeeP4SgkO03fItckqLN
 SIdKAZEPMz1uzHY6Z6EG6fILGnEsnwA8fNRgpsqSJ4YAKQxHn84fOnJRqpE6B02PRQIq
 kN0TXi4TW3qoy+bmjai1kPCVuo3BUAw0Toxb0RCo9/h5CQOD6K3WiK3v8t+J2A1L1Gov
 EOTfJQBhrJWTUnwr0qDIeBB9qoni9EoVdyjWMEApUHlALG7orf7WpY/mrFwh730Jvx+f
 kjsQ==
X-Gm-Message-State: AOAM531ZUjFMEDLr2X643SyLcgrwMAwtEqPdvmxgb6rRQvOR4JuvMkiK
 15RFACYI5eQho8ktF49zfR2qb+NVH6UZ83ewKiPZ9A==
X-Google-Smtp-Source: ABdhPJyMKuJJOKGFaTigvUdp8HwF3lod9iTWorZKe7d5hCu/IfZ+vtrzZR1g+6CcoalAPwoJwQJ7xGVYG0pJ3wAKnCA=
X-Received: by 2002:a5d:4245:: with SMTP id s5mr5836465wrr.6.1590762748933;
 Fri, 29 May 2020 07:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
In-Reply-To: <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 May 2020 15:30:38 +0100
Message-ID: <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 May 2020 at 15:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> Maybe I'm over thinking this.  I just don't want to get into a
> situation where we go through a lot of effort to add modifier support
> and then performance ends up being worse than it is today in a lot of
> cases.

I'm genuinely curious: what do you imagine could cause a worse result?

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
