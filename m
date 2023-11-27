Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0F7F9BE6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2410E02D;
	Mon, 27 Nov 2023 08:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678010E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:39:29 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5cf57a493d0so11983157b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 00:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701074368; x=1701679168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGuTrQtJmC2L2mzLaPy/bZacJMxGnwxM8Kv0t6QXz2o=;
 b=pejiFBGCH++n/ttF8H/70E78PL1ldSsynJxIvJ1NY6r08qWNeEcv4cO/P6ZkouB1T3
 EZFH8mrZ4oG3VCkqqRHF+IKIPGuso3uPBU8yk2r4TRVk5kyxaONHRUrsB2aKMUY3zHf1
 KeIg2nzQKNBqiCa6Xm2dDiBOyPYTrrutLNuSvX3sfhbKYJz6S4mfQlZxWuhhVH2gBkjL
 +LADrMwoHQNei0LKYtO2Jw1DZEC8Q+rV29t5zgCvZDK5zuoRzOjLVifC5foeZVQbrFG0
 EcF2lBNVJFpJBkBjtFrdA8XZ0+wHBVYQquFZVVb7JptK7ObDJaVn/yqqUk3YU7s6EVe+
 U77w==
X-Gm-Message-State: AOJu0YyOdg/7eJgkjSNoS7AJdDKIiT9vN31ZGjnW1gc+QBlUw3HGKFbF
 4hYBkz2Q/Z2JjD47OopAY8kIvo4ij1mfcQ==
X-Google-Smtp-Source: AGHT+IH9dRaX9j1D/h3xo3mBakYSelWEY3bKNpauPDKHxpcUKB/B2gNHoomnU/pZGvgsd+l1jnyEbQ==
X-Received: by 2002:a0d:db10:0:b0:5b3:b17d:190f with SMTP id
 d16-20020a0ddb10000000b005b3b17d190fmr10875086ywe.29.1701074367974; 
 Mon, 27 Nov 2023 00:39:27 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 fn10-20020a05690c340a00b005d01c297bc9sm834063ywb.1.2023.11.27.00.39.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 00:39:26 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5cc69df1b9aso36560107b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 00:39:25 -0800 (PST)
X-Received: by 2002:a0d:eb07:0:b0:5ad:716b:ead3 with SMTP id
 u7-20020a0deb07000000b005ad716bead3mr6535204ywe.28.1701074365164; Mon, 27 Nov
 2023 00:39:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700668843.git.donald.robson@imgtec.com>
 <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
In-Reply-To: <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 09:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
Message-ID: <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
Subject: Re: [PATCH v9 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
To: Donald Robson <donald.robson@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Donald,

On Wed, Nov 22, 2023 at 5:36=E2=80=AFPM Donald Robson <donald.robson@imgtec=
.com> wrote:
> From: Sarah Walker <sarah.walker@imgtec.com>
>
> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

Thanks for your patch, which is now commit 6a85c3b14728f0d5
("dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU") in
drm-misc/for-linux-next.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,am62-gpu
> +      - const: img,img-axe # IMG AXE GPU model/revision is fully discove=
rable

Why the double "img", and not just "img,axe"?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
