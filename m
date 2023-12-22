Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433F81CE6B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 19:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC7510E1D6;
	Fri, 22 Dec 2023 18:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC2B10E7DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 18:26:07 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6d98e7baad4so91648b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703269566; x=1703874366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQCbbwN+IZ5AZDdDw8ibn0GB1x1uSwPGN8scwOmeiUI=;
 b=D+iJFjKM2qvgh3FhcmN2mx6E/8iyDHKJp8jO8jBCCb52X2E4+bEg5FF4yu6xA9vdRD
 FHzNQK9uwFcuo21PAJpv8BLNPA9n/EkkHnTSE6klzoSHaxYRfgJKfQT9Cn3ThR9MwcBA
 lc9VxlqA9CSu+0l7NUjUARUYoC7MjV1i0ZSFexABOiQ0b9JI8fTEGmxQWlNzpNBIWsui
 8nVLjR/ibVKKLHHYyYgVJwxZ4EpfNaIB1RM1i2ctu10rK4Gb/xz/PZOnvWDBrD5EbwUF
 ORwgzU3K007y00IjLdG2wqrc3nhw5CFh11tfvQnUj5aBC3pAQLSjX6MmJ3P6Ont/c6jz
 UKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703269566; x=1703874366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQCbbwN+IZ5AZDdDw8ibn0GB1x1uSwPGN8scwOmeiUI=;
 b=JCp25WaHFlBXe0SGy2yTd2IAD5KPl55En65vPQ7TTemyrct3c4zPXxnpmx1qa6Ju/i
 zeUzybByk9i4E0wl4AU89sRgq7TgJwzL6fqh9QDgv1Yd+j5aCvBnKCUV6iJfXw5G8CBk
 rBlxaQccJm8BGccuf9FAD20zVsRnLsjI1l7iYFS9BqxfrrMVikeMOwFqL97kSs4F+p6/
 HfZ5KoBZpKBn5H8dmE2QUBsjUtbq7WRFU/qa2xj6dgtFsxh78PSjmFfLH7VtwPndOU4N
 A4X47nceBYmRjytNFNAdKhkrlAeR9Vr+Wj5TMhBDPGzn1UCFjBB8E91g0BUxqTRl7ure
 Gv1Q==
X-Gm-Message-State: AOJu0YyHgUmPcr2723CAxNalJi2Y9YuRn3abvyGZOO6JRAICSjWPR0U5
 r+3z6elGOFeI9nIHg2eGAJlhTDcj/HefD1vcj6o=
X-Google-Smtp-Source: AGHT+IH5cXRrWZNDyUoWIRpwVuNnU+yNXTGgQDkhlNaQbX4AQ1uo+xOVVl4p+hpKuc4WJ5eJ/3Y8WCkWXh62pdtDPCM=
X-Received: by 2002:a05:6a20:a2a5:b0:18d:4821:f75d with SMTP id
 a37-20020a056a20a2a500b0018d4821f75dmr2871144pzl.4.1703269566543; Fri, 22 Dec
 2023 10:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <20231222-pinetab2-v1-2-e148a7f61bd1@mecka.net>
In-Reply-To: <20231222-pinetab2-v1-2-e148a7f61bd1@mecka.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Dec 2023 15:25:53 -0300
Message-ID: <CAOMZO5DV9Kev8njR5ORhUM+mxSa9WxewB3xNKjEWP4zcuTZtiQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/panel: Add driver for BOE TH101MB31IG002-28A panel
To: Manuel Traut <manut@mecka.net>
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
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-rockchip@lists.infradead.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 2:32=E2=80=AFPM Manuel Traut <manut@mecka.net> wrot=
e:
>
> From: Segfault <awarnecke002@hotmail.com>
>
> The BOE TH101MB31IG002-28A panel is a WXGA panel.
> It is used in Pine64 Pinetab2 and PinetabV.
>
> Signed-off-by: Segfault <awarnecke002@hotmail.com>

Please use a real name instead...

> +MODULE_AUTHOR("Alexander Warnecke <awarnecke002@hotmail.com>");

like here.
