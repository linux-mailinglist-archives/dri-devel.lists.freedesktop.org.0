Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0188674D4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6843C10F13D;
	Mon, 26 Feb 2024 12:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gu/FtLP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4F510F13B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:27:46 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7bed9fb159fso151574939f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708950466; x=1709555266;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/faix5We06aG7AM987K0dvt+ZyZCoD81fzNbsR727U=;
 b=gu/FtLP2AM9JEd0BRAMZY5Q5FtRa/x0Vf96JxYMRTRXSOTL4ZVHmh9LyffvVnsKwJc
 Vb0dKYaGqeMp3JLha8jWvideELu9/gPf7yEfpJDOwA6A8iLLKx4tqlkcq8pryXnkMmXv
 OBzfR8pq+pnitD/ooomowS+Q87EqH8nye/TRxNPCazwOIFlgX4S/LdnuaCuBlRPW0yxp
 cYVlsJSJBmftBGNpgPZGWF62D+6cIijwqtSzwAHCTT26nsYIjTSwcsWE0jRXPe2yaQXD
 I6I2BTmXLL2ni2Umgu73iX8xmfTMr2REH6LOLVmSziD5p9JQrDn5KX1py1soMjD0PjUd
 vwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708950466; x=1709555266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/faix5We06aG7AM987K0dvt+ZyZCoD81fzNbsR727U=;
 b=h3jY1dpDHGLGj7tHEsbNQCtq2qcZbn5i/YCFjUFnnRWh+oEjZwEoD76CHrNf99+p7f
 +Nrzt//kZk7+1I+rqoVehc1syUFMz6lk/YXHWp80bzMFp+AjyYmhNIk9RRmsh2nRf3Bz
 0vOUwRmsqJIdff8+mslyg8iPIo1gkmYzFhcXn44JLYIbW1ENINuiKB68Z8wXg7QHqV1d
 3OWl3DpPsRBUj5LH1tD9KkfTggBfNyCdZqgag/zEzWfckqzfzO2F6cJLJ+o8LrHbcsEb
 +TY5KL3h3v4M3PdVnoYufdraBDDYVg2ip4hZ9rJi02GigKDgXcDFnwIyQt8oVsG+hL6O
 uTKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyrQ1th5x5sh1vJak9o8nieMXtVNKut/QuCyB5lKzQhytDUVeMvQrosrnREmmrE/IRBfX46lb4k879LOVGg9iDxaTzkNZfGfIfhZMhCjDo
X-Gm-Message-State: AOJu0YwJXwwirmDIIC7/23FwwfzjxcenOTTureJ8HkzxK58LjZ3F6ReL
 1mhGNh3RScCXrpIrEbQE1zJbsjiCrhXTup7QoYNPepzURqU39VdJxbBqJEFJCNVshWQuraNAjov
 Y0rJPZa6Krnndtv/VzUXO1du1YkUMdq15cFPz
X-Google-Smtp-Source: AGHT+IGbzgYpilRjkDEnKbvgS5UZhDNoI1XMbPezAG50YHRpmOYcGoysSkihTQvNaJRrC7lL2YXgrI5ogNuUIHDGx2E=
X-Received: by 2002:a05:6602:3413:b0:7c7:bbfd:d843 with SMTP id
 n19-20020a056602341300b007c7bbfdd843mr5675422ioz.19.1708950466041; Mon, 26
 Feb 2024 04:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-10-panikiel@google.com>
 <310cefcb-a4d5-4f4f-a482-ba2ff08a57f6@linaro.org>
 <CAM5zL5rQsYuo3+rW9+YPmvUg9PtNiR0Dy59e8Kf787ranfLh3Q@mail.gmail.com>
 <e2ae7bfc-fb51-4a60-bb52-c6ccca7a4189@linaro.org>
In-Reply-To: <e2ae7bfc-fb51-4a60-bb52-c6ccca7a4189@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 26 Feb 2024 13:27:35 +0100
Message-ID: <CAM5zL5pz0K5ro4-UjiYojM4h9Lqo_af5ZmH1FoZ_ajde_3+Dcg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] ARM: dts: chameleonv3: Add video device nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

On Mon, Feb 26, 2024 at 1:07=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/02/2024 12:09, Pawe=C5=82 Anikiel wrote:
> > On Mon, Feb 26, 2024 at 10:15=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> >>> Add device nodes for the video system present on the Chameleon v3.
> >>> It consists of six framebuffers and two Intel Displayport receivers.
> >>>
> >>> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> >>> ---
> >>
> >> ...
> >>
> >>> +             dprx_sst: dp-receiver@c0064000 {
> >>> +                     compatible =3D "intel,dprx-20.0.1";
> >>> +                     reg =3D <0xc0064000 0x800>;
> >>> +                     interrupt-parent =3D <&dprx_sst_irq>;
> >>> +                     interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> >>> +                     intel,max-link-rate =3D <0x1e>;
> >>
> >> Rate is not in hex! Rate is in Hz, at least usually...
> >>
> >> Fix your bindings...
> >
> > This is the DisplayPort link rate, for which the allowed values are
> > 8.1 Gbps, 5.4 Gbps, 2.7 Gbps, or 1.62 Gbps. The standard way to encode
> > them (used in the DisplayPort DPCD registers and this device's
>
> Then it is in bps or some other units:
>
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
>
> > configuration) is by multiples of 0.27Gbps. This value (AFAIK) is
> > usually represented in hex, so 8.1Gbps would be 0x1e.
>
> No, the value is represented in logical units. Frequency in Hz. Rate in
> bps/kbps/etc. Voltage in volts.

Okay, thanks for the info. So if I understand correctly, the max link
rate should be represented in bps in the devicetree, and then be
converted to the per 0.27Gbps value by the driver?

One problem is that the values here are too large to be represented in
bps (since the datatype is uint32). Can the property be in Mbps
instead?
