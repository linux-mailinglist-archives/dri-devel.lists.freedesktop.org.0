Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAFC4ABC87
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26C10E304;
	Mon,  7 Feb 2022 11:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBE10E304;
 Mon,  7 Feb 2022 11:48:56 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id d3so5413904qvb.5;
 Mon, 07 Feb 2022 03:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iC/gMJ6N3GpYe+fDxfWAxDAUcBlNXrtf/bjDh2uKJyE=;
 b=VNWv/KWrb+h5HrfeAONcqwH7SWfcd3y9V3UHiWPwzP1yktB/I6VEQ2FYItvJ8D8ntj
 ZH7gBDbuhtPQnd2yNUIMJvurFpucUABOnoPiHpNf4T9w2vHD7jiv7vIVqFckiDYZofvh
 ofsbIYP+f7TCsnwA4QieHdK766DbiHhmEyYxba+kXNOD9GYSkXRexbINW+aRR5NkGOlW
 2lenN1ig5Q1OYpkMkaFFGk1l9RA59TqCOTX4Hl1bJWu8wTn8PaKc6kYSZI15k84ISjDD
 SYjHJlFlkqguZe0yMNIow84MjP2kb4f5AY437Aont3Fuf8Ao4IrDP4qiM7t4/wOvoe1o
 NEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iC/gMJ6N3GpYe+fDxfWAxDAUcBlNXrtf/bjDh2uKJyE=;
 b=J04ZXPEpTFLOdnF3DrqVzWTYcL+S6sm9HWr1gwJYElcmSaYUP1PfifCwjqzrtkVwNs
 SOOzVsxzz2pRlUqh5XcHCWKF/9MXhQrPd06lM1Dy3btcJ5oCWkdNl1hXY6qf+9xFX3QW
 vaBIVBHCLK5uuS8F6uywvk7GCOB9dAnYOeNIbrs7IYDnBI/FV1MDGaLBEwHUSIRzcv5J
 vAL6Pj9WPXdyJtCVVegunR/ja83E7YRzDx9G+NdyOrczD1VhEzsIwtNaTRQoByCzfpCo
 QHaKWSH2ea2mad7nQKPvyecXsmR5edFcINDCbgfXGbCh96yfYR4cs6UiQSjuqeVOxG1c
 wjFQ==
X-Gm-Message-State: AOAM53134sbH4oNOt9EGW/aft8eEdrYgOzECFaDRfzSG8cllWP7fsG0V
 RU/MuE7GysqrNR5roNDSyJd7GTWWBzpvaQlxlVw=
X-Google-Smtp-Source: ABdhPJxngoqgzk6uDzSlMcCdUsXY3gEysjYn1Q23OoFDZk9E/QlNWQ5944y9ega8xyYb6uLZo/IUpWk2ej1v2Qj7WIY=
X-Received: by 2002:ad4:4ee9:: with SMTP id dv9mr957158qvb.41.1644234535768;
 Mon, 07 Feb 2022 03:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-2-ramalingam.c@intel.com>
In-Reply-To: <20220128185209.18077-2-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 7 Feb 2022 11:48:29 +0000
Message-ID: <CAM0jSHMCtDPk7MydenJHBE1yrghqjx8YrfMMuz_Zm4-WDvTFHA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/dg2: Add Wa_22011450934
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jan 2022 at 18:52, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> An indirect ctx wabb is implemented as per Wa_22011450934 to avoid rcs
> restore hang during context restore of a preempted context in GPGPU mode
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
