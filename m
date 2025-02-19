Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219FA3BE51
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB7B10E057;
	Wed, 19 Feb 2025 12:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QDanW54g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934210E057
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:40:16 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-307325f2436so56852601fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739968814; x=1740573614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
 b=QDanW54g26j7FSRQCerHw7jpRYgKja2L3ayUjokimdo9tpVRsUfntUZdG7mK1u3PVP
 9QtKOfFkMnk7Ch4EilRXntPUa6tKstQTY4nHpi7sy/rSUUKY7eU9qo/YufwIriK9+tO3
 SbdVWL2NhokZMMbGyQxFJP8IdpLSCK3sR5dHoUvtkwqh66V8O0rBxRpM2MWFcsog/1OM
 dweQJzGLAHz4qdJTcArv3/6H3gPIzWOV1bw7JeqU5elDSe/0/w0vjiwY64lk/gxZ+Bgy
 UlAYKWlJbDySS+g8Uvy06Tscmf9OrmyabCR34dpxnrynH+e30l/dw7C54NyHQz7yBNoL
 W5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739968814; x=1740573614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
 b=g8SO5Yq97UyAPqciSD4EM+XvajHLYtyuz+lYc5kSpX/bzBD9VBbzhiBpM7OWc4VS6U
 vwqJ2M/tRHSyXTNL+/sskBnaBrhmUpdnDdX78BOOsPze4JjtyDg4mW+h08LkkhoF94gg
 gWl1wcuMB6jLMivahqo0HSnioVw4TtrRoamvZG/h5+aDxml6aRZdc6t8Xt5Fu3UQ7nCy
 qyjt03hanWEn19NCB/rdQitqAG2Y9TX4EUuOIeNF4GQ3WjCSASDTGfsM2fgOtw7GC0ub
 +iU3UlI7NpKAqgBkr54q1Yh/8jwcOblG/tMsxKxg1xYsXBkyZrrME+2WAVFj/Op5DPZ2
 xFnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3iu4Hr2rO8aj4Uv0sfvv7sJBcMiMutsor7gonXS4gHZwUJTLQXVislWuY+acAUzaGm1Pz0HYMudA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx4yUK8TOZPrtWEvjn+JHbiFwOgCaart+9LwU9GtVkRE2otMTQ
 U51yhrguIGplCIWG5xQX2ClkjcFIFwXowkLPfuIWi3fg/MZL0NC29ZP04GnYfQmonPpkk27iJBI
 buSpmLqbCY4IajyL63X9uStbmzHQ=
X-Gm-Gg: ASbGncvHl3AXbOTZgeZUu2LKoNFUq3AA6NdcwDWXoctGkpsvA3jqsBbfdSMGcSmxOwN
 63D+QVAne6izD6XV2VA4nKdk5RNSgb/DSaa61f5L5CTgV0r9zocidCDqEDRh6I2r/P0wZCUiRGY
 nyKsuzUxm1+Dz1YqFSVcdrA/fPfAk=
X-Google-Smtp-Source: AGHT+IFiEAAmOQeNiwKM9pYHoGOeRxDwt6aWpRp0aHFkiqJ/scb58wtITAVUYzMW7vzAfCPPDIj0kMB/lDvHjfDXQ/E=
X-Received: by 2002:a2e:8810:0:b0:308:e8d3:756d with SMTP id
 38308e7fff4ca-30a44ed1da9mr12054681fa.19.1739968813787; Wed, 19 Feb 2025
 04:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com>
 <173073495749.210192.9138587910771237679.robh@kernel.org>
 <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
In-Reply-To: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:40:01 -0300
X-Gm-Features: AWEUYZkvUCi3PRNaZjpqQ7zkYqcKxcjgv_RBbFS6LFh_ywtWOQiG9QgEhk9Prp0
Message-ID: <CAOMZO5BJy2B0Jy-ehz44ZkrzUpGqrAs_GjE-Nh1P9K8uDXVmyw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
 conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
 andreas@kemnade.info, marex@denx.de
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

Rob,

On Tue, Dec 17, 2024 at 10:20=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:

> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> Can you apply 1/3 and 2/3?

Gentle ping.
