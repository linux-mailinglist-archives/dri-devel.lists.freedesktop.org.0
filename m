Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9F794386
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167410E064;
	Wed,  6 Sep 2023 19:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC9A10E064
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 19:03:43 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d7830c5b20aso161845276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694027023; x=1694631823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8z7JfMeTWIa2dMIiQZF3QfNFt+waJmFYaLRg5N1AX5A=;
 b=IVbN+0x0mOtXEtRRo8WvmBOm+8Xu+aD8epIKH/qWq7+QaWp6A4BumbroPUWM/ADI5g
 mVm4ldeD6qM1G2Ch1CGSRFwyoio+k3L+f+1wGaaQPcFbxxK5GLE5aaWQvwgN3U02Qjp3
 VCXq+WM0T/xjSn57Za9ef5rus4lFkTWy4+UpLwG5+wTSWScqnM7ZTGqL9Imuiohj1vKZ
 vk8Ulm0j8z2/dmYEDs0oZJx+kOpopxEEYA2aWmMcLx2hL/sf9U+lOeqMlxPoHidd0vMm
 wiRtpEfoof+sn6NLybCBxeLM5o3unmOFDHw5pfN1gMWsODZvD2oksC2sw3rJ/SPCRLIe
 M4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694027023; x=1694631823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8z7JfMeTWIa2dMIiQZF3QfNFt+waJmFYaLRg5N1AX5A=;
 b=acUdDlx/K/eyW4Ke/aBKB6dlsJiBwWnhDZ2kds1BNcDYgQvDviflX3p+lqj7gNQx0D
 UgqHDx5P5qEam0XjbIGca+bq68phEq/AYA76yICMMaO3MeMnRyjCK6ChqcqgMaOHnivp
 TUZEMnW8+tvg5mcwelZo01BiLkazSGkcrGCUC5NjmfzoIuR3Rm2i/zY3WO/OnmdAzNo5
 phCasgjij7V0XKw5B42J3iYJDpBGgfKujupI29Npm0W69ru66jvKB7Zaaj7Bt39o5qFz
 vqyKU54wyPXGSoj0HqMfg/Anj8gGSTdJ5KgoNd3hu27AQfSVt+cW4hMpMV+yDRtFtR4L
 yoLA==
X-Gm-Message-State: AOJu0YybotUv+T+6I0mOnrAT8bomCCJRv1Fw1g1awakrnzRk1idtHoXL
 wAMpHFc56oTP4Lou5S03NwqeBo+bt8dg/g8zGjCgjQ==
X-Google-Smtp-Source: AGHT+IH86FyU3nX8IvvfomZQMTa9OGpwmdFMH+65w5YXwKbO2KVUTcIKAGjBIG77tJnR85zEQ4SNo0g2UWc6erEZNP4=
X-Received: by 2002:a25:a429:0:b0:d79:e08f:e9c2 with SMTP id
 f38-20020a25a429000000b00d79e08fe9c2mr496388ybi.11.1694027023098; Wed, 06 Sep
 2023 12:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-4-sarah.walker@imgtec.com>
In-Reply-To: <20230906095542.3280699-4-sarah.walker@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Sep 2023 21:03:31 +0200
Message-ID: <CACRpkdaNbr_7ivzz=fam2rup0HYH6UivBexLDWLLyWiXDSHoOA@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
To: Sarah Walker <sarah.walker@imgtec.com>
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
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 6, 2023 at 11:56=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:

> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
> Changes since v5:
> - Update compatible string & description to match marketing name
> - Remove unnecessary clock-names definition in ti,am62-gpu constraints
> - Document that GPU revision is discoverable

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
