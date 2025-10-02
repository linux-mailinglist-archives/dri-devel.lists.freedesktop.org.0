Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183FBB60BB
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A560D10E88E;
	Fri,  3 Oct 2025 07:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XjA57dB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7199610E80F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 16:18:32 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32eb45ab7a0so1399716a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421912; x=1760026712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cs0gCH7mhvaO1qaWvoNXBT3MrPhbI+ZP4G1QowHi4cU=;
 b=XjA57dB1SX1a6drYmHwcfsi297M1V3GS3PLxQZeyOq24qrXHFtkgKVom1V0sQM2xfF
 ziZwzGWPf+n4Kk/2K0ZoI8RBHOW5l53Nl0nyd7VDLHrOWzPoKNBP8WiB55u6fJEhtAVe
 SBR4YUSJXIAQFKmISVIWDBPBlpQZuyWI2+KwlxmU+NDYsmV8hM39XbZHXKAuwRY3koMP
 T6eT0r3cQC8eOdFuzypDBQsMT1yOAv96iBewJJZMTRTAbkQjFGt5DR6Dk5bZecAgZIBT
 gLqK3lXB19T6+VjU0lDSqtIGAA32lHG81q1JNOHddPqzy5G/vxCx3d1MA+woYZUN4d6Y
 HrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421912; x=1760026712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cs0gCH7mhvaO1qaWvoNXBT3MrPhbI+ZP4G1QowHi4cU=;
 b=DpDxaZztQLeEB2Nc9UuXpSTebw57pGkDqwRVZZ7W6kQ3FGnTe6HnfVOq62rNDy7lgf
 HkFkyXJAQ36hEuuMmilvqddo2JSrMYwZEBABQZ2kbB5BFeI3L12BAxk3kJZ7YPRX9tl6
 7Gfj+PuF4pV8y3OF5EP2Q2tVvBya0QIDWhF7ov0qMb0nocpastC7I7JSOQmb9AOlQBqU
 Y7VWjRnSMMcX2ZiB5YPr374CTOMsJ7Z68SZY7zZqSoOZHTN6dCXhGiX3yabOMD8gQ+7R
 AFoQL8y2ZzJVen4QDB7DgYlpy3E87MFe1kxdV9tejxI9wn1F0bX4MxipGBc3P1o7KXt8
 rJSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/kwG8mnwfExYlBd5q4mNNUrP43pMGPZXj/vK8siETNrHn2PlIh0OjBhD5celenVfdMz3pRdCbo54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFeiyUtbdwD+EotscOFkpt9QJU00w9aVUkTCCabmJ8apBdwimo
 gmpftjmxwqRLjp/M8x28VKnS8PKcfT0bjfnxFgEbiPtwTz4rtqNEovYSOsvaOjitfeuu4WQNoDc
 UkVlaE2VyNy+SCUP/QF3ud9B6OyHbgBY=
X-Gm-Gg: ASbGnct9RlbHBnrGNzpeoGRQW4ZS5pDhG2NSIobCGvG1UBuU7S/PY8daiGcjj3asdWm
 Bz5HGiM5FZB8Mz8jFmpPc53xIRAiO+K57PUZtE4R14He0cCXY2lSNBB52ogfJTKPMASI4Mslbp2
 tLVaiC7eesIeH56808aR7Fn47JKGSsUuX9HQAYVt+aM1NhWJ/Crzn3t4IAh01tZjz4ctjy/+hkV
 W/IRSKvq3O9UunTqccFgiVG/1FWO5g=
X-Google-Smtp-Source: AGHT+IFg+PLUyWcoSsUAUf4htH875wDYY+hRdnGTted2LRpK1PJKUcMRnSKqqpUMk+z7FMvgEMVUAaitgkdEcJV3rx8=
X-Received: by 2002:a17:90b:38cb:b0:32e:ca03:3ba with SMTP id
 98e67ed59e1d1-339a6f2e679mr8142326a91.22.1759421910494; Thu, 02 Oct 2025
 09:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
 <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
In-Reply-To: <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:23:27 -0400
X-Gm-Features: AS18NWDwyTbNJJLg_4zVrM-EyYlDVd5QGpchaU4fwAQ38Pf7WEw2ME2yXmyyL7Q
Message-ID: <CALC8CXfTA6bBN-ZthgRoPXvv-BZQtvL7w7a+6bgTe_GTWnnfHg@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Oct 2025 07:00:55 +0000
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

Yoongxing the Chinaman, and Dmitry the RUSSKIE; Conspiring.

On Fri, Aug 22, 2025 at 6:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Aug 21, 2025 at 11:36:00AM +0800, Yongxing Mou wrote:
> > Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> >
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
>
