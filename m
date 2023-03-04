Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127A6AACC9
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 22:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1DB10E22A;
	Sat,  4 Mar 2023 21:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EDA10E22A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 21:53:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i34so23903455eda.7
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 13:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
 b=EjDJ1R8FKouJnuSxadiRe5SiBIgUSITPbM9SnQjhYDyIZ+LuEOc2GfJjRvdd1K10zP
 0B+VLs/N+kcVjphefjob7VPueiCtPcbheJAVql624mVmTFTwLvvcp1iZwDpKctQLPUHW
 891sEv52O94DJnZ6KiXRE4F/ROjfjMTPMKKI+OF6yfwNHXTh46djS1YKS+5RgOvxGYeH
 ZkMiXVI3btf5P7xmeL3czwdHnO3oxMI8+Piuk+XkuMFjbmF1+Tu4Euz0RahvlkxQA0+9
 WfciGbFo0TezFdbslWClljVVfxIS/uCJg+p/6L25hJAymiS1NrGxJW4JFm2298dmi6Zx
 AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
 b=JIPr4mtJivK6amReq0dvY+YSKTOynkNgcNiRDcnHgd4bqHLISe4RG6tK7SjsQ4dkix
 +T5fm2D6CMWqdzk9oDnfTCeeIJjMSOwkyIEywzG91OIy1zXBIBLhe2apIft5b62HX3I+
 zho+2ChpaO0WNbEeuARZqNyM/gHtvSXlT9z3ULHgs2zpsMxS8ErrqWqs6gQ7Vec/529B
 nf4uDKsC9MUQnPnf+usuAStKwuzaAS5a0XWGMqusiNLIKpsud8sN/FGOTzZ/CzRFxvpO
 tp/s7QUiKOQ/ZK1j/c7LRyQ9NR8bs0+6AThuPjVPrnShfksicnISdEECZn/kY+xuVL9L
 mu0A==
X-Gm-Message-State: AO0yUKXk4AxCWMs20eyOry4MNdSP1b5I0wGY3SsOB8KKWNCDtpmUqvYa
 EVT68B6QwJnBVYZP+VD2Q0wcoQxCqLG4K4Nan1k=
X-Google-Smtp-Source: AK7set+tmz2IUyxluM6H0uJ7rtHOVvVTQ1X6COH7sceQzb5b5yCqFKVzBbXboRNMEcYH9cGeInLEcv9muAb3OM5khBI=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3356647edi.6.1677966793189; Sat, 04 Mar
 2023 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:53:02 +0100
Message-ID: <CAFBinCCV4yu1HszSaCJuNVMhDC35hA8cpzLMw1x=a3x+LNYrEw@mail.gmail.com>
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 raphael.gallais-pou@foss.st.com, s.hauer@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, andrew@aj.id.au, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com, kernel@pengutronix.de,
 khilman@baylibre.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
