Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E960FA36307
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898E810ED03;
	Fri, 14 Feb 2025 16:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VXtbznP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3510ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:26:18 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-308f71d5efcso22209241fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739550376; x=1740155176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRwOfh6tgHaZL3+E0zLATKEm7zWEPnAJi4nv5EHJNOA=;
 b=VXtbznP9Ag7F0qdxyhSUlP53svvOgTkXGARHqhtO8t1xn57H9j8P2dKUdCwM45092i
 Rc5sZexw6iv9KjasNJBDm92wSZTBh0kRZAjRMhLlYNldR89BlUfhwUEJZLDdgdiyOmTt
 YaJjM0iyt2Hjjr/buraPJO/J0MQTl7jl551YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739550376; x=1740155176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRwOfh6tgHaZL3+E0zLATKEm7zWEPnAJi4nv5EHJNOA=;
 b=VQ3dIQO6Jcu8Rur6fE9vXqYKbM2mvF6YGpHg+77mXAjnfR91p1DQXqo+pMjobXMNM6
 A5x2c+uKBInjWBOFiFwXKQy3N9YFDh4/BB6bLkbonefZmCwAfd/JjpIJRpMCfx9LVIRp
 GmDEIP4dfUICsrdh/N+qSgOHYiyJTABc7V2ixIowoaJR/HLjehfEQRWVX70IfORHdeta
 GpXUviZWzfb78j2Kn0/oFeLod7opMNAOgDfwe2Nir6dJV1RjJ/3MO5cjrdQ7F46GeYtC
 reLCB3frFlvIlLam4mCvy730Q1rzJECO4rNRjIVnrJHJ61uK48hI79pV5vud/l5rsyAm
 9zUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXVR5ZescvIo5bJplkiBS33VQhl11IheblfisbpaECtW1+ZzP96y/JAXClhZQOBZP9XFGKdqQXZ0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVRXuAGRs91Ggff6IPgOorYs9371a/49jHp6YkiUWJPZB4RIIS
 vkZDEh9Liu7q6VtDc9oKNYxh+tY2GG4uistp5iX2hD5HMGZp+qiq1VNCK8RaDXQEmLzM1li+b0g
 PnA==
X-Gm-Gg: ASbGncsIgWLx2SGPwoPalcPX8nbEVagQkVmN85160ae+2SN6HGSbkwEqtQyixF5x0VT
 4IA5xk5nf7zUEa64gajcEjXTVT782Izri8M0GcFiGjL7OCrtyAoTi5gmDTxRWYFjd0gCYN6WnT9
 52XxBhNkxd5fOXg4sRlFtvM48YyZgDdTILLPjFOJCjaOwu1+YrDfbG51Ggpzr+rtwR5hOwFRGjL
 zRQwHujsd+7ZWTWSCQLCJ3gPTB3g5K3RhAt4hLh2h31VzQUjKZxNpSJhDynTd1wDv1mmfUAYtS2
 /AfTvJds+lvtnks7CA5e1KKiH6tDhHNgq5f3dJGUIf6QZm+8kJfwejyBty0=
X-Google-Smtp-Source: AGHT+IE/KyLBM9qjS1REcaPR1sQ7gCwe4wGf1NgS1WyqCQRiEyaFME42d/c3hSNibOijeHdvbWDtQw==
X-Received: by 2002:a2e:805a:0:b0:308:fec4:5a5f with SMTP id
 38308e7fff4ca-30927a2df42mr680921fa.4.1739550375728; 
 Fri, 14 Feb 2025 08:26:15 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309102bb8b1sm6022391fa.108.2025.02.14.08.26.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 08:26:14 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30613802a04so23090281fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9w/TTuplhguPAQQr4lKdEbA1C0E1fnW1PI9UTb2xdo8VWz7hkQjdqFZ1a9JQpN8iIDqMFu1XfeA0=@lists.freedesktop.org
X-Received: by 2002:a2e:a163:0:b0:2ff:a89b:4210 with SMTP id
 38308e7fff4ca-30927a2e355mr545351fa.8.1739550374272; Fri, 14 Feb 2025
 08:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 08:26:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
X-Gm-Features: AWEUYZl2UQnH588l_o4dR5jYVzX-zOJ9t0dVCpEUG6Ly_Dd5CIEQRbUnuFK0DTE
Message-ID: <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Jianhua Lu <lujianhua000@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.c=
om> wrote:
>
> A lot of mipi API are deprecated and have a _multi() variant
> which is the preferred way forward. This covers  TODO in the
> gpu Documentation:[1]
>
> An incomplete effort was made in the previous version
> to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> and mipi_dsi_generic_write_seq_multi() with the respective
> replacemts and not the rest of the API.

You didn't seem to take most of the suggestions I gave in response to
your v1 [3]. Specifically:

a) I asked that you CC Tejas. I've added him again.

b) I asked that you CC me on the whole patch series, which you didn't
do. I can find them, but I'd find it convenient in this case for them
to be in my Inbox.

The first patch conflicts with what Tejas already landed in
drm-misc-next. See commit 8025f23728e9 ("drm/panel:
xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
second patch _also_ conflicts with what Tejas already landed. See
commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
mipi_dsi wrapped functions"). Later patches also also conflict. See
commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
wrapped functions"), commit ce8c69ec90ca ("drm/panel:
samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
transition to mipi_dsi wrapped functions"). Maybe you should sync up
with drm-misc-next before submitting.

I also questioned whether this really made sense to try to do with a
Coccinelle script and I still don't think so. It looks like Dmitry has
already reviewed the first few of your patches and has repeated my
advice. If you want to help with the effort of addressing this TODO
item then that's great, but I'll stop reviewing (and start silently
deleting) any future submissions of yours that say that they're done
entirely with a Coccinelle script unless you address this point and
convince me that your Coccinelle script is really smart enough to
handle all the corner cases. I'll also assert that you should review
Tejas's submissions to see how these conversions are expected to go.

[3] https://lore.kernel.org/r/CAD=3DFV=3DWkPefg00R_TAQQA6waRqGdD+3e84JXfPLk=
2i9BRzW6Yg@mail.gmail.com
