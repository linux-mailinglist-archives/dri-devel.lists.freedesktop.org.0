Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D16DBAF5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429110E17C;
	Sat,  8 Apr 2023 12:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11E410E044
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 03:14:31 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id bi39so6582799qkb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 20:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680923670; x=1683515670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMTKJDQ8CdgEq5oydLbuNOEjnz2pC0DL2nvx8nYSz/g=;
 b=Q48jvsiIcW6+33OEw+8Rq2By/0rqAJXsy0pbv5Ivxlezjf2NnrQr5WO9WV+cxoLcY4
 P4kvSheOQQeR0uxecCxHXF+4BBRhAOXGI4WkJvpj5P7NfRHT9rW3MJ8D6DuRWfDCLkXR
 AFXPr5fol0nMe116ZVgI6KN3Rfqc2Pq1dm9gSnEsJN/j6UYohxHtO902BVIzNVuFdVNC
 /6lGFGdZ6rb2LdPUgWznZV/BfG818fKJT4SRzSLMRP0ZWiwsm080D2I4WjAiFqki9T3g
 LJb/wdZ3AiTLkMiuSZDD6T/DVSEAPKUcD9BfAUZz4xCW8GxKZ/LqMV60r7GQGYdLknPi
 4QXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923670; x=1683515670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMTKJDQ8CdgEq5oydLbuNOEjnz2pC0DL2nvx8nYSz/g=;
 b=O5OF9qzRO9oXI44NlHc0bKEj7sUvesULd9Wp/ApubsaxJ3tY+Ks77VUiihWc54sfIT
 bXZAc7tpjdZsTs9HDzFRkEuFOsFWkh9Wt5EG48FKTx00LFODtl5+QXR2iN4+hSt7YN+p
 ue6BFnNNf2nhAp4f3Wsjjqid2skHCwsZzKhBn6XQqXWwY91xt0B9a6Eb2JaTjDsVrGMY
 ngVfeyFtrJhsNJu3tNP+lQL8LDX5ppj+UpWbrimRg2dx1poF6u7dmHmMzyt2fUCU5DlD
 GcdzpZhZMDXdjb3OQvMklG9wfqBVjtzRiJMQ0hSfwr54eG5eUdY23tlL2vGTMkJ8MAMw
 xVFg==
X-Gm-Message-State: AAQBX9cnOVyXE2vdllTx1gshXvyAiIw8+XoYl/lHuHdf62l/dOoS99rx
 PhErcn2eYr2aN2Xb9ncMV59Qi+V+YQlTypKCYZM=
X-Google-Smtp-Source: AKy350Z3AtOV3Hj8e2V0+G3cXlcE2CUJYghvIUSBZ5M8j+IP946o3xKT9Fp538mrEE70dVq7aSFML1TYV1nrT8gDZvc=
X-Received: by 2002:a05:620a:1981:b0:74a:5c5:944 with SMTP id
 bm1-20020a05620a198100b0074a05c50944mr1150949qkb.4.1680923670462; Fri, 07 Apr
 2023 20:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
 <20230406203530.3012191-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406203530.3012191-7-krzysztof.kozlowski@linaro.org>
From: Aleksandr Mezin <mezin.alexander@gmail.com>
Date: Sat, 8 Apr 2023 06:14:19 +0300
Message-ID: <CADnvcfKwHJ=dOFH1+DsDfn6Y5k6xdzA7QR1uVDv1afwCsiso3w@mail.gmail.com>
Subject: Re: [PATCH 48/68] hwmon: nzxt: constify pointers to hwmon_channel_info
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 08 Apr 2023 12:37:55 +0000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Eric Tremblay <etremblay@distech-controls.com>, Tom Rix <trix@redhat.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Clemens Ladisch <clemens@ladisch.de>,
 dri-devel@lists.freedesktop.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Rudolf Marek <r.marek@assembler.cz>, UNGLinuxDriver@microchip.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-doc@vger.kernel.org,
 Jonas Malaco <jonas@protocubo.io>,
 Derek John Clark <derekjohn.clark@gmail.com>, openbmc@lists.ozlabs.org,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Aleksa Savic <savicaleksa83@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Robert Marko <robert.marko@sartura.hr>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Agathe Porte <agathe.porte@nokia.com>, linux-rpi-kernel@lists.infradead.org,
 Nick Hawkins <nick.hawkins@hpe.com>, Tali Perry <tali.perry1@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-kernel@vger.kernel.org,
 Jack Doan <me@jackdoan.com>, Michael Walle <michael@walle.cc>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, patches@opensource.cirrus.com,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023 at 11:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> -static const struct hwmon_channel_info *nzxt_smart2_channel_info[] =3D {
> +static const struct hwmon_channel_info * const nzxt_smart2_channel_info[=
] =3D {

In the rest of nzxt-smart2.c there are spaces only before "*", not on
both sides (and there are a few "*const" already). Would be nice to
keep it consistent. The same seems to be true for nzxt-kraken2.c
(although I'm not a maintainer)
