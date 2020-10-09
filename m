Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85D288C73
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208A6ECF7;
	Fri,  9 Oct 2020 15:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC4E6ECF7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:21:02 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j30so8690316lfp.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Tdu616n0lfCO7JWMgBa8UgQurcZd5xpo1ViBZWxMbg=;
 b=O9Bvs+rybhR7my78PggURMb+k1gzC2f4HxJEe96PPa0xHoILx/uHWK2OQ0NEwB8LYQ
 jbro0fG/BMrEk/TYZN8sotLGrNkyiV59Uc4CYBS4NBbix7dXoF6FdPKJqDF3U97r2m+C
 YAQsaNAcMp9e1KC7vRDiyHyNvUsvPKpZwdzVj8J3GQsv0RTeXXE4jiCWsQFSqTrvjDXa
 iukPpNiXmHVOBUafW5ef/t0s/yDRhjZy16mTIMdm8TNcBUs4AcDtvNqrcO/dA5nt1AzR
 W0BRZAWonj/HjJtpsnSBgwaLM/+BxSaZh8ag9tB14KNB82Tf4psWLL85NvrkLp9RerTE
 Tzhg==
X-Gm-Message-State: AOAM530zEWXZo5zfrVSGZIvhgXG7KDBNDJP1ua4Z/KIH8OE0OybSH/fW
 P+aBNxbtMmAWNSAHDDmEhSTpyKxNB4IXRA==
X-Google-Smtp-Source: ABdhPJxO1WTWTmEr1kSMbJp08c2oAw6DVoVVapkFzVugtlcqGQ2dkrfxEaKjGpNIhinag9MZoWwDTA==
X-Received: by 2002:a19:f713:: with SMTP id z19mr2787300lfe.113.1602256860603; 
 Fri, 09 Oct 2020 08:21:00 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id x17sm1312687lfc.33.2020.10.09.08.20.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 08:20:59 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id i2so9997250ljg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:20:59 -0700 (PDT)
X-Received: by 2002:a05:651c:1205:: with SMTP id
 i5mr5542285lja.47.1602256859516; 
 Fri, 09 Oct 2020 08:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <39d2bb3f089f39f57f306679e882816182300e03.1601910923.git-series.maxime@cerno.tech>
In-Reply-To: <39d2bb3f089f39f57f306679e882816182300e03.1601910923.git-series.maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 9 Oct 2020 23:20:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v67xu9dsZ_X5cnZkN20Tz6gVFZ4ZLSeZanDUFpk+FKEpBg@mail.gmail.com>
Message-ID: <CAGb2v67xu9dsZ_X5cnZkN20Tz6gVFZ4ZLSeZanDUFpk+FKEpBg@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 5/6] drm/sun4i: tcon: Enable the A20 dual-link
 output
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 11:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The A20 second TCON (TCON1) can be used as a secondary output to drive a
> dual-link LVDS output. Let's add it to our capabilities.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
