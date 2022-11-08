Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C16212C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3166110E2A2;
	Tue,  8 Nov 2022 13:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D810E289;
 Tue,  8 Nov 2022 13:42:15 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id x13so10226225qvn.6;
 Tue, 08 Nov 2022 05:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbRh/ro3AF7kveHByL39OkW+4w9BfWleF28OTQj/Mw0=;
 b=Tx+KySNjKms6ean/xYq1GLjXm6os+bGh9F/xODWCUtIoTGP51KFs7xHn8mvLCpAuN6
 0cko92PsmDXiJN3OmammhvvWpGf+eOfZtiqR7ll6IHBG5qPipAJgpTJQGGdZ5Vhn6Uah
 zuccGqpBsNOhPcTiZrH1i1MDL1Ate0ThbgI+v7KDQ5Rdyr1wTonlejz5WqIxB5M2Ml5k
 Ole0weEPHR5Tbb8o3VcUlJJkXzVhaBd9wTTG9J7lZiTg0j5IrV7BcWT2PePT7kYUS7oV
 EjCFlgSrayND4Tur7l2A56V8hYnsrYTOu/RQ700q9rkjv4qH8e7/IEPHuQjJo8FaEaxk
 kKRw==
X-Gm-Message-State: ACrzQf2SSJI8o+6qZdPjolT4kTKUK55rHZRfjqJSgNvlKEsGQso98UTt
 1Jg7p4e4FYFr4i7hxADxuBV3YB69XcVaoBd4
X-Google-Smtp-Source: AMsMyM6ZDICZEBb6J5nedchCl3BjtoF8fZxtTqFAV/gLLnCzdQI0Q2SpE5CpZWMSZF9mHGzArkFJwQ==
X-Received: by 2002:a05:6214:2601:b0:4bb:f5ef:998a with SMTP id
 gu1-20020a056214260100b004bbf5ef998amr43004367qvb.69.1667914934629; 
 Tue, 08 Nov 2022 05:42:14 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 w27-20020a05620a0e9b00b006ee949b8051sm9040891qkm.51.2022.11.08.05.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 05:42:13 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-369426664f9so133598917b3.12; 
 Tue, 08 Nov 2022 05:42:12 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr7181781ywe.358.1667914932477; Tue, 08
 Nov 2022 05:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <CAEFVmOKCTc_ZrFyCxiSwCmhtjJj_fzr6n99cWtb9aECFzzYVXg@mail.gmail.com>
In-Reply-To: <CAEFVmOKCTc_ZrFyCxiSwCmhtjJj_fzr6n99cWtb9aECFzzYVXg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 14:42:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDK6-wDjpx27KJd4_gwoXQWcP6qctN-zvG6OrUgYtGAA@mail.gmail.com>
Message-ID: <CAMuHMdXDK6-wDjpx27KJd4_gwoXQWcP6qctN-zvG6OrUgYtGAA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 00/23] drm: Analog TV Improvements
To: Lukas Satin <luke.satin@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas,

On Tue, Nov 8, 2022 at 2:20 PM Lukas Satin <luke.satin@gmail.com> wrote:
> One can switch from NTSC to PAL now using (on vc4)
>
> modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
>
> NTSC should be 640x480i, not 720. It will probably work on most TV's, but NTSC by the spec is 640x480i.

The above are actually the digital ("DVD Video") variants, which have 720
horizontal pixels (incl. overscan).
The analog variants do not have a fixed horizontal resolution, except
for bandwidth limitations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
