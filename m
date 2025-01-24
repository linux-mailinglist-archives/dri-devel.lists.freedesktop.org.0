Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B9A1AF2D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 04:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205F10E8CD;
	Fri, 24 Jan 2025 03:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kXI8kcHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4C510E2A7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:54:23 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso3280938a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 19:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737690862; x=1738295662;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SJYfNaQixDgAN2Y+cvoyflisp9x9nwhGNxUCEmIS5U=;
 b=kXI8kcHfrGI0drzIkAK1HLct1+hDFheuv8qgmVt+c05Zr3ZiFVn5AsyuZ3nBJEHxbf
 xE36rrUgMb7zfwB6Jp6fgf/BOl2ddQkX0SMz0vfm24CyprMusEKzhz+8sC9CF1MBxvUt
 d8kaEUrJ7LwAo/ti8AduMllcnp+o8fp2LMJvUqsT29QCBm19pRcG3iUxWQnqz7vyOzXZ
 lB6gPDSPXKpIbi2xltIpM5I0aasLRNG9R+i2wzJY2MXi9PT0OsklNpCoQIUm4qyR/0v5
 x/OcWtjIG8f/yb4ZBykY5S7ERgxrFF/UzGM+86KzSt7Nl4z4tgzR/mO+nw06+OMTygyy
 S4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737690862; x=1738295662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7SJYfNaQixDgAN2Y+cvoyflisp9x9nwhGNxUCEmIS5U=;
 b=ABjAbXS8lgKE5MS2KRkqpfaKak1RgqO2eiBBMpmAouurOUFIgcbn8+YYpHD8a/hFAj
 jenRYEPXuYZy6Qfkwa2iA+dmtyW1BSOs6f/dyPtGBjZgSFIr1kuykIAYQ7Yj3TdMoY/7
 P58RmuGXk1BvCoqlPct0orzeQLX1db8AB32baQuGO+bMbfxko4qnv34D+b5bXQEwbpYt
 PUnzgFpmV8t1z1lSv5UjyhKS/XA4eE4Xg2FapvKFFJC7pFViURC8Zs9byT79x9l2hiLm
 2MpLZqs9QCIUr+I0hVGDn4XiJ0KyxrbRnvvCqSnDJp2JNcmSC4+nsL9aDi9QgIqggHiK
 yMrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAYkNo4O4ok9Z70tXBIX6rh5UjHlPxJiWP+C94NaXDhQEPG0uDBToSDQJm1OMTQXvM7RBZ0sVZ2L0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy46uqwOQ68NNk8YswCuTdrLDKEk1fwQuxhw6VhNjR29IlYKx2c
 HWDsaFA65aMdztTIEHJDd5YZ5k0QI1u+YaCF/tlydz/ZVd+Jv6Ir2zu6EeFpKdonZ8aLbj6jYjh
 Qdtp1//XL2rpTe1VvnbsZXuJXnBDiP15vKJD+uA==
X-Gm-Gg: ASbGncslbCvImRIGksw+zeLVUqC5iXD0iV+4yso/SB3WxWkm3koYuskGufWPwIoL2Uk
 IO8SnIzv6jxKYZlj1F52sSZSvEOiPzFW3yH1P4MBSdstZjemz2CXLQNqtrBbsGG/4lHjLiEq6rQ
 ==
X-Google-Smtp-Source: AGHT+IF8bVXy7iYErZ8SedJ5V/in/H73YbvG7t1RAexKW9SaCUsQjnP2VH6byiDyREO6wZOTw/C2zCUAkuuSCRZMhhs=
X-Received: by 2002:a05:6402:849:b0:5d4:75b:8ced with SMTP id
 4fb4d7f45d1cf-5db7db2c371mr25393812a12.32.1737690861691; Thu, 23 Jan 2025
 19:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
 <20250123064758.743798-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=Vr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6vW_azMARZQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6vW_azMARZQ@mail.gmail.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Fri, 24 Jan 2025 11:54:10 +0800
X-Gm-Features: AWEUYZlvVzjDKdhtKmsHEYmOfyIMPbtjP2fRkgFUgH8QBR-mYVhMfVRyQ_imAuE
Message-ID: <CA++9cvpBHN-i82mMwd_WZZrDGEQog2DmUSWcE9hDxsREyhNdrg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add compatible for
 KD110N11-51IE and 2082109QFH040022-50E
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi Doug,
Your suggestion is very helpful to me, thank you.

I confirmed the controller chips of these two panels, and it turned
out that they use the HX83102 IC, so the correct approach is that I
should add these two MIPI panels to the binding file/driver of the
MIPI controller of HX83102.I would like to ask if I need to release a
v5 version or resend a new email if I do this?

Thank you again for taking the time out of your busy schedule to guide me.


Doug Anderson <dianders@chromium.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 01:46=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Wed, Jan 22, 2025 at 10:48=E2=80=AFPM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > KINGDISPLAY KD110N11-51IE and STARRY 2082109QFH040022-50E are
> > 10.95-inch WUXGA TFT LCD panels, which fits in nicely with the
> > existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> > compatible with panel specific config.
>
> FWIW, this is still missing acting on a request that Krzysztof made.
> Specifically, instead of the above wordy patch description, he
> suggested a much simpler patch description that was just one sentence.
> I could believe his suggestion may be difficult to understand if your
> English isn't strong. He said [1]:
>
> > "Add a new compatible for foo bar panel ....". One sentence. Could be
> > also one patch, not two patches
>
> Putting that more concretely, you'd want to change your patch
> description in this case to:
>
> Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> STARRY 2082109QFH040022-50E.
>
> ...and that's it.
>
> Personally I wouldn't send a V5 just for this, but if Krzysztof
> requests it strongly then I wouldn't object.
>
> That all being said, the part of the CL description that Krzysztof
> wants you to trim is actually somewhat relevant to me if I am to give
> a Reviewed-By tag. The agreement from DRM folks seemed to be that we
> don't want to jam all MIPI panels into one bindings file and one
> driver. The idea is that they should be organized by the controller
> chip. For some history here, see [2] and all of the discussion in
> response to a previous patch [3].
>
> So the question is: do the new panels you're adding actually share the
> same onboard MIPI controller as the other ones in this file? If not
> then you _do_ need to spin your patch. If there's already some other
> bindings file / driver for the MIPI controller in these panels then
> you can add to that. If not then you'd need to add a new bindings file
> and a new driver.
>
> [1] https://lore.kernel.org/r/9cf4efd5-cc4b-492c-a1f3-18a19ba7afeb@kernel=
.org
> [2] https://patchwork.freedesktop.org/patch/msgid/20240516072039.1287065-=
3-yangcong5@huaqin.corp-partner.google.com
> [3] https://lore.kernel.org/all/20240410071439.2152588-1-yangcong5@huaqin=
.corp-partner.google.com/
