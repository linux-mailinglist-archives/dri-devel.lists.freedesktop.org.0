Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AC6ADEE18
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017B010E834;
	Wed, 18 Jun 2025 13:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KYYI8c1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1FC10E834
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:41:30 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-313910f392dso6120248a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254090; x=1750858890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
 b=KYYI8c1IIVgVA1m/4JoWOfnir0XLnGpnACDybAl92b/6OQMbi5DpC1Mey+DohMkY6+
 +8Z3Ur+pOQmsyKdLgKTh6v7NKYQ0snMXO1AZ8j/7n0fJeHdW6o+gsg/DHsaSMSQVKUlE
 j12ZAagdf7OZ/n1JKQKmoFcQJaYlj8cZo7kRJN/UsxE9Bh9BDl+khdzGMKRi9jRiO2BP
 Esy+GFhgjvrgPSDIeKUhvaGqJ1B4yPbFjb5bPbt/FWFniu6R6RAom1QOeDPGSm9FK3hb
 tnDSsO71HdblrkTn/HbbU5HG1n4urXjlMPtERgGvjqcXGachPJTd7BB9F3VcnduyB7bx
 Ipgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254090; x=1750858890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
 b=SCeKS4TrnNRVRI8kQkLIGnvqeEhyDarIxnJaT+vEDqHzd+vNqIQPN3J6PqWY54o9fx
 /CmCkw+Nn0vLMUBS+VJAOkpGrUEcjYDFkgqAo35/WED9pXC8v6GwUZfL+vDPulvdg/XW
 ol5z4YozD1ukvfrHMu6s2ei67bqV0Q89mforrCra36KylxZJSbV6HWzbzQH9oKU31cWo
 QwSDnsS54PXFfaw6PQW9zBbZODNsTxs2VmSpQefd5kUP+rBHMrnB/l9efY5JVRawMYcm
 QmOldmuQg2pfcIth3yqM1hrpOboOzRpbRzCTjNfDBETHw4wKXgdh2CEfzf1zQ80ViSqV
 46tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXxVqwX7yqrCf68rrmD0GVpMgBWI/gmePnIqDy//qTagTa0387IPlihIFyT6eP8uYMOLwiObNMtKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFaddEtl8zYjnk2YOSIApDPFVMsTUx6d5iAuLcuoDlG8lDKzf1
 Oh9zJaCZBXdwHhAQdhU/ZJv2twbmtZyCFxu4XcJvXu6tP+Q4WXjnw+rgzhTul16RX9hM8Ri+gBi
 8flcBQ8pvBK8L8zY2f/SaruuIAyaJmqJ6PflVFeTkrA==
X-Gm-Gg: ASbGncu2D2F5UwraESzND7IerP/0s0412MgAXJjal8HHV2kFz2Q6+mkvjKWFDjuYrH8
 kfOk9dRwYqxcpfimyBMDreKL4rROIS8xZ+LE2OI7gSbEWfLYhS7fIWoIcPqW2qWh0lEg6jqRMVX
 l7V7HASnykBqN7Dp0nj017JW1PRRuetr7cg+/So3J9y5cxMeSnAIpG1sL/8cauoB/duisBZWPhH
 g==
X-Google-Smtp-Source: AGHT+IGM3MsC055WE6RGdmTL7+xpqbeOwcWlIGInX1z822Wu3bYLUR0ECZj1HH7bbG4yZBVpGpNdgZd2k9tfvrFyAoE=
X-Received: by 2002:a17:90b:52c6:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-313f1dcbbc1mr25929568a91.30.1750254090220; Wed, 18 Jun 2025
 06:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:41:16 +0200
X-Gm-Features: AX0GCFvz_RthrqCGUMHniOjba_9qiDf9mc2HoVSIdoi-DY1O9poo5r9j_4HtbqM
Message-ID: <CAMRc=MfarMrUrdgAwa6dR2JuWooRhaqPmJeEY9H6LhVkCxf4kA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> In order to support the complex power sequencing required by the TH1520
> GPU, the AON power domain driver must be responsible for initiating the
> corresponding sequencer driver. This functionality is specific to
> platforms where the GPU power sequencing hardware is controlled by the
> AON block.
>
> Extend the AON power domain driver to check for the presence of the
> "gpu-clkgen" reset in its own device tree node.
>
> If the property is found, create and register a new auxiliary device.
> This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
> auxiliary driver to bind and take control of the sequencing logic.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
