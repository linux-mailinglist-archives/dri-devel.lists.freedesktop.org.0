Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE808325D5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF0A10E96A;
	Fri, 19 Jan 2024 08:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F1510E96A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 08:38:54 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5fa4b03f3f5so5126137b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 00:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705653474; x=1706258274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRvn5RZ1HsZd07VKkQW6gCaAtfJNR2DY0xUO7eobngo=;
 b=aJMuTpWez46pG2zBAMc7X7JENjfPpBbQWiQvzl+dAAFf69B1XJRHBGh94kWieVZJDL
 7k6SyKMR+Eq2DoGcygWPn6R7o0uB6L5iGhrWFNftGsh6myPK0USO6gE7sBBigZ36O2SL
 nrz4rB1T2oxvKscTQDSFm3EMWkkzHuc6QUBdchkHh4WWyacNZSe59K/NEWIfcpi8Ln/Q
 sNdAEzs2Yq03ltIEf8nJlu8KXAu5lXgPDhFu10xLXz8a0axqh+k4lXOwezUYTB69Dc5n
 hMqItjEaPHXnDE3U8KpUL+DvqwKO+9gKVI3eo73XhDr0RkKsRLqrAevlcAVS85EZaSWm
 ByLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705653474; x=1706258274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRvn5RZ1HsZd07VKkQW6gCaAtfJNR2DY0xUO7eobngo=;
 b=DCfDXjBTxgSdXEEN/nTjiIi/X3pnRVZQzcfpzojJqy7R661FsVBwDMcHhBKMt1WcNJ
 zgIBg4aYRLVNXDR5pzpwSM1bjaY1HEAs/8oeSNjM/l2+4e8+XqDqpIh/daWB7nrPSgPq
 n7pG+UWVw+UgIYg9FguEU0hDBPX3e2Vk1ABXRvQ6CEYNdL5wWsMaFCZ7SrNpApi+0hQu
 PQXtaUqkJDpD1Rx4EcC28kxv7O6FILHT6gCbQaWcZXFU8dHt2dN6a5YyNzjh+OSWe4Ik
 YHsSLF0juZ8chX0qJ+3ipikN2HhzEENPXQ7+z1wkqQpZrUVjRomfXPXUTS2PFSphF1mh
 fHuw==
X-Gm-Message-State: AOJu0Yxubd4zmuKw7zucEwwVDZtTK1UimyCHcSnuGtBeEnp75pUWJKku
 kAOiJp4PnpSLMnCo1fOZM59mYMn57iJJa5Scaa7eX70+9plKrI2YE8OKsp4t7SKL0BgZacbCi9k
 1PIe9dRqpwy61zbmWgon9nK5ZgxhYLQLfngowlA==
X-Google-Smtp-Source: AGHT+IGnRTPdURLUcKdtp3ipXuTkQDClms+jlN2oiOzaPeSgMjQk19zwgmWNFm3a6edHmF4HgpK7tkJsvVx/Vhghxe8=
X-Received: by 2002:a81:62c5:0:b0:5ff:617e:6edf with SMTP id
 w188-20020a8162c5000000b005ff617e6edfmr2146542ywb.34.1705653473914; Fri, 19
 Jan 2024 00:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20240116071803.5264-1-quic_riteshk@quicinc.com>
In-Reply-To: <20240116071803.5264-1-quic_riteshk@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Jan 2024 09:37:43 +0100
Message-ID: <CACRpkdaNU-qD0+4CROGJHRb0KDPqrTGe5QpM_r1ztR04EpTENA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36672e: Include <linux/of.h>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, quic_vproddut@quicinc.com,
 airlied@gmail.com, quic_abhinavk@quicinc.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 quic_rajeevny@quicinc.com, quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 8:19=E2=80=AFAM Ritesh Kumar <quic_riteshk@quicinc.=
com> wrote:

> Include <linux/of.h> instead of <linux/of_device.h> to fix
> below compilation errors:
>
> drivers/gpu/drm/panel/panel-novatek-nt36672e.c:564:14: error: implicit de=
claration of function 'of_device_get_match_data'
>   ctx->desc =3D of_device_get_match_data(dev);
>               ^
> drivers/gpu/drm/panel/panel-novatek-nt36672e.c:622:34: error: array type =
has incomplete element type 'struct of_device_id'
>  static const struct of_device_id nt36672e_of_match[] =3D {
>                                   ^
>
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>

Patch applied to drm-misc-next on top of the commit that need fixing.

Yours,
Linus Walleij
