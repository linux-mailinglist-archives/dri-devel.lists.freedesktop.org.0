Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D5AC4242
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 17:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485410E39C;
	Mon, 26 May 2025 15:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LaVTbPmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1438510E3B6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 15:28:16 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3dc8265b9b5so19512055ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748273295; x=1748878095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok85kvavAOBcumYOi4zTE1YwoECPNwKxwTVh7Dm7eVw=;
 b=LaVTbPmXnC8X2I3Zdv36JCBTcwOokukuBRS3UnQ3n4a5mF80pzEaAxhFOD6MuANztR
 GevSjXdbRJ6CCg0wGsyyzbQS/yf9LJemf6TZNBrsh4xiT5cnuT8DEH+c33cZruUPDkCC
 9Cv39KL3wBXg7r/c3TMnvAaK7ZT7R8F5rskmOM7y6elroALfBRQBT61MBoz9JROrvIuY
 rY6A0ifF8OAC49cfzextZSS3M3qGl68Nw5BOA8GXGVhwf2oKxPkjGCrn75fFOnWEyF4h
 Sm3t3Oq3PA+AoY6LU8xFQTFQH91mGfhKm7ZQaHcfuWSt3+zEXWLA+sD95J8G3K12xzAy
 YMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748273295; x=1748878095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok85kvavAOBcumYOi4zTE1YwoECPNwKxwTVh7Dm7eVw=;
 b=TOm+IvJbJTRth3fiTNzXeDr0/EGXpzYR5eEJxv/tHOWKJt5tCg000THkedrASXK4hD
 bf/+wnFNPVj4L387fPRp1ltoZHP1Y/rhgmqdB1uAEGDwRRu1Jkeu/lKjaMmKZam0pPJf
 EEdkbrLoDB3xRaCAOVGD2+MdypiTmMhYnlVJRJlFwDKTwdLW8uA7GQvrU4gMf7XZ6uqd
 EOlG69ovwoZrtxWMqkZWpZTTS6XB3cBM36Us44Og4Uf9UUYrlhzkaitrBeEXZZ4QMxqN
 /XBpXZ3mFKQ5McSeXHmcHrMs9s8P/8dIrhhdhMeSeVLQRxtuMhjRWufJMk1J0OmeXdcK
 1OvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Xlnhx2GWZSQ+8xkHn/99gLDZfO1ffApWSG7/Dejyc51VtbHFi4gBNjzfhCuQgRMSklZDpv5VedY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJu2qSCASH99kkkIm9xYm6oTEEbtExOezo6D9+dEoNI97b/rDa
 vcB/Lq82PqkeeZrB/K8z2a2l4xMLKqxLwSoATamt4JuBPT1skGZcgJKYcfU70XbopsR9ZIfcJV8
 qRS4DSn5jjfnf0w4Ep1fnjubm+8DDOb0=
X-Gm-Gg: ASbGncv8fXQyK0w0GANz7SjfMYCpFbHxzguRgqdUopTLiWE1BwjtXokbbDIvHzY1c33
 cMD91zX1wyMopT/2CMk9Z6JTy2TvjUcXNkW5FnBp+nkfEie8Af+58vIjIPGuSAz409Hw/rMomyv
 m7ljKDon284vbpWVR3yB0flCCERPetZ4dZrw3TYH8lLyQ3rbk/e0DmMwYX5byqztJQ
X-Google-Smtp-Source: AGHT+IHnjEOHDEa+vpbuy9fu6OzuQBLctXm8e94NFAA5PAxQ1vPEMihVba1OMwmRFrSVy6hhC0EPPpaB3XtabMoYhcY=
X-Received: by 2002:a05:6e02:1a26:b0:3dc:8075:ccde with SMTP id
 e9e14a558f8ab-3dc9b68097amr86275465ab.4.1748273295224; Mon, 26 May 2025
 08:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
In-Reply-To: <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 May 2025 08:28:03 -0700
X-Gm-Features: AX0GCFth23zIDl8jXgXc3hV3XSnIr7KUSlHYudJjPTsDM7Pwue023yHnh3K8dkQ
Message-ID: <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 jens.glathe@oldschoolsolutions.biz, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> > On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> > > > On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Rela=
y wrote:
> > > > > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > > >
> > > > > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > > > > >
> > > > > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1=
].
> > > > > >
> > > > > > Supported features:
> > > > > >
> > > > > > - USB type-c and type-a ports
> > > > > > - Keyboard
> > > > > > - Touchpad (all that are described in the dsdt)
> > > > > > - Touchscreen (described in the dsdt, no known SKUss)
> > > > > > - Display including PWM backlight control
> > > > > > - PCIe devices
> > > > > > - nvme
> > > > > > - SDHC card reader
> > > > > > - ath12k WCN7850 Wifi and Bluetooth
> > > > > > - ADSP and CDSP
> > > > > > - GPIO keys (Lid switch)
> > > > > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > > > > - DP Altmode with 2 lanes (as all of these still do)
> > > > > > - Integrated fingerprint reader (FPC)
> > > > > > - Integrated UVC camera
> > > > > >
> > > > > > Not supported yet:
> > > > > >
> > > > > > - HDMI port.
> > > > > > - EC and some fn hotkeys.
> > > > > >
> > > > > > Limited support yet:
> > > > > >
> > > > > > - SDHC card reader is based on the on-chip sdhc_2 controller, b=
ut the driver from
> > > > > > the Snapdragon Dev Kit is only a partial match. It can do norma=
l slow sd cards,
> > > > > > but not UHS-I (SD104) and UHS-II.
> > > > > >
> > > > > > - The GPU is not yet supported. Graphics is only software rende=
red.
> > > > > >
> > > > > > This work was done without any schematics or non-public knowled=
ge of the device.
> > > > > > So, it is based on the existing x1e device trees, dsdt analysis=
, using HWInfo
> > > > > > ARM64, and pure guesswork. It has been confirmed, however, that=
 the device really
> > > > > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a =
reset GPIO (eusb5
> > > > > > @43).
> > > > > >
> > > > > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com=
>
> > > > > > ---

[snip]

> > > > > I think that you wrote that GPU isn't supported (yet).
> > > >
> > > > GPU is not supported on SoC level (x1p42100/purwa), not device
> > > > specific. The idea I suggested to Jens was to mimic Asus Zenbook A1=
4
> > > > as per discussion abou purwa GPU and purwa firmware in general [1]:=
 to
> > > > already include correct filename and firmware path (since these are
> > > > known) such that once SoC lands the GPU support laptops with that S=
oC
> > > > will gain GPU support 'automatically'. As nothing consumes this
> > > > property (on purwa) just yet, adding it already does not cause any
> > > > harm.
> > >
> > >
> > > Not quite. A14 specified the firmware name, but didn't enable the GPU=
.
> > > This patch actually enables the GPU device. Which means, that we are
> > > going to probe a driver on an unsupported device, using invalid GPU i=
ds.
> > >
> >
> > A14 also enables the GPU, just in the .dsti, not in the purwa .dts.
> > Though now looking at it, perhaps it's a bit misleading.
>
> It should be enabled in the board.dts, not in the interim dtsi.
>
> > Yes you are right, it does give GPU-related error in dmesg, which
> > appear to be otherwise harmless. Perhaps because `x1p42100.dtsi`
> > deletes the compatible of the GPU, hence no driver is probing it?
> >
> > ```
> > [    3.085697] msm_dpu ae01000.display-controller: no GPU device was fo=
und
> > ```
> >
> > Otherwise, if you still say GPU should be disabled regardless, shall I
> > also disable it on A14's purwa variant?
>
> Yes, please. Don't set okay status for the GPU until it gets enabled.

Drive-by: Shouldn't the dtb describe the hw and not the state of the
linux kernel's support for the hw?  Ie. if bad things happen if we
describe hw which is missing driver support, shouldn't we fix that in
the driver.

(In the case of the GPU there is the slight wrinkle that we don't have
a gpu-id yet so there is no compatible in the dtb yet.)

BR,
-R
